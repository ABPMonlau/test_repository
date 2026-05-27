CREATE TABLE turnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    tipo_turno ENUM('maniana', 'comida', 'noche') NOT NULL,
    hora_comienzo TIME NOT NULL,
    hora_cierre TIME NOT NULL,
    maxima_reserva INT NOT NULL
)
