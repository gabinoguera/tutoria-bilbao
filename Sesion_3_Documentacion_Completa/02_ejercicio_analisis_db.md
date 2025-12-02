# Ejercicio: Análisis y Documentación de Base de Datos (Reverse Engineering)

**Objetivo:** Usar Copilot para entender y documentar un esquema de base de datos existente sin tener que analizar el SQL línea por línea.

**Archivo de referencia:** `Sesion_1_Desarrollo/casos_metro/metro_schema.sql` (o el esquema que tengan disponible).

---

## Paso 1: Generación de Diagramas (Diagrams as Code)

Copilot puede generar código para herramientas de diagramado como Mermaid.js.

**Prompt Sugerido:**
> "Analiza el archivo `metro_schema.sql`. Genera un diagrama Entity-Relationship (ERD) usando sintaxis Mermaid.js. Incluye las tablas `BILLETES`, `VALIDACIONES`, `ESTACIONES` y `USUARIOS`. Muestra las claves primarias (PK) y foráneas (FK)."

**Nota:** Las tablas reales son `VALIDACIONES` (que registra los viajes) y no existe una tabla `TARIFAS` independiente (las tarifas se calculan dinámicamente).

**Acción:**
1. Copia el código generado.
2. Pégalo en un archivo Markdown dentro de un bloque `mermaid`.
3. Instala la extensión **Markdown Preview Mermaid Support** (`bierner.markdown-mermaid`) desde el Marketplace de VS Code.
4. Visualiza el resultado en el preview de VS Code/Codespaces (Ctrl+Shift+V o Cmd+Shift+V).

---

## Paso 2: Diccionario de Datos Automático

Generar documentación legible para negocio o analistas funcionales.

**Prompt Sugerido:**
> "Actúa como un Analista Funcional. Basado en `metro_schema.sql`, genera una tabla Markdown que sirva como Diccionario de Datos para la tabla `VALIDACIONES`.
> Las columnas deben ser:
> - Nombre del Campo
> - Tipo de Dato
> - Descripción Funcional (infiere el propósito basado en el nombre)
> - Es Obligatorio (Nullable)"

---

## Paso 3: Análisis de Integridad y Calidad

Usar Copilot como un auditor de calidad de datos.

**Prompt Sugerido:**
> "Analiza el script SQL completo.
> 1. Identifica tablas que no parecen tener relaciones (Foreign Keys) con otras tablas (Tablas aisladas).
> 2. Sugiere índices que podrían faltar basándote en columnas que parecen ser usadas para búsquedas (como `FECHA` o `CODIGO`)."

---

## Paso 4: Documentación de Procedimientos Almacenados

Si hay lógica en PL/SQL (ej. `PKG_VALIDACION.sql`).

**Prompt Sugerido (Chain of Thought):**
> "Analiza el procedimiento `VALIDAR_SALDO` en `PKG_VALIDACION.sql`.
> Piensa paso a paso:
> 1. ¿Qué parámetros recibe?
> 2. ¿Qué tablas consulta?
> 3. ¿Qué excepciones maneja?
>
> Finalmente, genera un resumen en lenguaje natural de qué hace este procedimiento para incluirlo en la documentación técnica."
