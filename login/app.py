from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import hashlib

# NUEVO: Importamos os y dotenv para leer el archivo .env
import os
from dotenv import load_dotenv

# NUEVO: Le decimos a Python que cargue el archivo .env en memoria
load_dotenv()

app = Flask(__name__)


# --- CONFIGURACIÓN DE LA BASE DE DATOS ---
def get_db_connection():
    # Ahora leemos las variables de entorno en lugar de usar texto plano
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
    )


# --- RUTAS DE NUESTRA WEB ---


@app.route("/")
def home():
    return redirect(url_for("login"))


# 2. Ruta para REGISTRARSE (Con validación de Administrador)
@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        admin_password = request.form["admin_password"]

        db = get_db_connection()
        cursor = db.cursor(dictionary=True)

        # 1. Buscamos al administrador en la base de datos
        cursor.execute("SELECT * FROM users WHERE username = 'admin'")
        admin_user = cursor.fetchone()

        if not admin_user:
            cursor.close()
            db.close()
            return render_template(
                "register.html",
                error="Error del sistema: No existe un administrador configurado.",
            )

        # 2. Verificamos que la contraseña de administrador sea correcta
        hash_admin_input = hashlib.sha256(admin_password.encode()).hexdigest()

        if hash_admin_input != admin_user["password_hash"]:
            cursor.close()
            db.close()
            return render_template(
                "register.html",
                error="La contraseña de Administrador es incorrecta. No tienes permiso.",
            )

        # 3. Si el admin es correcto, procedemos a registrar al nuevo usuario
        hashed_new_password = hashlib.sha256(password.encode()).hexdigest()

        try:
            sql = "INSERT INTO users (username, password_hash) VALUES (%s, %s)"
            valores = (username, hashed_new_password)
            cursor.execute(sql, valores)
            db.commit()

            return redirect(url_for("login"))

        except mysql.connector.IntegrityError:
            return render_template(
                "register.html", error="Ese nombre de usuario ya está registrado."
            )

        finally:
            cursor.close()
            db.close()

    return render_template("register.html")


# 3. Ruta para HACER LOGIN (Con mensaje de error genérico por seguridad)
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        db = get_db_connection()
        cursor = db.cursor(dictionary=True)

        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        user = cursor.fetchone()

        cursor.close()
        db.close()

        # MENSAJE GENÉRICO DE ERROR (Previene la enumeración de usuarios)
        error_msg = "Usuario o contraseña incorrectos."

        if user:
            # El usuario existe, comprobamos su contraseña
            hash_obj_login = hashlib.sha256(password.encode())
            hashed_password_login = hash_obj_login.hexdigest()

            if hashed_password_login == user["password_hash"]:
                return redirect(url_for("dashboard"))
            else:
                # Contraseña incorrecta
                return render_template("login.html", error=error_msg)
        else:
            # Usuario no encontrado
            return render_template("login.html", error=error_msg)

    return render_template("login.html")


# 4. La página PROTEGIDA
@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")


if __name__ == "__main__":
    app.run(debug=True)
