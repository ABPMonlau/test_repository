USE `reservas_lacanal`;

CREATE OR REPLACE VIEW vista_estadisticas_clientes AS
SELECT 
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email,
    COUNT(r.id_reserva) AS total_reservas,
    COALESCE(SUM(r.cantidad_personas), 0) AS total_personas_historico,
    MAX(r.fecha_reserva) AS ultima_reserva,
    (
        SELECT m.ubicacion
        FROM reservas r2
        JOIN mesas m ON r2.id_mesa = m.id_mesa
        WHERE r2.id_cliente = c.id_cliente
        GROUP BY m.ubicacion
        ORDER BY COUNT(r2.id_reserva) DESC
        LIMIT 1
    ) AS ubicacion_favorita
FROM clientes c
LEFT JOIN reservas r ON c.id_cliente = r.id_cliente
GROUP BY 
    c.id_cliente, 
    c.nombre, 
    c.email;