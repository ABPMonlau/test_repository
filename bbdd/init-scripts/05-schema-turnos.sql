INSERT INTO turnos (
    dia_semana,
    tipo_turno,
    hora_comienzo,
    hora_cierre,
    maxima_reserva
)
VALUES
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