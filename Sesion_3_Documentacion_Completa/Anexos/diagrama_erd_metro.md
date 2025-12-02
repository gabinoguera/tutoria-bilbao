# Diagrama Entity-Relationship - Sistema Metro Bilbao

Este diagrama muestra las relaciones entre las principales tablas del sistema de gestión del Metro de Bilbao.

---

## 🗺️ Diagrama ER Completo

```mermaid
erDiagram
    USUARIOS ||--o{ BILLETES : "posee"
    USUARIOS ||--o{ VALIDACIONES : "realiza"
    BILLETES ||--o{ VALIDACIONES : "se_usa_en"
    ESTACIONES ||--o{ VALIDACIONES : "registra"
    LINEAS ||--o{ ESTACIONES : "contiene"

    BILLETES {
        serial id PK
        integer usuario_id FK
        varchar tipo_billete
        integer zona_validez
        decimal saldo
        integer viajes_restantes
        timestamp fecha_compra
        date fecha_expiracion
        varchar numero_serie UK
        boolean activo
    }

    VALIDACIONES {
        serial id PK
        integer billete_id FK
        integer usuario_id FK
        integer estacion_id FK
        timestamp fecha_validacion
        varchar tipo_validacion
        integer zona_estacion
        decimal tarifa_aplicada
        decimal descuento_aplicado
        boolean exitosa
        text mensaje_error
    }

    ESTACIONES {
        serial id PK
        integer linea_id FK
        varchar nombre
        integer zona
        text direccion
        decimal latitud
        decimal longitud
        boolean activa
        date fecha_apertura
        integer orden_en_linea
    }

    USUARIOS {
        serial id PK
        varchar nombre
        varchar apellidos
        varchar email UK
        varchar telefono
        varchar tipo_usuario
        timestamp fecha_registro
        boolean activo
    }

    LINEAS {
        serial id PK
        varchar nombre
        varchar codigo UK
        varchar color
        boolean activa
        date fecha_inauguracion
    }
```

---

## 📊 Descripción de Relaciones

| Relación | Cardinalidad | Descripción |
|----------|--------------|-------------|
| **USUARIOS → BILLETES** | 1:N | Un usuario puede poseer múltiples billetes/bonos activos |
| **USUARIOS → VALIDACIONES** | 1:N | Un usuario puede realizar múltiples validaciones (entradas/salidas) |
| **BILLETES → VALIDACIONES** | 1:N | Un billete se utiliza en múltiples validaciones durante su vida útil |
| **ESTACIONES → VALIDACIONES** | 1:N | Cada estación registra múltiples validaciones diarias |
| **LINEAS → ESTACIONES** | 1:N | Una línea de metro contiene múltiples estaciones en su recorrido |

---

## 🔑 Leyenda

- **PK**: Primary Key (Clave Primaria)
- **FK**: Foreign Key (Clave Foránea)
- **UK**: Unique Key (Clave Única)
- **||--o{**: Relación Uno a Muchos (1:N)

---

## 📌 Notas Importantes

1. **VALIDACIONES** es la tabla de hechos central que registra cada transacción.
2. No existe una tabla `TARIFAS` independiente; los precios se calculan mediante el procedimiento `SP_CALCULAR_TARIFA` basándose en:
   - Zona de origen y destino
   - Tipo de usuario (regular, estudiante, tercera_edad)
3. El campo `tipo_validacion` en **VALIDACIONES** puede ser `'entrada'` o `'salida'`.
4. El sistema maneja 3 zonas tarifarias (1, 2, 3) que determinan el precio del viaje.

---

## 🚀 Visualización

Para visualizar este diagrama:
1. Abre este archivo en VS Code
2. Presiona `Ctrl+Shift+V` (Windows/Linux) o `Cmd+Shift+V` (Mac)
3. El diagrama se renderizará automáticamente en el preview de Markdown

Alternativamente, puedes usar:
- [Mermaid Live Editor](https://mermaid.live/)
- GitHub (renderiza Mermaid nativamente)
- Extensión de VS Code: "Markdown Preview Mermaid Support"
