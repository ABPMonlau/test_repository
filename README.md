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
├── README.md                          ← Este archivo de bienvenida
├── bbdd/                              # Base de datos unificada (MariaDB)
│   ├── docker-compose.yaml            # Orquestador del contenedor db-la-canal
│   ├── bbdd-reservas/                 # Persistencia e inicialización de turnos
│   │   └── init-scripts/
│   │       └── turnos.sql             # Datos de turnos de Reservas
│   └── init-scripts/                  # Scripts SQL de inicialización en orden de ejecución
│       ├── 01-databases-y-usuarios.sql   # Crea esquemas de base de datos y accesos
│       ├── 02-schema-vinos.sql           # Tablas de catálogo de vinos y bodegas
│       ├── 03-data-vinos.sql             # Importación de vinos iniciales
│       ├── 04-schema-reservas.sql        # Tablas de clientes, mesas y reservas
│       ├── 05-schema-turnos.sql          # Tablas de turnos horarios
│       ├── 05-schema-users.sql           # Credenciales y control de acceso inicial
│       └── 06-schema-menus.sql           # Platos, menús y precios del restaurante
├── api-vinos/                         # API REST de Catálogo de Vinos (Python 3 + Flask)
│   ├── app.py                         # Punto de entrada de la API REST (Flask)
│   ├── controller/                    # Lógica de controladores y ruteo
│   │   └── controller.py
│   ├── database/                      # Conexión a MariaDB mediante PyMySQL
│   │   └── connection.py
│   └── tests/                         # Pruebas automatizadas del backend
│       ├── __init__.py
│       └── test_controller.py         # Tests unitarios del controlador con Mocks (pytest)
├── front-end-vinos/                   # Frontend Web (React 19 + Vite 8 + CSS)
│   ├── package.json                   # Dependencias y scripts NPM (Vitest/Playwright)
│   ├── vite.config.js                 # Configuración de bundler Vite y Vitest (jsdom)
│   ├── playwright.config.js           # Orquestación y configuración de tests E2E
│   ├── index.html                     # Plantilla HTML raíz del cliente web
│   ├── tests-e2e/                     # Pruebas End-to-End
│   │   └── vinos_flow.spec.js         # Test Playwright de navegación y API Mocking
│   ├── proto/                         # Prototipos y maquetas en desarrollo
│   │   └── pagina_menu/
│   │       └── menu.md                # Maquetación prototipo de menús
│   └── src/                           # Código fuente de React
│       ├── main.jsx                   # Entrada de inicialización de la SPA
│       ├── App.jsx                    # Enrutador principal y diseño de layouts
│       ├── setupTests.js              # Configuración global de matchers de HTML (Vitest)
│       ├── index.css                  # Estilos globales y variables de diseño CSS
│       └── components/                # Componentes web modulares y reutilizables
│           ├── CardMenu.jsx           # Renderizador de tarjetas de menús
│           ├── CardVino.jsx           # Renderizador de tarjetas de vinos
│           ├── CardVino.test.jsx      # Test unitario del componente CardVino (RTL)
│           ├── Footer.jsx             # Pie de página transversal
│           ├── Hero.jsx               # Panel de bienvenida editorial
│           ├── HeroImageCard.jsx      # Carrusel visual de la landing page
│           ├── ListaVinos.jsx         # Agrupación y filtrado de la bodega
│           └── NavBar.jsx             # Barra de navegación receptiva
├── book_api/                          # API REST de Reservas (Java + Spring Boot 3)
│   ├── pom.xml                        # Descriptor del proyecto Maven y dependencias
│   ├── Dockerfile                     # Receta de compilación y empaquetado del contenedor
│   ├── mvnw / mvnw.cmd                # Envoltorio ejecutable de Maven (wrapper)
│   └── src/
│       ├── main/                      # Código productivo del backend
│       │   ├── java/com/lacanal/book_api/
│       │   │   ├── BookApiApplication.java # Inicializador de Spring Boot
│       │   │   ├── controllers/       # Endpoints REST de reservas
│       │   │   ├── dao/               # Interfaces y lógica SQL con JdbcTemplate
│       │   │   ├── models/            # Clases de dominio POJO (Cliente, Mesa, Reserva, etc.)
│       │   │   └── mappers/           # RowMappers para conversión ResultSet-POJO
│       │   └── resources/
│       │       └── application.properties # Parámetros del servidor y BBDD
│       └── test/                      # Batería de pruebas automatizadas en Java
│           └── java/com/lacanal/book_api/
│               └── BookApiApplicationTests.java # Tests unitarios de Spring Context
└── docs/                              # Centro Unificado de Documentación
    ├── README.md                      ← Mapa de Navegación del centro de docs
    ├── bbdd/                          # Manuales de persistencia y esquemas SQL
    ├── front-end-vinos/               # Arquitectura visual, manuales y testing
    ├── api-vinos/                     # Documentación de la API de Vinos
    ├── book_api/                      # Arquitectura y manual del backend de Reservas
    └── general/                       # Políticas de testing, Git y uso de agentes
```

---

## Índice de Documentación

| Archivo / Ruta | Descripción |
|----------------|-------------|
| [docs/README.md](docs/README.md) | 🗺️ Mapa de navegación principal de la documentación |
| [docs/bbdd/instrucciones.md](docs/bbdd/instrucciones.md) | 🐳 Guía de despliegue y comandos Docker de MariaDB |
| [docs/bbdd/documentacion-bbdd-vinos.md](docs/bbdd/documentacion-bbdd-vinos.md) | 🍷 Esquema detallado de la BBDD `cataleg-vins` |
| [docs/bbdd/documentacion-bbdd-reservas.md](docs/bbdd/documentacion-bbdd-reservas.md) | 📋 Esquema detallado de la BBDD `reservas_lacanal` |
| [docs/bbdd/documentacion-bbdd-usuarios.md](docs/bbdd/documentacion-bbdd-usuarios.md) | 👤 Esquema detallado de la BBDD `usuarios-lacanal` |
| [docs/bbdd/documentacion-bbdd-menus.md](docs/bbdd/documentacion-bbdd-menus.md) | 🍔 Esquema detallado de la BBDD `menus-lacanal` |
| [docs/front-end-vinos/README.md](docs/front-end-vinos/README.md) | 💻 Documentación principal e instrucciones del Frontend |
| [docs/front-end-vinos/instrucciones.md](docs/front-end-vinos/instrucciones.md) | ⚡ Guía de inicio y comandos Vite para el frontend |
| [docs/front-end-vinos/frontend-architecture.md](docs/front-end-vinos/frontend-architecture.md) | 📐 Arquitectura detallada, modularidad y estilos del cliente |
| [docs/front-end-vinos/testing.md](docs/front-end-vinos/testing.md) | 🧪 Guía de Testing del Frontend (Vitest + Playwright + API Mocking) |
| [docs/api-vinos/README.md](docs/api-vinos/README.md) | 🐍 Documentación y endpoints del catálogo de vinos (Python + Flask) |
| [docs/api-vinos/documentacion-lista-vinos.md](docs/api-vinos/documentacion-lista-vinos.md) | 🍷 Flujo de datos y llamadas de red de vinos |
| [docs/book_api/README.md](docs/book_api/README.md) | ☕ Documentación principal y endpoints de Reservas (Spring Boot) |
| [docs/book_api/documentacion-book-api.md](docs/book_api/documentacion-book-api.md) | 📅 Análisis arquitectónico y reglas de aforo de mesas |
| [docs/general/uso_de_agentes.md](docs/general/uso_de_agentes.md) | 🤖 Directrices del flujo de desarrollo asistido con agentes AI |
| [docs/general/git-ignore-explanations.md](docs/general/git-ignore-explanations.md) | 🚫 Explicación de políticas y reglas del archivo `.gitignore` |
| [docs/general/guia-testing.md](docs/general/guia-testing.md) | 🧪 Guía técnica transversal de testing y pirámide de pruebas |
| [docs/general/informe_testing_git_uml.md](docs/general/informe_testing_git_uml.md) | 📄 Informe de Ingeniería: Gestión de Configuración, Testing y UML (Mermaid) |

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
> No subir al repositorio: `.venv/`, `node_modules/`, `__pycache__/`, archivos `.pyc`, `.env`, ni `dist/`. Revisa el [.gitignore](docs/general/git-ignore-explanations.md) para más detalles.

