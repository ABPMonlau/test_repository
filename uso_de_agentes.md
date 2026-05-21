# 🤖 Guía de Uso de Agentes y Skills (ABP)

Este documento describe cómo interactuar con **Antigravity** (el agente de IA) y cómo utilizar las **Skills** personalizadas definidas en este repositorio para automatizar tareas y mantener la calidad del proyecto.

---

## 🚀 Antigravity CLI

**Antigravity** es el asistente virtual de codificación que apoya en el desarrollo de la aplicación **La Canal**. Se puede invocar para realizar diversas tareas complejas, tales como:

- **Orquestación de Base de Datos**: Fusionar contenedores de Docker, configurar usuarios, gestionar permisos específicos y verificar inicializaciones.
- **Desarrollo de API y Frontend**: Crear endpoints, estructurar componentes de React y configurar el enrutamiento.
- **Auditoría y Documentación**: Generar archivos Markdown detallados de los esquemas de base de datos (`docs/documentacion-bbdd-vinos.md`, `docs/documentacion-bbdd-reservas.md`) y validar el estado del proyecto.

---

## 🛠️ Skills Disponibles

Las **Skills** son conjuntos de instrucciones, scripts y directrices que extienden las capacidades de los agentes de IA dentro de este repositorio. Se encuentran en el directorio `.agents/skills/`.

### 1. `documentacion-codigo`
Ubicación: [documentacion-codigo/SKILL.md](file:///Users/heernaa/Desktop/ABP/.agents/skills/documentacion-codigo/SKILL.md)

Esta skill guía al agente o desarrollador en la creación y actualización de documentación técnica detallada para cada aplicación del repositorio, garantizando que el equipo de 5 integrantes tenga claridad absoluta sobre la estructura de la base de datos, el flujo del frontend y el despliegue del proyecto.

#### 🔍 Script de Verificación Automatizado
La skill incluye un script de verificación automatizado en Python para auditar qué archivos modificados o creados recientemente necesitan documentación.

**Cómo ejecutar el script:**
1. Asegúrate de tener Python 3 instalado.
2. Ejecuta el script desde la raíz del proyecto:
   ```bash
   python3 .agents/skills/documentacion-codigo/scripts/check_undocumented.py
   ```

**Funcionamiento:**
El script analiza el estado de Git (`git status --porcelain`) y genera una lista de verificación dinámica (checklist) con recomendaciones basadas en el tipo de archivos modificados:
- Si se modifican archivos SQL en `bbdd/init-scripts/`, sugerirá añadir comentarios en el SQL y actualizar la guía de la base de datos.
- Si se modifican componentes React (`.jsx`, `.js`), sugerirá documentar props y estados mediante JSDoc.
- Si se modifican configuraciones (`package.json`, `docker-compose.yaml`, `.env`), recomendará documentar nuevos puertos, variables o dependencias.

---

## 💡 Buenas Prácticas para el Trabajo con Agentes

Para obtener los mejores resultados al delegar tareas a Antigravity u otros agentes de IA, sigue estas recomendaciones:

> [!TIP]
> **Claridad en los Requerimientos**: Sé explícito con los nombres de las bases de datos, usuarios, contraseñas y puertos. Por ejemplo: *"Modifica el docker-compose para crear un usuario llamado adminreservas con contraseña 1234"* en lugar de *"Crea un usuario para la base de datos"*.

> [!IMPORTANT]
> **Revisión de Documentación**: Siempre ejecuta el script `check_undocumented.py` antes de realizar un Commit o abrir un Pull Request (PR). Asegura que toda nueva funcionalidad esté documentada de acuerdo a las directrices de la skill.

> [!WARNING]
> **Seguridad de Credenciales**: Asegúrate de que las credenciales sensibles o configuraciones locales permanezcan en archivos `.env` (los cuales están excluidos en el [.gitignore](file:///Users/heernaa/Desktop/ABP/.gitignore)) y no sean expuestos por el agente en commits públicos.
