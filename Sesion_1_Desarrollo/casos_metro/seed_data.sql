-- Datos de prueba para Metro Bilbao
-- Ejecutar después de metro_schema.sql

-- Líneas del metro
INSERT INTO lineas (nombre, codigo, color, fecha_inauguracion) VALUES
('Línea 1 - Etxebarri/Basauri - Plentzia', 'L1', 'Naranja', '1995-11-11'),
('Línea 2 - Basauri - Kabiezes', 'L2', 'Rojo', '2002-04-13'),
('Línea 3 - Kukullaga - Matiko', 'L3', 'Verde', '2017-04-08');

-- Estaciones Línea 1 (muestras)
INSERT INTO estaciones (nombre, linea_id, zona, orden_en_linea, fecha_apertura) VALUES
('Plentzia', 1, 3, 1, '1995-11-11'),
('Urduliz', 1, 3, 2, '1995-11-11'),
('Sopela', 1, 3, 3, '1995-11-11'),
('Larrabasterra', 1, 2, 4, '1995-11-11'),
('Berango', 1, 2, 5, '1995-11-11'),
('Algorta', 1, 2, 6, '1995-11-11'),
('Aiboa', 1, 2, 7, '1995-11-11'),
('Gobela', 1, 2, 8, '1995-11-11'),
('Neguri', 1, 2, 9, '1995-11-11'),
('Areeta', 1, 2, 10, '1995-11-11'),
('Bidezabal', 1, 2, 11, '1995-11-11'),
('Lutxana-Barakaldo', 1, 2, 12, '1995-11-11'),
('Bagatza', 1, 2, 13, '1995-11-11'),
('Urbinaga', 1, 2, 14, '1995-11-11'),
('Ansio', 1, 1, 15, '1995-11-11'),
('Santurtzi', 1, 1, 16, '1995-11-11'),
('Peñota', 1, 1, 17, '1995-11-11'),
('Portugalete', 1, 1, 18, '1995-11-11'),
('Abatxolo', 1, 1, 19, '1995-11-11'),
('Sestao', 1, 1, 20, '1995-11-11'),
('Kareaga', 1, 1, 21, '1997-11-08'),
('San Inazio', 1, 1, 22, '2005-03-21'),
('Gurutzeta-Cruces', 1, 1, 23, '2005-03-21'),
('Basarrate', 1, 1, 24, '1995-11-11'),
('Casco Viejo', 1, 1, 25, '1997-05-25'),
('Abando', 1, 1, 26, '1995-11-11'),
('Moyua', 1, 1, 27, '1995-11-11'),
('Indautxu', 1, 1, 28, '1995-11-11');

-- Estaciones Línea 2 (muestras)
INSERT INTO estaciones (nombre, linea_id, zona, orden_en_linea, fecha_apertura) VALUES
('Basauri', 2, 2, 1, '2002-04-13'),
('Ariz', 2, 2, 2, '2002-04-13'),
('Etxebarri', 2, 2, 3, '2002-04-13'),
('San Ignazio', 2, 1, 4, '2014-04-06'),
('Bolueta', 2, 1, 5, '2014-04-06'),
('Santutxu', 2, 1, 6, '2014-04-06'),
('Deusto', 2, 1, 7, '2017-02-21'),
('San Mames', 2, 1, 8, '2013-11-16');

-- Usuarios de prueba
INSERT INTO usuarios (nombre, apellidos, email, tipo_usuario, fecha_registro) VALUES
('Juan', 'García Fernández', 'juan.garcia@email.com', 'regular', '2024-01-15'),
('María', 'López Martínez', 'maria.lopez@email.com', 'estudiante', '2024-02-20'),
('Pedro', 'Sánchez Ruiz', 'pedro.sanchez@email.com', 'tercera_edad', '2023-11-10'),
('Ana', 'Rodríguez González', 'ana.rodriguez@email.com', 'regular', '2024-03-05'),
('Luis', 'Martínez Pérez', 'luis.martinez@email.com', 'estudiante', '2024-01-22'),
('Carmen', 'Fernández López', 'carmen.fernandez@email.com', 'tercera_edad', '2023-12-01'),
('Carlos', 'González Sánchez', 'carlos.gonzalez@email.com', 'empresa', '2024-04-10'),
('Isabel', 'Pérez Rodríguez', 'isabel.perez@email.com', 'regular', '2024-02-15'),
('Javier', 'Ruiz García', 'javier.ruiz@email.com', 'estudiante', '2024-03-20'),
('Laura', 'Martín López', 'laura.martin@email.com', 'regular', '2024-01-30');

-- Billetes de prueba
INSERT INTO billetes (usuario_id, tipo_billete, zona_validez, saldo, viajes_restantes, numero_serie, fecha_expiracion) VALUES
(1, 'mensual', 1, 45.00, 60, 'BT-2024-001-00123', '2025-01-31'),
(2, 'bono_10', 2, 15.00, 7, 'BT-2024-002-00456', '2025-12-31'),
(3, 'bono_30', 3, 35.00, 22, 'BT-2024-003-00789', '2025-12-31'),
(4, 'mensual', 1, 45.00, 58, 'BT-2024-001-01234', '2025-01-31'),
(5, 'bono_10', 1, 12.00, 5, 'BT-2024-001-05678', '2025-12-31'),
(6, 'anual', 3, 480.00, 720, 'BT-2024-003-09876', '2025-12-31'),
(7, 'mensual', 2, 55.00, 60, 'BT-2024-002-54321', '2025-01-31'),
(8, 'bono_30', 1, 38.00, 28, 'BT-2024-001-11111', '2025-12-31'),
(9, 'bono_10', 2, 18.00, 9, 'BT-2024-002-22222', '2025-12-31'),
(10, 'sencillo', 1, 1.50, 1, 'BT-2024-001-99999', '2024-12-31');

-- Recargas de ejemplo
INSERT INTO recargas (billete_id, usuario_id, monto, viajes_agregados, metodo_pago, estacion_id, fecha_recarga) VALUES
(2, 2, 15.00, 10, 'tarjeta', 26, '2024-10-01 09:30:00'),
(3, 3, 60.00, 30, 'app', 1, '2024-10-05 14:20:00'),
(5, 5, 12.00, 10, 'efectivo', 26, '2024-10-10 08:15:00'),
(8, 8, 40.00, 30, 'tarjeta', 27, '2024-09-15 10:45:00'),
(9, 9, 18.00, 10, 'app', 8, '2024-10-20 16:30:00');

-- Validaciones de ejemplo (últimos 3 meses)
-- Octubre 2024
INSERT INTO validaciones (billete_id, usuario_id, estacion_id, fecha_validacion, tipo_validacion, zona_estacion, tarifa_aplicada, descuento_aplicado, exitosa) VALUES
-- Usuario 1 (regular, zona 1)
(1, 1, 26, '2024-10-28 08:15:00', 'entrada', 1, 1.50, 0.00, true),
(1, 1, 27, '2024-10-28 08:45:00', 'salida', 1, 0.00, 0.00, true),
(1, 1, 27, '2024-10-28 18:20:00', 'entrada', 1, 1.50, 0.00, true),
(1, 1, 26, '2024-10-28 18:50:00', 'salida', 1, 0.00, 0.00, true),

-- Usuario 2 (estudiante, zona 2)
(2, 2, 4, '2024-10-28 09:00:00', 'entrada', 2, 1.40, 0.60, true),
(2, 2, 12, '2024-10-28 09:30:00', 'salida', 2, 0.00, 0.00, true),
(2, 2, 12, '2024-10-28 17:45:00', 'entrada', 2, 1.40, 0.60, true),
(2, 2, 4, '2024-10-28 18:15:00', 'salida', 2, 0.00, 0.00, true),

-- Usuario 3 (tercera edad, zona 3)
(3, 3, 1, '2024-10-28 10:30:00', 'entrada', 3, 1.25, 1.25, true),
(3, 3, 26, '2024-10-28 11:45:00', 'salida', 1, 0.00, 0.00, true),

-- Más validaciones de días anteriores
(1, 1, 26, '2024-10-27 08:20:00', 'entrada', 1, 1.50, 0.00, true),
(1, 1, 27, '2024-10-27 08:50:00', 'salida', 1, 0.00, 0.00, true),
(4, 4, 26, '2024-10-27 09:10:00', 'entrada', 1, 1.50, 0.00, true),
(4, 4, 8, '2024-10-27 09:40:00', 'salida', 1, 0.00, 0.00, true),

-- Septiembre 2024 (muestras)
(1, 1, 26, '2024-09-15 08:15:00', 'entrada', 1, 1.50, 0.00, true),
(1, 1, 27, '2024-09-15 08:45:00', 'salida', 1, 0.00, 0.00, true),
(2, 2, 4, '2024-09-15 09:00:00', 'entrada', 2, 1.40, 0.60, true),
(2, 2, 12, '2024-09-15 09:30:00', 'salida', 2, 0.00, 0.00, true),
(3, 3, 1, '2024-09-15 10:30:00', 'entrada', 3, 1.25, 1.25, true),
(3, 3, 26, '2024-09-15 11:45:00', 'salida', 1, 0.00, 0.00, true),

-- Agosto 2024 (muestras)
(1, 1, 26, '2024-08-10 08:15:00', 'entrada', 1, 1.50, 0.00, true),
(1, 1, 27, '2024-08-10 08:45:00', 'salida', 1, 0.00, 0.00, true),
(4, 4, 26, '2024-08-10 09:10:00', 'entrada', 1, 1.50, 0.00, true),
(4, 4, 8, '2024-08-10 09:40:00', 'salida', 1, 0.00, 0.00, true),
(6, 6, 1, '2024-08-10 11:00:00', 'entrada', 3, 1.25, 1.25, true),
(6, 6, 26, '2024-08-10 12:15:00', 'salida', 1, 0.00, 0.00, true);

-- Validaciones adicionales para volumen (hora punta)
-- Generar más validaciones para 10-28 entre 7:00 y 9:00
INSERT INTO validaciones (billete_id, usuario_id, estacion_id, fecha_validacion, tipo_validacion, zona_estacion, tarifa_aplicada, descuento_aplicado, exitosa)
SELECT 
  (id % 10) + 1,  -- billete_id rotativo
  (id % 10) + 1,  -- usuario_id rotativo
  ((id % 10) + 16),  -- estacion_id (zona 1)
  TIMESTAMP '2024-10-28 07:00:00' + (id * INTERVAL '2 minutes'),
  'entrada',
  1,
  1.50,
  0.00,
  true
FROM generate_series(1, 50) AS id;

-- Validaciones de salida correspondientes
INSERT INTO validaciones (billete_id, usuario_id, estacion_id, fecha_validacion, tipo_validacion, zona_estacion, tarifa_aplicada, descuento_aplicado, exitosa)
SELECT 
  (id % 10) + 1,  -- billete_id rotativo
  (id % 10) + 1,  -- usuario_id rotativo
  ((id % 10) + 18),  -- estacion_id diferente (zona 1)
  TIMESTAMP '2024-10-28 07:30:00' + (id * INTERVAL '2 minutes'),
  'salida',
  1,
  0.00,
  0.00,
  true
FROM generate_series(1, 50) AS id;

-- Validaciones fallidas (ejemplos de errores)
INSERT INTO validaciones (billete_id, usuario_id, estacion_id, fecha_validacion, tipo_validacion, zona_estacion, tarifa_aplicada, descuento_aplicado, exitosa, mensaje_error) VALUES
(10, 10, 1, '2024-10-28 12:30:00', 'entrada', 3, 0.00, 0.00, false, 'Saldo insuficiente para zona 3'),
(5, 5, 1, '2024-10-25 15:45:00', 'entrada', 3, 0.00, 0.00, false, 'Billete zona 1 no válido para zona 3'),
(10, 10, 26, '2024-10-20 09:15:00', 'entrada', 1, 0.00, 0.00, false, 'Billete expirado');

COMMENT ON TABLE validaciones IS 'Nota: Las validaciones incluyen entradas y salidas. La tarifa se cobra en la entrada.';
