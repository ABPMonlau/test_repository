-- 1. TABLAS INDEPENDIENTES (Sin dependencias)

INSERT INTO
    uvas (uva_nombre, uva_desc)
VALUES (
        'Tempranillo',
        'Uva tinta autóctona de España, aporta notas a frutos rojos y cuero.'
    ),
    (
        'Albariño',
        'Uva blanca gallega, muy aromática, fresca y con acidez equilibrada.'
    ),
    (
        'Garnacha Tinta',
        'Uva tinta muy frutal, aporta volumen y notas de frutos negros.'
    );

INSERT INTO
    tipos (tipo_nombre, tipo_desc)
VALUES (
        'Tinto',
        'Vino elaborado a partir de mosto de uvas tintas.'
    ),
    (
        'Blanco',
        'Vino elaborado con uvas blancas.'
    ),
    (
        'Espumoso',
        'Vino con gas carbónico natural (Cava, Champagne).'
    );

INSERT INTO
    bodegas (bodega_nombre, bodega_zona)
VALUES ('Bodegas Muga', 'La Rioja'),
    ('Terras Gauda', 'Galicia'),
    ('Familia Torres', 'Penedès');

INSERT INTO
    formatos (
        formato_nombre,
        formato_capacidad
    )
VALUES ('Estándar', 750),
    ('Magnum', 1500),
    ('Media Botella', 375);

INSERT INTO
    copas (copa_nombre)
VALUES ('Copa Burdeos (Tinto)'),
    ('Copa Borgoña (Tinto)'),
    ('Copa Tulipa (Blanco)');

-- 2. TABLAS DEPENDIENTES (Nivel 1)
-- Aquí ya usamos los IDs (1, 2, 3...) generados en el bloque anterior

INSERT INTO
    vinos (
        vino_nombre,
        vino_tipo,
        zona_origen,
        bodega,
        vino_desc,
        copa_id
    )
VALUES (
        'Muga Crianza',
        1,
        'D.O.Ca. Rioja',
        1,
        'Vino tinto clásico, 24 meses en barrica. Equilibrado.',
        1
    ),
    (
        'Terras Gauda O Rosal',
        2,
        'D.O. Rías Baixas',
        2,
        'Vino blanco expresivo, notas a melocotón y flores blancas.',
        3
    ),
    (
        'Coronas Crianza',
        1,
        'D.O. Catalunya',
        3,
        'Tinto cálido, con notas especiadas y taninos suaves.',
        1
    );

-- 3. TABLAS DEPENDIENTES (Nivel 2 y 3)

-- Relacionamos qué uvas lleva cada vino
INSERT INTO
    vinos_uvas (vino_id, uva_tipo, porcentaje)
VALUES (1, 1, 70.00), -- Muga (1) lleva 70% Tempranillo (1)
    (1, 3, 30.00), -- Muga (1) lleva 30% Garnacha (3)
    (2, 2, 100.00), -- Terras Gauda (2) lleva 100% Albariño (2)
    (3, 1, 100.00);
-- Coronas (3) lleva 100% Tempranillo (1)

-- Añadimos las cosechas/añadas de cada vino
INSERT INTO
    cosechas (vino_id, anio)
VALUES (1, 2019), -- Muga Crianza 2019 (ID Cosecha = 1)
    (1, 2020), -- Muga Crianza 2020 (ID Cosecha = 2)
    (2, 2022);
-- Terras Gauda 2022 (ID Cosecha = 3)

-- Definimos el catálogo final a la venta (producto final combinando cosecha y formato)
INSERT INTO
    vinos_venta (cosecha_id, formato_id)
VALUES (1, 1), -- Muga 2019 en formato Estándar (750ml)
    (1, 2), -- Muga 2019 en formato Magnum (1500ml)
    (3, 1);
-- Terras