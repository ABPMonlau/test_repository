import os
import pymysql

def get_connection():
    """
    Abre una conexión con la base de datos MySQL/MariaDB.
    Esta función se reutiliza en las rutas que necesitan consultar
    o modificar datos.
    """
    connection = pymysql.connect(
        host=os.environ.get("DB_HOST", "localhost"),
        port=int(os.environ.get("DB_PORT", 3306)),
        user=os.environ.get("DB_USER", "vinosadmin"),
        password=os.environ.get("DB_PASSWORD", "1234"),
        database=os.environ.get("DB_NAME", "cataleg-vins"),
        cursorclass=pymysql.cursors.DictCursor,
    )
    return connection
