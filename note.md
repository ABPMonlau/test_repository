# Cómo subir código a GitHub

## Primera vez (configurar repositorio)

Inicializar Git:

```bash
git init
```

Conectar el repositorio remoto:

```bash
git remote add origin https://github.com/ABPMonlau/test_repository.git
```

Descargar información del repositorio:

```bash
git fetch origin
```

Conectarse a la rama:

```bash
git checkout -b julen_dev origin/julen_dev
```

---

# Subir el proyecto

Añadir todos los archivos:

```bash
git add .
```

Crear commit:

```bash
git commit -m "Subo proyecto"
```

Subir cambios a GitHub:

```bash
git push origin julen_dev
```

---

# Flujo normal de trabajo

Cada vez que hagas cambios:

```bash
git add .
git commit -m "Descripción de cambios"
git push
```

---

# Comandos útiles

## Ver estado del repositorio

```bash
git status
```

## Ver ramas

```bash
git branch
```

## Cambiar de rama

```bash
git checkout nombre_rama
```

## Descargar cambios del repositorio

```bash
git pull
```

---

# Recomendación

Antes de empezar a trabajar:

```bash
git pull
```

Al terminar:

```bash
git add .
git commit -m "Descripción de cambios"
git push
```

Así evitarás conflictos y mantendrás el repositorio actualizado.
