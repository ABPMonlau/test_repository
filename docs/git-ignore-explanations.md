# Explicación del .gitignore (front-end-vinos)

Este documento explica por qué ciertos archivos y carpetas están excluidos del repositorio Git en nuestro proyecto de Vite. Esto es fundamental para mantener la seguridad, la limpieza y evitar conflictos en nuestro equipo de 5 personas.

## 1. Seguridad (Archivos .env)
**Archivos:** .env, .env.local, .env.*.local
*   **Por qué:** Estos archivos contienen variables de entorno, que a menudo incluyen claves de API, contraseñas de bases de datos o secretos de autenticación.
*   **Regla de equipo:** Nunca subas secretos al repositorio. Cada integrante debe crear su propio archivo .env localmente basándose en un archivo .env.example (si existe).

## 2. Dependencias (node_modules/)
**Carpeta:** node_modules/
*   **Por qué:** Contiene miles de archivos que se pueden descargar ejecutando npm install. Subirlos haría que el repositorio fuera extremadamente pesado y lento.
*   **Nota:** El archivo package-lock.json SÍ se sube para asegurar que todos instalemos exactamente las mismas versiones.

## 3. Compilación y Caché (dist/, .vite/)
**Carpetas:** dist/, .vite/
*   **Por qué:** 
    *   dist/ es el resultado final para producción; no se necesita en el código fuente.
    *   .vite/ es una caché interna que Vite usa para cargar más rápido. Si se sube, causaría conflictos constantes cada vez que alguien guarde un cambio.

## 4. Archivos del Sistema Operativo (.DS_Store, Thumbs.db)
*   **Por qué:** Son archivos basura que crean macOS y Windows para guardar preferencias de visualización de carpetas. No tienen nada que ver con el código y ensucian el historial de Git.

## 5. Editores e IDEs (.vscode/)
**Archivos:** .vscode/*, exceptuando settings.json y extensions.json.
*   **Por qué:** Queremos compartir la configuración de formato (Prettier/ESLint) y las extensiones recomendadas para que los 5 trabajemos igual, pero no queremos subir estados temporales del editor de cada uno.

---
*Si necesitas añadir una excepción o tienes dudas, coméntalo con el equipo antes de modificar el .gitignore.*
