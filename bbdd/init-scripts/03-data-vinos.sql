-- ==================================================
-- Script 03: Datos iniciales de cataleg-vins (Desde CSV)
-- Estructura estricta sin modificaciones.
-- ==================================================

USE `cataleg-vins`;

-- --------------------------------------------------
-- 1. TABLAS INDEPENDIENTES (Sin dependencias)
-- --------------------------------------------------

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
    ),
    (
        'Chardonnay',
        'Uva blanca versátil, origen en Borgoña, ideal para crianza y espumosos.'
    ),
    (
        'Macabeu',
        'Uva blanca catalana, fresca, base clásica para cavas.'
    ),
    (
        'Xarel·lo',
        'Uva blanca estructurada, aporta cuerpo y acidez.'
    ),
    (
        'Pinot Noir',
        'Uva tinta elegante, de piel fina, notas a frutos rojos frescos.'
    ),
    (
        'Syrah',
        'Uva tinta potente, color intenso, mora y pimienta negra.'
    ),
    (
        'Cabernet Sauvignon',
        'Uva tinta estructurada, taninos firmes y notas balsámicas.'
    ),
    (
        'Mencía',
        'Uva tinta del Bierzo/Ribeira Sacra, perfil floral y mineral.'
    ),
    (
        'Riesling',
        'Uva blanca centroeuropea, alta acidez y mineralidad.'
    ),
    (
        'Godello',
        'Uva blanca gallega, estructurada y con gran potencial.'
    ),
    (
        'Garnatxa Blanca',
        'Uva blanca mediterránea, aporta volumen y toques florales.'
    ),
    (
        'Palomino Fino',
        'Uva blanca neutra, esencial para vinos de Jerez.'
    ),
    (
        'Sauvignon Blanc',
        'Uva blanca de aromas herbáceos y muy refrescante.'
    ),
    (
        'Multivarietal',
        'Mezcla (coupage) de diversas variedades o uvas autóctonas.'
    );

INSERT INTO
    tipos (tipo_nombre, tipo_desc)
VALUES (
        'Blanc',
        'Vino elaborado a partir de mosto de uvas blancas.'
    ),
    (
        'Escumós',
        'Vino con gas carbónico natural (Cava, Champagne).'
    ),
    (
        'Generós',
        'Vino con graduación alcohólica aumentada (Jerez, Oporto).'
    ),
    (
        'Negre',
        'Vino elaborado a partir de mosto de uvas tintas.'
    ),
    (
        'Rosat',
        'Vino tinto con maceración muy corta de las pieles.'
    ),
    (
        'Rosat Escumós',
        'Vino espumoso con tonalidad rosada.'
    ),
    (
        'Dolç',
        'Vino con alta concentración de azúcares residuales.'
    );

-- Clasificamos los proveedores del CSV como "Bodegas" para adaptarnos al modelo
INSERT INTO
    bodegas (bodega_nombre, bodega_zona)
VALUES (
        'Vila Viniteca',
        'Distribuidor Nacional'
    ),
    (
        'Celler',
        'Bodega Propia / Varios Orígenes'
    );

INSERT INTO
    formatos (
        formato_nombre,
        formato_capacidad
    )
VALUES ('Estándar', 750),
    ('Magnum', 1500);

-- Asignamos copas genéricas según el tipo
INSERT INTO
    copas (copa_nombre)
VALUES ('Copa Burdeos (Tinto)'),
    ('Copa Borgoña (Tinto)'),
    ('Copa Tulipa (Blanco)'),
    ('Copa Flauta (Espumosos)'),
    (
        'Copa Afinados (Dulces/Generosos)'
    );

-- --------------------------------------------------
-- 2. TABLAS DEPENDIENTES (Nivel 1)
-- Integrando Stock, Precios y Carta dentro de "vino_desc"
-- --------------------------------------------------

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
        'Pazo Barrantes Gran Vino Albariño',
        1,
        'D.O. Rías Baixas',
        1,
        'Variedad: Albariño. Compra: 27,00€ | Venta: 50,00€. Stock: 1. Estado: Fora',
        3
    ),
    (
        'Veigadares',
        1,
        'D.O. Rías Baixas',
        2,
        'Variedad: Albariño. Compra: 15,30€ | Venta: 30,00€. Stock: 3. Estado: Carta',
        3
    ),
    (
        'El Hombre Bala Albillo Real',
        1,
        'Madrid',
        1,
        'Variedad: Albillo Real. Compra: 17,35€ | Venta: 33,00€. Stock: 1. Estado: Fora',
        3
    ),
    (
        'Masia Carreras (Blanc)',
        1,
        'D.O. Empordà',
        2,
        'Variedad: Carinyena Blanca/Garnatxa. Compra: 14,95€ | Venta: 35,00€. Stock: 4. Estado: Carta',
        3
    ),
    (
        'Billaud-Simon Chablis 1er Cru Montée de Tonnerre',
        1,
        'Borgoña',
        1,
        'Variedad: Chardonnay. Compra: 50,90€ | Venta: 92,00€. Stock: 1. Estado: Fora',
        3
    ),
    (
        'Droin Montée de Tonnerre Chablis 1er Cru',
        1,
        'Bourgogne',
        2,
        'Variedad: Chardonnay. Compra: 45,70€ | Venta: 88,00€. Stock: 1. Estado: Carta',
        3
    ),
    (
        'Joseph Drouhin Chablis 1er Cru Mont de Milieu',
        1,
        'Borgoña',
        1,
        'Variedad: Chardonnay. Compra: 39,95€ | Venta: 72,00€. Stock: 1. Estado: Fora',
        3
    ),
    (
        'Mâcon-Milly-Lamartine',
        1,
        'A.O.C. Pouilly-Fuissé',
        2,
        'Variedad: Chardonnay. Compra: 14,45€ | Venta: 33,00€. Stock: 4. Estado: Carta',
        3
    ),
    (
        'Cap Sentit',
        1,
        'D.O. Catalunya',
        2,
        'Variedad: Garnatxa Blanca. Compra: 7,18€ | Venta: 20,00€. Stock: 4. Estado: Carta',
        3
    ),
    (
        'Agathe Bursin Zinnkoepflé Gewurztraminer Grand Cru',
        1,
        'A.O.C. Alsace',
        2,
        'Variedad: Gewurztraminer. Compra: 28,50€ | Venta: 52,00€. Stock: 1. Estado: Carta',
        3
    ),
    (
        'Luar do Sil sobre Lías Godello',
        1,
        'D.O. Valdeorras',
        2,
        'Variedad: Godello. Compra: 14,30€ | Venta: 29,00€. Stock: 4. Estado: Carta',
        3
    ),
    (
        'Suerte del Marqués "Trenzado"',
        1,
        'D.O. Valle de la Orotava',
        2,
        'Variedad: Listán Blanco. Compra: 13,95€ | Venta: 34,00€. Stock: 0. Estado: Carta',
        3
    ),
    (
        'Ma de Ferro',
        1,
        'D.O. Penedès',
        2,
        'Variedad: Macabeu. Compra: 8,00€ | Venta: 22,00€. Stock: 4. Estado: Carta',
        3
    ),
    (
        'Ostrea',
        1,
        'D.O. Tarragona',
        2,
        'Variedad: Macabeu. Compra: 8,95€ | Venta: 24,00€. Stock: 3. Estado: Carta',
        3
    ),
    (
        'Golós',
        1,
        'D.O. Pla i Llevant-Mallorca',
        2,
        'Variedad: Moscatell/Viognier. Compra: 9,90€ | Venta: 25,00€. Stock: 4. Estado: Carta',
        3
    ),
    (
        'UBE Miraflores Alta',
        1,
        'V.T. Cádiz',
        1,
        'Variedad: Palomino Fino. Compra: 16,65€ | Venta: 36,00€. Stock: 3. Estado: Carta',
        3
    ),
    (
        'Jardins de Babylone',
        1,
        'A.O.C. Jurançon',
        2,
        'Variedad: Petit Manseng. Compra: 66,50€ | Venta: 125,00€. Stock: 1. Estado: Carta',
        3
    ),
    (
        'Agathe Bursin Dirstelberg Riesling',
        1,
        'A.O.C. Alsace',
        2,
        'Variedad: Riesling. Compra: 17,85€ | Venta: 36,00€. Stock: 1. Estado: Carta',
        3
    ),
    (
        'Domaine Dujac',
        1,
        'Bourgogne AOC',
        2,
        'Variedad: Pinot Noir. Compra: 26,00€ | Venta: 65,00€. Stock: 2. Estado: Carta',
        3
    ),
    (
        'La Cuvée Sélection Brut',
        2,
        'A.O.C. Champagne',
        2,
        'Variedad: Chardonnay/Pinot Noir. Compra: 22,60€ | Venta: 52,00€. Stock: 1. Estado: Carta',
        4
    ),
    (
        'Els Gorgs Brut Nature Gran Reserva',
        2,
        'D.O. Penedès',
        2,
        'Variedad: Macabeu/Xarel·lo. Compra: 26,30€ | Venta: 54,00€. Stock: 2. Estado: Carta',
        4
    ),
    (
        'Bodegas de la Riva Macharnudo',
        3,
        'Jerez',
        1,
        'Variedad: Palomino Fino. Compra: 49,95€ | Venta: 90,00€. Stock: 1. Estado: Fora',
        5
    ),
    (
        'Castell del Remei 1780 Collita',
        4,
        'D.O. Costers del Segre',
        1,
        'Variedad: Cabernet S/Tempranillo. Compra: 19,10€ | Venta: 35,00€. Stock: 0. Estado: No Tenim',
        1
    ),
    (
        'Castell d’Encus Thalarn',
        4,
        'D.O. Costers del Segre',
        1,
        'Variedad: Syrah. Compra: 30,05€ | Venta: 54,00€. Stock: 1. Estado: Fora',
        1
    ),
    (
        'Masia Carreras (Negre)',
        4,
        'D.O. Empordà',
        2,
        'Variedad: 100% Cariñena. Compra: 15,10€ | Venta: 35,00€. Stock: 4. Estado: Carta',
        1
    ),
    (
        'Comando G Rozas',
        4,
        'Sierra de Gredos',
        1,
        'Variedad: Garnacha. Compra: 29,50€ | Venta: 53,00€. Stock: 2. Estado: Fora',
        2
    ),
    (
        'Abadia da Cova Loia',
        4,
        'D.O. Ribeira Sacra',
        2,
        'Variedad: Mencía. Compra: 13,35€ | Venta: 29,00€. Stock: 1. Estado: Carta',
        1
    ),
    (
        'Dominio del Águila Reserva',
        4,
        'D.O. Ribera del Duero',
        1,
        'Variedad: Tempranillo. Compra: 48,60€ | Venta: 88,00€. Stock: 1. Estado: Fora',
        1
    ),
    (
        'Les Crestes',
        4,
        'D.O. Priorat',
        2,
        'Variedad: N/D. Compra: N/D | Venta: N/D. Stock: 12. Estado: N/D',
        1
    ),
    (
        'Domaine de Triennes Rosé',
        5,
        'I.G.P. Méditerranée',
        2,
        'Variedad: Cinsault/Grenache/Syrah. Compra: 8,25€ | Venta: 21,00€. Stock: 2. Estado: Carta',
        3
    ),
    (
        'Billecart-Salmon "Le Rosé"',
        6,
        'Champagne',
        2,
        'Variedad: Pinot Noir. Compra: 68,90€ | Venta: 125,00€. Stock: 1. Estado: Carta',
        4
    ),
    (
        'Tokaji 1430',
        7,
        'Tokaji Hungria',
        2,
        'Variedad: Edes Szamorodni. Compra: 21,30€ | Venta: 38,00€. Stock: 1. Estado: Postres',
        5
    );

-- --------------------------------------------------
-- 3. TABLAS DEPENDIENTES (Nivel 2 y 3)
-- --------------------------------------------------

-- Relacionamos qué uvas lleva cada vino (Muestra de combinaciones representativas del CSV)
INSERT INTO
    vinos_uvas (vino_id, uva_tipo, porcentaje)
VALUES (1, 2, 100.00), -- Pazo Barrantes -> Albariño (ID 2)
    (2, 2, 100.00), -- Veigadares -> Albariño (ID 2)
    (5, 4, 100.00), -- Chablis -> Chardonnay (ID 4)
    (9, 13, 100.00), -- Cap Sentit -> Garnatxa Blanca (ID 13)
    (13, 5, 100.00), -- Ma de Ferro -> Macabeu (ID 5)
    (21, 5, 50.00), -- Els Gorgs -> Macabeu (ID 5)
    (21, 6, 50.00), -- Els Gorgs -> Xarel·lo (ID 6)
    (22, 14, 100.00), -- Bodegas de la Riva -> Palomino Fino (ID 14)
    (24, 8, 100.00), -- Castell d'Encus -> Syrah (ID 8)
    (28, 1, 100.00);
-- Dominio del Águila -> Tempranillo (ID 1)

-- Añadimos las cosechas/añadas extraídas de la columna "Any"
INSERT INTO
    cosechas (vino_id, anio)
VALUES (1, 2022),
    (2, 2024),
    (3, 2024),
    (4, 2023),
    (5, 2023),
    (6, 2023),
    (7, 2023),
    (8, 2024),
    (9, 2023),
    (10, 2023),
    (11, 2024),
    (12, 2024),
    (13, 2021),
    (14, 2022),
    (15, 2023),
    (16, 2024),
    (17, 2021),
    (18, 2023),
    (19, 2023),
    (20, NULL), -- NV (Sin añada especificada en Champagne)
    (21, 2014),
    (22, 2021),
    (23, 2019),
    (24, 2019),
    (25, 2023),
    (26, 2023),
    (27, 2020),
    (28, 2020),
    (29, NULL),
    (30, 2024),
    (31, NULL),
    (32, 2021);

-- Definimos el catálogo final a la venta.
-- Usamos las cosechas generadas y el formato_id = 1 (Estándar 750ml) para todas por defecto.
INSERT INTO
    vinos_venta (cosecha_id, formato_id)
VALUES (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (11, 1),
    (12, 1),
    (13, 1),
    (14, 1),
    (15, 1),
    (16, 1),
    (17, 1),
    (18, 1),
    (19, 1),
    (20, 1),
    (21, 1),
    (22, 1),
    (23, 1),
    (24, 1),
    (25, 1),
    (26, 1),
    (27, 1),
    (28, 1),
    (29, 1),
    (30, 1),
    (31, 1),
    (32, 1);