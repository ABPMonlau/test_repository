# Guía de Levantamiento: Base de Datos de Reservas

Este proyecto contiene una base de datos MySQL configurada para inicializarse automáticamente con el esquema y los datos del sistema de reservas.

## Requisitos Previos

1.  **Docker Desktop**: Asegúrate de tener Docker instalado y en ejecución.
2.  **Puertos**: El puerto 3306 debe estar libre en tu máquina local.

## Pasos para el levantamiento desde cero

### 1. Preparación
Asegúrate de estar en la raíz del directorio del proyecto donde se encuentra el archivo docker-compose.yaml.

```bash
cd bbdd-reservas
```

### 2. Despliegue del Contenedor
Ejecuta el siguiente comando para construir e iniciar el contenedor en segundo plano:

```bash
docker compose up -d
```

### 3. Verificación
Puedes comprobar que el contenedor está corriendo correctamente con:

```bash
docker ps
```
Deberías ver un contenedor llamado `reservas-la-canal` en estado "Up".

### 4. Acceso a la Base de Datos

Puedes conectarte a la base de datos utilizando los siguientes parámetros:

*   **Host**: `localhost`
*   **Puerto**: `3306`
*   **Usuario Administrador**: `adminreservas` (privilegios limitados a la BD del esquema) o `root` (privilegios totales)
*   **Contraseña**: `1234`
*   **Base de datos**: `reservas_lacanal`

#### Acceso vía terminal (CLI) con usuario administrador del esquema
Si tienes el cliente de MySQL instalado localmente:
```bash
mysql -h localhost -P 3306 -u adminreservas -p1234 reservas_lacanal
```

#### Acceso dentro del contenedor
Si quieres entrar directamente a la consola del contenedor:
```bash
docker exec -it reservas-la-canal mysql -u adminreservas -p1234 reservas_lacanal
```

## Mantenimiento y Limpieza

*   **Detener el contenedor**: `docker compose stop`
*   **Eliminar el contenedor y red (manteniendo datos)**: `docker compose down`
*   **Eliminar todo (incluyendo los datos)**: `docker compose down -v`
