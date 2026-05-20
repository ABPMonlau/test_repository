# api-vinos — Documentación Técnica

API REST construida con **Python + Flask** que actúa como capa de acceso a datos entre la base de datos MariaDB (`bbdd-vinos`) y el frontend (`front-end-vinos`).

---

## Índice

1. [Arquitectura del proyecto](#1-arquitectura-del-proyecto)
2. [Requisitos previos](#2-requisitos-previos)
3. [Instalación y puesta en marcha](#3-instalación-y-puesta-en-marcha)
4. [Estructura de archivos](#4-estructura-de-archivos)
5. [Endpoints disponibles](#5-endpoints-disponibles)
6. [Base de datos](#6-base-de-datos)
7. [Variables de entorno](#7-variables-de-entorno)
8. [Convenciones del equipo](#8-convenciones-del-equipo)

---

## 1. Arquitectura del proyecto

```
front-end-vinos (React/Vite)
        │
        │  HTTP (JSON)
        ▼
  api-vinos (Flask)
        │
        │  pymysql
        ▼
  bbdd-vinos (MariaDB via Docker)
```

La API sigue el patrón **Blueprint** de Flask para separar rutas del punto de entrada principal:

- `app.py` — Punto de entrada. Crea la app Flask y registra el Blueprint.
- `controller/controller.py` — Define todas las rutas (Blueprint `main`).
- `database/connection.py` — Función reutilizable que abre la conexión a MariaDB.

---

## 2. Requisitos previos

| Herramienta | Versión mínima | Uso |
|---|---|---|
| Python | 3.12 | Entorno de ejecución |
| pip | — | Gestor de paquetes |
| Docker Desktop | — | Para levantar MariaDB (`bbdd-vinos`) |

Dependencias Python (instalar dentro del entorno virtual):

```
flask
pymysql
```

---

## 3. Instalación y puesta en marcha

> [!IMPORTANT]
> Antes de arrancar la API asegúrate de que el contenedor de MariaDB de `bbdd-vinos` está corriendo.

### 3.1 Levantar la base de datos

```bash
cd bbdd-vinos
docker compose up -d
```

### 3.2 Crear el entorno virtual e instalar dependencias

Desde la raíz de `api-vinos`:

```bash
# Crear el entorno virtual (solo la primera vez)
python3 -m venv .venv

# Activar el entorno virtual
source .venv/bin/activate        # macOS / Linux
.venv\Scripts\activate           # Windows

# Instalar dependencias
pip install flask pymysql
```

> [!NOTE]
> El directorio `.venv/` está excluido del repositorio mediante `.gitignore`. Cada miembro del equipo debe crearlo localmente.

### 3.3 Arrancar el servidor de desarrollo

```bash
python app.py
```

La API quedará disponible en: **`http://127.0.0.1:5000`**

---

## 4. Estructura de archivos

```
api-vinos/
├── .venv/                  # Entorno virtual Python (ignorado por Git)
├── app.py                  # Punto de entrada de Flask
├── controller/
│   └── controller.py       # Rutas del Blueprint "main"
└── database/
    └── connection.py       # Función get_connection() para MariaDB
```

### Por qué no hay `__init__.py`

Flask localiza los módulos `controller` y `database` como paquetes Python porque el servidor se lanza **desde la raíz de `api-vinos/`**, añadiendo ese directorio al `sys.path` automáticamente. Los archivos `__init__.py` son opcionales en Python 3 (namespace packages).

> [!WARNING]
> Si se abre la carpeta `api-vinos/` directamente en VSCode sin configurar el intérprete de Python del `.venv`, el editor no encontrará los módulos locales (`database`, `controller`) ni las librerías instaladas (`flask`, `pymysql`). Ver la sección de [Convenciones del equipo](#8-convenciones-del-equipo) para la solución.

---

## 5. Endpoints disponibles

### `GET /vinos`

Devuelve todos los productos de la tabla `products` de la base de datos.

**Request**
```
GET http://127.0.0.1:5000/vinos
```

**Response** — `200 OK`
```json
[
  {
    "producto_id": 1,
    "cosecha_id": 1,
    "formato_id": 2
  }
]
```

> [!NOTE]
> La query actual consulta la tabla `products`. Según el esquema de `bbdd-vinos`, la tabla de productos de venta se llama `vinos_venta`. Este endpoint deberá actualizarse cuando el esquema quede consolidado.

---

## 6. Base de datos

La conexión se configura directamente en `database/connection.py`:

| Parámetro | Valor actual |
|---|---|
| `host` | `127.0.0.1` |
| `user` | `root` |
| `password` | `la-canal-admin` |
| `database` | `cataleg-vins` |
| `cursorclass` | `DictCursor` (resultados como diccionarios) |

El uso de `DictCursor` hace que cada fila retornada sea un `dict` Python con los nombres de columna como claves, lo que permite serializarla directamente a JSON.

> [!CAUTION]
> Las credenciales están escritas directamente en el código. Como próximo paso se deben mover a un archivo `.env` (ver sección siguiente) que **no se suba al repositorio**.

---

## 7. Variables de entorno

Actualmente no existe un archivo `.env`. El objetivo es moverlo aquí para no tener credenciales en el código fuente.

Crear un archivo `.env` en la raíz de `api-vinos/` (este archivo está en `.gitignore`):

```env
DB_HOST=127.0.0.1
DB_USER=root
DB_PASSWORD=la-canal-admin
DB_NAME=cataleg-vins
```

Compartir con el equipo un archivo `.env.example` con los nombres de las variables pero **sin valores reales**:

```env
DB_HOST=
DB_USER=
DB_PASSWORD=
DB_NAME=
```

---

## 8. Convenciones del equipo

### Seleccionar el intérprete de Python en VSCode

VSCode necesita saber qué intérprete usar para resolver los imports correctamente. Si ves errores de tipo `Import "flask" could not be resolved`:

1. Abre la paleta de comandos: `Cmd+Shift+P`
2. Escribe y selecciona: **Python: Select Interpreter**
3. Elige la opción que apunte a `.venv`:
   ```
   ./api-vinos/.venv/bin/python  (o similar)
   ```

Alternativamente, crea un archivo `.vscode/settings.json` en la raíz del repositorio:

```json
{
  "python.defaultInterpreterPath": "${workspaceFolder}/api-vinos/.venv/bin/python"
}
```

### Flujo de trabajo Git

- **No subir** `.venv/`, `__pycache__/`, archivos `.pyc` ni `.env`.
- Hacer commit de cualquier nueva dependencia documentándola en este README o en un `requirements.txt`.
- Abrir Pull Request para cualquier nuevo endpoint y actualizar la sección [Endpoints](#5-endpoints-disponibles).
