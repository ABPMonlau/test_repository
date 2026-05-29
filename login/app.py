from flask import Flask, render_template, request, redirect, url_for, flash, session
from functools import wraps
import mysql.connector
import hashlib
import os
from dotenv import load_dotenv

# Importamos el módulo de vinos
from vinos import vinos_bp

load_dotenv()
app = Flask(__name__)
app.secret_key = "clave_super_secreta_para_la_canal"

# Registramos las rutas de los vinos
app.register_blueprint(vinos_bp)


# --- CONEXIÓN A LA BASE DE DATOS DE USUARIOS (CRM) ---
def get_users_db():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),  # Apunta a usuarios-lacanal
    )


# --- EL PORTERO DE SEGURIDAD (Decorador) ---
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "logueado" not in session:
            flash("Por favor, inicia sesión para acceder al CRM.", "error")
            return redirect(url_for("login"))
        return f(*args, **kwargs)

    return decorated_function


# --- RUTAS PRINCIPALES ---


@app.route("/")
def index():
    return redirect(url_for("login"))


@app.route("/login", methods=["GET", "POST"])
def login():
    # Si ya tiene la sesión abierta, lo mandamos directo al dashboard
    if "logueado" in session:
        return redirect(url_for("dashboard"))

    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        # Encriptamos la contraseña introducida para compararla con la base de datos
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        db = get_users_db()
        cursor = db.cursor(dictionary=True)

        # CORREGIDO: Buscamos en la tabla 'users' y en la columna 'password_hash'
        cursor.execute(
            "SELECT * FROM users WHERE username = %s AND password_hash = %s",
            (username, hashed_password),
        )
        user = cursor.fetchone()

        cursor.close()
        db.close()

        if user:
            # ¡LE DAMOS LA PULSERA VIP!
            session["logueado"] = True
            session["username"] = username
            return redirect(url_for("dashboard"))
        else:
            flash("Usuario o contraseña incorrectos.", "error")

    return render_template("login.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        # Encriptamos la contraseña antes de guardarla
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        db = get_users_db()
        cursor = db.cursor()

        try:
            # CORREGIDO: Insertamos en la tabla 'users' y en la columna 'password_hash'
            cursor.execute(
                "INSERT INTO users (username, password_hash) VALUES (%s, %s)",
                (username, hashed_password),
            )
            db.commit()
            flash("Cuenta creada con éxito. Ahora puedes iniciar sesión.", "success")
            return redirect(url_for("login"))
        except mysql.connector.IntegrityError:
            # Si el username es UNIQUE en tu base de datos y ya existe, saltará este error
            flash("Ese nombre de usuario ya está en uso. Elige otro.", "error")
        finally:
            cursor.close()
            db.close()

    return render_template("register.html")


@app.route("/logout")
def logout():
    session.clear()  # Cortamos la pulsera de seguridad
    return redirect(url_for("login"))


@app.route("/dashboard")
@login_required  # Ruta protegida por el portero
def dashboard():
    return render_template("dashboard.html", username=session.get("username"))


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
