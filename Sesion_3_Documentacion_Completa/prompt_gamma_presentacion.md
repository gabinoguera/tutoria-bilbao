# Documentación Inteligente de Proyectos con GitHub Copilot

## Diapositiva 1: Portada
**Título:** Documentación Inteligente de Proyectos con GitHub Copilot  
**Subtítulo:** Catálogo de Documentación Generada con IA  
**Caso de Uso:** Metro Bilbao - Sistema de Validación y Tarifas

---

## Diapositiva 2: El Problema de la Documentación
**Título:** ¿Por qué la documentación siempre queda pendiente?

**Problemas comunes:**
- ⏰ Falta de tiempo (prioridad baja vs. features)
- 🔄 Desactualización constante (código cambia, docs no)
- 📝 Esfuerzo manual tedioso (nadie quiere documentar)
- 🤷 Falta de estándares claros en el equipo

**Resultado:** Código sin contexto, onboarding lento, knowledge silos

**Solución:** Automatización inteligente con GitHub Copilot

---

## Diapositiva 3: Categorías de Documentación Generada
**Título:** 6 Tipos de Documentación que Copilot Domina

1. **📋 Documentación de Proyecto** (README, CHANGELOG)
2. **🧠 Guías para IA** (.github/copilot-instructions.md)
3. **🎯 Plantillas de Prompts** (.github/prompt-templates.md)
4. **💬 Comentarios de Código** (Docstrings, XML, JSDoc)
5. **🗄️ Diccionarios de Datos** (Esquemas SQL, ERD)
6. **📊 Diagramas Técnicos** (Mermaid: ERD, Flujo, Arquitectura)

**Valor:** Cubrir todas las necesidades de documentación técnica

---

## Diapositiva 4: Tipo 1 - Documentación de Proyecto
**Título:** README.md y CHANGELOG.md Profesionales

**README.md generado incluye:**
- 📖 Descripción del proyecto y contexto de negocio
- 🏗️ Arquitectura del sistema (con diagramas Mermaid)
- ⚙️ Requisitos e instrucciones de setup
- 🚀 Ejemplos de uso y casos comunes
- 🐛 Sección de troubleshooting

**CHANGELOG.md automático:**
- 📅 Historial de versiones estructurado
- 🏷️ Clasificación por tipo: features, fixes, breaking changes
- 🔗 Referencias a PRs y commits relacionados

**Prompt ejemplo:**  
> "Genera un README.md profesional para el proyecto Metro Bilbao Validation System. Stack: .NET 8, Oracle 23c. Incluye arquitectura en Mermaid y setup de BD."

---

## Diapositiva 5: Tipo 2 - Copilot Instructions
**Título:** .github/copilot-instructions.md - Guía para la IA

**Propósito:** Enseñar a Copilot el contexto del proyecto una sola vez

**Contenido típico:**
- 🎯 Dominio del negocio (ej: Metro Bilbao - sistema de tarifas)
- 🏛️ Arquitectura y convenciones (Clean Architecture, CQRS)
- 📝 Estándares de código (nomenclatura, idioma de comentarios)
- 🚫 Anti-patrones específicos del proyecto
- 🗄️ Stack tecnológico (C#, Oracle, Docker)

**Beneficio:** Copilot genera código más alineado sin repetir contexto en cada prompt

**Ejemplo real:**
```markdown
## Dominio: Metro Bilbao
Sistema de validación de billetes y cálculo de tarifas.
Tablas clave: BILLETES, VALIDACIONES, TARIFAS, ESTACIONES.
```

---

## Diapositiva 6: Tipo 3 - Prompt Templates
**Título:** .github/prompt-templates.md - Biblioteca de Prompts Reutilizables

**Propósito:** Estandarizar cómo el equipo pide ayuda a Copilot

**Categorías de templates incluidas:**
1. 🗺️ **Generación de diagramas** (ERD, secuencia, arquitectura)
2. 📊 **Análisis de datos** (CSV a SQL, normalización)
3. 📖 **Diccionarios de datos** (documentar tablas)
4. 🧠 **Chain of Thought** (análisis paso a paso de lógica compleja)
5. 📝 **Documentación de código** (XML, JSDoc, PLDoc)
6. 🚀 **Generación de README/CHANGELOG**

**Ejemplo template:**
```markdown
## Template: Análisis CoT de Procedimiento SQL
> "Analiza paso a paso el procedimiento [NOMBRE].
> 1. Identifica los parámetros de entrada y salida
> 2. Lista las operaciones principales
> 3. Detecta posibles anti-patterns (ej: COMMIT dentro de procedure)"
```

**Valor:** Consistencia en la documentación del equipo completo

---

## Diapositiva 7: Tipo 4 - Comentarios de Código (Docstrings)
**Título:** Documentación In-Code Automática

**Formatos soportados por lenguaje:**
- **C#:** XML Documentation (`<summary>`, `<param>`, `<returns>`, `<example>`)
- **Python:** Docstrings (Google, NumPy, Sphinx)
- **JavaScript/TypeScript:** JSDoc
- **PL/SQL:** PLDoc (formato Javadoc)
- **Java:** Javadoc estándar

**Beneficios:**
- ✅ IntelliSense mejorado en el IDE
- ✅ Generación automática de documentación HTML (Doxygen, Sphinx)
- ✅ Contratos de API claros

**Prompt ejemplo C#:**
> "Genera comentarios XML completos para el método CalcularPrecioViaje. Incluye ejemplo de uso en etiqueta `<example>`."

**Resultado:**
```csharp
/// <summary>
/// Calcula el precio final del viaje aplicando descuentos por perfil.
/// </summary>
/// <param name="perfilUsuario">Perfil: NORMAL, JOVEN, JUBILADO</param>
/// <returns>Precio en euros con 2 decimales</returns>
```

---

## Diapositiva 8: Tipo 5 y 6 - Diccionarios de Datos y Diagramas
**Título:** Visualización Automática de Estructuras

**Diccionarios de Datos (Tipo 5):**
- 📋 Tablas Markdown con: columna, tipo, descripción funcional
- 🔍 Generado desde schema SQL existente
- ✅ Perfecto para onboarding de nuevos devs

**Diagramas Mermaid (Tipo 6):**
- 🗺️ **ERD:** Relaciones entre tablas
- 🔄 **Diagramas de flujo:** Lógica de procedimientos
- 🏗️ **Arquitectura:** Capas del sistema
- 🌐 **Topología:** Mapas de red (caso Metro Bilbao)

**Prompt ejemplo ERD:**
> "Genera un diagrama Mermaid tipo ERD de las tablas BILLETES, VALIDACIONES, ESTACIONES y sus relaciones."

**Ventaja:** Renderizado nativo en GitHub, VS Code, Confluence

---

## Diapositiva 9: Caso Especial - Open Data a Documentación
**Título:** BONUS - Del CSV al Mapa Interactivo

**Escenario real:** CSV con 123 estaciones del Metro Bilbao (Open Data)

**Documentación generada en cascada:**
1. 📊 **Schema SQL normalizado** (3 tablas: LINEAS, ESTACIONES, ACCESOS)
2. 🗺️ **Diagrama Mermaid** de topología de red (L1 y L2)
3. 🌐 **Mapa interactivo Leaflet.js** con coordenadas GPS reales

**Prompt usado:**
> "Analiza estaciones.csv con Chain of Thought. Genera schema SQL normalizado, diagrama Mermaid de la red, y mapa HTML interactivo con Leaflet.js usando coordenadas GPS."

**Resultado:** De datos crudos a visualización profesional en minutos

**Impacto:** Ideal para demos, presentaciones a stakeholders, análisis exploratorio

---

## Diapositiva 10: Implementación Práctica
**Título:** Cómo Empezar Hoy Mismo

**Paso 1 - Setup inicial (15 min):**
- Crear `.github/copilot-instructions.md` con contexto del proyecto
- Crear `.github/prompt-templates.md` con 3-5 templates clave

**Paso 2 - Generar documentación base (30 min):**
- README.md del proyecto principal
- Diccionario de datos de tablas críticas
- Diagrama ERD de esquema principal

**Paso 3 - Adopción gradual:**
- Documentar funciones complejas con docstrings
- Actualizar CHANGELOG en cada release
- Iterar prompt templates según necesidades del equipo

**Métricas de éxito:**
- ⏱️ Tiempo de onboarding reducido 50%+
- 📈 Documentación actualizada (medible en commits)
- 🚀 Menos preguntas repetitivas en Slack/Teams

**Call to Action:** Aplica estos 6 tipos de documentación en tu proyecto actual esta semana
