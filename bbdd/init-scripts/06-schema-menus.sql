USE `menus-lacanal`;

-- 1. Tabla principal para los Menús
CREATE TABLE if not exists menus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    subtitle VARCHAR(255),
    price DECIMAL(5, 2) NOT NULL,
    price_details VARCHAR(255)
);

-- 2. Tabla para las secciones del menú
CREATE TABLE if not exists menu_sections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    menu_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT fk_sections_menus FOREIGN KEY (menu_id) REFERENCES menus (id) ON DELETE CASCADE
);

-- 3. Tabla para los platos/ítems de cada sección
CREATE TABLE if not exists menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    section_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    supplement DECIMAL(5, 2) DEFAULT NULL,
    CONSTRAINT fk_items_sections FOREIGN KEY (section_id) REFERENCES menu_sections (id) ON DELETE CASCADE
);


-- INSERT MENUS --

INSERT INTO
    menus (
        title,
        subtitle,
        price,
        price_details
    )
VALUES (
        'Menú del Dia',
        'De dimarts a divendres al migdia',
        19.50,
        'IVA inclòs • amb pa, aigua i copa de vi'
    ),
    (
        'Menú Interludi',
        'Cocktail benvinguda',
        45.00,
        'IVA inclòs • amb pa i aigua'
    ),
    (
        'Menú Cap de Setmana',
        'Cocktail benvinguda',
        35.00,
        'IVA inclòs • amb pa i aigua'
    );

--- INSERT MENÚ DIA ---

-- Secció: Primers
INSERT INTO menu_sections (menu_id, name) VALUES (1, 'Primers');

SET @sec_primers = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_primers,
        'Amanida Waldorf',
        NULL
    ),
    (
        @sec_primers,
        'Salmorejo',
        NULL
    ),
    (
        @sec_primers,
        'Pasta amb gambes a l''all',
        NULL
    ),
    (
        @sec_primers,
        'Zamburinyes amb salsa d''estragó',
        8.00
    );

-- Secció: Segons
INSERT INTO menu_sections (menu_id, name) VALUES (1, 'Segons');

SET @sec_segons = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_segons,
        'Arròs de sípia',
        NULL
    ),
    (
        @sec_segons,
        'Peix del dia amb salsa Nantua',
        NULL
    ),
    (
        @sec_segons,
        'Llom de porc amb anisats i salsa tàrtara',
        NULL
    ),
    (
        @sec_segons,
        'Filet de vedella',
        14.00
    );

-- Secció: Postres
INSERT INTO menu_sections (menu_id, name) VALUES (1, 'Postres');

SET @sec_postres = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_postres,
        'Maduixes amb infusió de temporada',
        NULL
    ),
    (
        @sec_postres,
        'Cremós de iogurt amb concasse de fruita',
        NULL
    ),
    (
        @sec_postres,
        'Lemon pie deconstruït',
        NULL
    );



--- MENÚ INTERLUDIO ---

-- Secció: Snacks
INSERT INTO
    menu_sections (menu_id, name)
VALUES (2, 'Snacks');

SET @sec_snacks_int = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_snacks_int,
        'Bunyol de formatge, mel i mandarina fermentada',
        NULL
    ),
    (
        @sec_snacks_int,
        'Xurro amb espuma de pesto i horseradish',
        NULL
    ),
    (
        @sec_snacks_int,
        'Snack de paté de pollastre amb quicos i blat de moro',
        NULL
    ),
    (
        @sec_snacks_int,
        'Crema d''anguila fumada, gamba blanca amb oli dels seus caps, gel de cirera i consomé, xiitake i kombu',
        NULL
    ),
    (
        @sec_snacks_int,
        'Plat de verdures de temporada',
        NULL
    ),
    (
        @sec_snacks_int,
        'Foie micuit amb coulis d''aglà, praliné d''avellanes i torradetes de brioix',
        10.00
    );

-- Secció: Segons a escollir
INSERT INTO
    menu_sections (menu_id, name)
VALUES (
        2,
        'Segons a escollir'
    );

SET @sec_segons_int = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_segons_int,
        'Peix del dia amb Gazpachuelo',
        NULL
    ),
    (
        @sec_segons_int,
        'Terrina de caça i porc amb textures de remolatxa',
        NULL
    );

-- Secció: Postres a escollir
INSERT INTO
    menu_sections (menu_id, name)
VALUES (
        2,
        'Postres a escollir'
    );

SET @sec_postres_int = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_postres_int,
        'Textures de maduixa, vainilla i estragó',
        NULL
    ),
    (
        @sec_postres_int,
        'Xocolata i ametlla (Inclou els nostres petit fours)',
        NULL
    );



--- MENÚ FIN DE SEMANA ---

-- Secció: Snacks
INSERT INTO
    menu_sections (menu_id, name)
VALUES (3, 'Snacks');

SET @sec_snacks_cs = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_snacks_cs,
        'Bunyol de formatge, mel i llimona fermentada',
        NULL
    ),
    (
        @sec_snacks_cs,
        'Xurro amb espuma de pesto i horseradish',
        NULL
    ),
    (
        @sec_snacks_cs,
        'Snack de paté de pollastre amb quicos i blat de moro',
        NULL
    ),
    (
        @sec_snacks_cs,
        'Crema d''anguila fumada, gamba blanca amb oli dels seus caps, gel de cirera i consomé, xiitake i kombu',
        NULL
    ),
    (
        @sec_snacks_cs,
        'Foie micuit amb coulis d''aglà, praliné d''avellanes i torradetes de brioix',
        10.00
    );

-- Secció: Segons a escollir
INSERT INTO
    menu_sections (menu_id, name)
VALUES (
        3,
        'Segons a escollir'
    );

SET @sec_segons_cs = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_segons_cs,
        'Peix del dia amb Gazpachuelo',
        NULL
    ),
    (
        @sec_segons_cs,
        'Terrina de caça i porc amb textures de remolatxa',
        NULL
    );

-- Secció: Postres a escollir
INSERT INTO
    menu_sections (menu_id, name)
VALUES (
        3,
        'Postres a escollir'
    );

SET @sec_postres_cs = LAST_INSERT_ID();

INSERT INTO
    menu_items (section_id, name, supplement)
VALUES (
        @sec_postres_cs,
        'Textures de maduixa, vainilla i estragó',
        NULL
    ),
    (
        @sec_postres_cs,
        'Xocolata i ametlla',
        NULL
    );