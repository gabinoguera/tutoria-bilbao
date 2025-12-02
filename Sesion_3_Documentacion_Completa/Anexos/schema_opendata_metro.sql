-- ============================================
-- Schema Metro Bilbao - Generado desde Open Data
-- Fuente: https://www.metrobilbao.eus/es/open-data/dataset/estaciones
-- Fecha: 2025-12-01
-- ============================================

-- Tabla de Líneas del Metro
CREATE TABLE lineas_metro (
    codigo VARCHAR(3) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    color VARCHAR(20),
    activa BOOLEAN DEFAULT true,
    CONSTRAINT chk_codigo CHECK (LENGTH(codigo) = 3)
);

-- Tabla de Estaciones (agrupadas por parent_station)
CREATE TABLE estaciones_metro (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(3) NOT NULL,
    nombre_corto VARCHAR(50) NOT NULL, -- Ej: 'ABA', 'ABT'
    nombre_completo VARCHAR(100),       -- Ej: 'Abando', 'Abatxolo'
    parent_station INTEGER NOT NULL,
    latitud DECIMAL(10,7) NOT NULL,
    longitud DECIMAL(10,7) NOT NULL,
    zona INTEGER CHECK (zona BETWEEN 1 AND 3),
    activa BOOLEAN DEFAULT true,
    CONSTRAINT uk_parent_station UNIQUE (parent_station)
);

-- Tabla de Accesos de cada estación
CREATE TABLE accesos_estacion (
    id SERIAL PRIMARY KEY,
    stop_id INTEGER NOT NULL UNIQUE,
    estacion_id INTEGER NOT NULL REFERENCES estaciones_metro(id),
    nombre VARCHAR(100) NOT NULL,  -- Ej: 'Ascensor', 'Berastegi', 'Gran Vía'
    tipo VARCHAR(20),               -- 'Ascensor', 'Acceso Principal', 'Salida'
    latitud DECIMAL(10,7),
    longitud DECIMAL(10,7),
    location_type INTEGER,
    CONSTRAINT chk_location_type CHECK (location_type IN (0, 1, 2))
);

-- Índices para mejorar consultas
CREATE INDEX idx_estaciones_codigo ON estaciones_metro(codigo);
CREATE INDEX idx_accesos_estacion ON accesos_estacion(estacion_id);
CREATE INDEX idx_estaciones_zona ON estaciones_metro(zona);

-- ============================================
-- DATOS DE EJEMPLO (primeras estaciones)
-- ============================================

-- Líneas identificadas del CSV
INSERT INTO lineas_metro (codigo, nombre, color) VALUES
    ('ABA', 'Línea 1 - Sector Abando', '#0066CC'),
    ('ABT', 'Línea 2 - Sector Abatxolo', '#FF6600'),
    ('PLE', 'Línea 1 - Sector Plentzia', '#0066CC'),
    ('ETX', 'Línea 1 - Sector Etxebarri', '#0066CC');

-- Estaciones (parent_station como ID único)
INSERT INTO estaciones_metro (codigo, nombre_corto, nombre_completo, parent_station, latitud, longitud, zona) VALUES
    ('ABA', 'ABA', 'Abando', 0, 43.26144, -2.92820, 1),
    ('ABT', 'ABT', 'Abatxolo', 2, 43.31376, -3.01251, 2),
    ('AIB', 'AIB', 'Aiboa', 3, 43.34359, -3.00288, 3),
    ('ALG', 'ALG', 'Algorta', 4, 43.34988, -3.00910, 3),
    ('BER', 'BER', 'Berango', 13, 43.36676, -2.99942, 3),
    ('ETX', 'ETX', 'Etxebarri', 18, 43.24387, -2.89668, 1);

-- Accesos de Abando (múltiples entradas)
INSERT INTO accesos_estacion (stop_id, estacion_id, nombre, tipo, latitud, longitud, location_type) VALUES
    (74, 1, 'Ascensor', 'Ascensor', 43.26144, -2.92820, 1),
    (75, 1, 'Berastegi', 'Acceso Principal', 43.26203, -2.92804, 1),
    (76, 1, 'Gran Vía', 'Acceso Secundario', 43.26134, -2.92783, 1),
    (77, 1, 'RENFE', 'Conexión RENFE', 43.26078, -2.92746, 1);

-- Comentarios de documentación
COMMENT ON TABLE estaciones_metro IS 'Estaciones del Metro de Bilbao agrupadas por ubicación física (parent_station)';
COMMENT ON TABLE accesos_estacion IS 'Puntos de acceso individuales (ascensores, escaleras, entradas) de cada estación';
COMMENT ON COLUMN estaciones_metro.parent_station IS 'ID de agrupación de GTFS - Identifica estaciones con múltiples accesos';
COMMENT ON COLUMN accesos_estacion.location_type IS 'Tipo GTFS: 0=Parada, 1=Estación, 2=Entrada/Salida';
