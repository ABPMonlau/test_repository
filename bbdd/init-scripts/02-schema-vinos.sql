-- ==================================================
-- Script 02: Esquema de la base de datos cataleg-vins
-- ==================================================

USE `cataleg-vins`;

-- 1. TABLAS INDEPENDIENTES (Catálogos base)

CREATE TABLE uvas (
    uva_id INT AUTO_INCREMENT,
    uva_nombre VARCHAR(50) NOT NULL,
    uva_desc VARCHAR(255),
    CONSTRAINT pk_uvas PRIMARY KEY (uva_id)
);

CREATE TABLE tipos (
    tipo_id INT AUTO_INCREMENT,
    tipo_nombre VARCHAR(50) NOT NULL,
    tipo_desc VARCHAR(255),
    CONSTRAINT pk_tipos PRIMARY KEY (tipo_id)
);

CREATE TABLE bodegas (
    bodega_id INT AUTO_INCREMENT,
    bodega_nombre VARCHAR(50) NOT NULL,
    bodega_zona VARCHAR(50), -- Zona principal de la bodega
    CONSTRAINT pk_bodegas PRIMARY KEY (bodega_id)
);

CREATE TABLE formatos (
    formato_id INT AUTO_INCREMENT,
    formato_nombre VARCHAR(50) NOT NULL,
    formato_capacidad INT, -- En mililitros (ml)
    CONSTRAINT pk_formatos PRIMARY KEY (formato_id),
    CONSTRAINT chk_formatos_capacidad CHECK (formato_capacidad > 0)
);

CREATE TABLE copas (
    copa_id INT AUTO_INCREMENT,
    copa_nombre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_copas PRIMARY KEY (copa_id)
);

-- 2. TABLAS DEPENDIENTES (Nivel 1)

CREATE TABLE vinos (
    vino_id INT AUTO_INCREMENT,
    vino_nombre VARCHAR(50) NOT NULL,
    vino_tipo INT,
    zona_origen VARCHAR(50), -- Ajustado a VARCHAR para almacenar el texto directamente
    bodega INT,
    vino_desc VARCHAR(255),
    copa_id INT,
    CONSTRAINT pk_vinos PRIMARY KEY (vino_id),
    CONSTRAINT uq_vinos_nombre UNIQUE (vino_nombre),
    -- Relaciones (Claves Foráneas)
    CONSTRAINT fk_vinos_tipos FOREIGN KEY (vino_tipo) REFERENCES tipos (tipo_id) ON DELETE SET NULL,
    CONSTRAINT fk_vinos_bodegas FOREIGN KEY (bodega) REFERENCES bodegas (bodega_id) ON DELETE SET NULL,
    CONSTRAINT fk_vinos_copas FOREIGN KEY (copa_id) REFERENCES copas (copa_id) ON DELETE SET NULL
);

-- 3. TABLAS DEPENDIENTES (Nivel 2 y 3)

CREATE TABLE vinos_uvas (
    vino_id INT,
    uva_tipo INT,
    porcentaje DECIMAL(5, 2),
    CONSTRAINT pk_vinos_uvas PRIMARY KEY (vino_id, uva_tipo),
    -- Relaciones
    CONSTRAINT fk_vu_vinos FOREIGN KEY (vino_id) REFERENCES vinos (vino_id) ON DELETE CASCADE,
    CONSTRAINT fk_vu_uvas FOREIGN KEY (uva_tipo) REFERENCES uvas (uva_id) ON DELETE CASCADE,
    -- Validación
    CONSTRAINT chk_vu_porcentaje CHECK (
        porcentaje > 0
        AND porcentaje <= 100
    )
);

CREATE TABLE cosechas (
    cosecha_id INT AUTO_INCREMENT,
    vino_id INT,
    anio INT,
    CONSTRAINT pk_cosechas PRIMARY KEY (cosecha_id),
    -- Relaciones
    CONSTRAINT fk_cosechas_vinos FOREIGN KEY (vino_id) REFERENCES vinos (vino_id) ON DELETE CASCADE
);

CREATE TABLE vinos_venta (
    producto_id INT AUTO_INCREMENT,
    cosecha_id INT,
    formato_id INT,
    CONSTRAINT pk_vinos_venta PRIMARY KEY (producto_id),
    -- Relaciones
    CONSTRAINT fk_vv_cosechas FOREIGN KEY (cosecha_id) REFERENCES cosechas (cosecha_id) ON DELETE CASCADE,
    CONSTRAINT fk_vv_formatos FOREIGN KEY (formato_id) REFERENCES formatos (formato_id) ON DELETE RESTRICT
);
