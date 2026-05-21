# React Router — Guía de uso

> Versión usada en este proyecto: **react-router-dom ^7.15.1**

React Router es la librería estándar para gestionar la **navegación** en aplicaciones React. Permite que la URL del navegador cambie sin recargar la página, mostrando distintos componentes según la ruta activa.

---

## Índice

1. [Conceptos clave](#1-conceptos-clave)
2. [Configuración inicial](#2-configuración-inicial)
3. [Definir rutas](#3-definir-rutas)
4. [Navegar entre páginas](#4-navegar-entre-páginas)
5. [Rutas con parámetros](#5-rutas-con-parámetros)
6. [Ruta 404 — página no encontrada](#6-ruta-404--página-no-encontrada)
7. [Rutas anidadas y layouts](#7-rutas-anidadas-y-layouts)
8. [Flujo de trabajo recomendado para este proyecto](#8-flujo-de-trabajo-recomendado-para-este-proyecto)

---

## 1. Conceptos clave

| Concepto | Qué es |
|---|---|
| **Router** | Componente raíz que escucha los cambios de URL. Solo hay uno en toda la app. |
| **Route** | Asocia una URL (`path`) con un componente React. |
| **Link** | Enlace de navegación que no recarga la página (equivale a `<a>` inteligente). |
| **Outlet** | Marca el lugar donde se renderiza una ruta hija dentro de un layout. |
| **useNavigate** | Hook para navegar desde código JavaScript (sin clic del usuario). |
| **useParams** | Hook para leer los parámetros dinámicos de la URL (ej. `/vinos/3`). |

---

## 2. Configuración inicial

El `BrowserRouter` (o `createBrowserRouter`) debe envolver toda la aplicación. En este proyecto el punto de entrada es `src/main.jsx`:

```jsx
// src/main.jsx
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import App from './App.jsx'
import './index.css'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </StrictMode>
)
```

> [!IMPORTANT]
> `BrowserRouter` solo debe aparecer **una vez** en toda la app, siempre en el nivel más alto. Si lo pones dentro de un componente interior obtendrás errores de contexto.

---

## 3. Definir rutas

Las rutas se definen con `<Routes>` y `<Route>` dentro de `App.jsx` (o en un archivo de rutas dedicado):

```jsx
// src/App.jsx
import { Routes, Route } from 'react-router-dom'
import Home from './pages/Home'
import Vinos from './pages/Vinos'
import DetalleVino from './pages/DetalleVino'

function App() {
  return (
    <Routes>
      <Route path="/"          element={<Home />} />
      <Route path="/vinos"     element={<Vinos />} />
      <Route path="/vinos/:id" element={<DetalleVino />} />
    </Routes>
  )
}

export default App
```

- **`path`** — patrón de URL que activa la ruta.
- **`element`** — componente React que se renderiza cuando la URL coincide.
- **`:id`** — segmento dinámico (parámetro). Ver sección 5.

---

## 4. Navegar entre páginas

### Con `<Link>` (desde el JSX)

Usa `<Link>` en lugar de `<a href>` para no recargar la página:

```jsx
import { Link } from 'react-router-dom'

function NavBar() {
  return (
    <nav>
      <Link to="/">Inicio</Link>
      <Link to="/vinos">Catálogo de vinos</Link>
    </nav>
  )
}
```

### Con `<NavLink>` (con estilo activo automático)

`NavLink` añade automáticamente la clase `active` al enlace de la página actual:

```jsx
import { NavLink } from 'react-router-dom'

<NavLink
  to="/vinos"
  style={({ isActive }) => ({ fontWeight: isActive ? 'bold' : 'normal' })}
>
  Catálogo
</NavLink>
```

### Con `useNavigate` (desde código JS)

Útil para redirigir después de una acción (por ejemplo, tras enviar un formulario):

```jsx
import { useNavigate } from 'react-router-dom'

function FormularioBusqueda() {
  const navigate = useNavigate()

  function handleSubmit(e) {
    e.preventDefault()
    // Redirige a /vinos tras enviar el formulario
    navigate('/vinos')
  }

  return <form onSubmit={handleSubmit}>...</form>
}
```

---

## 5. Rutas con parámetros

Un parámetro dinámico se define con `:nombre` en el `path` y se lee con el hook `useParams`:

```jsx
// Definición de la ruta en App.jsx
<Route path="/vinos/:id" element={<DetalleVino />} />
```

```jsx
// src/pages/DetalleVino.jsx
import { useParams } from 'react-router-dom'

function DetalleVino() {
  const { id } = useParams()  // id === "3" si la URL es /vinos/3

  return <h1>Detalle del vino con ID: {id}</h1>
}
```

> [!NOTE]
> `useParams` devuelve los parámetros siempre como **string**. Si necesitas un número, conviértelo: `const vinoId = Number(id)`.

---

## 6. Ruta 404 — página no encontrada

Añade una ruta con `path="*"` al final para capturar cualquier URL que no coincida con las demás:

```jsx
<Routes>
  <Route path="/"      element={<Home />} />
  <Route path="/vinos" element={<Vinos />} />
  <Route path="*"      element={<PaginaNoEncontrada />} />
</Routes>
```

---

## 7. Rutas anidadas y layouts

Las rutas anidadas permiten que varias páginas compartan un mismo layout (cabecera, menú lateral, etc.) sin repetir código.

### Layout compartido

```jsx
// src/layouts/MainLayout.jsx
import { Outlet } from 'react-router-dom'
import NavBar from '../components/NavBar'

function MainLayout() {
  return (
    <>
      <NavBar />
      <main>
        <Outlet />  {/* aquí se renderiza la ruta hija activa */}
      </main>
    </>
  )
}
```

### Rutas en App.jsx con layout

```jsx
<Routes>
  <Route element={<MainLayout />}>       {/* layout sin path propio */}
    <Route path="/"          element={<Home />} />
    <Route path="/vinos"     element={<Vinos />} />
    <Route path="/vinos/:id" element={<DetalleVino />} />
  </Route>
  <Route path="*" element={<PaginaNoEncontrada />} />
</Routes>
```

`<Outlet />` dentro de `MainLayout` renderizará `<Home />`, `<Vinos />` o `<DetalleVino />` según la URL, manteniendo siempre la `<NavBar />` visible.

---

## 8. Flujo de trabajo recomendado para este proyecto

Sigue esta estructura cuando añadas una nueva página al frontend:

### Paso 1 — Crear el componente de página

```
front-end-vinos/src/pages/NuevaPagina.jsx
```

```jsx
function NuevaPagina() {
  return <h1>Nueva página</h1>
}

export default NuevaPagina
```

### Paso 2 — Registrar la ruta en `App.jsx`

```jsx
import NuevaPagina from './pages/NuevaPagina'

// Dentro de <Routes>:
<Route path="/nueva-pagina" element={<NuevaPagina />} />
```

### Paso 3 — Añadir el enlace en la navegación

```jsx
<Link to="/nueva-pagina">Nueva página</Link>
```

### Paso 4 — Documentar el endpoint consumido (si aplica)

Si la nueva página hace una llamada a `api-vinos`, añade el endpoint correspondiente en `api-vinos/README.md`.

---

*Para más información, consulta la documentación oficial: https://reactrouter.com*
