# Módulo 5 — Evaluación y Testing (prompts y guía)

Objetivo
- Proveer prompts y un flujo reproducible para revisar, testear y auditar el código y consultas generadas con Copilot.
- Incluir una versión optimizada de tu "Prompt de revisión de vulnerabilidades" y variantes para diferentes profundidades.

1) Prompt base (mejorado) — revisión de vulnerabilidades y debilidades

Instrucciones para el alumno/instructor: pega este prompt en Copilot Chat junto con el fragmento de código o la consulta SQL que quieres auditar. Reemplaza `#nombre_modulo` por el nombre del módulo o archivo concreto.

Prompt (detallado):

"You are a senior security and architecture reviewer. Take the time to perform a thorough vulnerability and architecture review of the code/SQL provided for module `#nombre_modulo`. Analyze for logic flaws, input type and validation issues, parameter order problems, concurrency and race conditions, scalability bottlenecks, architectural anti-patterns, duplication/redundancy, SQL injection risks, permission/authorization issues, and maintainability concerns.

Please produce:
1) Short summary (2-4 lines) of the overall risk level and main findings.
2) A prioritized list of issues found. For each issue include:
   - Title (one line)
   - Severity (High/Medium/Low)
   - Explanation (why it's a problem)
   - Reproduction steps or example input that would trigger the issue (if applicable)
   - Suggested fix (concise change or pattern)
   - Tests or checks to validate the fix (one or two commands or assertions)
3) Quick wins (3 suggestions that are low effort / high impact)
4) Defensive checklist (short list of actions to harden the code)
5) If no issues found, reply exactly: "análisis de vulnerabilidades finalizada"

Context: [PASTE the relevant code or SQL here]."


2) Variantes útiles

- Prompt corto (rápida):
"Quickly review the pasted code/SQL for obvious vulnerabilities or architectural issues and return a 3-bullet summary (severity + one-line fix each). If none, reply: 'análisis de vulnerabilidades finalizada'"

- Prompt enfocado a SQL (EXPLAIN):
"Analyze the pasted SQL query and the provided EXPLAIN ANALYZE output. Identify the top 3 bottlenecks, suggest indexes or rewrite strategies, and provide the EXPLAIN commands the reviewer should run locally to verify improvements. If no major issues, reply: 'análisis de vulnerabilidades finalizada'"


3) Prompts para generar tests

- Prompt para tests unitarios (SQL):
"Generate 3 SQL unit tests (using pgTAP or simple asserts) that validate the correctness and edge cases of the following query: [PASTE QUERY]. Include setup statements to create minimal tables and seed data."

- Prompt para tests funcionales (integration):
"Generate a small integration test plan to validate that after applying the SQL changes, key reports keep consistent results. Include steps to seed data and compare results (before/after)."

4) Checklist de evaluación rápida (rubrica)

- Correctness: query returns expected results for representative inputs
- Performance: explain plan shows indexes used and acceptable cost
- Security: no string concatenation for SQL, parameters used or prepared statements
- Robustness: input validation and error handling
- Maintainability: clear naming, avoid duplicated logic, modularity

5) Cómo usar en clase

- Workflow recomendado:
  1. El alumno pega su consulta o fragmento en Copilot junto con el prompt detallado.
  2. Revisa la lista priorizada y aplica cambios conceptuales (índices, filtros, joins).
  3. Ejecuta EXPLAIN/EXPLAIN ANALYZE localmente y pega resultados para una segunda iteración.
  4. Pide a Copilot que genere tests que validen los cambios.

- Recomendación: guardar prompts efectivos en `INSTRUCTIONS.md` o en una carpeta `prompts/` para reutilización.

---

Fin del módulo 5
