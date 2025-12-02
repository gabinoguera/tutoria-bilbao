# Diccionario de Datos - Metro Bilbao

> Documentación generada automáticamente del esquema `metro_schema.sql`
> 
> **Sistema**: Metro Bilbao - Gestión de Validaciones y Tarifas
> **Compatibilidad**: PostgreSQL / Oracle (con ajustes menores)

---

## 📊 Diagrama de Relaciones

```mermaid
erDiagram
    LINEAS ||--o{ ESTACIONES : "contiene"
    USUARIOS ||--o{ BILLETES : "posee"
    USUARIOS ||--o{ RECARGAS : "realiza"
    BILLETES ||--o{ VALIDACIONES : "genera"
    BILLETES ||--o{ RECARGAS : "recibe"
    ESTACIONES ||--o{ VALIDACIONES : "registra"
    ESTACIONES ||--o{ RECARGAS : "ubicacion"

    LINEAS {
        serial id PK
        varchar codigo UK
        varchar color
        boolean activa
    }

    ESTACIONES {
        serial id PK
        integer linea_id FK
        integer zona
        decimal latitud
        decimal longitud
    }

    USUARIOS {
        serial id PK
        varchar email UK
        varchar tipo_usuario
        boolean activo
    }

    BILLETES {
        serial id PK
        integer usuario_id FK
        varchar tipo_billete
        decimal saldo
    }

    VALIDACIONES {
        serial id PK
        integer billete_id FK
        integer estacion_id FK
        timestamp fecha_validacion
        decimal tarifa_aplicada
    }

    RECARGAS {
        serial id PK
        integer billete_id FK
        integer estacion_id FK
        decimal monto
    }
```

---

## 📑 Índice de Tablas

| Tabla | Dominio | Descripción |
|-------|---------|-------------|
| [LINEAS](#tabla-lineas) | Infraestructura | Líneas del metro (L1, L2, etc.) |
| [ESTACIONES](#tabla-estaciones) | Infraestructura | Estaciones con ubicación y zona tarifaria |
| [USUARIOS](#tabla-usuarios) | Comercial | Usuarios registrados en el sistema |
| [BILLETES](#tabla-billetes) | Comercial | Títulos de transporte activos |
| [RECARGAS](#tabla-recargas) | Operacional | Historial de recargas de saldo |
| [VALIDACIONES](#tabla-validaciones) | Operacional | Registro de entradas/salidas |

---

## ⚠️ Reglas de Negocio Críticas

> **🎫 MENORES DE 6 AÑOS**: Viajan **GRATIS** en todo el sistema Metro Bilbao.
> - No requieren billete ni título de transporte
> - No pasan por torniquete (acceso por puerta lateral)
> - No generan registros en `USUARIOS`, `BILLETES` ni `VALIDACIONES`
> - Deben ir acompañados de un adulto con título válido

---
