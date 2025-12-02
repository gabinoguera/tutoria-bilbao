# Diagrama ERD - Metro Bilbao

> Diagrama Entity-Relationship generado desde `metro_schema.sql`

```mermaid
erDiagram
    USUARIOS ||--o{ BILLETES : "posee"
    USUARIOS ||--o{ VALIDACIONES : "realiza"
    BILLETES ||--o{ VALIDACIONES : "genera"
    LINEAS ||--o{ ESTACIONES : "contiene"
    ESTACIONES ||--o{ VALIDACIONES : "registra"

    USUARIOS {
        serial id PK "Identificador único"
        varchar nombre "NOT NULL"
        varchar apellidos
        varchar email UK "Único"
        varchar telefono
        varchar tipo_usuario "regular|estudiante|tercera_edad|empresa"
        timestamp fecha_registro "DEFAULT CURRENT_TIMESTAMP"
        boolean activo "DEFAULT true"
    }

    BILLETES {
        serial id PK "Identificador único"
        integer usuario_id FK "→ usuarios(id)"
        varchar tipo_billete "sencillo|bono_10|bono_30|mensual|anual"
        integer zona_validez "CHECK (1,2,3)"
        decimal saldo "DEFAULT 0.00"
        integer viajes_restantes "DEFAULT 0"
        timestamp fecha_compra "DEFAULT CURRENT_TIMESTAMP"
        date fecha_expiracion
        varchar numero_serie UK "NOT NULL, Único"
        boolean activo "DEFAULT true"
    }

    ESTACIONES {
        serial id PK "Identificador único"
        varchar nombre "NOT NULL"
        integer linea_id FK "→ lineas(id)"
        integer zona "CHECK (1,2,3) - Zona tarifaria"
        text direccion
        decimal latitud "GPS (10,7)"
        decimal longitud "GPS (10,7)"
        boolean activa "DEFAULT true"
        date fecha_apertura
        integer orden_en_linea
    }

    VALIDACIONES {
        serial id PK "Identificador único"
        integer billete_id FK "→ billetes(id)"
        integer usuario_id FK "→ usuarios(id)"
        integer estacion_id FK "→ estaciones(id)"
        timestamp fecha_validacion "DEFAULT CURRENT_TIMESTAMP"
        varchar tipo_validacion "entrada|salida"
        integer zona_estacion "NOT NULL"
        decimal tarifa_aplicada
        decimal descuento_aplicado "DEFAULT 0.00"
        boolean exitosa "DEFAULT true"
        text mensaje_error
    }

    LINEAS {
        serial id PK "Identificador único"
        varchar nombre "NOT NULL"
        varchar codigo UK "L1, L2, etc."
        varchar color
        boolean activa "DEFAULT true"
        date fecha_inauguracion
    }
```

---

## 📊 Resumen de Relaciones

| Relación | Cardinalidad | Descripción |
|----------|--------------|-------------|
| USUARIOS → BILLETES | 1:N | Un usuario puede tener múltiples títulos de transporte |
| USUARIOS → VALIDACIONES | 1:N | Un usuario genera múltiples validaciones (viajes) |
| BILLETES → VALIDACIONES | 1:N | Cada billete puede usarse en múltiples validaciones |
| LINEAS → ESTACIONES | 1:N | Una línea contiene múltiples estaciones |
| ESTACIONES → VALIDACIONES | 1:N | Cada estación registra múltiples validaciones |

---

## 🔑 Claves del Diagrama

### Claves Primarias (PK)
Todas las tablas usan `SERIAL` (auto-incremental) como PK

### Claves Foráneas (FK)
- `billetes.usuario_id` → `usuarios.id`
- `estaciones.linea_id` → `lineas.id`
- `validaciones.billete_id` → `billetes.id`
- `validaciones.usuario_id` → `usuarios.id`
- `validaciones.estacion_id` → `estaciones.id`

### Claves Únicas (UK)
- `usuarios.email`
- `billetes.numero_serie`
- `lineas.codigo`

---

## ⚠️ Regla de Negocio

> **MENORES DE 6 AÑOS**: Viajan gratis y no aparecen en este modelo de datos (no requieren billete ni validación).

---

## 👁️ Visualización

Para ver este diagrama:
1. Abre este archivo en VS Code
2. Instala la extensión **Markdown Preview Mermaid Support** (`bierner.markdown-mermaid`)
3. Pulsa `Cmd+Shift+V` (Mac) o `Ctrl+Shift+V` (Windows/Linux)
