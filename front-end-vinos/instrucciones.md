# Guía de Inicio: Frontend Vinos (Vite + React)

Este documento explica cómo configurar y ejecutar la aplicación frontend en tu máquina local.

## Requisitos Previos

1.  **Node.js**: Se recomienda la versión LTS más reciente (v20 o superior).
2.  **npm**: Viene instalado con Node.js.

## Pasos para el levantamiento desde cero

### 1. Instalación de dependencias
Primero, navega a la carpeta del proyecto e instala los paquetes necesarios:

```bash
cd front-end-vinos
npm install
```

### 2. Ejecución en desarrollo
Para iniciar el servidor de desarrollo con recarga en tiempo real (HMR):

```bash
npm run dev
```
Por defecto, la aplicación estará disponible en [http://localhost:5173](http://localhost:5173).

### 3. Linting (Revisión de código)
Para revisar que el código sigue las reglas de estilo y no tiene errores comunes:

```bash
npm run lint
```

## Colaboración en el equipo

*   **Ramas (Branches)**: Antes de empezar una nueva funcionalidad, asegúrate de crear una rama descriptiva (`git checkout -b feature/nombre-tarea`).
*   **Pull Requests**: No subas cambios directamente a `main`. Crea un PR y pide a otro compañero que revise el código.
*   **Variables de Entorno**: Si el proyecto requiere un archivo `.env`, pídelo a un compañero o revisa si hay un `.env.example` en la raíz.

## Construcción para Producción

Si necesitas generar los archivos optimizados para subir a un servidor:

```bash
npm run build
```
Los archivos se generarán en la carpeta `dist/`.
