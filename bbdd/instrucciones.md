# Guía de Levantamiento: Base de Datos Unificada (La Canal)

Este proyecto contiene una base de datos MariaDB unificada que aloja tres esquemas en un único contenedor Docker:

- **`cataleg-vins`** — Catálogo de vinos (tipos, bodegas, uvas, formatos, cosechas)
- **`reservas_lacanal`** — Sistema de reservas (clientes, mesas, reservas)
- **`usuarios-lacanal`** — Control de acceso y usuarios del panel de administración (users)

## Requisitos Previos

1. **Docker Desktop**: Asegúrate de tener Docker instalado y en ejecución.
2. **Puertos**: El puerto 3306 debe estar libre en tu máquina local.

## Estructura de Archivos

```text
bbdd/
├── docker-compose.yaml              # Archivo unificado para levantar el contenedor
├── init-scripts/                     # Scripts de inicialización (orden alfabético)
│   ├── 01-databases-y-usuarios.sql   # Crea las 3 BD y sus respectivos usuarios
│   ├── 02-schema-vinos.sql           # Esquema de tablas de cataleg-vins
│   ├── 03-data-vinos.sql             # Datos iniciales de cataleg-vins
│   ├── 04-schema-reservas.sql        # Esquema y datos de reservas_lacanal
│   └── 05-schema-users.sql           # Esquema y datos por defecto de usuarios-lacanal
└── instrucciones.md                  # Esta guía de uso y levantamiento
```

> **Nota:** Los scripts dentro de `init-scripts/` se ejecutan en orden alfabético al crear el contenedor por primera vez. Por eso están numerados secuencialmente del `01-` al `05-`.

## Pasos para el levantamiento desde cero

### 1. Preparación

Asegúrate de estar en el directorio `bbdd` del proyecto:

```bash
cd bbdd
```

### 2. Despliegue del Contenedor

Ejecuta el siguiente comando para iniciar el contenedor en segundo plano:

```bash
docker compose up -d
```

### 3. Verificación

Puedes comprobar que el contenedor está corriendo correctamente con:

```bash
docker ps
```

Deberías ver un contenedor llamado `db-la-canal` en estado "Up".

### 4. Acceso a las Bases de Datos

#### Credenciales

| Parámetro       | Usuario root             | Usuario vinosadmin       | Usuario reservasadmin         | Usuario usersadmin            |
|-----------------|--------------------------|--------------------------|-------------------------------|-------------------------------|
| **Host**        | `localhost`              | `localhost`              | `localhost`                   | `localhost`                   |
| **Puerto**      | `3306`                   | `3306`                   | `3306`                        | `3306`                        |
| **Usuario**     | `root`                   | `vinosadmin`             | `reservasadmin`               | `usersadmin`                  |
| **Contraseña**  | `la-canal-admin`         | `1234`                   | `1234`                        | `1234`                        |
| **Acceso a**    | Todas las bases de datos | Solo `cataleg-vins`      | Solo `reservas_lacanal`       | Solo `usuarios-lacanal`       |

#### Acceso vía terminal (CLI) como root

```bash
mariadb -h localhost -P 3306 -u root -pla-canal-admin
```

Una vez dentro, puedes cambiar de base de datos con:

```sql
USE `cataleg-vins`;
-- o
USE `reservas_lacanal`;
-- o
USE `usuarios-lacanal`;
```

#### Acceso como vinosadmin (solo vinos)

```bash
mariadb -h localhost -P 3306 -u vinosadmin -p1234 cataleg-vins
```

#### Acceso como reservasadmin (solo reservas)

```bash
mariadb -h localhost -P 3306 -u reservasadmin -p1234 reservas_lacanal
```

#### Acceso como usersadmin (solo usuarios)

```bash
mariadb -h localhost -P 3306 -u usersadmin -p1234 usuarios-lacanal
```

#### Acceso dentro del contenedor

```bash
docker exec -it db-la-canal mariadb -u root -pla-canal-admin
```

## Usuarios y Permisos

| Usuario         | Contraseña       | Permisos                                           |
|-----------------|------------------|-----------------------------------------------------|
| `root`          | `la-canal-admin` | Superusuario — acceso total a todo el servidor      |
| `vinosadmin`    | `1234`           | Todos los privilegios solo sobre `cataleg-vins`     |
| `reservasadmin` | `1234`           | Todos los privilegios solo sobre `reservas_lacanal` |
| `usersadmin`    | `1234`           | Todos los privilegios solo sobre `usuarios-lacanal` |

## Mantenimiento y Limpieza

- **Detener el contenedor**: `docker compose stop`
- **Eliminar el contenedor y red (manteniendo datos)**: `docker compose down`
- **Eliminar todo (incluyendo los datos)**: `docker compose down -v`

> **⚠️ Importante:** Los scripts de `init-scripts/` solo se ejecutan la **primera vez** que se crea el contenedor (cuando el volumen de datos está vacío). Si necesitas reinicializar las bases de datos, ejecuta `docker compose down -v` para eliminar el volumen y luego `docker compose up -d` de nuevo.

