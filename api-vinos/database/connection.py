import pymysql

def get_connection():
    """
    Abre una conexión con la base de datos MySQL/MariaDB.
    Esta función se reutiliza en las rutas que necesitan consultar
    o modificar datos.
    """
    connection = pymysql.connect(
        host="127.0.0.1",
        user="root",
        password="la-canal-admin",
        database="cataleg-vins",
        cursorclass=pymysql.cursors.DictCursor,
    )
    return connection
