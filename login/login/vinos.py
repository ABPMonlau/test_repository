from flask import Blueprint, render_template, request, redirect, url_for, flash
import mysql.connector
from mysql.connector import pooling
import os

from dotenv import load_dotenv

load_dotenv()

vinos_bp = Blueprint("vinos", __name__)

# --- CONFIGURACIÓN DEL POOL DE CONEXIONES ---
db_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="piscina_vinos",
    pool_size=5,
    pool_reset_session=True,
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_VINOS_USER"),
    password=os.getenv("DB_VINOS_PASSWORD"),
    database=os.getenv("DB_VINOS_NAME"),
)


# --- ESCUDO 1: EL DESFIBRILADOR ---
def get_vinos_db():
    db = db_pool.get_connection()
    try:
        # Obliga a la conexión a hacer un "ping" a la Raspberry.
        # Si no responde, lo intenta 3 veces seguidas antes de rendirse.
        db.ping(reconnect=True, attempts=3, delay=1)
    except:
        pass  # Si falla definitivamente, lo cazará el try...finally de las rutas
    return db


# --- 1. LEER: Mostrar todos los vinos (CON BUCLE DE REINTENTOS) ---
@vinos_bp.route("/vinos")
def lista_vinos():
    max_intentos = 3

    for intento in range(max_intentos):
        db = None
        cursor = None
        try:
            db = get_vinos_db()
            cursor = db.cursor(dictionary=True, buffered=True)

            query = """
                SELECT v.vino_id, v.vino_nombre, t.tipo_nombre, b.bodega_nombre, v.zona_origen 
                FROM vinos v
                LEFT JOIN tipos t ON v.vino_tipo = t.tipo_id
                LEFT JOIN bodegas b ON v.bodega = b.bodega_id
                ORDER BY v.vino_nombre ASC
            """
            cursor.execute(query)
            vinos = cursor.fetchall()

            # Si llega hasta aquí, ha triunfado. Rompe el bucle y carga la página.
            return render_template("vinos_lista.html", vinos=vinos)

        except mysql.connector.errors.OperationalError as e:
            # Si es el último intento y sigue fallando, entonces sí mostramos el error
            if intento == max_intentos - 1:
                raise e
            print(f"⚠️ Micro-corte detectado (Intento {intento + 1}). Reintentando...")

        finally:
            # Cerramos todo correctamente en cada intento, ya sea éxito o fracaso
            try:
                if cursor:
                    cursor.close()
            except:
                pass
            try:
                if db:
                    db.close()
            except:
                pass


# --- 2. CREAR: Añadir un vino nuevo ---
@vinos_bp.route("/vinos/nuevo", methods=["GET", "POST"])
def nuevo_vino():
    db = get_vinos_db()
    cursor = db.cursor(dictionary=True, buffered=True)

    try:
        if request.method == "POST":
            nombre = request.form["vino_nombre"]
            tipo_id = request.form["vino_tipo"] or None
            bodega_id = request.form["bodega"] or None
            zona = request.form["zona_origen"]
            desc = request.form["vino_desc"]

            sql = """
                INSERT INTO vinos (vino_nombre, vino_tipo, bodega, zona_origen, vino_desc) 
                VALUES (%s, %s, %s, %s, %s)
            """
            cursor.execute(sql, (nombre, tipo_id, bodega_id, zona, desc))
            db.commit()

            flash("El vino se ha guardado correctamente en el catálogo.", "success")
            return redirect(url_for("vinos.lista_vinos"))

        cursor.execute("SELECT * FROM tipos")
        tipos = cursor.fetchall()

        cursor.execute("SELECT * FROM bodegas")
        bodegas = cursor.fetchall()

        return render_template("vinos_form.html", tipos=tipos, bodegas=bodegas)

    finally:
        # --- CIERRE SEGURO ---
        try:
            cursor.close()
        except:
            pass
        try:
            db.close()
        except:
            pass


# --- 3. BORRAR: Eliminar un vino ---
@vinos_bp.route("/vinos/borrar/<int:id>", methods=["POST"])
def borrar_vino(id):
    db = get_vinos_db()
    cursor = db.cursor()

    try:
        cursor.execute("DELETE FROM vinos WHERE vino_id = %s", (id,))
        db.commit()

        flash("Vino eliminado del catálogo de forma exitosa.", "success")
        return redirect(url_for("vinos.lista_vinos"))

    finally:
        # --- CIERRE SEGURO ---
        try:
            cursor.close()
        except:
            pass
        try:
            db.close()
        except:
            pass
