-- Schema Metro Bilbao
-- Sistema de gestión de validaciones y tarifas
-- Compatible con PostgreSQL y Oracle (con ajustes menores)

-- Limpiar tablas existentes
DROP TABLE IF EXISTS validaciones CASCADE;
DROP TABLE IF EXISTS recargas CASCADE;
DROP TABLE IF EXISTS billetes CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS estaciones CASCADE;
DROP TABLE IF EXISTS lineas CASCADE;

-- Tabla de líneas del metro
CREATE TABLE lineas (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  codigo VARCHAR(10) UNIQUE NOT NULL,
  color VARCHAR(20),
  activa BOOLEAN DEFAULT true,
  fecha_inauguracion DATE
);

-- Tabla de estaciones
CREATE TABLE estaciones (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  linea_id INTEGER REFERENCES lineas(id),
  zona INTEGER NOT NULL CHECK (zona IN (1, 2, 3)),
  direccion TEXT,
  latitud DECIMAL(10, 7),
  longitud DECIMAL(10, 7),
  activa BOOLEAN DEFAULT true,
  fecha_apertura DATE,
  orden_en_linea INTEGER
);

-- Tabla de usuarios
CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellidos VARCHAR(150),
  email VARCHAR(150) UNIQUE,
  telefono VARCHAR(20),
  tipo_usuario VARCHAR(20) NOT NULL CHECK (tipo_usuario IN ('regular', 'estudiante', 'tercera_edad', 'empresa')),
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  activo BOOLEAN DEFAULT true
);

-- Tabla de billetes/bonos
CREATE TABLE billetes (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER REFERENCES usuarios(id),
  tipo_billete VARCHAR(30) NOT NULL CHECK (tipo_billete IN ('sencillo', 'bono_10', 'bono_30', 'mensual', 'anual')),
  zona_validez INTEGER NOT NULL CHECK (zona_validez IN (1, 2, 3)),
  saldo DECIMAL(10, 2) DEFAULT 0.00,
  viajes_restantes INTEGER DEFAULT 0,
  fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_expiracion DATE,
  numero_serie VARCHAR(50) UNIQUE NOT NULL,
  activo BOOLEAN DEFAULT true
);

-- Tabla de recargas
CREATE TABLE recargas (
  id SERIAL PRIMARY KEY,
  billete_id INTEGER REFERENCES billetes(id),
  usuario_id INTEGER REFERENCES usuarios(id),
  monto DECIMAL(10, 2) NOT NULL,
  viajes_agregados INTEGER DEFAULT 0,
  fecha_recarga TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  metodo_pago VARCHAR(30) CHECK (metodo_pago IN ('efectivo', 'tarjeta', 'app', 'transferencia')),
  estacion_id INTEGER REFERENCES estaciones(id)
);

-- Tabla de validaciones (transacciones de entrada/salida)
CREATE TABLE validaciones (
  id SERIAL PRIMARY KEY,
  billete_id INTEGER REFERENCES billetes(id),
  usuario_id INTEGER REFERENCES usuarios(id),
  estacion_id INTEGER REFERENCES estaciones(id),
  fecha_validacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  tipo_validacion VARCHAR(10) CHECK (tipo_validacion IN ('entrada', 'salida')),
  zona_estacion INTEGER NOT NULL,
  tarifa_aplicada DECIMAL(10, 2),
  descuento_aplicado DECIMAL(5, 2) DEFAULT 0.00,
  exitosa BOOLEAN DEFAULT true,
  mensaje_error TEXT
);

-- Índices básicos para mejorar consultas comunes
CREATE INDEX idx_validaciones_fecha ON validaciones(fecha_validacion);
CREATE INDEX idx_validaciones_billete ON validaciones(billete_id);
CREATE INDEX idx_validaciones_estacion ON validaciones(estacion_id);
CREATE INDEX idx_billetes_usuario ON billetes(usuario_id);
CREATE INDEX idx_estaciones_zona ON estaciones(zona);
CREATE INDEX idx_usuarios_tipo ON usuarios(tipo_usuario);

-- Comentarios de documentación
COMMENT ON TABLE lineas IS 'Líneas del metro de Bilbao (L1, L2, etc.)';
COMMENT ON TABLE estaciones IS 'Estaciones del metro con información de ubicación y zona tarifaria';
COMMENT ON TABLE usuarios IS 'Usuarios registrados en el sistema';
COMMENT ON TABLE billetes IS 'Billetes y bonos de transporte activos';
COMMENT ON TABLE validaciones IS 'Registro de validaciones (entradas/salidas) en estaciones';
COMMENT ON TABLE recargas IS 'Historial de recargas de saldo o viajes';

COMMENT ON COLUMN estaciones.zona IS 'Zona tarifaria: 1 (centro), 2 (periferia cercana), 3 (periferia lejana)';
COMMENT ON COLUMN usuarios.tipo_usuario IS 'Tipo de usuario para aplicar descuentos: regular, estudiante, tercera_edad, empresa';
COMMENT ON COLUMN billetes.tipo_billete IS 'Tipo de billete: sencillo, bono_10, bono_30, mensual, anual';
