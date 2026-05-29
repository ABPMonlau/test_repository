# CRM Restaurant La Canal 🍽️

Guía técnica para la instalación, ejecución y uso del panel de gestión interno del restaurante.

---

# 1. 📦 Contenido del proyecto

La carpeta del proyecto debe contener:

* `app.py`
* Carpeta `templates/`
* Carpeta `static/`
* `requirements.txt`

---

# 2. 💻 Requisitos necesarios

Para utilizar el proyecto hace falta:

* Python 3 instalado.
* Visual Studio Code (recomendado).
* Conexión a la misma red que la Raspberry Pi.
* Base de datos MariaDB activa en la Raspberry Pi.

---

# 3. 📥 Instalación

## Abrir el proyecto

Abrir la carpeta del proyecto en VS Code.

---

## Abrir terminal

```text id="j92lma"
Terminal > New Terminal
```

o:

```text id="r3z8jq"
Ctrl + ñ
```

---

## Instalar dependencias

Ejecutar:

```bash id="x4r1nn"
pip install -r requirements.txt
```

---

# 4. 🗄️ Base de datos

El CRM utiliza una base de datos MariaDB alojada en la Raspberry Pi.

Si la IP de la Raspberry cambia, será necesario actualizarla en:

```text id="4k11bq"
app.py
```

dentro de:

```python id="s0w5hz"
get_db_connection()
```

---

# 5. 🚀 Ejecutar el servidor

Ejecutar en terminal:

```bash id="7u7zdo"
py app.py
```

Si no funciona:

```bash id="8m7t7d"
python app.py
```

---

# 6. 🌐 Abrir la plataforma

Abrir en el navegador:

```text id="1s0m9n"
http://127.0.0.1:5000
```

---

# 7. 🔐 Uso del CRM

## Iniciar sesión

Introducir:

* Usuario
* Contraseña

---

## Crear un usuario nuevo

Desde el Login pulsar:

```text id="4xl4o2"
"No tengo cuenta, crear una nueva"
```

Será necesario introducir:

* Nombre de usuario
* Contraseña
* Contraseña de administrador

---

# 8. 🛠️ Tecnologías utilizadas

* Python
* Flask
* MariaDB
* HTML
* CSS
* Raspberry Pi
* Docker

---

# 9. ✅ Ejecución rápida

## Instalar dependencias

```bash id="9j2o7n"
pip install -r requirements.txt
```

## Ejecutar servidor

```bash id="s3e6ki"
py app.py
```

## Abrir CRM

```text id="h0ghx2"
http://127.0.0.1:5000
```
