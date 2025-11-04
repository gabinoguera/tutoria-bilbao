## Herramientas útiles (breve)


- Copilot Chat (Agente / Ask / Edit): diálogo interactivo para pedir, refactorizar o explicar código.

	Ejemplos (Ask / Edit):

	- Ask: "Explícame en 2 líneas qué hace esta función y su complejidad": pega la función y pregunta.
	- Edit: "Refactoriza esta función para que sea más legible y añada validación de entrada": selecciona la función y pide el cambio.

	Ejemplo de función para refactorizar:

	/**
	 * Parses a date string in the format "YYYY-MM-DD" and returns a JavaScript Date object.
	 * Time complexity: O(1), as it performs a fixed number of operations regardless of input.
	 */
	```javascript
	function parseDate(str) {
	  var parts = str.split("-");
	  return new Date(parts[0], parts[1] - 1, parts[2]);
	}
	```
------------------------------------------------------------------------------------------------

- Copilot Suggestions (inline): completado automático y sugerencias de código mientras tecleas.

	Ejemplos:

	- Escribe "function parseDate(" y acepta la sugerencia para obtener la implementación.
	- Deja un comentario `// TODO: mejorar rendimiento` y espera la sugerencia inline de Copilot.

function parseDate(str) {
  var parts = str.split("-");
  return new Date(parts[0], parts[1] - 1, parts[2]);
}

------------------------------------------------------------------------------------------------

- Problemas (Problems): lista de errores y advertencias mostrados por linters/compilador.

	Ejemplos:

	- Guarda un archivo con errores de lint y abre Problems; pide a Copilot "¿Cómo corrijo este warning?" pegando la traza.

------------------------------------------------------------------------------------------------


- Extensiones (Extensions view): instalar y configurar extensiones (Copilot, linters, etc.).

	Ejemplos:

	- Busca e instala "ESLint" desde Extensions para linting JavaScript.
	- Instala "GitHub Copilot" y sigue el asistente de configuración.

------------------------------------------------------------------------------------------------

- Búsqueda (Search): buscar texto, símbolos y patrones en todo el proyecto.

	Ejemplos:

	- Buscar `class User` para encontrar todas sus definiciones y usos.
	- Buscar `SELECT .* FROM` para localizar consultas SQL en el repo.

------------------------------------------------------------------------------------------------

- Paleta de comandos (Command Palette / Run Commands): ejecutar comandos de VS Code y extensiones rápidamente.

	Ejemplos:

	- Abre la paleta (Cmd+Shift+P) y ejecuta "Tasks: Run Task" para lanzar tests.
	- Ejecuta "Developer: Reload Window" para recargar el entorno tras instalar extensiones.

- Tareas (Run Tasks): ejecutar tareas definidas en `tasks.json` (builds, linters, scripts).
- Terminal integrado (Run in Terminal): correr comandos de shell y scripts desde el editor.
- Git / GitHub (integración): control de versiones, diffs, commits y PRs desde el editor.
- Buscador de repositorios GitHub: localizar ejemplos y snippets en repositorios públicos.

	Ejemplos:

	- Task: "npm: test" para ejecutar la suite de tests.
	- Task: "lint" para ejecutar ESLint antes de un commit.

- Terminal integrado (Run in Terminal): correr comandos de shell y scripts desde el editor.

	Ejemplos:

	- Ejecuta `npm test` desde el terminal integrado para correr tests rápidos.
	- Corre `psql -f scripts/setup.sql` para cargar datos de ejemplo (ajustar según proyecto).

- Git / GitHub (integración): control de versiones, diffs, commits y PRs desde el editor.
	Ejemplos (Git):

	- Crea una rama `feature/copilot-demo`, haz cambios y abre un commit; pide a Copilot "Escribe un mensaje de commit claro de 1 línea".
	- Desde la vista Source Control, haz un diff y usa Copilot Chat para explicar el cambio: "Resume estos cambios en una frase".

- Buscador de repositorios GitHub: localizar ejemplos y snippets en repositorios públicos.

	Ejemplos:

	- Busca en GitHub repos con `nodejs express starter` para ejemplos rápidos.
	- Copia un snippet útil y pégalo en el editor para pedir a Copilot que lo adapte a tu proyecto.

- Open Simple Browser: previsualizar páginas o documentación local sin salir del editor.
- Notebooks / Jupyter: editar y ejecutar celdas interactivas (útil para demos y análisis).
- Extensión Python: soporte para entornos, linting, debugging y testing en Python.
- Test runner (Test Failure): ejecutar tests y ver fallos con trazas integradas.
- Usages / Find References: encontrar definiciones y usos de símbolos en el código.
- Todos (Todo tool): gestionar listas de tareas y ejercicios dentro del workspace.

	Ejemplos:

	- Abre la documentación local `docs/index.html` con Open Simple Browser para mostrarla en clase.
	- Usa Open Simple Browser para revisar una API interna sin salir del editor.

- Notebooks / Jupyter: editar y ejecutar celdas interactivas (útil para demos y análisis).

	Ejemplos:

	- Ejecuta una celda que genere una tabla resumen y muéstrala en clase.
	- Inserta un gráfico simple con matplotlib/plotly en una celda y ejecútalo.

- Extensión Python: soporte para entornos, linting, debugging y testing en Python.

	Ejemplos:

	- Selecciona un intérprete Python y ejecuta el archivo con un breakpoint.
	- Ejecuta `pytest` desde el panel de tests y revisa la traza en caso de fallo.

- Test runner (Test Failure): ejecutar tests y ver fallos con trazas integradas.

	Ejemplos:

	- Ejecuta un test específico desde la paleta y, si falla, pega el error en Copilot Chat: "Explica por qué falla este test".
	- Usa cobertura (Run With Coverage) para mostrar líneas no cubiertas cuando esté disponible.

- Usages / Find References: encontrar definiciones y usos de símbolos en el código.

	Ejemplos:

	- Right-click en una función -> "Find References" para listar dónde se usa.
	- Usa la lista de usos para preguntar a Copilot "¿Qué efectos colaterales pueden ocurrir si cambio esta función?".

- Todos (Todo tool): gestionar listas de tareas y ejercicios dentro del workspace.

	Ejemplos:

	- Crea un todo para "Preparar ejercicio 1" y asígnalo a la sesión.
	- Marca un todo como completado en clase para seguir el progreso.

### Las más útiles para la clase

- Copilot Chat & Copilot Suggestions — para generar, explicar y refactorizar código en ejemplos en vivo.

- Búsqueda + Usages — para entender rápidamente dónde se usa una función o tabla en el proyecto.

- Paleta de comandos + Terminal integrado — para ejecutar scripts, builds y tests sin cambiar de contexto.

- Problemas + Test runner — para localizar errores y validar soluciones durante los ejercicios.

- Git / GitHub — para enseñar flujo de trabajo real: commits, ramas y PRs con Copilot asistiendo los mensajes o los cambios.

Cómo usarlas en los ejercicios:

- Usa "Ask" para preguntas puntuales (explicaciones, alternativas).

- Usa "Edit" para solicitar cambios concretos en el código (refactorizaciones, seguridad, performance).

- Combina Search + Copilot para localizar una pieza de código y pedir mejoras puntuales.

- Ejecuta tests desde la paleta de comandos o tasks y usa Problems/Test runner para depurar fallos en clase.