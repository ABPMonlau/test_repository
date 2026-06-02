from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from functools import wraps
import mysql.connector
from mysql.connector import pooling
import os
from dotenv import load_dotenv

load_dotenv()
vinos_bp = Blueprint("vinos", __name__)  # modulo independiente


# portero copia local para evitar
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "logueado" not in session:
            flash("Acceso denegado. Inicia sesión primero.", "error")
            return redirect("/login")
        return f(*args, **kwargs)

    return decorated_function


# configuración pool de connexiones,
db_pool = mysql.connector.pooling.MySQLConnectionPool(
    pool_name="piscina_vinos",
    pool_size=5,  # maximo 5 connexiones a la vez
    pool_reset_session=True,
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_VINOS_USER"),
    password=os.getenv("DB_VINOS_PASSWORD"),
    database=os.getenv("DB_VINOS_NAME"),
)


def get_vinos_db():
    db = db_pool.get_connection()  # coge un pool
    try:
        db.ping(reconnect=True, attempts=3, delay=1)  # comprueba que sigue connextado
    except:
        pass
    return db


# mostrat todos los vinos
@vinos_bp.route("/vinos")
@login_required
def lista_vinos():
    max_intentos = 3
    for intento in range(max_intentos):
        db = None
        cursor = None
        try:
            db = get_vinos_db()
            cursor = db.cursor(
                dictionary=True, buffered=True
            )  # cursor entrega diccionario

            query = """
                SELECT v.vino_id, v.vino_nombre, t.tipo_nombre, b.bodega_nombre, v.zona_origen 
                FROM vinos v
                LEFT JOIN tipos t ON v.vino_tipo = t.tipo_id
                LEFT JOIN bodegas b ON v.bodega = b.bodega_id
                ORDER BY v.vino_nombre ASC
            """
            cursor.execute(query)
            vinos = cursor.fetchall()  # todos los resultados
            return render_template("vinos_lista.html", vinos=vinos)

        except mysql.connector.errors.OperationalError as e:
            if intento == max_intentos - 1:
                raise e
            print(  # log por si se corta
                f"⚠️ Micro-corte de red detectado (Intento {intento + 1}). Reintentando..."
            )

        finally:
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


# añadir vinos
@vinos_bp.route("/vinos/nuevo", methods=["GET", "POST"])
@login_required
def nuevo_vino():
    db = get_vinos_db()
    cursor = db.cursor(dictionary=True, buffered=True)

    try:
        if request.method == "POST":
            # datos del formulario
            nombre = request.form["vino_nombre"]
            tipo_id = request.form["vino_tipo"] or None
            bodega_id = request.form["bodega"] or None
            zona = request.form["zona_origen"]
            desc = request.form["vino_desc"]

            sql = """
                INSERT INTO vinos (vino_nombre, vino_tipo, bodega, zona_origen, vino_desc) 
                VALUES (%s, %s, %s, %s, %s) 
            """
            # %s pasar los datos por separado
            cursor.execute(sql, (nombre, tipo_id, bodega_id, zona, desc))
            db.commit()

            flash("El vino se ha guardado correctamente en el catálogo.", "success")
            return redirect(url_for("vinos.lista_vinos"))

        #  si es get mostramos
        cursor.execute("SELECT * FROM tipos")
        tipos = cursor.fetchall()

        cursor.execute("SELECT * FROM bodegas")
        bodegas = cursor.fetchall()

        # obtener zonas ya guardadas pra el autocompletado
        cursor.execute(
            "SELECT DISTINCT zona_origen FROM vinos WHERE zona_origen IS NOT NULL AND zona_origen != '' ORDER BY zona_origen"
        )
        zonas_existentes = cursor.fetchall()

        return render_template(
            "vinos_form.html",
            tipos=tipos,
            bodegas=bodegas,
            zonas_existentes=zonas_existentes,
        )

    finally:
        try:
            cursor.close()
        except:
            pass
        try:
            db.close()
        except:
            pass


# borrar un docker
@vinos_bp.route("/vinos/borrar/<int:id>", methods=["POST"])
@login_required
def borrar_vino(id):
    db = get_vinos_db()
    cursor = db.cursor()

    try:
        cursor.execute("DELETE FROM vinos WHERE vino_id = %s", (id,))
        db.commit()
        flash("Vino eliminado del catálogo de forma exitosa.", "success")
        return redirect(url_for("vinos.lista_vinos"))

    finally:
        try:
            cursor.close()
        except:
            pass
        try:
            db.close()
        except:
            pass
