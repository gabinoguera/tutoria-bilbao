# Índice Completo del Proyecto - Metro Bilbao

**Programa:** GitHub Copilot - Desarrollo con IA  
**Cliente:** Metro Bilbao  
**Duración:** 3 sesiones (90 min c/u)  
**Estado:** ✅ Estructura base completada

---

## 📁 Estructura de Archivos Creados

```
/Users/gabrielnoguera/Documents/BrainCode/BILBAO/

├── README.md ✅
│   └── Documento principal del programa
│       - Objetivos y estructura
│       - Requisitos técnicos
│       - Plan de adopción
│       - ROI esperado
│
├── INDICE.md ✅
│   └── Este archivo - Índice completo del proyecto
│
├── GUIA_RAPIDA_INSTRUCTOR.md ✅
│   └── Guía paso a paso para impartir SC2
│       - Setup pre-sesión
│       - Flujo minuto a minuto
│       - Troubleshooting
│       - Tips de facilitación
│
├── RESUMEN_ADAPTACION.md ✅
│   └── Análisis comparativo ULMA vs Metro Bilbao
│       - Qué reutilizamos (80%)
│       - Qué adaptamos (15%)
│       - Qué eliminamos (5%)
│
├── .gitignore ✅
│   └── Configuración de archivos a ignorar en Git
│
├── Sesion_SC2_Desarrollo/ ✅
│   ├── 00_guion_clase.md ✅
│   │   └── Plan completo de 90 minutos
│   │       - Objetivos y estructura
│   │       - Timing detallado
│   │       - Notas para instructor
│   │
│   ├── 01_introduccion_vibecoding.md ✅
│   │   └── Conceptos fundamentales
│   │       - Qué es vibecoding
│   │       - Ventajas y desventajas
│   │       - Mejores prácticas
│   │       - Ejercicio de calentamiento
│   │
│   ├── 02_ejercicio_generacion_codigo.md ✅
│   │   └── Generación de código multi-lenguaje
│   │       - Zero-shot vs Few-shot
│   │       - JavaScript: Función de tarifas
│   │       - PL/SQL: Stored procedure
│   │       - C#: API service
│   │       - Ejercicios prácticos
│   │
│   ├── 03_ejercicio_optimizacion_sql.md ✅ ⭐ PAIN POINT
│   │   └── Optimización de queries legacy
│   │       - Query lenta de validaciones
│   │       - EXPLAIN ANALYZE con Copilot
│   │       - Sugerencia de índices
│   │       - Query de agregación
│   │       - Top usuarios
│   │       - Análisis hora punta
│   │
│   ├── 04_ejercicio_debugging.md ✅
│   │   └── Detección y corrección de errores
│   │       - Query con múltiples errores
│   │       - Error de lógica de negocio
│   │       - Error de agregación
│   │       - SQL injection vulnerability
│   │
│   ├── 05_preview_testing.md ✅
│   │   └── Vista previa de SC6 y SC7
│   │       - Qué viene en siguientes sesiones
│   │       - Ejercicios adelanto
│   │       - Tarea opcional
│   │
│   └── casos_metro/ ✅
│       ├── metro_schema.sql ✅
│       │   └── Schema completo de Metro Bilbao
│       │       - 6 tablas principales
│       │       - Relaciones y constraints
│       │       - Índices básicos
│       │       - Comentarios de documentación
│       │
│       ├── seed_data.sql ✅
│       │   └── Datos de prueba realistas
│       │       - Líneas L1, L2, L3
│       │       - 30+ estaciones
│       │       - 10 usuarios de prueba
│       │       - 10 billetes activos
│       │       - 130+ validaciones
│       │       - Casos de error
│       │
│       ├── queries_optimizacion.sql [TODO]
│       │   └── Queries para ejercicio optimización
│       │
│       ├── query_con_errores.sql [TODO]
│       │   └── Query con errores intencionales
│       │
│       └── query_corregida.sql [TODO]
│           └── Versión corregida con explicaciones
│
├── Sesion_SC6_Testing_Documentacion_I/ ✅
│   ├── 00_guion_clase.md ✅
│   │   └── Plan completo de 90 minutos
│   │       - Objetivos y estructura
│   │       - Timing detallado
│   │       - Conexión con SC2
│   │
│   ├── 01_project_setup_instructions.md [TODO]
│   │   └── Configurar Instructions y Modes
│   │       - Project Rules para Metro
│   │       - Prompt Files reutilizables
│   │       - Modes: Documentation, Testing, Review
│   │
│   ├── 02_ejercicio_documentacion.md [TODO]
│   │   └── Documentar código legacy
│   │       - Stored procedure sin docs
│   │       - Generar Gherkin/BDD
│   │       - README técnico
│   │       - Diagramas Mermaid
│   │
│   ├── 03_ejercicio_vulnerabilidades.md [TODO]
│   │   └── Análisis de seguridad
│   │       - SQL Injection
│   │       - Credenciales hardcodeadas
│   │       - Validación de inputs
│   │       - Priorización de fixes
│   │
│   ├── 04_ejercicio_tests_unitarios.md [TODO]
│   │   └── Generación de tests
│   │       - Tests PL/SQL (utPLSQL)
│   │       - Tests C# (xUnit)
│   │       - Tests JavaScript (Jest)
│   │
│   ├── 05_preview_sc7.md [TODO]
│   │   └── Vista previa sesión final
│   │
│   └── casos_metro/ [TODO]
│       ├── sp_validar_billete.sql
│       ├── sp_validar_billete_documentado.sql
│       ├── codigo_vulnerable.sql
│       ├── codigo_seguro.sql
│       └── tests/
│           ├── test_validacion.spec.js
│           ├── ValidacionServiceTests.cs
│           └── test_sp_validar_billete.sql
│
├── Sesion_SC7_Testing_Documentacion_II/ ✅
│   ├── 00_guion_clase.md ✅
│   │   └── Plan completo de 90 minutos
│   │       - Objetivos y estructura
│   │       - Retrospectiva completa
│   │       - Plan de adopción
│   │
│   ├── 01_ejercicio_testing_frontend.md [TODO]
│   │   └── Tests JavaScript y E2E
│   │       - Jest para lógica JS
│   │       - Validación de formularios
│   │       - Preview Playwright
│   │
│   ├── 02_ejercicio_integracion_dotnet.md [TODO]
│   │   └── Tests de integración API
│   │       - TestServer setup
│   │       - Tests de endpoints
│   │       - Mock vs BD real
│   │
│   ├── 03_ejercicio_documentacion_proyecto.md [TODO]
│   │   └── Documentación completa
│   │       - README.md principal
│   │       - ARCHITECTURE.md
│   │       - API_DOCUMENTATION.md
│   │       - CHANGELOG.md
│   │       - CONTRIBUTING.md
│   │
│   ├── 04_retrospectiva_plan_adopcion.md [TODO]
│   │   └── Cierre del programa
│   │       - Mejores prácticas
│   │       - Checklist de adopción
│   │       - Roadmap 3 meses
│   │       - Q&A final
│   │
│   └── casos_metro/ [TODO]
│       ├── portal_usuario.html
│       ├── validacion.js
│       ├── ValidacionController.cs
│       ├── ValidacionService.cs
│       ├── tests/
│       │   ├── portal.test.js
│       │   ├── playwright.config.js
│       │   ├── IntegrationTests.cs
│       │   └── e2e.spec.js
│       └── docs/
│           ├── README.md
│           ├── ARCHITECTURE.md
│           ├── API_DOCUMENTATION.md
│           ├── CHANGELOG.md
│           └── CONTRIBUTING.md
│
├── _REFERENCIA_Clase1_ULMA/ 📚
│   └── Material de referencia de Clase 1 ULMA (conservar para consulta)
│       - Conceptos reutilizables
│       - Ejemplos de vibecoding
│       - Setup técnico
│
├── _REFERENCIA_Clase2_ULMA/ 📚
│   └── Material de referencia de Clase 2 ULMA (conservar para consulta)
│       - Guías de Copilot
│       - Metodología de documentación
│
└── _DOCUMENTOS_REFERENCIA/ 📚
    └── PDFs y documentos de referencia del cliente
        - Contenidos pensados SC2 y SC6.pdf
        - SC7 documento.docx
        - Presentación original
```

---

## 📊 Estado de Completitud Actual

### ✅ Estructura Principal Lista

**Archivos en raíz:**
- ✅ README.md - Documento principal completo
- ✅ INDICE.md - Este archivo (índice completo)
- ✅ GUIA_RAPIDA_INSTRUCTOR.md - Guía para impartir
- ✅ RESUMEN_ADAPTACION.md - Análisis de adaptación
- ✅ .gitignore - Configuración Git

**Sesiones:**
**Sesiones:**
- ✅ SC2: Guion + 5 ejercicios + Schema BD + Datos
- ✅ SC6: Guion base creado
- ✅ SC7: Guion base creado

**Material de referencia:**
- 📚 Carpetas de ULMA conservadas para consulta
- 📚 Documentos originales del cliente archivados
- ⚠️ Todo el código X++ y específico de ULMA eliminado

---

## 🗑️ Archivos Eliminados (Limpieza Completada)

### Eliminados de Clase 2 - ULMA:
- ❌ `Class_PWProdNotificarTerminadoEspeciales.xpo` (código X++)
- ❌ `PWProdNotificarTerminadoEspeciales.xpp` (código X++)
- ❌ `PWProdNotificarTerminadoEspeciales/` (carpeta completa de código X++)
- ❌ `PWProdNotificarTerminadoEspeciales_Gherkin.md` (específico de ULMA)
- ❌ `presentacion_clase2.md` (específico de ULMA)

### Organizados (no eliminados, solo archivados):
- 📁 Carpetas de Clase 1 y 2 renombradas con prefijo `_REFERENCIA_`
- 📁 PDFs y documentos movidos a `_DOCUMENTOS_REFERENCIA/`

**Razón de eliminación:** Código específico de X++ y Dynamics que no aplica a Metro Bilbao

---

## 📁 Estructura Final (Limpia)

```
BILBAO/
├── README.md                           ← Documento principal
├── INDICE.md                           ← Este archivo
├── GUIA_RAPIDA_INSTRUCTOR.md          ← Para el instructor
├── RESUMEN_ADAPTACION.md              ← Análisis comparativo
├── .gitignore                         ← Config Git
│
├── Sesion_SC2_Desarrollo/             ← Material para 04/11/2025
├── Sesion_SC6_Testing_Documentacion_I/ ← Material para 02/12/2025
├── Sesion_SC7_Testing_Documentacion_II/ ← Material para 09/12/2025
│
├── _REFERENCIA_Clase1_ULMA/           ← Solo consulta
├── _REFERENCIA_Clase2_ULMA/           ← Solo consulta
└── _DOCUMENTOS_REFERENCIA/            ← PDFs cliente
```

**Ventajas de esta estructura:**
- ✅ Fácil de navegar
- ✅ Separación clara entre material activo y referencia
- ✅ Sin archivos confusos de ULMA en la raíz
- ✅ Preparado para Git (con .gitignore)

---

## 📋 Tareas Pendientes (Opcionales)

### Prioridad Alta (Hacer antes de SC2)
- [ ] Crear `casos_metro/queries_optimizacion.sql` (3 ejemplos)
- [ ] Crear `casos_metro/query_con_errores.sql` (1 query con problemas)
- [ ] Crear `casos_metro/query_corregida.sql` (versión arreglada)
- [ ] Probar setup completo en ambiente limpio

**Estimación:** 1-2 horas

### Prioridad Media (Hacer antes de SC6)
- [ ] `01_project_setup_instructions.md`
- [ ] `02_ejercicio_documentacion.md`
- [ ] `03_ejercicio_vulnerabilidades.md`
- [ ] `04_ejercicio_tests_unitarios.md`
- [ ] `05_preview_sc7.md`
- [ ] Casos de ejemplo para SC6

**Estimación:** 2-3 horas

### Prioridad Baja (Hacer antes de SC7)
- [ ] `01_ejercicio_testing_frontend.md`
- [ ] `02_ejercicio_integracion_dotnet.md`
- [ ] `03_ejercicio_documentacion_proyecto.md`
- [ ] `04_retrospectiva_plan_adopcion.md`
- [ ] Casos de ejemplo para SC7

**Estimación:** 2-3 horas

**Nota:** Muchos de estos archivos pueden crearse DURANTE las sesiones usando Copilot en vivo como demostración.

---

## 🎯 Archivos Críticos para Cada Sesión

### Para impartir SC2 (04/11/2025) se necesita:

**Imprescindibles:**
- ✅ `00_guion_clase.md`
- ✅ `01_introduccion_vibecoding.md`
- ✅ `02_ejercicio_generacion_codigo.md`
- ✅ `03_ejercicio_optimizacion_sql.md` ⭐⭐⭐
- ✅ `metro_schema.sql`
- ✅ `seed_data.sql`
- ✅ Docker con PostgreSQL

**Opcionales:**
- `04_ejercicio_debugging.md` (puede improvisarse)
- Queries adicionales (pueden crearse en vivo)

### Para impartir SC6 (02/12/2025) se necesitará:

**Imprescindibles:**
- ✅ `00_guion_clase.md` (ya creado)
- Ejercicios 01-04 (por crear)
- Casos de ejemplo de código vulnerable
- BD con datos (ya existe de SC2)

**Tiempo de preparación:** 3-4 horas adicionales

### Para impartir SC7 (09/12/2025) se necesitará:

**Imprescindibles:**
- ✅ `00_guion_clase.md` (ya creado)
- Ejercicios 01-04 (por crear)
- Ejemplos de frontend y API .NET
- Templates de documentación

**Tiempo de preparación:** 3-4 horas adicionales

---

## 💾 Cambios Aplicados en Esta Limpieza

### Eliminaciones ❌
1. Todos los archivos .xpo y .xpp (código X++ de Dynamics)
2. Carpeta completa PWProdNotificarTerminadoEspeciales
3. Documentación específica de caso ULMA

### Reorganizaciones 📁
1. `Clase 1...` → `_REFERENCIA_Clase1_ULMA/`
2. `Clase 2...` → `_REFERENCIA_Clase2_ULMA/`
3. PDFs → `_DOCUMENTOS_REFERENCIA/`
4. `README_METRO_BILBAO.md` → `README.md`

### Añadidos ➕
1. `.gitignore` - Configuración Git
2. Estructura actualizada en este INDICE.md

---

## 🎯 Para Gabriel: Tu Repositorio Ahora Está

- ✅ **Limpio:** Sin archivos confusos de ULMA en carpetas activas
- ✅ **Organizado:** Material activo separado de referencia
- ✅ **Preparado:** Listo para impartir SC2 el 04/11/2025
- ✅ **Documentado:** README principal, guías e índice actualizados
- ✅ **Versionable:** Con .gitignore apropiado

### Siguiente Paso
1. Lee `GUIA_RAPIDA_INSTRUCTOR.md` antes de SC2
2. Prueba el setup 15 min antes de la sesión
3. Ten abierto `Sesion_SC2_Desarrollo/00_guion_clase.md` durante la clase

---

**Última actualización:** 31 de octubre de 2025 - Limpieza completada  
**Estado:** ✅ Repositorio limpio y listo para Metro Bilbao
