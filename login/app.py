from flask import Flask, render_template, request, redirect, url_for, flash, session
from functools import wraps
import mysql.connector
import hashlib
import os
from dotenv import load_dotenv

# importar vinos
from vinos import vinos_bp

load_dotenv()  # cargar .env
app = Flask(__name__)  # crear app web
app.secret_key = "clave_super_secreta_para_la_canal"  # cifrar la sesion

# registrar rutas vinos a app principal
app.register_blueprint(vinos_bp)


# connexion a la base de datos usando parametros  del env
def get_users_db():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
    )


# decorador / portero,
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "logueado" not in session:
            flash("Por favor, inicia sesión para acceder al CRM.", "error")
            return redirect(url_for("login"))
        return f(*args, **kwargs)

    return decorated_function


# rutas principales


@app.route("/")
def index():
    return redirect(url_for("login"))


@app.route("/login", methods=["GET", "POST"])
def login():
    # si tiene sesion abierta mandamos al loguin
    if "logueado" in session:
        return redirect(url_for("dashboard"))

    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        # hashear para comparar
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        db = get_users_db()
        cursor = db.cursor(dictionary=True)  # para que el cursor use diccionarios

        # cursor = como un mandado
        cursor.execute(
            "SELECT * FROM users WHERE username = %s AND password_hash = %s",
            (username, hashed_password),
        )
        user = cursor.fetchone()  # coje solo uno el primero

        cursor.close()
        db.close()

        if user:

            session["logueado"] = True
            session["username"] = username
            return redirect(url_for("dashboard"))
        else:
            flash("Usuario o contraseña incorrectos.", "error")

    return render_template("login.html")


# ruta registrar
@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        # hashear contraseña antes de guardarla
        hashed_password = hashlib.sha256(password.encode()).hexdigest()

        db = get_users_db()
        cursor = db.cursor()

        try:
            # insertar usuario
            cursor.execute(
                "INSERT INTO users (username, password_hash) VALUES (%s, %s)",
                (username, hashed_password),
            )
            db.commit()
            flash("Cuenta creada con éxito. Ahora puedes iniciar sesión.", "success")
            return redirect(url_for("login"))
        except mysql.connector.IntegrityError:
            # si el username ya esta cogif
            flash("Ese nombre de usuario ya está en uso. Elige otro.", "error")
        finally:
            cursor.close()
            db.close()

    return render_template("register.html")


@app.route("/logout")
def logout():
    session.clear()  # parar session
    return redirect(url_for("login"))


@app.route("/dashboard")
@login_required  # ruta protegida
def dashboard():
    return render_template("dashboard.html", username=session.get("username"))


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
