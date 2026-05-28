-- 1. Tabla principal para los Menús
CREATE TABLE menus (
    id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    subtitle VARCHAR(255),
    price DECIMAL(5, 2) NOT NULL,
    price_details VARCHAR(255)
);

-- 2. Tabla para las secciones del menú
CREATE TABLE menu_sections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    menu_id VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT fk_sections_menus FOREIGN KEY (menu_id) REFERENCES menus (id) ON DELETE CASCADE
);

-- 3. Tabla para los platos/ítems de cada sección
CREATE TABLE menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    section_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    supplement DECIMAL(5, 2) DEFAULT NULL,
    CONSTRAINT fk_items_sections FOREIGN KEY (section_id) REFERENCES menu_sections (id) ON DELETE CASCADE
);