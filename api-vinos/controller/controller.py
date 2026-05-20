from flask import Blueprint, jsonify

from database.queries import get_all_vinos

# Creamos el Blueprint para organizar las rutas
main_blueprint = Blueprint("main", __name__)

@main_blueprint.route("/vinos", methods=["GET"])
def vinos():
    data = get_all_vinos()
    return jsonify(data)
