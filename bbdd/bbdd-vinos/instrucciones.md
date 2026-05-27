# Guía de Levantamiento: Base de Datos de Vinos

Este proyecto contiene una base de datos MariaDB configurada para inicializarse automáticamente con el esquema y los datos del catálogo de vinos.

## Requisitos Previos

1.  **Docker Desktop**: Asegúrate de tener Docker instalado y en ejecución.
2.  **Puertos**: El puerto 3306 debe estar libre en tu máquina local.

## Pasos para el levantamiento desde cero

### 1. Preparación
Asegúrate de estar en la raíz del directorio del proyecto donde se encuentra el archivo docker-compose.yaml.

```bash
cd bbdd-vinos
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
Deberías ver un contenedor llamado vins-la-canal en estado "Up".

### 4. Acceso a la Base de Datos

Puedes conectarte a la base de datos utilizando los siguientes parámetros:

*   **Host**: localhost
*   **Puerto**: 3306
*   **Usuario**: root
*   **Contraseña**: la-canal-admin
*   **Base de datos**: cataleg-vins

#### Acceso vía terminal (CLI)
Si tienes el cliente de MariaDB/MySQL instalado localmente:
```bash
mariadb -h localhost -P 3306 -u root -pla-canal-admin cataleg-vins
```

#### Acceso dentro del contenedor
Si quieres entrar directamente a la consola del contenedor:
```bash
docker exec -it vins-la-canal mariadb -u root -pla-canal-admin cataleg-vins
```

## Mantenimiento y Limpieza

*   **Detener el contenedor**: docker compose stop
*   **Eliminar el contenedor y red (manteniendo datos)**: docker compose down
*   **Eliminar todo (incluyendo los datos)**: docker compose down -v
