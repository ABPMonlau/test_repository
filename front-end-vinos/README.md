# 🍷 Front-End Vinos — La Canal

Interfaz web del catálogo de vinos de **La Canal**, desarrollada con **React 19** y **Vite 8**. Esta aplicación consume la API REST proporcionada por `api-vinos` (Flask) para mostrar, filtrar y gestionar la información de los vinos disponibles.

> [!NOTE]
> Este proyecto forma parte del **ABP Vinos** y está diseñado para trabajar junto con los servicios de base de datos (`bbdd-vinos`) y la API (`api-vinos`).

---

## 📦 Stack Tecnológico

| Tecnología | Versión | Propósito |
|---|---|---|
| [React](https://react.dev/) | ^19.2.6 | Biblioteca principal de UI |
| [React DOM](https://react.dev/) | ^19.2.6 | Renderizado en el navegador |
| [React Router DOM](https://reactrouter.com/) | ^7.15.1 | Navegación y enrutamiento SPA |
| [Vite](https://vite.dev/) | ^8.0.12 | Bundler y servidor de desarrollo |
| [ESLint](https://eslint.org/) | ^10.3.0 | Análisis estático y linting |

---

## 🗂️ Estructura de Archivos

```text
front-end-vinos/
├── src/
│   ├── main.jsx            — Punto de entrada, renderiza App envuelto en BrowserRouter
│   ├── App.jsx             — Componente principal con la definición de rutas (Routes)
│   ├── App.css             — Estilos del componente App
│   ├── index.css           — Estilos CSS globales y tokens de diseño
│   ├── assets/             — Recursos estáticos (logos, imágenes oficiales)
│   ├── pages/
│   │   └── index.jsx       — Orquestador de la página de inicio (Landing Page)
│   └── components/
│       ├── NavBar.jsx      — Barra de navegación con soporte SPA y scroll activo
│       ├── Hero.jsx        — Banner de presentación editorial atrevido y asimétrico
│       ├── HeroImageCard.jsx — Componente modular para las imágenes del collage 3D
│       ├── ListaVino.jsx   — Listado de vinos
│       ├── CardVino.jsx    — Tarjeta individual de vino
|       └── Footer.jsx      - Componente Footer para toda la web
├── public/                 — Archivos estáticos públicos
├── docs/
│   └── react-router.md    — Guía de uso de React Router
├── instrucciones.md        — Guía de instalación y ejecución
├── package.json
├── vite.config.js
└── eslint.config.js
```

---

## 🧩 Componentes

| Componente | Archivo | Descripción | Estado |
|---|---|---|---|
| **App** | `src/App.jsx` | Componente raíz. Define las rutas principales del enrutador (`<Routes>`). | ✅ Listo |
| **NavBar** | `src/components/NavBar.jsx` | Barra de navegación interactiva con scroll suave al inicio en la Home. | ✅ Listo |
| **Hero** | `src/components/Hero.jsx` | Banner de bienvenida con estructura editorial asimétrica en 3D y maquetación móvil dedicada. | ✅ Listo |
| **HeroImageCard** | `src/components/HeroImageCard.jsx` | Componente modular que optimiza y encuadra las imágenes en marcos dobles con hover states. | ✅ Listo |
| **ListaVinos** | `src/components/ListaVinos.jsx` | Muestra el listado completo de vinos obtenidos desde la API con buscador y filtros rápidos. | ✅ Listo |
| **CardVino** | `src/components/CardVino.jsx` | Tarjeta con la información resumida e imágenes dinámicas de un vino individual. | ✅ Listo |
| **Footer** | `src/components/CardVino.jsx` | Componente con información sobre el restaurante + Link a Instagram del mismo. | ✅ Listo |

> [!IMPORTANT]
> La maquetación de la página de inicio (Landing Page), el ruteado dinámico y la estructura de todos los componentes modulares de vinos (`ListaVinos` y `CardVino`), del Hero y del NavBar están **completamente finalizados y validados**.


---

## 🔌 Conexión con la API

El frontend consume los endpoints de la API REST `api-vinos` (desarrollada con Flask). La comunicación se realiza mediante peticiones HTTP (`fetch` o similar) al backend.

```text
┌─────────────────┐         HTTP         ┌─────────────────┐
│  front-end-vinos│  ──────────────────▶  │    api-vinos    │
│  localhost:5173  │  ◀──────────────────  │  (Flask API)    │
└─────────────────┘      JSON responses   └─────────────────┘
```

> [!WARNING]
> Asegúrate de que la API `api-vinos` esté en ejecución antes de iniciar el frontend. De lo contrario, las peticiones al backend fallarán y los componentes no podrán cargar datos.

---

## ⚙️ Scripts Disponibles

| Comando | Descripción |
|---|---|
| `npm run dev` | Inicia el servidor de desarrollo en `http://localhost:5173` |
| `npm run build` | Genera la build de producción en la carpeta `dist/` |
| `npm run lint` | Ejecuta ESLint para analizar el código en busca de errores |
| `npm run preview` | Previsualiza la build de producción localmente |

### Inicio rápido

```bash
# Instalar dependencias
npm install

# Iniciar en modo desarrollo
npm run dev
```

> [!TIP]
> Para instrucciones detalladas de instalación, configuración y ejecución, consulta el archivo [`instrucciones.md`](instrucciones.md).

---

## 📚 Documentación Adicional

| Recurso | Descripción |
|---|---|
| [`instrucciones.md`](instrucciones.md) | Guía completa de instalación, configuración y ejecución del proyecto |
| [`docs/react-router.md`](docs/react-router.md) | Guía de uso y configuración de React Router en este proyecto |

---

## 👥 Equipo

Proyecto desarrollado por el equipo de **ABP Vinos — La Canal** (5 integrantes).
