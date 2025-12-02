-- =====================================================
-- Schema OpenData Metro Bilbao
-- Generado desde: estaciones.csv (datos abiertos)
-- Fuente: https://www.metrobilbao.eus/es/open-data/dataset/estaciones
-- =====================================================

-- =====================================================
-- ANÁLISIS DEL CSV (Chain of Thought)
-- =====================================================
-- 
-- 1. COLUMNAS IDENTIFICADAS:
--    - stop_id: ID único del acceso (ej: 74, 75, 76)
--    - stop_name: Código estación + nombre acceso (ej: "ABA,Ascensor")
--    - stop_lat/stop_lon: Coordenadas GPS del acceso
--    - location_type: ID de la estación física (parent)
--    - parent_station: Siempre 0 (no usado en este dataset)
--
-- 2. AGRUPACIÓN POR parent_station (location_type):
--    - ABA (Abando): 4 accesos → Ascensor, Berastegi, Gran Vía, RENFE
--    - ETX (Etxebarri): 1 acceso → Etxebarri
--    - SAM (San Mamés): 3 accesos → Ascensor, Luis Briñas, Sabino Arana
--    - Total: 49 estaciones físicas, 123 accesos
--
-- 3. MODELO PROPUESTO:
--    - LINEAS_METRO: L1 (Etxebarri-Plentzia), L2 (Basauri-Kabiezes), L3 (Matiko-Kukullaga)
--    - ESTACIONES_METRO: Una fila por estación física con coordenadas centroid
--    - ACCESOS_ESTACION: Cada entrada/ascensor de la estación
-- =====================================================

-- Limpiar tablas existentes
DROP TABLE IF EXISTS accesos_estacion CASCADE;
DROP TABLE IF EXISTS estaciones_metro CASCADE;
DROP TABLE IF EXISTS lineas_metro CASCADE;

-- =====================================================
-- Tabla: LINEAS_METRO
-- Líneas del sistema de Metro Bilbao
-- =====================================================
CREATE TABLE lineas_metro (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(5) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    color VARCHAR(20),
    estacion_origen VARCHAR(50),
    estacion_destino VARCHAR(50),
    num_estaciones INTEGER,
    longitud_km DECIMAL(5,2),
    fecha_inauguracion DATE,
    activa BOOLEAN DEFAULT true
);

COMMENT ON TABLE lineas_metro IS 'Líneas del Metro de Bilbao extraídas de OpenData';

-- =====================================================
-- Tabla: ESTACIONES_METRO
-- Estaciones físicas (agrupadas por location_type)
-- =====================================================
CREATE TABLE estaciones_metro (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(5) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    linea_id INTEGER REFERENCES lineas_metro(id),
    -- Coordenadas GPS (centroide de accesos)
    latitud DECIMAL(12, 8) NOT NULL,
    longitud DECIMAL(12, 8) NOT NULL,
    -- Zona tarifaria (1=centro, 2=periferia cercana, 3=lejana)
    zona INTEGER CHECK (zona IN (1, 2, 3)),
    -- Metadata
    es_intercambiador BOOLEAN DEFAULT false,
    es_terminal BOOLEAN DEFAULT false,
    tiene_parking BOOLEAN DEFAULT false,
    tiene_ascensor BOOLEAN DEFAULT false,
    orden_en_linea INTEGER,
    activa BOOLEAN DEFAULT true,
    -- OpenData reference
    location_type INTEGER UNIQUE -- ID original del CSV
);

COMMENT ON TABLE estaciones_metro IS 'Estaciones físicas del Metro Bilbao con coordenadas GPS';
COMMENT ON COLUMN estaciones_metro.location_type IS 'ID de agrupación del CSV OpenData';

-- =====================================================
-- Tabla: ACCESOS_ESTACION
-- Entradas, ascensores y accesos de cada estación
-- =====================================================
CREATE TABLE accesos_estacion (
    id SERIAL PRIMARY KEY,
    estacion_id INTEGER NOT NULL REFERENCES estaciones_metro(id),
    stop_id INTEGER UNIQUE NOT NULL, -- ID original del CSV
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(30) CHECK (tipo IN ('entrada', 'ascensor', 'escalera', 'anden')),
    -- Coordenadas GPS específicas del acceso
    latitud DECIMAL(12, 8) NOT NULL,
    longitud DECIMAL(12, 8) NOT NULL,
    -- Características
    accesible BOOLEAN DEFAULT true,
    activo BOOLEAN DEFAULT true
);

COMMENT ON TABLE accesos_estacion IS 'Accesos individuales a cada estación (puertas, ascensores)';

-- =====================================================
-- Índices para optimización
-- =====================================================
CREATE INDEX idx_estaciones_linea ON estaciones_metro(linea_id);
CREATE INDEX idx_estaciones_zona ON estaciones_metro(zona);
CREATE INDEX idx_estaciones_codigo ON estaciones_metro(codigo);
CREATE INDEX idx_accesos_estacion ON accesos_estacion(estacion_id);

-- Índice espacial (si se usa PostGIS)
-- CREATE INDEX idx_estaciones_geo ON estaciones_metro USING GIST (
--     ST_SetSRID(ST_MakePoint(longitud, latitud), 4326)
-- );

-- =====================================================
-- DATOS DE EJEMPLO
-- =====================================================

-- Insertar líneas
INSERT INTO lineas_metro (codigo, nombre, color, estacion_origen, estacion_destino, num_estaciones, fecha_inauguracion) VALUES
('L1', 'Línea 1 - Etxebarri-Plentzia', '#EE2A24', 'Etxebarri', 'Plentzia', 31, '1995-11-11'),
('L2', 'Línea 2 - Basauri-Kabiezes', '#F7931D', 'Basauri', 'Kabiezes', 18, '2002-04-21'),
('L3', 'Línea 3 - Matiko-Kukullaga', '#009639', 'Matiko', 'Kukullaga', 8, '2017-04-08');

-- Insertar primeras 5 estaciones (con coordenadas centroid)
INSERT INTO estaciones_metro (codigo, nombre, linea_id, latitud, longitud, zona, es_intercambiador, tiene_ascensor, location_type) VALUES
-- Abando (4 accesos) - Intercambiador con RENFE
('ABA', 'Abando', 1, 43.26140, -2.92788, 1, true, true, 1),
-- Abanto (3 accesos) - L2
('ABT', 'Abanto', 2, 43.31443, -3.01315, 2, false, true, 2),
-- Aiboa (2 accesos) - L2
('AIB', 'Aiboa', 2, 43.34359, -3.00288, 3, false, false, 3),
-- Algorta (2 accesos) - L1
('ALG', 'Algorta', 1, 43.35045, -3.00934, 3, false, false, 4),
-- Ansio/BEC (1 acceso) - L1
('ANS', 'Ansio (BEC)', 1, 43.28975, -2.98699, 2, false, false, 5);

-- Insertar accesos de las primeras 5 estaciones
INSERT INTO accesos_estacion (estacion_id, stop_id, nombre, tipo, latitud, longitud, accesible) VALUES
-- Accesos Abando (estacion_id = 1)
(1, 74, 'Ascensor', 'ascensor', 43.26144, -2.92820, true),
(1, 75, 'Berastegi', 'entrada', 43.26203, -2.92804, true),
(1, 76, 'Gran Vía', 'entrada', 43.26134, -2.92783, true),
(1, 77, 'RENFE', 'entrada', 43.26078, -2.92746, true),
-- Accesos Abanto (estacion_id = 2)
(2, 146, 'Azeta', 'entrada', 43.31376, -3.01251, true),
(2, 147, 'Los Palangreros', 'entrada', 43.31488, -3.01327, true),
(2, 148, 'Ascensor', 'ascensor', 43.31465, -3.01366, true),
-- Accesos Aiboa (estacion_id = 3)
(3, 113, 'Txakursolo', 'entrada', 43.34359, -3.00288, true),
(3, 114, 'Alango', 'entrada', 43.34359, -3.00288, true),
-- Accesos Algorta (estacion_id = 4)
(4, 116, 'Bolue', 'entrada', 43.34988, -3.00910, true),
(4, 117, 'Telletxe', 'entrada', 43.35102, -3.00957, true),
-- Accesos Ansio/BEC (estacion_id = 5)
(5, 133, 'BEC', 'entrada', 43.28975, -2.98699, true);

-- =====================================================
-- CONSULTAS DE VERIFICACIÓN
-- =====================================================

-- Ver estructura completa de una estación
-- SELECT 
--     e.codigo, e.nombre as estacion, e.zona,
--     l.codigo as linea, l.color,
--     a.nombre as acceso, a.tipo,
--     a.latitud, a.longitud
-- FROM estaciones_metro e
-- JOIN lineas_metro l ON e.linea_id = l.id
-- JOIN accesos_estacion a ON a.estacion_id = e.id
-- WHERE e.codigo = 'ABA';

-- Contar accesos por estación
-- SELECT e.codigo, e.nombre, COUNT(a.id) as num_accesos
-- FROM estaciones_metro e
-- LEFT JOIN accesos_estacion a ON a.estacion_id = e.id
-- GROUP BY e.id, e.codigo, e.nombre
-- ORDER BY num_accesos DESC;

-- =====================================================
-- DIAGRAMA ERD (Mermaid)
-- =====================================================
-- 
-- ```mermaid
-- erDiagram
--     LINEAS_METRO ||--o{ ESTACIONES_METRO : "contiene"
--     ESTACIONES_METRO ||--o{ ACCESOS_ESTACION : "tiene"
-- 
--     LINEAS_METRO {
--         serial id PK
--         varchar codigo UK
--         varchar nombre
--         varchar color
--     }
-- 
--     ESTACIONES_METRO {
--         serial id PK
--         varchar codigo UK
--         integer linea_id FK
--         decimal latitud
--         decimal longitud
--         integer zona
--     }
-- 
--     ACCESOS_ESTACION {
--         serial id PK
--         integer estacion_id FK
--         integer stop_id UK
--         varchar nombre
--         varchar tipo
--     }
-- ```
