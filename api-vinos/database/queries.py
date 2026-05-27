import json
from pathlib import Path

from database.connection import get_connection

# Cargamos todas las queries desde el fichero JSON una sola vez al importar el módulo.
# Path(__file__) apunta a este mismo archivo (queries.py), así que .parent
# nos da la carpeta database/ donde también vive querys.json.
_QUERIES_FILE = Path(__file__).parent / "querys.json"
_QUERIES = json.loads(_QUERIES_FILE.read_text(encoding="utf-8"))


def get_all_vinos():
    """
    Consulta los vinos con todos sus datos relacionados (tipo, bodega,
    cosecha, formato y copa) usando la query definida en querys.json.
    Devuelve una lista de diccionarios, uno por cada fila.
    """
    connection = get_connection()
    cursor = connection.cursor()
    cursor.execute(_QUERIES["get_vinos"])
    data = cursor.fetchall()
    cursor.close()
    connection.close()
    return data

