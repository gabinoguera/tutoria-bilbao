# Guion de Clase - Sesión 3 (SC6)
## Documentación y Análisis de Sistemas con Copilot (Enfoque Reverse Engineering)

**Fecha:** [Fecha de la sesión]
**Duración:** 90 minutos
**Perfil:** Desarrolladores Senior (Visual Studio 2022, C#, Oracle)
**Entorno:** GitHub Codespaces (Simulando entorno .NET/Oracle)

---

## 🎯 Objetivos de la Sesión
Aportar valor sobre lo ya construido, utilizando Copilot no solo para escribir código, sino para **entender, analizar y documentar** sistemas existentes (Reverse Engineering):
1. Aplicar **técnicas avanzadas de prompting** (Academy) para tareas de documentación.
2. Generar **diagramas y diccionarios de datos** a partir de esquemas SQL existentes.
3. Documentar lógica de negocio compleja en **C# y PL/SQL**.
4. Crear documentación de proyecto (**README, CHANGELOG**) para facilitar el mantenimiento.

---

## 📋 Estructura Temporal (90 min)

| Bloque | Tema | Duración | Actividad |
|--------|------|----------|-----------|
| 1 | **Prompting Avanzado para Docs** | 15 min | Conceptos Academy (CoT, APE) aplicados a documentación |
| 2 | **Análisis de Base de Datos** | 25 min | Diagramas Mermaid, Diccionario de Datos, Análisis de Tablas |
| 3 | **Documentación de Código** | 20 min | XML Comments, explicación de algoritmos (C# y PL/SQL) |
| 4 | **Documentación de Proyecto** | 20 min | README profesional y CHANGELOG automático |
| 5 | **Cierre y Conclusiones** | 10 min | Valor de la documentación viva |

---

## 📝 Desarrollo Detallado

### 1. Prompting Avanzado para Documentación (15 min)
Explicación breve de conceptos de la academia aplicados a **entender código**:
- **Chain of Thought (CoT):** "Analiza paso a paso este procedimiento almacenado antes de resumirlo."
- **Few-Shot Prompting:** "Aquí tienes un ejemplo de cómo documento mis APIs. Documenta esta nueva clase igual."
- **Role Prompting:** "Actúa como un Arquitecto de Software y genera un diagrama de secuencia de este flujo."

### 2. Ejercicio 1: Análisis de Base de Datos (25 min)
**Contexto:** Tenemos un esquema de base de datos (`metro_schema.sql`) y necesitamos entenderlo sin mirar el código línea por línea.

**Actividades:**
1. **Diagramas Automáticos:**
   - Prompt: *"Genera un diagrama Entity-Relationship en formato Mermaid de las tablas relacionadas con 'BILLETES' y 'VALIDACIONES' en el archivo `metro_schema.sql`."*
   - Renderizar el diagrama en el Markdown preview.
2. **Diccionario de Datos:**
   - Prompt: *"Crea una tabla Markdown que actúe como diccionario de datos para la tabla `TARIFAS`. Incluye columna, tipo, y una descripción funcional inferida del nombre."*
3. **Análisis de Integridad:**
   - Prompt: *"Analiza el esquema y dime qué tablas parecen no tener relaciones definidas (tablas huérfanas) o posibles riesgos de integridad referencial."*

### 3. Ejercicio 2: Documentación de Código (20 min)
**Contexto:** Tenemos lógica compleja en C# (`TarifasService.cs`) y Oracle (`PKG_VALIDACION.sql`).

**Actividades:**
1. **C# XML Documentation:**
   - Prompt: *"Genera comentarios XML para la clase `TarifasService`. Incluye ejemplos de uso en las etiquetas `<example>`."*
2. **Explicación de Lógica (PL/SQL):**
   - Prompt (CoT): *"Explica paso a paso la lógica de validación en `PKG_VALIDACION.sql`. Identifica las reglas de negocio críticas y lístalas en bullet points."*
3. **Generación de Guía de Desarrollador:**
   - Prompt: *"Basado en `TarifasService.cs`, genera una breve guía en Markdown titulada 'Cómo calcular tarifas' para un nuevo desarrollador."*

### 4. Ejercicio 3: Documentación de Proyecto (20 min)
**Contexto:** Entregar el proyecto de forma profesional.

**Actividades:**
1. **README.md:**
   - Prompt: *"Genera un README.md profesional para el proyecto 'Metro Bilbao Core'. Incluye secciones de: Requisitos, Configuración de DB (Oracle), y Ejemplos de uso de la API de Tarifas."*
2. **CHANGELOG:**
   - Prompt: *"Imagina que acabamos de refactorizar la validación de edad. Genera una entrada para el CHANGELOG.md bajo la versión 2.1.0."*

### 5. Cierre (10 min)
- **Recap:** Copilot ayuda a "leer" código, no solo a escribirlo.
- **Valor:** La documentación generada así se mantiene viva más fácilmente.
- **Q&A.**

### 3. Ejercicio 2: README Completo (20 min)
**Escenario:** Un nuevo desarrollador senior se une al equipo mañana. Necesita entender el sistema rápido.

**Pasos:**
1. Crear archivo `README.md` vacío en la raíz.
2. **Prompt a Copilot:**
   > "Genera un README.md profesional para el proyecto 'Metro Bilbao Validation System'.
   > Stack: .NET 8, Oracle 23c.
   > Incluye: Descripción, Arquitectura (Mermaid), Requisitos, Setup de BD, y Cómo correr tests."
3. Iterar para agregar sección específica de **Troubleshooting** (ej. "Error ORA-12154 común").

**Archivo de trabajo:** `03_ejercicio_readme.md`

### 4. Ejercicio 3: PRs y Commits (20 min)
**Escenario:** Vamos a subir un hotfix crítico de tarifas.

**Parte A: Commit Semántico**
1. Realizar un cambio pequeño en `TarifasController.cs`.
2. **Prompt:** "Genera un mensaje de commit semántico (Conventional Commits) para este cambio."
3. Resultado esperado: `fix(tarifas): corregir cálculo de descuento en fin de semana`

**Parte B: Pull Request**
1. Simular que estamos creando un PR.
2. **Prompt:** "Escribe una descripción para un PR que incluye cambios en `TarifasController.cs` y el SP `pkg_tarifas`. Explica el riesgo, cómo probarlo y checklist de despliegue."

**Archivo de trabajo:** `04_ejercicio_pr_commits.md`

### 5. Ejercicio 4: Documentación Técnica (15 min)
**Escenario:** Exponer nuestra API a otros equipos.

**C# XML Comments:**
1. Ir a `ValidationService.cs`.
2. Seleccionar método complejo `ValidarTransbordo()`.
3. **Prompt:** "Genera comentarios XML de documentación. Incluye etiquetas <summary>, <param>, <returns> y <example>."

**Oracle PL/SQL Docs:**
1. Ir a `database/packages/pkg_validacion.sql`.
2. **Prompt:** "Documenta este paquete usando formato Javadoc/PLDoc. Describe cada procedimiento y sus parámetros."

**Archivo de trabajo:** `05_ejercicio_docs_tecnica.md`

### 6. Cierre (5 min)
- Resumen de herramientas usadas.
- **Tarea:** Aplicar esto en SU proyecto actual (generar un README o CHANGELOG hoy mismo).
- Preview Sesión 4: Testing Avanzado.

---

## 🛠️ Recursos Necesarios (Codespaces)
- Repositorio con estructura `MetroBilbao_Project`.
- Extensión "C# Dev Kit" activa.
- Contenedor Oracle levantado (`docker ps` para verificar).
- Archivos de ejemplo en carpeta `ejemplos/`.
