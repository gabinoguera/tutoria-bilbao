# Conceptos de Prompting Avanzado para Documentación

En esta sección aplicaremos los conceptos teóricos de la academia a casos de uso reales de documentación y análisis de código.

## 1. Chain of Thought (CoT)
**Concepto:** Pedir al modelo que "piense en voz alta" o desglose su razonamiento paso a paso.
**Aplicación en Docs:** Ideal para entender algoritmos complejos o procedimientos almacenados largos antes de resumirlos.

**Ejemplo:**

> "Analiza paso a paso el procedimiento `SP_CALCULAR_TARIFA`. Primero identifica las variables de entrada, luego explica la lógica de los condicionales, y finalmente resume qué hace el procedimiento en un párrafo."

> "diagrama de flujo que represente la lógica del procedimiento `SP_CALCULAR_TARIFA`, detallando cada paso del proceso."

## 2. Few-Shot Prompting
**Concepto:** Darle al modelo ejemplos (shots) de lo que quieres para guiar su salida.
**Aplicación en Docs:** Mantener consistencia en el estilo de documentación (ej. formato de comentarios SQL, estructura de diagramas Mermaid).

**Ejemplo:**
> "Quiero documentar las tablas del esquema siguiendo este formato:
>
> ```markdown
> ### Tabla: `USUARIOS`
> **Propósito**: Almacena información de los usuarios del sistema Metro.
>
> **Columnas**:
> - `ID_USUARIO` (NUMBER, PK): Identificador único del usuario.
> - `NOMBRE` (VARCHAR2(100)): Nombre completo del usuario.
> - `FECHA_REGISTRO` (DATE): Fecha de alta en el sistema.
>
> **Relaciones**:
> - FK a `TARJETAS` (1:N) - Un usuario puede tener múltiples tarjetas.
>
> **Reglas de Negocio**:
> - Los usuarios menores de 6 años no requieren tarjeta para viajar.
> ```
>
> Ahora genera la documentación para la tabla `VALIDACIONES` del archivo `metro_schema.sql` siguiendo exactamente ese patrón."

## 3. Role Prompting
**Concepto:** Asignar un rol específico a la IA (ej. "Eres un experto en seguridad").
**Aplicación en Docs:** Obtener diferentes perspectivas de análisis sobre el mismo código.

**Ejemplo:**
> "Actúa como un Arquitecto de Datos Senior. Analiza el archivo `metro_schema.sql` y genera una descripción de alto nivel de la arquitectura de datos, destacando las tablas principales y sus relaciones."

## 4. Automatic Prompt Engineering (APE)
**Concepto:** Dejar que la IA genere sus propios prompts o mejore los tuyos.
**Aplicación en Docs:** Cuando no sabes cómo pedir la documentación perfecta.

**Ejemplo:**
> "Escribe un prompt optimizado para pedirle a Copilot que genere un diagrama Mermaid detallado a partir de un esquema SQL, asegurando que incluya tipos de datos y claves foráneas."

>Guardarlo como prompt template para futuros usos.

---

## 🔄 Análisis de Procedimientos (Chain of Thought)

```
Analiza paso a paso el procedimiento [NOMBRE_PROCEDIMIENTO]. 
1. Primero identifica las variables de entrada y salida.
2. Luego explica la lógica de los condicionales.
3. Finalmente resume qué hace el procedimiento en un párrafo.
4. Genera un diagrama de flujo en formato Mermaid que represente la lógica.
```

## 6. Knowledge Based Reasoning
**Concepto:** Usar conocimiento externo o contexto específico del dominio.
**Aplicación en Docs:** Enriquecer la documentación técnica con reglas de negocio.

**Ejemplo:**
> "Sabiendo que en el Metro de Bilbao los menores de 6 años viajan gratis (Regla de Negocio), revisa la documentación generada para `ValidarEdad` y asegúrate de que esta excepción esté claramente mencionada."
