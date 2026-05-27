---
name: documentacion-codigo
description: |
  Esta skill guía al agente o desarrollador en la creación y actualización de documentación técnica detallada para cada aplicación del repositorio (bbdd-vinos y front-end-vinos), asegurando que el equipo de 5 integrantes tenga claridad absoluta sobre la estructura de la base de datos, el flujo de frontend y el despliegue del proyecto.
---

# Skill de Documentación de Código y Aplicaciones (ABP Vinos)

Esta skill define las pautas, plantillas y flujos de trabajo recomendados para documentar cualquier código, esquema o configuración creado o modificado en este repositorio.

## Estructura del Repositorio y Roles

El repositorio se compone de dos aplicaciones principales:
1. **bbdd-vinos**: Base de datos MariaDB (Docker, SQL de inicialización).
2. **front-end-vinos**: Interfaz web (Vite + React).
3. **docs**: Documentación global del proyecto (como políticas de equipo y guías transversales).

---

## Cuándo usar esta Skill

Utiliza esta skill siempre que:
- Creas una nueva funcionalidad o realizas cambios en el esquema de base de datos (`bbdd-vinos/init-scripts/`).
- Creas o modificas componentes, estados o lógica de integración API en el frontend (`front-end-vinos/src/`).
- Configuras variables de entorno o archivos de configuración del proyecto (Docker, Vite, ESLint, Git, etc.).
- Deseas verificar si la documentación de tus últimos cambios está completa antes de hacer un commit o abrir un Pull Request (PR).

---

## Directrices de Documentación por Aplicación

### 1. Base de Datos (`bbdd-vinos`)

Cualquier cambio en la base de datos debe reflejarse en:
- `bbdd-vinos/instrucciones.md` (o un archivo `docs/bbdd-vinos-schema.md` si el esquema crece).
- Comentarios detallados dentro de los archivos SQL de `init-scripts/`.

#### Qué documentar en BBDD:
- **Esquema de Tablas**: Para cada tabla nueva o modificada:
  - Nombre de la tabla y propósito.
  - Columnas, tipos de datos, restricciones (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`).
  - Relaciones (diagrama conceptual o descripción textual clara).
- **Scripts de Inicialización**: Si se añade un script SQL en `init-scripts/`, documenta su orden de ejecución y qué datos/esquema aporta.
- **Instrucciones de Despliegue**: Si cambian las credenciales, puertos o variables de entorno en `docker-compose.yaml`.

---

### 2. Frontend (`front-end-vinos`)

Cualquier componente o integración nueva en React debe documentarse en:
- `front-end-vinos/instrucciones.md` (instrucciones de inicio y comandos).
- Un archivo `front-end-vinos/README.md` o `docs/frontend-architecture.md` si es un cambio estructural.
- Documentación inline de componentes utilizando JSDoc.

#### Qué documentar en Frontend:
- **Componentes**:
  - Propósito del componente.
  - Props requeridas y opcionales.
  - Estado local (`useState`, `useReducer`) o global (`Context`, `Redux`).
- **Lógica de API / Consumo de Servicios**:
  - Rutas del backend que se consumen, métodos HTTP y el formato de datos esperado.
  - Gestión de errores y estados de carga.
- **Estilos y CSS**:
  - Si se añade un nuevo archivo de estilos o se usan variables CSS globales en `index.css`.

---

### 3. Documentación Global (`docs/`)

Para configuraciones que afecten a todo el proyecto (como reglas de Git, integraciones de CI/CD, configuración de despliegue, o variables de entorno globales):
- Añadir o actualizar archivos markdown específicos dentro de la carpeta `docs/`.
- Mantener un índice de la documentación en un `README.md` principal en la raíz del repositorio.

---

## Guía de Estilo y Formato de Documentación

1. **Markdown Limpio**: Utiliza títulos claros (`#`, `##`, `###`), bloques de código con sintaxis resaltada (especifica el lenguaje como `sql`, `javascript`, `bash`, `yaml`) y listas ordenadas/desordenadas para los pasos.
2. **Alertas de GitHub**: Utiliza alertas para destacar información clave (ej. `> [!IMPORTANT]`, `> [!WARNING]`, `> [!NOTE]`).
3. **Autodocumentación**: Antes de escribir documentación extensa, asegúrate de que el código sea autodocumentado (nombres de variables descriptivos, funciones cortas con responsabilidad única).
4. **Comentarios de Código Explicativos**: Documenta el *por qué* se tomó una decisión de diseño compleja, no solo el *qué* hace el código.

---

## Script Auxiliar de Verificación de Documentación

Esta skill incluye un script de verificación automatizado en `skills/documentacion-codigo/scripts/check_undocumented.py`. 
Este script analiza los archivos modificados/creados recientemente usando Git y genera una lista de verificación (checklist) con las sugerencias de documentación que debes revisar antes de dar por terminado tu trabajo.

### Cómo ejecutar el script:
1. Asegúrate de tener Python 3 instalado.
2. Ejecuta el script desde la raíz del proyecto:
   ```bash
   python3 skills/documentacion-codigo/scripts/check_undocumented.py
   ```
