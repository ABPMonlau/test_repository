# 🗺️ Mapa de Navegación de la Documentación (La Canal)

¡Bienvenido al centro unificado de documentación del **Restaurant La Canal**! 

Este directorio centraliza toda la especificación técnica, manuales de despliegue y guías de desarrollo de los diferentes componentes del proyecto para asegurar que el equipo de **5 integrantes** tenga total claridad sobre el flujo de trabajo y la arquitectura de la aplicación.

La documentación se encuentra clasificada rigurosamente según su origen y componente:

---

## 📂 Estructura de Documentación

```
docs/
├── README.md                          # Este índice de navegación
│
├── bbdd/                              # Bases de Datos (MariaDB / Docker)
│   ├── instrucciones.md               # Comandos de despliegue y uso de Docker
│   ├── documentacion-bbdd-menus.md    # Esquema y lógica de la BBDD de Menús
│   ├── documentacion-bbdd-reservas.md # Esquema y lógica de la BBDD de Reservas
│   ├── documentacion-bbdd-usuarios.md # Esquema y lógica de la BBDD de Usuarios
│   └── documentacion-bbdd-vinos.md    # Esquema y lógica de la BBDD de Vinos
│
├── front-end-vinos/                   # Frontend Web (React + Vite)
│   ├── README.md                      # Instrucciones de inicio del Frontend
│   ├── instrucciones.md               # Guía de instalación y comandos Vite
│   ├── react-router.md                # Configuración detallada de rutas en React
│   └── frontend-architecture.md       # Arquitectura, componentes y estilos
│
├── api-vinos/                         # API de Catálogo de Vinos (Python)
│   ├── README.md                      # Documentación del backend de Vinos
│   └── documentacion-lista-vinos.md   # Flujo de datos y endpoints de vinos
│
├── book_api/                          # API de Reservas de Mesas (Java / Spring Boot)
│   ├── README.md                      # Documentación y endpoints de Reservas
│   ├── HELP.md                        # Guía oficial del framework Spring Boot
│   └── documentacion-book-api.md      # Análisis de arquitectura y reglas del backend
│
└── general/                           # Políticas globales y Guías transversales
    ├── uso_de_agentes.md              # Flujo y directrices de desarrollo con agentes
    ├── git-ignore-explanations.md     # Explicación de políticas del .gitignore
    └── guia-testing.md                # Guía y políticas de pruebas automatizadas
```

---

## 🔑 Acceso Directo por Componentes

### 🗄️ 1. Bases de Datos (`bbdd/`)
* 🐳 **[Despliegue y Comandos de Docker](./bbdd/instrucciones.md):** Manual paso a paso para levantar los contenedores MariaDB y persistencia de volúmenes.
* 📋 **[BBDD Reservas](./bbdd/documentacion-bbdd-reservas.md):** Esquema relacional de clientes, mesas, turnos y la tabla principal de reservas.
* 🍔 **[BBDD Menús](./bbdd/documentacion-bbdd-menus.md):** Especificación de tablas relativas a platos, menús y precios.
* 🍷 **[BBDD Vinos](./bbdd/documentacion-bbdd-vinos.md):** Estructura del catálogo de vinos y bodegas.
* 👤 **[BBDD Usuarios](./bbdd/documentacion-bbdd-usuarios.md):** Gestión de credenciales, roles y acceso del personal.

### 💻 2. Frontend de Vinos (`front-end-vinos/`)
* ⚡ **[Guía Rápida de Despliegue](./front-end-vinos/instrucciones.md):** Comandos `npm` para levantar el entorno de desarrollo y generar el bundle de producción con Vite.
* 🗺️ **[Arquitectura de Rutas](./front-end-vinos/react-router.md):** Configuración de navegación del lado del cliente usando React Router.
* 📐 **[Diseño y Estilo](./front-end-vinos/frontend-architecture.md):** Especificación del sistema de componentes, modularidad y políticas de maquetación CSS del frontend.

### 🐍 3. API Vinos - Python (`api-vinos/`)
* 🍷 **[Endpoints y Flujo](./api-vinos/documentacion-lista-vinos.md):** Detalle de los servicios web REST encargados de consultar, filtrar y devolver el catálogo completo de vinos.

### ☕ 4. API Reservas - Java (`book_api/`)
* 📅 **[Arquitectura y Endpoints de Reservas](./book_api/documentacion-book-api.md):** Documentación exhaustiva sobre el backend de Spring Boot, incluyendo la regla algorítmica de optimización espacial para el aforo de mesas.

### 🛠️ 5. Políticas y Guías Generales (`general/`)
* 🤖 **[Uso de Agentes AI](./general/uso_de_agentes.md):** Directrices y flujo de trabajo al interactuar con asistentes de codificación en el repositorio.
* 🚫 **[Manual del .gitignore](./general/git-ignore-explanations.md):** Explicación detallada de qué archivos se excluyen del repositorio de Git y por qué.
* 🧪 **[Manual de Pruebas](./general/guia-testing.md):** Pautas para el desarrollo de pruebas unitarias y de integración de software.
