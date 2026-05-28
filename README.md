# ABP Vinos — La Canal

Sistema de gestión para el restaurante **La Canal**, compuesto por un catálogo de vinos, un sistema de reservas y un panel de administración de accesos. Proyecto ABP desarrollado por un equipo de 5 integrantes.

---

## Arquitectura del Proyecto

```
┌─────────────────────────┐
│   front-end-vinos       │
│   (React 19 + Vite 8)   │
│   Puerto: 5173          │
└───────────┬─────────────┘
            │ HTTP (JSON)
            ▼
┌─────────────────────────┐
│   api-vinos             │
│   (Python + Flask)      │
│   Puerto: 5000          │
└───────────┬─────────────┘
            │ pymysql
            ▼
┌─────────────────────────┐
│   bbdd (MariaDB)        │
│   Contenedor Docker     │
│   Puerto: 3306          │
│                         │
│  ┌───────────────────┐  │
│  │  cataleg-vins     │  │
│  │  (8 tablas)       │  │
│  └───────────────────┘  │
│  ┌───────────────────┐  │
│  │  reservas_lacanal │  │
│  │  (4 tablas)       │  │
│  └───────────────────┘  │
│  ┌───────────────────┐  │
│  │  usuarios-lacanal │  │
│  │  (1 tabla)        │  │
│  └───────────────────┘  │
│  ┌───────────────────┐  │
│  │  menus-lacanal    │  │
│  │  (3 tablas)       │  │
│  └───────────────────┘  │
└─────────────────────────┘
```

---

## Componentes

| Componente | Tecnología | Puerto | Descripción |
|------------|-----------|--------|-------------|
| **bbdd** | MariaDB (Docker) | 3306 | Base de datos unificada con cuatro esquemas |
| **api-vinos** | Python 3 + Flask | 5000 | API REST para el catálogo de vinos |
| **front-end-vinos** | React 19 + Vite 8 | 5173 | Interfaz web del catálogo |

---

## Inicio Rápido

> [!IMPORTANT]
> Los servicios deben arrancarse en este orden: primero la base de datos, luego la API y finalmente el frontend.

### 1. Levantar la base de datos

```bash
cd bbdd
docker compose up -d
```

Verifica que el contenedor `db-la-canal` está activo:

```bash
docker ps
```

### 2. Arrancar la API

```bash
cd api-vinos

# Solo la primera vez: crear entorno virtual e instalar dependencias
python3 -m venv .venv
source .venv/bin/activate      # macOS / Linux
pip install flask pymysql flask-cors

# Arrancar el servidor
python app.py
```

La API quedará disponible en `http://127.0.0.1:5000`

### 3. Arrancar el frontend

```bash
cd front-end-vinos

# Solo la primera vez
npm install

# Arrancar el servidor de desarrollo
npm run dev
```

La aplicación estará disponible en `http://localhost:5173`

---

## Credenciales de Base de Datos

| Usuario | Contraseña | Acceso |
|---------|------------|--------|
| `root` | `la-canal-admin` | Superusuario — acceso total |
| `vinosadmin` | `1234` | Solo `cataleg-vins` |
| `reservasadmin` | `1234` | Solo `reservas_lacanal` |
| `usersadmin` | `1234` | Solo `usuarios-lacanal` |
| `menusadmin` | `1234` | Solo `menus-lacanal` |

---

## Estructura del Repositorio

```text
test_repository/
├── README.md                          ← Este archivo
├── bbdd/                              # Base de datos unificada
│   ├── docker-compose.yaml
│   ├── instrucciones.md
│   └── init-scripts/
│       ├── 01-databases-y-usuarios.sql   # Crea las 4 BD y usuarios
│       ├── 02-schema-vinos.sql           # Esquema de la BD de vinos
│       ├── 03-data-vinos.sql             # Datos de catálogo de vinos
│       ├── 04-schema-reservas.sql        # Esquema y datos de reservas (con turnos)
│       ├── 05-schema-users.sql           # Esquema y admin inicial de accesos
│       └── 06-schema-menus.sql           # Esquema y datos de menus
├── api-vinos/                         # API REST (Flask)
│   ├── README.md
│   ├── app.py
│   ├── controller/
│   └── database/
├── front-end-vinos/                   # Frontend (React + Vite)
│   ├── README.md
│   ├── instrucciones.md
│   ├── docs/react-router.md
│   └── src/
└── docs/                              # Documentación global
    ├── documentacion-bbdd-vinos.md
    ├── documentacion-bbdd-reservas.md
    ├── documentacion-bbdd-usuarios.md
    ├── documentacion-bbdd-menus.md
    ├── frontend-architecture.md
    └── git-ignore-explanations.md
```

---

## Índice de Documentación

| Archivo | Descripción |
|---------|-------------|
| [bbdd/instrucciones.md](bbdd/instrucciones.md) | Guía de levantamiento de la BD unificada |
| [api-vinos/README.md](api-vinos/README.md) | Documentación técnica completa de la API |
| [front-end-vinos/README.md](front-end-vinos/README.md) | Documentación del frontend |
| [front-end-vinos/instrucciones.md](front-end-vinos/instrucciones.md) | Guía de inicio del frontend |
| [front-end-vinos/docs/react-router.md](front-end-vinos/docs/react-router.md) | Guía de uso de React Router |
| [docs/frontend-architecture.md](docs/frontend-architecture.md) | Arquitectura y estructura detallada del frontend |
| [docs/documentacion-bbdd-vinos.md](docs/documentacion-bbdd-vinos.md) | Esquema detallado de `cataleg-vins` |
| [docs/documentacion-bbdd-reservas.md](docs/documentacion-bbdd-reservas.md) | Esquema detallado de `reservas_lacanal` |
| [docs/documentacion-bbdd-usuarios.md](docs/documentacion-bbdd-usuarios.md) | Esquema detallado de `usuarios-lacanal` |
| [docs/documentacion-bbdd-menus.md](docs/documentacion-bbdd-menus.md) | Esquema detallado de `menus-lacanal` |
| [docs/git-ignore-explanations.md](docs/git-ignore-explanations.md) | Explicación de reglas del `.gitignore` |

---

## Convenciones del Equipo

### Ramas (Branches)

- **`main`** — Rama principal protegida. No subir cambios directamente.
- Crear una rama descriptiva para cada tarea:
  ```bash
  git checkout -b feature/nombre-tarea
  ```

### Pull Requests

- Todo cambio debe pasar por un **Pull Request** revisado por al menos un compañero.
- Actualizar la documentación relevante en cada PR.

### Variables de Entorno

- Los archivos `.env` están en `.gitignore` y **nunca deben subirse** al repositorio.
- Cada miembro crea su propio `.env` localmente.
- Consultar con el equipo los valores necesarios.

### Dependencias

- **Python** (api-vinos): Documentar en el README o crear un `requirements.txt`.
- **Node.js** (front-end-vinos): Se gestionan con `package.json` + `npm install`.
- **Docker** (bbdd): No requiere instalación adicional de dependencias.

> [!WARNING]
> No subir al repositorio: `.venv/`, `node_modules/`, `__pycache__/`, archivos `.pyc`, `.env`, ni `dist/`. Revisa el [.gitignore](docs/git-ignore-explanations.md) para más detalles.

