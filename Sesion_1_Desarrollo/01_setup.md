# Herramientas Técnicas de GitHub Copilot para Desarrollo de Código

SETUP DEL PROYECTO

Objetivo del módulo
- Enseñar a documentar las instrucciones ("Instructions") básicas del proyecto para que Copilot y otros asistentes automáticos trabajen con un contexto técnico consistente.
- Proveer plantillas y buenas prácticas para commits, testing, logging y manejo de errores.

1) ¿Por qué documentar "Instructions"?
- Las "Instructions" son el contexto fijo que Copilot puede usar para alinearse con las reglas del proyecto: estilo, convenciones, limitaciones y comportamiento esperado.
- Mantenerlas claras y versionadas ayuda a reproducir resultados y facilita el trabajo en equipo.

¿Por qué .github?
1. GitHub lo reconoce automáticamente:
GitHub busca automáticamente archivos en .github para funcionalidades especiales
No necesitas configurar nada, simplemente funciona
2. Templates automáticos:
PULL_REQUEST_TEMPLATE.md → GitHub lo muestra automáticamente al crear PRs
ISSUE_TEMPLATE.md → Se usa al crear issues
CONTRIBUTING.md → Aparece cuando alguien quiere contribuir
3. Configuraciones del proyecto:
copilot-instructions.md → Instrucciones específicas para Copilot en este repo
workflows/ → GitHub Actions (CI/CD)
CODEOWNERS → Define quién revisa cambios en qué archivos
4. Organización y limpieza:
Mantiene la raíz del proyecto limpia
Separa archivos de "meta-configuración" del código real
Los desarrolladores saben dónde buscar templates y configuraciones

.github/
├── ISSUE_TEMPLATE.md          # Auto-carga al crear issues
├── PULL_REQUEST_TEMPLATE.md   # Auto-carga al crear PRs  
├── copilot-instructions.md    # Copilot lee esto automáticamente
├── prompts/                   # Prompts organizados para el proyecto
└── workflows/                 # GitHub Actions

Beneficios prácticos:
Para estudiantes: Saben dónde encontrar templates y ayuda
Para Copilot: Lee automáticamente las instrucciones del proyecto
Para colaboradores: Proceso estandarizado de contribución

2) Contenido mínimo recomendado para las "Instructions"
- Project overview (1-2 frases): propósito del repositorio.
- Tech stack: lenguajes, frameworks y versiones principales.
- Coding style: normas de estilo, linters y formateadores.
- Commit conventions: formato de mensajes (Conventional Commits) y ejemplos.
- Testing: framework (pytest, jest), cómo ejecutar tests y coverage.
- CI / CD: enlaces o comandos para pipelines principales.
- Error handling & retries: comportamiento esperado ante fallos de APIs.
- Logging & observability: niveles, formatos y métricas clave.
- Security & secrets: dónde y cómo NO incluir secretos, variables de entorno.

3) Plantilla recomendada de "Instructions" (copiable)

---
Project: <short project name>
Purpose: <one-line purpose>
Tech stack: <python 3.11, node 18, postgres 15, etc.>

Coding style:
- Formatter: <black/Prettier/eslint>
- Linter: <flake8/eslint>

Commits:
- Conventional Commits enforced. Examples:
  - feat(scope): short description
  - fix(scope): short description

Testing:
- Test framework: <pytest/jest>
- Run tests: `npm test` or `pytest`
- Coverage: prefer >80%

CI:
- Main pipeline: .github/workflows/ci.yml
- Commands run in CI: install, lint, test, build

Error handling:
- Retry logic for external APIs (exponential backoff, max 3 attempts)
- Fail fast on schema mismatch

Logging:
- Format: JSON logs with keys: timestamp, level, component, message
- Levels: DEBUG/INFO/WARN/ERROR

Secrets:
- Use environment variables or secret managers (do not commit .env)

---

4) Convenciones de commits (integrar extractos de `3.1 instructions.md`)
- Usar Conventional Commits en inglés: `<type>(<scope>): <description>`
- Tipos principales: `feat`, `fix`, `refactor`, `docs`, `test`, `perf`, `ci`, `build`, `chore`
- Scope opcional pero recomendado (ej: `auto_mapeo`, `prompt_manager`).
- Mantener la descripción en presente imperativo (ej: `add feature`).

Ejemplos específicos del proyecto:
- feat(auto_mapeo): add CloudPromptManager for GCS prompt storage
- fix(data_selector): improve row selection for sparse datasets
- refactor(schemas): separate personal and financial variable schemas

Estructura del mensaje de commit:
1. Título (máx 72 caracteres)
2. Cuerpo (opcional): QUÉ y POR QUÉ
3. Footer (opcional): issues, breaking changes

Anti-patrones a evitar: commits vagos (fix bug, update files, wip)

5) Testing y validación (resumen práctico)
- Frameworks: prefer pytest para Python, jest/mocha para JS.
- Comandos rápidos:
  - Python: `pytest -q`
  - Node: `npm test`
- Mocks para APIs externas y tests de integración separados.
- Métricas a reportar: tiempo de ejecución, coverage, número de casos.

6) Logging y observabilidad (qué documentar)
- Qué niveles usar y ejemplos mínimos de line log.
- Donde recoger métricas: Prometheus / logs estructurados / traces.

7) Manejo de errores (qué incluir en las Instructions)
- Estrategia de reintentos ante rate-limits y timeouts.
- Mensajes de error útiles para usuarios (en español cuando sea UX-facing).
- Politica para retries y backoff (ej. exponential backoff, jitter).

8) PR Request Template (opcional)
- Incluir checklist de convenciones, tests, EXPLAIN para SQL, riesgos y rollback
- Ejemplo en `.github/PULL_REQUEST_TEMPLATE.md` (ver más abajo)

8) Dónde ubicar las Instructions en el repo
- Archivo recomendado: `.copilot-instructions.md` o `INSTRUCTIONS.md` en la raíz.
- Mantenerlas cortas (1 pantalla) con enlaces a documentos detallados cuando sea necesario.

9) Ejemplo práctico (Instructions mínimo listo para copiar)

---


