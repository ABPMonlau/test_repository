import os
import pymysql

def get_connection():
    """
    Abre una conexión con la base de datos MySQL/MariaDB.
    Esta función se reutiliza en las rutas que necesitan consultar
    o modificar datos.
    """
    connection = pymysql.connect(
        host="172.17.34.40",
        port=3306,
        user="vinosadmin",
        password="1234",
        database="cataleg-vins",
        cursorclass=pymysql.cursors.DictCursor,
    )
    return connection
