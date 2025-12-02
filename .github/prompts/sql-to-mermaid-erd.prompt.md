# SQL to Mermaid ERD Diagram Generator

> **Uso**: Genera diagramas Entity-Relationship en formato Mermaid a partir de esquemas SQL.
> **Técnica**: APE (Automatic Prompt Engineering) + Few-Shot
> **Basado en**: [Claude 4 Best Practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-4-best-practices)

---

## Prompt Template

```
<task_context>
Necesito generar documentación visual de bases de datos de forma consistente para 
el equipo de desarrollo. Los diagramas ERD en Mermaid nos permiten visualizar 
relaciones sin herramientas externas y se integran directamente en Markdown.
</task_context>

<instructions>
Analiza el archivo SQL proporcionado y genera un diagrama Entity-Relationship 
usando sintaxis Mermaid (erDiagram). 

El diagrama DEBE incluir:
1. Todas las tablas con sus columnas
2. Tipo de dato de cada columna (VARCHAR, NUMBER, DATE, etc.)
3. Indicadores de clave primaria (PK) y foránea (FK)
4. Cardinalidad de relaciones usando notación Mermaid:
   - ||--o{ = uno a muchos
   - ||--|| = uno a uno
   - }o--o{ = muchos a muchos
5. Etiquetas descriptivas en las relaciones (ej: "contiene", "pertenece_a")
</instructions>

<output_format>
erDiagram
    TABLA1 ||--o{ TABLA2 : "etiqueta_relacion"
    
    TABLA1 {
        tipo columna PK "descripción opcional"
        tipo columna FK
        tipo columna
    }
</output_format>

<example>
Para una tabla USUARIOS con FK a DEPARTAMENTOS:

erDiagram
    DEPARTAMENTOS ||--o{ USUARIOS : "emplea"
    
    DEPARTAMENTOS {
        int id PK "Identificador único"
        varchar nombre "Nombre del departamento"
    }
    
    USUARIOS {
        int id PK
        varchar email UK "Email único"
        int departamento_id FK
        timestamp fecha_registro
    }
</example>

<sql_input>
[PEGAR AQUÍ EL CONTENIDO DEL ARCHIVO SQL O USAR @workspace PARA REFERENCIAR]
</sql_input>
```

---

## Versión Compacta (para Copilot Chat)

```
Genera un diagrama erDiagram de Mermaid del archivo [ARCHIVO.sql].
Incluye: todas las tablas, tipos de dato, PK/FK marcadas, y cardinalidad 
de relaciones (||--o{, ||--||). Etiqueta cada relación con un verbo 
descriptivo. Usa el formato:

TABLA {
    tipo columna PK/FK "descripción"
}
```

---

## Ejemplo de Uso con Metro Bilbao

**Input**: `@workspace /casos_metro/metro_schema.sql`

**Prompt**:
```
Genera un diagrama erDiagram de Mermaid del archivo metro_schema.sql.
Incluye: todas las tablas, tipos de dato, PK/FK marcadas, y cardinalidad.
Enfócate en las tablas VALIDACIONES, BILLETES, USUARIOS y ESTACIONES.
```

---

## Principios de Claude 4 Aplicados

| Principio | Aplicación |
|-----------|------------|
| **Be explicit** | Instrucciones numeradas con requisitos específicos |
| **Add context** | `<task_context>` explica el propósito |
| **Be vigilant with examples** | Ejemplo concreto del formato esperado |
| **Use XML tags** | Estructura clara con tags semánticos |
| **Tell what to do** | Lenguaje positivo: "DEBE incluir" |

---

## Variables para Personalizar

- `[ARCHIVO.sql]` → Nombre del archivo SQL a analizar
- `[TABLAS_ESPECÍFICAS]` → Lista de tablas si no quieres todas
- `[DESCRIPCIÓN_CONTEXTO]` → Dominio del negocio (ej: "sistema de metro")
