# Guion de Clase - Sesión 3 (SC6)
## Documentación Inteligente de Cierre de Proyecto con GitHub Copilot

**Fecha:** [Fecha de la sesión]
**Duración:** 90 minutos
**Perfil:** Desarrolladores Senior (Visual Studio 2022, C#, Oracle)
**Entorno:** GitHub Codespaces (Simulando entorno .NET/Oracle)

---

## 🎯 Objetivos de la Sesión
Al finalizar, los participantes sabrán cómo usar Copilot para saldar la "deuda de documentación" al final de un proyecto:
1. Generar **CHANGELOGs** automáticos analizando el historial de cambios.
2. Crear **READMEs** profesionales para onboarding de nuevos desarrolladores.
3. Redactar descripciones de **Pull Requests** y mensajes de **Commit** semánticos.
4. Generar documentación técnica avanzada (**XML Comments**, **JSDoc**, **PL/SQL Docs**).

---

## 📋 Estructura Temporal (90 min)

| Bloque | Tema | Duración | Actividad |
|--------|------|----------|-----------|
| 1 | **Intro: El Arte de Cerrar Proyectos** | 10 min | Contexto y problema de la "deuda de documentación" |
| 2 | **CHANGELOG Automático** | 20 min | Generación desde historial git y código |
| 3 | **README Profesional** | 20 min | Estructura completa de proyecto Metro Bilbao |
| 4 | **PRs y Commits Semánticos** | 20 min | Buenas prácticas de versionado y revisión |
| 5 | **Docs Técnica Avanzada** | 15 min | C# XML Comments y Oracle Packages |
| 6 | **Cierre y Tarea** | 5 min | Recap y próximos pasos |

---

## 📝 Desarrollo Detallado

### 1. Introducción (10 min)
- **Pain Point:** "Terminamos el código, funciona, pero... ¿quién se acuerda de qué cambiamos hace 3 meses?"
- **Concepto:** Documentación de Cierre vs. Documentación de Desarrollo.
- **Demo rápida:** Mostrar un proyecto sin README vs. uno con README profesional.

### 2. Ejercicio 1: CHANGELOG Automático (20 min)
**Escenario:** Se entrega la versión 2.0 del módulo de validaciones. Necesitamos listar qué cambió.

**Pasos:**
1. Abrir el proyecto `Metro.Validation.Service`.
2. Mostrar historial de cambios (simulado o real).
3. **Prompt a Copilot:**
   > "Analiza los cambios en la clase `ValidationService.cs` y genera una entrada para CHANGELOG.md siguiendo el formato 'Keep a Changelog'. Clasifica en Added, Changed, Fixed."
4. Refinar el resultado para incluir detalles técnicos de Oracle (ej. "Se optimizó SP `sp_validar_billete`").

**Archivo de trabajo:** `02_ejercicio_changelog.md`

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
