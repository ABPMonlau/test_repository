#!/usr/bin/env python3
import subprocess
import sys
import os

def run_git_status():
    try:
        result = subprocess.run(
            ['git', 'status', '--porcelain'],
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.split('\n')
    except subprocess.CalledProcessError as e:
        print(f"Error al ejecutar git status: {e}")
        return []
    except FileNotFoundError:
        print("Git no está instalado o no se encuentra en el PATH.")
        return []

def main():
    print("==================================================")
    print("🔍 VERIFICADOR DE DOCUMENTACIÓN DE CAMBIOS (ABP) 🔍")
    print("==================================================\n")

    lines = run_git_status()
    # Filter empty lines
    files_changed = [line[3:] for line in lines if line.strip()]

    if not files_changed or (len(files_changed) == 1 and files_changed[0] == ''):
        print("✅ No se detectaron archivos nuevos o modificados en Git.")
        print("No hay cambios pendientes de documentar. ¡Buen trabajo!")
        return

    print(f"Detectados {len(files_changed)} archivo(s) modificado(s) o nuevo(s):\n")
    for f in files_changed:
        print(f"  • {f}")
    print("\n--------------------------------------------------\n")

    db_changes = []
    fe_changes = []
    config_changes = []

    db_instructions_updated = False
    fe_instructions_updated = False

    for filepath in files_changed:
        # DB app
        if filepath.startswith("bbdd-vinos/"):
            if filepath == "bbdd-vinos/instrucciones.md":
                db_instructions_updated = True
            elif filepath.endswith(".sql"):
                db_changes.append(filepath)
            elif filepath.endswith("docker-compose.yaml"):
                config_changes.append(filepath)
        # FE app
        elif filepath.startswith("front-end-vinos/"):
            if filepath == "front-end-vinos/instrucciones.md":
                fe_instructions_updated = True
            elif filepath.endswith((".js", ".jsx", ".ts", ".tsx", ".css")):
                fe_changes.append(filepath)
            elif filepath.endswith(("package.json", "vite.config.js", ".gitignore")):
                config_changes.append(filepath)
        # Root configs/docs
        elif filepath.startswith("docs/"):
            pass
        elif filepath.endswith(".gitignore"):
            config_changes.append(filepath)

    # Generate recommendations
    recommendations = []

    # Database
    if db_changes:
        recommendations.append("📂 Base de Datos (bbdd-vinos):")
        recommendations.append("  [ ] Añadir comentarios descriptivos en los archivos SQL modificados/nuevos.")
        if not db_instructions_updated:
            recommendations.append("  [ ] ⚠️ Actualizar 'bbdd-vinos/instrucciones.md' explicando los cambios en las tablas o datos de inicialización.")
        else:
            recommendations.append("  [x] Se ha detectado una actualización en 'bbdd-vinos/instrucciones.md'.")
        recommendations.append("")

    # Frontend
    if fe_changes:
        recommendations.append("💻 Frontend (front-end-vinos):")
        has_new_components = any("components" in f for f in fe_changes)
        if has_new_components:
            recommendations.append("  [ ] Escribir bloques de documentación JSDoc para los nuevos componentes, detallando props y estado.")
        recommendations.append("  [ ] Comentar lógica compleja (como custom hooks o integraciones con la API) explicando el 'por qué'.")
        if not fe_instructions_updated:
            recommendations.append("  [ ] ⚠️ Considerar si los cambios requieren actualizar 'front-end-vinos/instrucciones.md' (nuevas dependencias, scripts de npm, variables .env).")
        else:
            recommendations.append("  [x] Se ha detectado una actualización en 'front-end-vinos/instrucciones.md'.")
        recommendations.append("")

    # Configs
    if config_changes:
        recommendations.append("⚙️ Configuraciones de Entorno:")
        for cf in config_changes:
            if "docker" in cf or ".env" in cf:
                recommendations.append(f"  [ ] Documentar cualquier nueva variable de entorno o puerto expuesto en {cf}.")
            elif "package.json" in cf:
                recommendations.append("  [ ] Asegurar que las dependencias agregadas a package.json se mencionen en el README/Instrucciones del frontend.")
            else:
                recommendations.append(f"  [ ] Revisar si los cambios en {cf} impactan el flujo de trabajo del equipo de 5 integrantes.")
        recommendations.append("")

    if recommendations:
        print("📋 CHECKLIST DE DOCUMENTACIÓN RECOMENDADA:\n")
        for rec in recommendations:
            print(rec)
        print("👉 Recuerda mantener la documentación actualizada para facilitar el desarrollo en equipo.")
    else:
        print("✅ Los cambios detectados no requieren documentación específica según las reglas estándar.")

if __name__ == "__main__":
    main()
