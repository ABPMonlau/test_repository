-- ==================================================
-- INSERCIÓN COMPLETA CORREGIDA Y OPTIMIZADA
-- ==================================================

USE `cataleg-vins`;

-- 1. TIPOS (con descripción)
INSERT INTO
    tipos (tipo_nombre, tipo_desc)
VALUES (
        'Blanc',
        'Vinos blancos elaborados sin hollejos, de colores claros y sabores frescos o complejos.'
    ),
    (
        'Negre',
        'Vinos tintos fermentados con hollejos, con presencia de taninos y estructura.'
    ),
    (
        'Rosat',
        'Vinos rosados de corta maceración, frescos, afrutados y versátiles.'
    ),
    (
        'Escumós',
        'Vinos espumosos con burbujas procedentes de fermentación en botella o tanque.'
    ),
    (
        'Rosat Escumós',
        'Vinos espumosos de color rosado, elegantes y con finas burbujas.'
    ),
    (
        'Dolç',
        'Vinos dulces con alto contenido de azúcar residual, ideales para postres.'
    ),
    (
        'Generós',
        'Vinos generosos o fortificados, típicos de Jerez, Oporto, etc., con mayor graduación.'
    );

-- 2. UVAS (con descripción corregida y sin duplicados)
INSERT INTO
    uvas (uva_nombre, uva_desc)
VALUES (
        'Albariño',
        'Uva blanca gallega, aromática, con acidez natural y notas cítricas y de flores blancas.'
    ),
    (
        'Carinyena Blanca',
        'Variedad blanca catalana, aporta cuerpo y acidez moderada, con toques herbáceos.'
    ),
    (
        'Garnatxa',
        'Uva tinta y blanca muy versátil, da vinos afrutados, cálidos y especiados.'
    ),
    (
        'Varietats autòctones',
        'Mezcla de variedades locales propias de la región.'
    ),
    (
        'Chardonnay',
        'Uva blanca internacional, muy adaptable, con sabores que van de frutas tropicales a mantecosos.'
    ),
    (
        'Gewurztraminer',
        'Uva blanca alsaciana, muy aromática, con notas de lichi, rosa y especias.'
    ),
    (
        'Godello',
        'Uva blanca gallega, estructura y mineralidad, con recuerdos frutales y herbáceos.'
    ),
    (
        'Listán Blanco',
        'Variedad blanca canaria, ligera, cítrica y ligeramente salina.'
    ),
    (
        'Macabeu',
        'Uva blanca catalana, base del cava, fresca, afrutada y equilibrada.'
    ),
    (
        'Moscatell',
        'Uva blanca muy dulce y aromática, con notas florales y de melocotón.'
    ),
    (
        'Viognier',
        'Uva blanca del Ródano, intensa, con aromas de albaricoque, melocotón y flores.'
    ),
    (
        'Riesling',
        'Uva blanca alemana, alta acidez, aromas a manzana, melocotón y minerales.'
    ),
    (
        'Giró Blanc',
        'Variedad blanca menorquina, fresca y cítrica.'
    ),
    (
        'Palomino Fino',
        'Uva base del jerez, neutra, con capacidad de envejecer bajo velo de flor.'
    ),
    (
        'Petit Manseng',
        'Uva blanca del suroeste francés, ideal para vinos dulces por su acidez y estructura.'
    ),
    (
        'Parellada',
        'Uva blanca catalana, aporta finura y acidez, usada en cavas y blancos.'
    ),
    (
        'Sauvignon Blanc',
        'Uva blanca mundial, herbácea, con notas de hierba recién cortada, maracuyá y cítricos.'
    ),
    (
        'Verdejo',
        'Uva blanca española de Rueda, con amargor final agradable, frutas verdes y anisados.'
    ),
    (
        'Xarel·lo',
        'Uva blanca catalana fundamental en cava, proporciona cuerpo y acidez moderada.'
    ),
    (
        'Pinot Noir',
        'Uva tinta delicada, da vinos finos, afrutados (cereza) y elegantes, base de grandes borgoñas.'
    ),
    (
        'Poma',
        'Manzana, utilizada en la elaboración de sidra.'
    ),
    (
        'Garnatxa Negra',
        'Uva tinta mediterránea, vinos cálidos, con notas de frutos rojos y especias.'
    ),
    (
        'Meunier',
        'Uva tinta champenesa, aporta frutosidad y redondez a los espumosos.'
    ),
    (
        'Ull llebre',
        'Sinónimo de Tempranillo en Cataluña.'
    ),
    (
        'Gn',
        'Variedad desconocida o mezcla no especificada.'
    ),
    (
        'Syrah',
        'Uva tinta del Ródano, especiada (pimienta negra), frutos negros y cuerpo.'
    ),
    (
        'Cariñena',
        'Uva tinta catalana, alta acidez y taninos, con notas de frutos negros y garriga.'
    ),
    (
        'Garnacha Tinta',
        'Uva tinta española, vinos afrutados, especiados y con graduación alcohólica alta.'
    ),
    (
        'Cabernet Sauvignon',
        'Uva tinta internacional, estructura, larga guarda, aromas de cassis y grafito.'
    ),
    (
        'Merlot',
        'Uva tinta bordelesa, más suave que Cabernet, con ciruela y chocolate.'
    ),
    (
        'Carinyena Negra',
        'Variedad tinta catalana, similar a Cariñena, rústica y tánica.'
    ),
    (
        'Garnacha',
        'Uva tinta (sinónimo de Garnacha Tinta), versátil y cálida.'
    ),
    (
        'Garnatxa Peluda',
        'Variedad de Garnacha con hojas peludas, vinos más suaves y afrutados.'
    ),
    (
        'Graciano',
        'Uva tinta riojana, alta acidez y aromas especiados, ideal para larga guarda.'
    ),
    (
        'Mencía',
        'Uva tinta gallega, vinos ligeros, florales y con mineralidad.'
    ),
    (
        'Nebbiolo',
        'Uva tinta piamontesa, vinos potentes, con taninos firmes y aromas de rosas y alquitrán.'
    ),
    (
        'Spätburgunder',
        'Sinónimo alemán de Pinot Noir, vinos finos y elegantes.'
    ),
    (
        'Tempranillo',
        'Uva tinta española principal, vinos equilibrados, con fresa, cuero y tabaco.'
    ),
    (
        'Tinta de Toro',
        'Variedad de Tempranillo adaptada a Toro, más potente y alcohólica.'
    ),
    (
        'Cinsault',
        'Uva tinta francesa, fresca, afrutada y suave, usada en rosados.'
    ),
    (
        'Grenache',
        'Uva tinta mediterránea (Garnacha), vinos cálidos y especiados.'
    ),
    (
        'Edes Szamorodni',
        'Estilo de vino dulce húngaro de Tokaji, hecho con uvas afectadas por botrytis.'
    ),
    (
        'Muscat',
        'Familia de uvas muy aromáticas, con notas de moscatel, florales y afrutadas.'
    ),
    (
        'Sauternes',
        'Uva usada en Sauternes (Sémillon, Sauvignon Blanc, Muscadelle), afectada por botrytis.'
    ),
    (
        'Touriga Nacional',
        'Uva tinta portuguesa principal para Oporto, vinos intensos y florales.'
    ),
    (
        'Touriga Franca',
        'Uva tinta portuguesa, complementa a la Nacional, con elegancia.'
    ),
    (
        'Tinta Roriz',
        'Sinónimo de Tempranillo en Portugal.'
    ),
    (
        'Tinta Barroca',
        'Uva tinta portuguesa, aporta dulzor y cuerpo al Oporto.'
    ),
    (
        'Albillo Real',
        'Uva blanca de Madrid, vinos aromáticos y con cuerpo.'
    ),
    (
        'Garnatxa Blanca',
        'Variedad blanca de Garnacha, vinos untuosos y con mineralidad.'
    );

-- 3. FORMATOS
INSERT INTO
    formatos (
        formato_nombre,
        formato_capacidad
    )
VALUES ('Media botella', 375),
    ('Botella Estándar', 750),
    ('Magnum', 1500);

-- 4. COPAS
INSERT INTO
    copas (copa_nombre)
VALUES ('Universal'),
    ('Tinto Burdeos'),
    ('Tinto Borgoña'),
    ('Blanco'),
    ('Rosado'),
    ('Espumoso (Flauta)'),
    ('Fortificado / Jerez'),
    ('Copa de Cata'),
    ('Copa de Agua');

-- 5. BODEGAS (Se añade la restricción UNIQUE para que el INSERT IGNORE funcione)
ALTER TABLE bodegas
ADD CONSTRAINT uq_bodegas_nombre UNIQUE (bodega_nombre);

INSERT IGNORE INTO
    bodegas (bodega_nombre, bodega_zona)
VALUES (
        'Bodega genérica (no especificada)',
        NULL
    ),
    (
        'Pazo de Barrantes',
        'D.O. Rías Baixas'
    ),
    (
        'Adegas Galegas',
        'D.O. Rías Baixas'
    ),
    (
        'Comando G',
        'D.O. Vinos de Madrid'
    ),
    (
        'Celler Martí Fabra',
        'D.O. Empordà'
    ),
    (
        'Domaine Billaud-Simon',
        'Chablis, Borgoña'
    ),
    (
        'Celler de Capçanes',
        'D.O. Catalunya'
    ),
    (
        'Domaine Agathe Bursin',
        'Alsacia, Francia'
    ),
    (
        'Pago de los Capellanes / O Luar do Sil',
        'D.O. Valdeorras'
    ),
    (
        'Suertes del Marqués',
        'D.O. Valle de la Orotava'
    ),
    (
        'Mas Gomà Vinyes del Tiet Pere',
        'D.O. Tarragona'
    ),
    (
        'Miquel Gelabert',
        'D.O. Pla i Llevant'
    ),
    ('Cota 45', 'V.T. Cádiz'),
    (
        'Domaine Didier Dagueneau',
        'Jurançon'
    ),
    (
        'Weingut Donnhoff',
        'Nahe, Alemania'
    ),
    (
        'Família Nin-Ortiz',
        'D.O. Priorat'
    ),
    (
        'Domaine Vacheron',
        'Sancerre, Loira'
    ),
    (
        'Tayaimgut Viticultor',
        'D.O. Penedès'
    ),
    (
        'Bodegas José Pariente',
        'D.O. Rueda'
    ),
    (
        'Edra Bodega y Viñedos',
        'I.G.P. Ribera del Gállego'
    ),
    (
        'Paul Jaboulet Aîné',
        'Valle del Ródano'
    ),
    (
        'Celler Mas Alba',
        'D.O. Alella'
    ),
    (
        'Celler Baldufa',
        'D.O. Penedès'
    ),
    (
        'Domaine Denis Père et Fils',
        'Bourgogne'
    ),
    (
        'Fürst Bürgstadter',
        'Franken, Alemania'
    ),
    (
        'Celler Colltor',
        'D.O. Pla de Bages'
    ),
    (
        'Dominio del Águila',
        'D.O. Ribera del Duero'
    ),
    ('Bodegas de la Riva', 'Jerez'),
    (
        'Roda Reserva',
        'D.O.P. Rioja'
    ),
    (
        'Domaine Droin',
        'Chablis, Borgoña'
    ),
    (
        'Maison Joseph Drouhin',
        'Borgoña'
    ),
    ('Domaine Dujac', 'Bourgogne'),
    (
        'Champagne Aubry',
        'Champagne'
    ),
    (
        'Celler Mas Codina',
        'D.O. Alt Penedès'
    ),
    (
        'Castell del Remei',
        'D.O. Costers del Segre'
    ),
    (
        'Castell d’Encus',
        'D.O. Costers del Segre'
    ),
    (
        'Castillo de Monjardín',
        'D.O. Navarra'
    ),
    (
        'Celler Altaroses',
        'D.O. Montsant'
    ),
    (
        'Château Beau Rivage',
        'A.O.C. Médoc'
    ),
    (
        'Álvaro Palacios',
        'D.O.Q. Priorat'
    ),
    ('Viña Zorzal', 'D.O. Navarra'),
    (
        'Abadía da Cova',
        'D.O. Ribeira Sacra'
    ),
    (
        'Descendientes de J. Palacios',
        'D.O. Bierzo'
    ),
    (
        'Giovanni Rosso',
        'Barolo (DOCG)'
    ),
    (
        'Domaine de Triennes',
        'I.G.P. Méditerranée'
    ),
    (
        'Bodegas Jilabà',
        'D.O.P. Rioja'
    ),
    (
        'Bodegas Mauro',
        'Castilla y León'
    ),
    ('Teso La Monja', 'D.O. Toro'),
    (
        'Bodegas Elías Mora',
        'D.O. Toro'
    ),
    (
        'Billecart-Salmon',
        'Champagne'
    ),
    (
        'Champagne Antonin Pehu',
        'Champagne'
    ),
    ('Domaine Cazes', 'Rivesaltes'),
    (
        'Château Violet Lamothe',
        'AOC Sauternes'
    ),
    ('Ramos Pinto', 'Oporto'),
    ('Regnard', 'Bourgogne'),
    (
        'Domaine de Babylone',
        'Jurançon'
    );

-- 6. VINOS (Corrección de nombres de vinos y ortografía)
INSERT INTO
    vinos (
        vino_nombre,
        vino_tipo,
        zona_origen,
        bodega,
        vino_desc,
        copa_id
    )
VALUES

-- Blancs
(
    'Pazo Barrantes Gran Vino Albariño',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Rías Baixas',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Pazo de Barrantes'
    ),
    'Albariño monovarietal con notas cítricas, salinas y florales, fresco y equilibrado.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Veigadares',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Rías Baixas',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Adegas Galegas'
    ),
    'Albariño juvenil, aromas de manzana verde y hierba cortada, paso ligero.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'El Hombre Bala Albillo Real',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Madrid',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Comando G'
    ),
    'Albillo Real con cuerpo, fruta madura y toques florales, de montaña.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Masia Carreras (Blanc)',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Empordà',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Martí Fabra'
    ),
    'Mezcla de variedades autóctonas, vino blanco seco con carácter mediterráneo.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Billaud-Simon Chablis 1er Cru Montée de Tonnerre',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Borgoña',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Billaud-Simon'
    ),
    'Chardonnay puro, mineral, con notas de piedra mojada y cítricos, gran acidez.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Droin Montée de Tonnerre Chablis 1er Cru',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Bourgogne',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Droin'
    ),
    'Chablis elegante, con tensión mineral, aromas de manzana verde y lima.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Joseph Drouhin Chablis 1er Cru Mont de Milieu',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Borgoña',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Maison Joseph Drouhin'
    ),
    'Chardonnay refinado, equilibrio entre fruta y mineralidad, final largo.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Mâcon-Milly-Lamartine',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'A.O.C. Pouilly-Fuissé',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Chardonnay del Mâconnais, fresco y frutal, con notas de melocotón y avellana.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Cap Sentit',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Catalunya',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler de Capçanes'
    ),
    'Garnatxa Blanca, untuoso, con frutas blancas y hierbas aromáticas.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Agathe Bursin Zinnkoepflé Gewurztraminer Grand Cru',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'A.O.C. Alsace',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Agathe Bursin'
    ),
    'Gewurztraminer intenso, aromas de lichi, rosa y especias, gran cuerpo.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Luar do Sil sobre Lías Godello',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Valdeorras',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Pago de los Capellanes / O Luar do Sil'
    ),
    'Godello con crianza sobre lías, cremoso, con notas de manzana y hierbas.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Suerte del Marqués "Trenzado"',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Valle de la Orotava',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Suertes del Marqués'
    ),
    'Listán Blanco de viña vieja, volcánico, salino y con acidez vibrante.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Ma de Ferro',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Macabeu joven, fresco, con frutas de hueso y final ligeramente amargo.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Ostrea',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Tarragona',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Mas Gomà Vinyes del Tiet Pere'
    ),
    'Macabeu mediterráneo, notas de manzana y flores blancas, ideal con mariscos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Golós',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Pla i Llevant-Mallorca',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Miquel Gelabert'
    ),
    'Ensamblaje de Moscatel, Viognier, Riesling y Giró, muy aromático y goloso.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'UBE Miraflores Alta',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'V.T. Cádiz',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Cota 45'
    ),
    'Palomino Fino de pago, seco, salino, con notas de manzanilla y almendra.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Jardins de Babylone',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'A.O.C. Jurançon',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine de Babylone'
    ),
    'Petit Manseng, vino blanco seco pero untuoso, con acidez and fruta exótica.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Agathe Bursin Dirstelberg Riesling',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'A.O.C. Alsace',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Agathe Bursin'
    ),
    'Riesling seco, pizarroso, con aromas cítricos y minerales.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Donnhoff Tonschiefer (2020)',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Nahe',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Weingut Donnhoff'
    ),
    'Riesling de pizarra, eléctrico, con notas de melocotón y piedra húmeda.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Donnhoff Tonschiefer (2021)',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Nahe',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Weingut Donnhoff'
    ),
    'Riesling de otro año, igualmente vibrante, frutal y mineral.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Família Nin Ortiz Terra Vermella',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Família Nin-Ortiz'
    ),
    'Parellada de suelos arcillosos, vino blanco complejo, con textura y acidez.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Didier Dagueneau Pur Sang',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Pouilly-Fumé (Loire)',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Didier Dagueneau'
    ),
    'Sauvignon Blanc de culto, intenso, con notas de cítricos, pedernal y hierbas.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Domaine Vacheron Sancerre Les Romains',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Loira',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Vacheron'
    ),
    'Sancerre de altura, Sauvignon Blanc con mineralidad y fruta blanca.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Tayaimgut (Blanc)',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Tayaimgut Viticultor'
    ),
    'Sauvignon Blanc joven, fresco, con típico carácter herbáceo y cítrico.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'José Pariente La Medina',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Rueda',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodegas José Pariente'
    ),
    'Verdejo de viña vieja, con complejidad, notas de hinojo y fruta de hueso.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Edra "Ontina"',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'I.G.P. Ribera del Gállego',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Edra Bodega y Viñedos'
    ),
    'Viognier, aromático, con flores blancas y albaricoque, paso graso.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Viognier Jaboulet Secret de Famille',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'A.O.C. Côtes du Rhône Blanc',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Paul Jaboulet Aîné'
    ),
    'Viognier fácil de beber, con notas de melocotón y miel, suave.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Etiris',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Alella',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Mas Alba'
    ),
    'Xarel·lo puro, con acidez integrada y ligeras notas de fruta madura.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Baldufa (Blanc)',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'D.O. Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Baldufa'
    ),
    'Mezcla de Xarel·lo y Macabeu, blanco sencillo y afrutado.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Domaine Dujac',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Blanc'
    ),
    'Bourgogne AOC',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Dujac'
    ),
    'Blanco de Borgoña (Pinot Noir vinificado en blanco), raro y elegante.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),

-- Escumós (espumosos)
(
    'Sidra Angelón',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Escumós'
    ),
    'D.O. Astúries',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Sidra natural asturiana, con burbuja fina y acidez refrescante.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'La Cuvée Sélection Brut',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Escumós'
    ),
    'A.O.C. Champagne',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Champagne de ensamblaje clásico, seco, con frutas y brioche.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'AT Pedregar Brut Nature Gran Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Escumós'
    ),
    'D.O. Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Cava Gran Reserva, brut nature, con notas de manzana y fermentación larga.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'Els Gorgs Brut Nature Gran Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Escumós'
    ),
    'D.O. Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Cava de larga crianza, elegante, con burbuja integrada y tostados.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'Brut Réserve Premier Cru Aubry',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Escumós'
    ),
    'A.O.C. Montagne de Reims',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Champagne Aubry'
    ),
    'Champagne Premier Cru, con predominio de Meunier, frutal y redondo.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'Ortus Brut Nature Gran Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Escumós'
    ),
    'D.O. Cava',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Cava de Pinot Noir, brut nature, con finura y toques de frutos rojos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'Mas Codina Brut Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Escumós'
    ),
    'D.O. Alt Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Mas Codina'
    ),
    'Cava reserva, equilibrado, con notas de manzana verde y cítricos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),

-- Generós
(
    'Bodegas de la Riva Macharnudo',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Generós'
    ),
    'Jerez',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodegas de la Riva'
    ),
    'Vino generoso tipo Manzanilla o Fino, seco, salino, con velo de flor.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Fortificado / Jerez'
    )
),

-- Negres (tintos)
(
    'Castell del Remei 1780 Collita',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Costers del Segre',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Castell del Remei'
    ),
    'Tinto clásico de mezcla, con fruta negra y notas de crianza.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Castell d’Encus Thalarn',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Costers del Segre',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Castell d’Encus'
    ),
    'Syrah de alta montaña, intenso, especiado y con buena estructura.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Castillo de Monjardín Gran Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Navarra',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Castillo de Monjardín'
    ),
    'Gran Reserva de Cabernet y Tempranillo, evolucionado, con cuero y fruta confitada.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Masia Carreras (Negre)',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Empordà',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Martí Fabra'
    ),
    'Cariñena pura, tinto mediterráneo, con fruta negra y toques de garriga.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Altaroses',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Montsant',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Altaroses'
    ),
    'Garnacha Tinta, afrutado, especiado y con taninos suaves.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Cuvée Beau Rivage de By',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'A.O.C. Médoc',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Château Beau Rivage'
    ),
    'Burdeos de entrada de gama, Cabernet-Merlot, con notas de cassis.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'El Clos es Vent Samsó',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Montsant',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Carinyena Negra, tinto rústico, con frutos negros y mineralidad.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Comando G Rozas',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'Sierra de Gredos',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Comando G'
    ),
    'Garnacha de altura, muy fresco, floral y con taninos finos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Álvaro Palacios Gratallops',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O.Q. Priorat',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Álvaro Palacios'
    ),
    'Garnacha de Priorat, potente, con mineral de llicorella y fruta negra.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'L’Oratori',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Empordà',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Mezcla de Garnacha, Cariñena y Cabernet, vino joven y afrutado.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Terrotxa',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O.Q. Priorat',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Priorat de Garnachas y Cabernet, con cuerpo y mineralidad.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Baldufa (Negre)',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Baldufa'
    ),
    'Mezcla de Garnacha y Syrah, tinto suave, frutal y ligeramente especiado.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Viña Zorzal Cuatro del Cuatro Graciano',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Navarra',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Viña Zorzal'
    ),
    'Graciano monovarietal, alta acidez, aromas florales y especiados.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Abadia da Cova Loia',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Ribeira Sacra',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Abadía da Cova'
    ),
    'Mencía de Ribeira Sacra, ligero, con notas de frutos rojos y mineral.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Borgoña'
    )
),
(
    'Descendientes de J. Palacios Corullón',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Bierzo',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Descendientes de J. Palacios'
    ),
    'Mencía de viñas viejas, complejo, con fruta negra y toques ahumados.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Borgoña'
    )
),
(
    'Paxaro Tolo',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Ribeira Sacra',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Mencía joven, fresco, con aromas florales y balsámicos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Borgoña'
    )
),
(
    'Giovanni Rosso Barolo del Comune di Serralunga d’Alba',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'Barolo (DOCG)',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Giovanni Rosso'
    ),
    'Nebbiolo potente, con taninos firmes, notas de rosas y alquitrán.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Biu de Sort',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Costers del Segre',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Pinot Noir fresco, con frutos rojos y suavidad.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Borgoña'
    )
),
(
    'Domaine Denis Père et Fils Pernand-Vergelesses',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'Bourgogne',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Denis Père et Fils'
    ),
    'Pinot Noir de Borgoña, elegante, con cereza y tierra húmeda.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Borgoña'
    )
),
(
    'Negre Regnard Nuits-Saint-Georges 1er Cru',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'Bourgogne',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Regnard'
    ),
    'Pinot Noir de primer cru, estructurado, con fruta negra y especias.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Borgoña'
    )
),
(
    'Negre Fürst Bürgstadter',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'Franken',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Fürst Bürgstadter'
    ),
    'Spätburgunder (Pinot Noir) alemán, ligero y afrutado.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Borgoña'
    )
),
(
    'Colltor',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Pla de Bages',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Colltor'
    ),
    'Syrah de Bages, especiado, con fruta negra y taninos redondos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Triennes Saint Auguste',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'I.G.P. Méditerranée',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine de Triennes'
    ),
    'Ensamblaje de Syrah y Cabernet, mediterráneo, frutal y especiado.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Dominio del Águila Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Ribera del Duero',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Dominio del Águila'
    ),
    'Tempranillo de gran guarda, complejo, con fruta negra, cuero y mineral.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Jilabà Crianza',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O.P. Rioja',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodegas Jilabà'
    ),
    'Tempranillo riojano, con crianza en barrica, equilibrado y frutal.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Mauro',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'Castilla y León',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodegas Mauro'
    ),
    'Tempranillo con carácter, potente y con toques elegantes.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Teso La Monja Almirez',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Toro',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Teso La Monja'
    ),
    'Tinta de Toro, vino tinto muy potente, con alta graduación y fruta negra.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Roda Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O.P. Rioja',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Roda Reserva'
    ),
    'Rioja moderno, con Tempranillo y Graciano, elegante y persistente.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Elías Mora Crianza',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Toro',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodegas Elías Mora'
    ),
    'Tinta de Toro con crianza, rústico, notas de fruta negra y especias.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Les Crestes',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Priorat',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Priorat de autor, con gran concentración y mineralidad.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),
(
    'Salenques',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Negre'
    ),
    'D.O. Priorat',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Priorat potente, con notas de fruta madura y llicorella.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Tinto Burdeos'
    )
),

-- Rosats
(
    'Domaine de Triennes Rosé',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Rosat'
    ),
    'I.G.P. Méditerranée',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine de Triennes'
    ),
    'Rosado de Cinsault, Grenache y Syrah, fresco, con frutos rojos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Rosado'
    )
),
(
    'Serendipity',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Rosat'
    ),
    'D.O. Terra Alta',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Garnacha rosada, ligera, con notas de fresa y frambuesa.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Rosado'
    )
),
(
    'Alella',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Rosat'
    ),
    'D.O. Alta Alella',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Rosado de Garnacha, fresco y floral.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Rosado'
    )
),
(
    'Tayaimgut',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Rosat'
    ),
    'D.O. Terra Alta',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Tayaimgut Viticultor'
    ),
    'Rosado pálido, seco, con aromas cítricos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Rosado'
    )
),

-- Rosat Escumós
(
    'Billecart-Salmon "Le Rosé"',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Rosat Escumós'
    ),
    'Champagne',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Billecart-Salmon'
    ),
    'Champagne rosado muy elegante, con finas burbujas y notas de frutos rojos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'Mas Codina Rosat Brut Reserva',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Rosat Escumós'
    ),
    'D.O. Alt Penedès',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Celler Mas Codina'
    ),
    'Cava rosado de Pinot Noir, afrutado y fresco.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),
(
    'Antonin Pehu "Les Grains" Rosat',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Rosat Escumós'
    ),
    'Champagne (Verzenay)',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Champagne Antonin Pehu'
    ),
    'Champagne rosado de Pinot Noir y Chardonnay, intenso y cremoso.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Espumoso (Flauta)'
    )
),

-- Dolç (dulces)
(
    'Tokaji 1430',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Dolç'
    ),
    'Tokaji Hungria',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Bodega genérica (no especificada)'
    ),
    'Vino dulce húngaro estilo Szamorodni, con notas de albaricoque y miel.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Muscat de Rivesaltes',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Dolç'
    ),
    'Domaine Cazes',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Domaine Cazes'
    ),
    'Vino dulce natural de Moscatel, aromático y goloso.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Château Violet Lamothe',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Dolç'
    ),
    'AOC Sauternes',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Château Violet Lamothe'
    ),
    'Sauternes, dulce con botrytis, notas de fruta confitada y miel.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Blanco'
    )
),
(
    'Porto Ramos Pinto',
    (
        SELECT tipo_id
        FROM tipos
        WHERE
            tipo_nombre = 'Dolç'
    ),
    'Porto',
    (
        SELECT MIN(bodega_id)
        FROM bodegas
        WHERE
            bodega_nombre = 'Ramos Pinto'
    ),
    'Oporto tinto, dulce y licoroso, con frutos negros y notas de frutos secos.',
    (
        SELECT copa_id
        FROM copas
        WHERE
            copa_nombre = 'Fortificado / Jerez'
    )
);

-- 7. COSECHAS (añadas - nombres alineados con la sección 6)
INSERT INTO
    cosechas (vino_id, anio)
VALUES (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Pazo Barrantes Gran Vino Albariño'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Veigadares'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'El Hombre Bala Albillo Real'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Masia Carreras (Blanc)'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Billaud-Simon Chablis 1er Cru Montée de Tonnerre'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Droin Montée de Tonnerre Chablis 1er Cru'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Joseph Drouhin Chablis 1er Cru Mont de Milieu'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mâcon-Milly-Lamartine'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Cap Sentit'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Agathe Bursin Zinnkoepflé Gewurztraminer Grand Cru'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Luar do Sil sobre Lías Godello'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Suerte del Marqués "Trenzado"'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Ma de Ferro'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Ostrea'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Golós'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'UBE Miraflores Alta'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Jardins de Babylone'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Agathe Bursin Dirstelberg Riesling'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Donnhoff Tonschiefer (2020)'
        ),
        2020
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Donnhoff Tonschiefer (2021)'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Família Nin Ortiz Terra Vermella'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Didier Dagueneau Pur Sang'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine Vacheron Sancerre Les Romains'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Tayaimgut (Blanc)'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'José Pariente La Medina'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Edra "Ontina"'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Viognier Jaboulet Secret de Famille'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Etiris'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Baldufa (Blanc)'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine Dujac'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Sidra Angelón'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'La Cuvée Sélection Brut'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'AT Pedregar Brut Nature Gran Reserva'
        ),
        2017
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Els Gorgs Brut Nature Gran Reserva'
        ),
        2014
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Brut Réserve Premier Cru Aubry'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Ortus Brut Nature Gran Reserva'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mas Codina Brut Reserva'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Bodegas de la Riva Macharnudo'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castell del Remei 1780 Collita'
        ),
        2019
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castell d’Encus Thalarn'
        ),
        2019
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castillo de Monjardín Gran Reserva'
        ),
        2012
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Masia Carreras (Negre)'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Altaroses'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Cuvée Beau Rivage de By'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'El Clos es Vent Samsó'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Comando G Rozas'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Álvaro Palacios Gratallops'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'L’Oratori'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Terrotxa'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Baldufa (Negre)'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Viña Zorzal Cuatro del Cuatro Graciano'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Abadia da Cova Loia'
        ),
        2020
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Descendientes de J. Palacios Corullón'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Paxaro Tolo'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Giovanni Rosso Barolo del Comune di Serralunga d’Alba'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Biu de Sort'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine Denis Père et Fils Pernand-Vergelesses'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Negre Regnard Nuits-Saint-Georges 1er Cru'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Negre Fürst Bürgstadter'
        ),
        2018
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Colltor'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Triennes Saint Auguste'
        ),
        2020
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Dominio del Águila Reserva'
        ),
        2020
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Jilabà Crianza'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mauro'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Teso La Monja Almirez'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Roda Reserva'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Elías Mora Crianza'
        ),
        2020
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Les Crestes'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Salenques'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine de Triennes Rosé'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Serendipity'
        ),
        2025
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Alella'
        ),
        2025
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Tayaimgut'
        ),
        2024
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Billecart-Salmon "Le Rosé"'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mas Codina Rosat Brut Reserva'
        ),
        2023
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Antonin Pehu "Les Grains" Rosat'
        ),
        NULL
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Tokaji 1430'
        ),
        2021
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Muscat de Rivesaltes'
        ),
        2020
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Château Violet Lamothe'
        ),
        2022
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Porto Ramos Pinto'
        ),
        2017
    );

-- 8. VINOS_UVAS (Subconsultas completamente alineadas con las tablas maestras)
INSERT INTO
    vinos_uvas (vino_id, uva_tipo, porcentaje)
VALUES (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Pazo Barrantes Gran Vino Albariño'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Albariño'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Veigadares'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Albariño'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'El Hombre Bala Albillo Real'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Albillo Real'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Masia Carreras (Blanc)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Carinyena Blanca'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Masia Carreras (Blanc)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Masia Carreras (Blanc)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Varietats autòctones'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Billaud-Simon Chablis 1er Cru Montée de Tonnerre'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Droin Montée de Tonnerre Chablis 1er Cru'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Joseph Drouhin Chablis 1er Cru Mont de Milieu'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mâcon-Milly-Lamartine'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Cap Sentit'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Blanca'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Agathe Bursin Zinnkoepflé Gewurztraminer Grand Cru'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Gewurztraminer'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Luar do Sil sobre Lías Godello'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Godello'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Suerte del Marqués "Trenzado"'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Listán Blanco'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Ma de Ferro'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Macabeu'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Ostrea'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Macabeu'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Golós'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Moscatell'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Golós'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Viognier'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Golós'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Riesling'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Golós'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Giró Blanc'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'UBE Miraflores Alta'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Palomino Fino'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Jardins de Babylone'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Petit Manseng'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Agathe Bursin Dirstelberg Riesling'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Riesling'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Donnhoff Tonschiefer (2020)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Riesling'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Donnhoff Tonschiefer (2021)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Riesling'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Família Nin Ortiz Terra Vermella'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Parellada'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Didier Dagueneau Pur Sang'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Sauvignon Blanc'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine Vacheron Sancerre Les Romains'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Sauvignon Blanc'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Tayaimgut (Blanc)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Sauvignon Blanc'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'José Pariente La Medina'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Verdejo'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Edra "Ontina"'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Viognier'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Viognier Jaboulet Secret de Famille'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Viognier'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Etiris'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Xarel·lo'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Baldufa (Blanc)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Xarel·lo'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Baldufa (Blanc)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Macabeu'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine Dujac'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Sidra Angelón'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Poma'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'La Cuvée Sélection Brut'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        60
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'La Cuvée Sélection Brut'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        30
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'La Cuvée Sélection Brut'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Meunier'
        ),
        10
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'AT Pedregar Brut Nature Gran Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Negra'
        ),
        85
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'AT Pedregar Brut Nature Gran Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Macabeu'
        ),
        15
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Els Gorgs Brut Nature Gran Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Macabeu'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Els Gorgs Brut Nature Gran Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Xarel·lo'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Brut Réserve Premier Cru Aubry'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Meunier'
        ),
        60
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Brut Réserve Premier Cru Aubry'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        20
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Brut Réserve Premier Cru Aubry'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        20
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Ortus Brut Nature Gran Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mas Codina Brut Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Xarel·lo'
        ),
        55
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mas Codina Brut Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Macabeu'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mas Codina Brut Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        10
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mas Codina Brut Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        10
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Bodegas de la Riva Macharnudo'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Palomino Fino'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castell del Remei 1780 Collita'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cabernet Sauvignon'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castell del Remei 1780 Collita'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Ull llebre'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castell del Remei 1780 Collita'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Gn'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castell d’Encus Thalarn'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Syrah'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castillo de Monjardín Gran Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cabernet Sauvignon'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Castillo de Monjardín Gran Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tempranillo'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Masia Carreras (Negre)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cariñena'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Altaroses'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnacha Tinta'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Cuvée Beau Rivage de By'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cabernet Sauvignon'
        ),
        60
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Cuvée Beau Rivage de By'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Merlot'
        ),
        40
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'El Clos es Vent Samsó'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Carinyena Negra'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Comando G Rozas'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnacha'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Álvaro Palacios Gratallops'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnacha'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'L’Oratori'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnacha Tinta'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'L’Oratori'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cariñena'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'L’Oratori'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cabernet Sauvignon'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Terrotxa'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Negra'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Terrotxa'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Peluda'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Terrotxa'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cabernet Sauvignon'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Baldufa (Negre)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Negra'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Baldufa (Negre)'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Syrah'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Viña Zorzal Cuatro del Cuatro Graciano'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Graciano'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Abadia da Cova Loia'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Mencía'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Descendientes de J. Palacios Corullón'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Mencía'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Paxaro Tolo'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Mencía'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Giovanni Rosso Barolo del Comune di Serralunga d’Alba'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Nebbiolo'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Biu de Sort'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine Denis Père et Fils Pernand-Vergelesses'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Negre Regnard Nuits-Saint-Georges 1er Cru'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Negre Fürst Bürgstadter'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Spätburgunder'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Colltor'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Syrah'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Triennes Saint Auguste'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Syrah'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Triennes Saint Auguste'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cabernet Sauvignon'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Dominio del Águila Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tempranillo'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Jilabà Crianza'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tempranillo'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mauro'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tempranillo'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Teso La Monja Almirez'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tempranillo'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Roda Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tempranillo'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Roda Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Graciano'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Elías Mora Crianza'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tinta de Toro'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine de Triennes Rosé'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Cinsault'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine de Triennes Rosé'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Grenache'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Domaine de Triennes Rosé'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Syrah'
        ),
        33.33
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Serendipity'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Negra'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Alella'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Negra'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Alella'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Garnatxa Peluda'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Billecart-Salmon "Le Rosé"'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Mas Codina Rosat Brut Reserva'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Antonin Pehu "Les Grains" Rosat'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Pinot Noir'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Antonin Pehu "Les Grains" Rosat'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Chardonnay'
        ),
        50
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Tokaji 1430'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Edes Szamorodni'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Muscat de Rivesaltes'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Muscat'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Château Violet Lamothe'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Sauternes'
        ),
        100
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Porto Ramos Pinto'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Touriga Nacional'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Porto Ramos Pinto'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Touriga Franca'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Porto Ramos Pinto'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tinta Roriz'
        ),
        25
    ),
    (
        (
            SELECT vino_id
            FROM vinos
            WHERE
                vino_nombre = 'Porto Ramos Pinto'
        ),
        (
            SELECT uva_id
            FROM uvas
            WHERE
                uva_nombre = 'Tinta Barroca'
        ),
        25
    );

-- 9. VINOS_VENTA (Asignar formato estándar automáticamente)
INSERT INTO
    vinos_venta (cosecha_id, formato_id)
SELECT cosecha_id, (
        SELECT formato_id
        FROM formatos
        WHERE
            formato_nombre = 'Botella Estándar'
    )
FROM cosechas;