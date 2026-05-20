from flask import Blueprint, jsonify, redirect, render_template, request, url_for

from database.connection import get_connection

# Creamos el Blueprint para organizar las rutas
main_blueprint = Blueprint("main", __name__)

@main_blueprint.route("/vinos", methods=["GET"])
def vinos():
    connection = get_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM vinos")
    data_usuarios = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(data_usuarios)

