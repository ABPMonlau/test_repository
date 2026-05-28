from flask import Blueprint, render_template, request, redirect, url_for, flash
import mysql.connector
from mysql.connector import pooling  # IMPORTANTE: La herramienta de Pooling
import os

vinos_bp = Blueprint("vinos", __name__)

# --- CONFIGURACIÓN DEL POOL DE CONEXIONES ---
# Creamos la piscina fuera de las funciones para que sea global y permanente.
# Esto mantiene 5 conexiones abiertas y listas, evitando los micro-cortes de red.
db_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="piscina_vinos",
    pool_size=5,
    pool_reset_session=True,
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_VINOS_USER"),
    password=os.getenv("DB_VINOS_PASSWORD"),
    database=os.getenv("DB_VINOS_NAME"),
)


# Función auxiliar para pedir una conexión prestada de la piscina
def get_vinos_db():
    return db_pool.get_connection()


# --- 1. LEER: Mostrar todos los vinos ---
@vinos_bp.route("/vinos")
def lista_vinos():
    db = get_vinos_db()
    # buffered=True evita que la conexión se caiga mientras lee datos de la Raspberry
    cursor = db.cursor(dictionary=True, buffered=True)

    try:
        query = """
            SELECT v.vino_id, v.vino_nombre, t.tipo_nombre, b.bodega_nombre, v.zona_origen 
            FROM vinos v
            LEFT JOIN tipos t ON v.vino_tipo = t.tipo_id
            LEFT JOIN bodegas b ON v.bodega = b.bodega_id
            ORDER BY v.vino_nombre ASC
        """
        cursor.execute(query)
        vinos = cursor.fetchall()
        return render_template("vinos_lista.html", vinos=vinos)

    finally:
        # SIEMPRE devuelve el "libro" a la biblioteca (la conexión a la piscina)
        cursor.close()
        db.close()


# --- 2. CREAR: Añadir un vino nuevo ---
@vinos_bp.route("/vinos/nuevo", methods=["GET", "POST"])
def nuevo_vino():
    db = get_vinos_db()
    cursor = db.cursor(dictionary=True, buffered=True)

    try:
        if request.method == "POST":
            nombre = request.form["vino_nombre"]

            # Si el desplegable viene vacío (""), lo convertimos a None (NULL en la BD)
            # Esto evita que MariaDB colapse al intentar meter texto en un INT
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

        # Si es GET, cargamos las listas para los desplegables del formulario
        cursor.execute("SELECT * FROM tipos")
        tipos = cursor.fetchall()

        cursor.execute("SELECT * FROM bodegas")
        bodegas = cursor.fetchall()

        return render_template("vinos_form.html", tipos=tipos, bodegas=bodegas)

    finally:
        cursor.close()
        db.close()


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
        cursor.close()
        db.close()
