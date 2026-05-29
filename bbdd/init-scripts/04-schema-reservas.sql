-- ==================================================
-- Script 04: Esquema y datos de reservas_lacanal
-- ==================================================

USE `reservas_lacanal`;

-- ==================================================
-- BLOQUE 1: ELIMINACIÓN DE TABLAS Y DATOS
-- ==================================================
-- Desactivamos temporalmente las restricciones para evitar conflictos de dependencias
SET FOREIGN_KEY_CHECKS = 0;

-- Borramos primero la tabla intermedia/hija que contiene las llaves foráneas
DROP TABLE IF EXISTS `reservas`;

-- Borramos las tablas padre
DROP TABLE IF EXISTS `turnos`;
DROP TABLE IF EXISTS `mesas`;
DROP TABLE IF EXISTS `clientes`;

-- Volvemos a activar las restricciones para el proceso de creación e inserción
SET FOREIGN_KEY_CHECKS = 1;


-- ==================================================
-- BLOQUE 2: CREACIÓN DE ESTRUCTURAS (TABLAS)
-- ==================================================

-- 2.1. Estructura para la tabla `clientes`
CREATE TABLE `clientes` (
    `id_cliente` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(100) NOT NULL,
    `telefono` varchar(20) NOT NULL,
    `email` varchar(100) NOT NULL,
    `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id_cliente`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 2.2. Estructura para la tabla `mesas`
CREATE TABLE `mesas` (
    `id_mesa` int NOT NULL AUTO_INCREMENT,
    `numero_mesa` int NOT NULL,
    `capacidad` int NOT NULL,
    `ubicacion` varchar(50) DEFAULT 'Interior',
    `activa` tinyint(1) DEFAULT 1,
    PRIMARY KEY (`id_mesa`),
    UNIQUE KEY `numero_mesa` (`numero_mesa`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 2.3. Estructura para la tabla `turnos`
CREATE TABLE `turnos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `dia_semana` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    `tipo_turno` ENUM('maniana', 'comida', 'noche') NOT NULL,
    `hora_comienzo` TIME NOT NULL,
    `hora_cierre` TIME NOT NULL,
    `maxima_reserva` INT NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 2.4. Estructura para la tabla `reservas` (Se crea al final porque depende de las 3 anteriores)
CREATE TABLE `reservas` (
    `id_reserva` int NOT NULL AUTO_INCREMENT,
    `id_cliente` int NOT NULL,
    `id_mesa` int NOT NULL,
    `id_turno` int NOT NULL, 
    `fecha_reserva` date NOT NULL,
    `hora_reserva` time NOT NULL, 
    `cantidad_personas` int NOT NULL,
    `estado` enum(
        'Pendiente',
        'Confirmada',
        'Cancelada',
        'Completada'
    ) DEFAULT 'Pendiente',
    `notas_especiales` text,
    `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id_reserva`),
    KEY `id_cliente` (`id_cliente`),
    KEY `id_mesa` (`id_mesa`),
    KEY `id_turno` (`id_turno`), 
    CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE,
    CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`) ON DELETE RESTRICT,
    CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id`) ON DELETE RESTRICT 
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;


-- ==================================================
-- BLOQUE 3: INSERCIÓN DE DATOS (DUMPING DATA)
-- ==================================================

-- 3.1. Datos para la tabla `mesas`
INSERT INTO `mesas` VALUES 
(1, 1, 4, 'Comedor', 1),
(2, 2, 4, 'Comedor', 1),
(3, 3, 4, 'Comedor', 1),
(4, 4, 4, 'Comedor', 1),
(5, 5, 4, 'Comedor', 1),
(6, 6, 4, 'Comedor', 1),
(7, 7, 4, 'Comedor', 1),
(8, 8, 4, 'Comedor', 1),
(9, 9, 2, 'Comedor', 1),
(10, 101, 2, 'Comedor', 1),
(11, 102, 2, 'Comedor', 1),
(12, 103, 2, 'Comedor', 1);

-- 3.2. Datos para la tabla `turnos`
INSERT INTO `turnos` (
    dia_semana,
    tipo_turno,
    hora_comienzo,
    hora_cierre,
    maxima_reserva
) VALUES
-- Wednesday
('Wednesday', 'comida', '13:00:00', '15:30:00', 30),
-- Thursday
('Thursday', 'comida', '13:00:00', '15:30:00', 30),
-- Friday
('Friday', 'comida', '13:00:00', '15:30:00', 30),
('Friday', 'noche',  '20:00:00', '22:00:00', 30),
-- Saturday
('Saturday', 'maniana', '08:00:00', '10:30:00', 30),
('Saturday', 'comida',  '13:00:00', '15:30:00', 30),
('Saturday', 'noche',   '20:00:00', '22:00:00', 30),
-- Sunday
('Sunday', 'maniana', '08:00:00', '10:30:00', 30),
('Sunday', 'comida',  '13:00:00', '15:30:00', 30);