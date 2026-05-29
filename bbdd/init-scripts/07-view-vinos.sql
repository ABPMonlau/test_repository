USE `cataleg-vins`;

CREATE OR REPLACE VIEW vista_resumen_bodegas AS
SELECT 
    b.bodega_id,
    b.bodega_nombre,
    b.bodega_zona,
    COUNT(DISTINCT v.vino_id) AS total_vinos_producidos,
    COUNT(c.cosecha_id) AS total_cosechas_disponibles,
    (
        SELECT u.uva_nombre
        FROM vinos v2
        JOIN vinos_uvas vu ON v2.vino_id = vu.vino_id
        JOIN uvas u ON vu.uva_tipo = u.uva_id
        WHERE v2.bodega = b.bodega_id
        GROUP BY u.uva_id, u.uva_nombre
        ORDER BY COUNT(vu.uva_tipo) DESC
        LIMIT 1
    ) AS uva_mas_utilizada
FROM bodegas b
LEFT JOIN vinos v ON b.bodega_id = v.bodega
LEFT JOIN cosechas c ON v.vino_id = c.vino_id
GROUP BY 
    b.bodega_id, 
    b.bodega_nombre, 
    b.bodega_zona;