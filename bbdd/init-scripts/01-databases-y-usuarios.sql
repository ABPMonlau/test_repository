-- ==================================================
-- Script 01: Creación de bases de datos y usuarios
-- ==================================================
-- Este script se ejecuta primero para preparar
-- ambas bases de datos y sus usuarios dedicados.
-- ==================================================

-- --------------------------
-- Base de datos: cataleg-vins
-- --------------------------
CREATE DATABASE IF NOT EXISTS `cataleg-vins` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- --------------------------
-- Base de datos: reservas_lacanal
-- --------------------------
CREATE DATABASE IF NOT EXISTS `reservas_lacanal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE DATABASE IF NOT EXISTS `usuarios-lacanal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- --------------------------
-- Usuario: reservasadmin
-- Permisos solo sobre reservas_lacanal
-- --------------------------
CREATE USER IF NOT EXISTS 'reservasadmin' @'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON `reservas_lacanal`.* TO 'reservasadmin' @'%';

-- --------------------------
-- Usuario: vinosadmin
-- Permisos solo sobre cataleg-vins
-- --------------------------
CREATE USER IF NOT EXISTS 'vinosadmin' @'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON `cataleg-vins`.* TO 'vinosadmin' @'%';

-- --------------------------
-- Usuario: useradmin
-- Permisos solo sobre users
-- --------------------------

CREATE USER IF NOT EXISTS 'usersadmin' @'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON `usuarios-lacanal`.* TO 'usersadmin' @'%';

FLUSH PRIVILEGES;