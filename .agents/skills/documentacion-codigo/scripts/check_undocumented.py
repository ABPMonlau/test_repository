#!/usr/bin/env python3
"""
check_undocumented.py
=====================
Script auxiliar de verificación de documentación para el proyecto ABP Vinos.

Analiza el estado actual del repositorio Git (`git status --porcelain`) y clasifica
los archivos modificados o nuevos según la aplicación a la que pertenecen:
  - **bbdd-vinos**: scripts SQL y configuración Docker.
  - **front-end-vinos**: componentes React, estilos CSS y configuración de Vite/npm.
  - **docs/**: documentación global (se omite de las recomendaciones, se asume documentada).
  - **Raíz del repositorio**: archivos de configuración generales (`.gitignore`, etc.).

A partir de esa clasificación genera un **checklist de documentación recomendada**
que el desarrollador debe revisar antes de hacer un commit o abrir un Pull Request.

Uso:
    python3 .agents/skills/documentacion-codigo/scripts/check_undocumented.py

Requisitos:
    - Python 3.6+
    - Git instalado y disponible en el PATH.
    - Ejecutar desde la raíz del repositorio (o cualquier subdirectorio que pertenezca al repo).
"""

import subprocess
import sys
import os


def run_git_status():
    """
    Ejecuta `git status --porcelain` y devuelve la salida como lista de líneas.

    El formato `--porcelain` garantiza una salida estable y scriptable independientemente
    de la configuración local de Git del usuario.  Cada línea tiene la forma::

        XY ruta/al/archivo

    donde los dos primeros caracteres representan el estado en el área de staging (X)
    y en el árbol de trabajo (Y).  Esta función devuelve las líneas en bruto para que
    `main()` decida cómo interpretarlas.

    Returns:
        list[str]: Lista de líneas de salida de `git status --porcelain`.
                   Devuelve una lista vacía si Git falla o no está instalado.
    """
    try:
        result = subprocess.run(
            ['git', 'status', '--porcelain'],
            capture_output=True,
            text=True,
            check=True  # Lanza CalledProcessError si el código de retorno es distinto de 0
        )
        return result.stdout.split('\n')
    except subprocess.CalledProcessError as e:
        # Puede ocurrir si el directorio actual no es un repositorio Git.
        print(f"Error al ejecutar git status: {e}")
        return []
    except FileNotFoundError:
        # Git no está instalado o no se encuentra en el PATH del sistema.
        print("Git no está instalado o no se encuentra en el PATH.")
        return []


def main():
    """
    Punto de entrada principal del script.

    Flujo de ejecución:
        1. Obtiene la lista de archivos modificados/nuevos mediante `run_git_status()`.
        2. Clasifica cada archivo en una de las categorías:
           - ``db_changes``: archivos SQL de bbdd-vinos.
           - ``fe_changes``: archivos JS/TS/CSS de front-end-vinos.
           - ``config_changes``: archivos de configuración (Docker, package.json, .gitignore…).
        3. Detecta si los archivos de instrucciones de cada aplicación ya han sido actualizados
           (``bbdd-vinos/instrucciones.md`` y ``front-end-vinos/instrucciones.md``), de forma que
           el checklist pueda marcar esas tareas como completadas.
        4. Genera e imprime el checklist de documentación recomendada para cada categoría con
           cambios detectados.

    Returns:
        None
    """
    print("==================================================")
    print("🔍 VERIFICADOR DE DOCUMENTACIÓN DE CAMBIOS (ABP) 🔍")
    print("==================================================\n")

    lines = run_git_status()

    # `git status --porcelain` antepone dos caracteres de estado + un espacio antes de la ruta.
    # Recortamos los primeros 3 caracteres (`XY `) para obtener sólo la ruta del archivo.
    # Las líneas vacías se descartan con `if line.strip()`.
    files_changed = [line[3:] for line in lines if line.strip()]

    if not files_changed or (len(files_changed) == 1 and files_changed[0] == ''):
        print("✅ No se detectaron archivos nuevos o modificados en Git.")
        print("No hay cambios pendientes de documentar. ¡Buen trabajo!")
        return

    print(f"Detectados {len(files_changed)} archivo(s) modificado(s) o nuevo(s):\n")
    for f in files_changed:
        print(f"  • {f}")
    print("\n--------------------------------------------------\n")

    # Listas de archivos clasificados por categoría
    db_changes = []       # Scripts SQL y archivos relacionados con la BBDD
    fe_changes = []       # Componentes, hooks, estilos del frontend
    config_changes = []   # Archivos de configuración de entorno o herramientas

    # Banderas que indican si los archivos de instrucciones ya fueron actualizados.
    # Evitan mostrar una advertencia innecesaria cuando el desarrollador ya los editó.
    db_instructions_updated = False
    fe_instructions_updated = False

    for filepath in files_changed:
        # --- Aplicación: bbdd-vinos ---
        if filepath.startswith("bbdd-vinos/"):
            if filepath == "bbdd-vinos/instrucciones.md":
                # El desarrollador ya actualizó las instrucciones de la BBDD.
                db_instructions_updated = True
            elif filepath.endswith(".sql"):
                db_changes.append(filepath)
            elif filepath.endswith("docker-compose.yaml"):
                # Los cambios en docker-compose pueden alterar variables de entorno o puertos.
                config_changes.append(filepath)

        # --- Aplicación: front-end-vinos ---
        elif filepath.startswith("front-end-vinos/"):
            if filepath == "front-end-vinos/instrucciones.md":
                # El desarrollador ya actualizó las instrucciones del frontend.
                fe_instructions_updated = True
            elif filepath.endswith((".js", ".jsx", ".ts", ".tsx", ".css")):
                fe_changes.append(filepath)
            elif filepath.endswith(("package.json", "vite.config.js", ".gitignore")):
                # Cambios en configuración de bundler o dependencias afectan al equipo completo.
                config_changes.append(filepath)

        # --- Documentación global: docs/ ---
        elif filepath.startswith("docs/"):
            # Los archivos dentro de docs/ se consideran documentación per se;
            # no se genera ninguna recomendación adicional para ellos.
            pass

        # --- Configuración en la raíz del repositorio ---
        elif filepath.endswith(".gitignore"):
            config_changes.append(filepath)

    # --- Generación del checklist de recomendaciones ---
    recommendations = []

    # Recomendaciones para cambios en la base de datos
    if db_changes:
        recommendations.append("📂 Base de Datos (bbdd-vinos):")
        recommendations.append("  [ ] Añadir comentarios descriptivos en los archivos SQL modificados/nuevos.")
        if not db_instructions_updated:
            recommendations.append(
                "  [ ] ⚠️ Actualizar 'bbdd-vinos/instrucciones.md' explicando los cambios en las tablas o datos de inicialización."
            )
        else:
            recommendations.append("  [x] Se ha detectado una actualización en 'bbdd-vinos/instrucciones.md'.")
        recommendations.append("")

    # Recomendaciones para cambios en el frontend
    if fe_changes:
        recommendations.append("💻 Frontend (front-end-vinos):")
        # Si existe algún archivo dentro de la carpeta `components/`, se pide documentación JSDoc específica.
        has_new_components = any("components" in f for f in fe_changes)
        if has_new_components:
            recommendations.append(
                "  [ ] Escribir bloques de documentación JSDoc para los nuevos componentes, detallando props y estado."
            )
        recommendations.append(
            "  [ ] Comentar lógica compleja (como custom hooks o integraciones con la API) explicando el 'por qué'."
        )
        if not fe_instructions_updated:
            recommendations.append(
                "  [ ] ⚠️ Considerar si los cambios requieren actualizar 'front-end-vinos/instrucciones.md' "
                "(nuevas dependencias, scripts de npm, variables .env)."
            )
        else:
            recommendations.append("  [x] Se ha detectado una actualización en 'front-end-vinos/instrucciones.md'.")
        recommendations.append("")

    # Recomendaciones para cambios en archivos de configuración
    if config_changes:
        recommendations.append("⚙️ Configuraciones de Entorno:")
        for cf in config_changes:
            if "docker" in cf or ".env" in cf:
                recommendations.append(
                    f"  [ ] Documentar cualquier nueva variable de entorno o puerto expuesto en {cf}."
                )
            elif "package.json" in cf:
                recommendations.append(
                    "  [ ] Asegurar que las dependencias agregadas a package.json se mencionen en el README/Instrucciones del frontend."
                )
            else:
                # Para cualquier otro archivo de configuración, se recuerda valorar el impacto en el equipo.
                recommendations.append(
                    f"  [ ] Revisar si los cambios en {cf} impactan el flujo de trabajo del equipo de 5 integrantes."
                )
        recommendations.append("")

    # Impresión final del checklist
    if recommendations:
        print("📋 CHECKLIST DE DOCUMENTACIÓN RECOMENDADA:\n")
        for rec in recommendations:
            print(rec)
        print("👉 Recuerda mantener la documentación actualizada para facilitar el desarrollo en equipo.")
    else:
        print("✅ Los cambios detectados no requieren documentación específica según las reglas estándar.")


if __name__ == "__main__":
    main()
