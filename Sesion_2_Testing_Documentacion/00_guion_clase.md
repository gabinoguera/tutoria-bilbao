# Guion de Clase - Sesión 2# Guía Sesión SC6: Testing y Documentación I



## Testing y Documentación con GitHub Copilot**Fecha:** Martes 02/12/2025  

**Horario:** 9:00 a 10:30h (90 minutos)  

**Fecha:** 02/12/2025  **Modalidad:** Online  

**Horario:** 9:00 - 10:30h (90 minutos)  **Cliente:** Metro Bilbao

**Modalidad:** Online

## Presentación

---Bienvenida y conexión con la sesión SC2. En esta sesión aprenderemos a usar Copilot para documentar código legacy, analizar vulnerabilidades y generar tests unitarios.



## 🎯 Objetivos de la Sesión## Objetivos de la Clase

- Configurar Project Rules e Instructions para contexto consistente

Al finalizar, los participantes sabrán:- Documentar código legacy sin documentación usando Copilot

1. ✅ Qué son los tests y por qué son importantes- Identificar vulnerabilidades de seguridad automáticamente

2. ✅ Cómo generar tests simples con Copilot- Generar tests unitarios en PL/SQL, C# y JavaScript

3. ✅ Cómo documentar funciones con JSDoc usando Copilot- Crear documentación técnica completa

4. ✅ Cómo crear READMEs completos con Copilot

## Recap de SC2 (5 min)

---- Vibecoding y prompts efectivos

- Generación de código multi-lenguaje

## 📋 Estructura Temporal (90 min)- Optimización de SQL (pain point principal)

- Debugging de queries

### 1. Intro + ¿Qué es Testing? (10 min)

- Recap breve Sesión 1 (2 min)**¿Qué faltó en SC2?** Documentar, asegurar y testear.

- Concepto de testing con analogías simples

- Por qué importa en Metro Bilbao (código legacy)---

- **Archivo:** `01_introduccion_testing.md`

## Estructura y Guion de la Clase

### 2. Ejercicio 1: Tests Simples (25 min)

- Crear función simple (tarifa)### 1. Project Rules & Instructions (15 min)

- Pedirle a Copilot que genere tests- Configurar Instructions globales en Copilot para contexto de Metro Bilbao

- Ejecutar tests con Node.js- Crear Prompt Files reutilizables

- Discutir resultados y casos adicionales- Establecer convenciones de código y documentación

- **Archivo:** `02_ejercicio_tests_simples.md`- Uso de Modes: Documentation, Testing, Review

- **Archivo:** `01_project_setup_instructions.md`

### 3. Ejercicio 2: Documentar Código (25 min)

- Tomar función sin documentar### 2. Ejercicio 1: Documentar Código Legacy (25 min) 

- Pedirle a Copilot documentación JSDoc- Presentar stored procedure PL/SQL sin documentación

- Documentar código legacy con nombres poco claros- Generar con Copilot:

- Comparar antes/después  - Documentación Gherkin/BDD

- **Archivo:** `03_ejercicio_documentar_codigo.md`  - README técnico del módulo

  - Comentarios inline

### 4. Ejercicio 3: Crear README (20 min)  - Diagrama de flujo Mermaid

- Generar README para script simple- **Archivo:** `02_ejercicio_documentacion.md`

- Pedirle mejoras a Copilot- **Scripts:** `casos_metro/sp_validar_billete.sql` (sin docs), `casos_metro/sp_validar_billete_documentado.sql`

- Discutir secciones importantes

- **Archivo:** `04_ejercicio_readme.md`### 3. Ejercicio 2: Análisis de Vulnerabilidades (20 min)

- Código con vulnerabilidades intencionales:

### 5. Cierre y Tarea (10 min)  - SQL Injection en queries dinámicos

- Recap de lo aprendido  - Falta de validación de inputs

- Tarea: Documentar una función de su trabajo  - Exposición de datos sensibles

- Preview Sesión 3: Testing frontend y documentación avanzada  - Credenciales hardcodeadas

- Q&A- Pedir a Copilot análisis completo de seguridad

- Priorizar y remediar vulnerabilidades top

---- **Archivo:** `03_ejercicio_vulnerabilidades.md`

- **Scripts:** `casos_metro/codigo_vulnerable.sql`, `casos_metro/codigo_seguro.sql`

## ⚙️ Materiales Necesarios

### 4. Ejercicio 3: Generar Tests Unitarios (20 min)

### Para Instructor:- Desde función documentada, generar suite de tests

- VS Code con GitHub Copilot activo- **PL/SQL:** Tests con utPLSQL framework

- Node.js instalado (para demostrar tests)- **C#:** Tests con xUnit

- Ejemplos preparados en archivos- **JavaScript:** Tests con Jest

- Setup de datos de prueba

### Para Participantes:- **Archivo:** `04_ejercicio_tests_unitarios.md`

- VS Code con GitHub Copilot- **Scripts:** `casos_metro/tests/`

- Node.js instalado

- Ganas de aprender 😊### 5. Vista Previa SC7 y Cierre (10 min)

- ¿Qué viene en SC7? Testing E2E, integración, documentación completa

---- Recapitulación de aprendizajes

- Preguntas y respuestas

## 🚨 Notas CRÍTICAS para el Instructor- **Archivo:** `05_preview_sc7.md`



### ⚠️ RECORDAR: Este Grupo Va Lento---

- **No asumir conocimientos previos** de testing

- **Explicar conceptos básicos:** "Un test verifica que tu código funciona"## Materiales y Prerequisitos

- **Mostrar CADA PASO** en tu pantalla

- **Pausar frecuentemente:** "¿Todos vamos aquí?"### Repositorio de la clase:

```

### Tips de Facilitación:Sesion_SC6_Testing_Documentacion_I/

1. **Testing puede ser intimidante** - Usa analogías simples (ej: verificar que 2+2=4)├── 00_guion_clase.md (este archivo)

2. **No usar frameworks complejos** - Solo JavaScript simple con console.log├── 01_project_setup_instructions.md

3. **Enfatizar valor práctico** - "Los tests te avisan si rompes algo"├── 02_ejercicio_documentacion.md

4. **Celebrar pequeños logros** - "¡Tu primer test pasó!"├── 03_ejercicio_vulnerabilidades.md

├── 04_ejercicio_tests_unitarios.md

### Prioridades Si Falta Tiempo:├── 05_preview_sc7.md

1. ✅ Ejercicio 1 (Tests) - IMPRESCINDIBLE└── casos_metro/

2. ✅ Ejercicio 2 (Documentar) - IMPORTANTE      ├── sp_validar_billete.sql

3. ⚠️ Ejercicio 3 (README) - Puede acortarse    ├── sp_validar_billete_documentado.sql

    ├── codigo_vulnerable.sql

### Si Van Bien de Tiempo (poco probable):    ├── codigo_seguro.sql

- Agregar más casos de prueba    ├── README_ejemplo.md

- Experimentar con tests de funciones propias    └── tests/

- Discutir casos reales de su trabajo        ├── test_validacion.spec.js

        ├── ValidacionServiceTests.cs

---        └── test_sp_validar_billete.sql

```

## 📚 Recursos Mínimos

### Requisitos técnicos:

### Lo que SÍ necesitamos:- **GitHub Copilot** activado en VS Code

- ✅ VS Code- Misma BD de SC2 (con datos ya cargados)

- ✅ GitHub Copilot- Node.js (opcional, para ejecutar tests JS)

- ✅ Node.js (para ejecutar tests)- .NET SDK (opcional, para ejecutar tests C#)



### Lo que NO necesitamos:---

- ❌ Frameworks de testing (Jest, Mocha, etc.)

- ❌ Base de datos## Notas para el Instructor

- ❌ Configuraciones complejas

### Filosofía de la Sesión

---- **No ejecutaremos los tests** (eso es SC7)

- **Foco en GENERACIÓN** de documentación y tests con Copilot

## 🆘 Troubleshooting Común- **Mostrar el proceso**, no el resultado perfecto



### Problema: "No sé qué es un test"### Preparación previa (5 min):

**Solución:** Usa analogía simple: "Es como verificar que una calculadora da 4 cuando sumas 2+2"1. Tener VS Code abierto con Copilot activo

2. BD PostgreSQL corriendo (desde SC2)

### Problema: Tests no se ejecutan3. Archivos de ejemplo listos en `casos_metro/`

**Solución:** 

1. Verificar Node.js: `node --version`### Tips de facilitación:

2. Verificar que el archivo se guardó- **Muestra el proceso iterativo**: Primera versión de Copilot → Refinar prompt → Mejor resultado

3. Ejecutar: `node nombre_archivo.js`- **Pide participación**: "¿Qué vulnerabilidad buscarían primero?"

- **Comparte pantalla completa**: Para que vean Copilot Chat en acción

### Problema: No entienden JSDoc- **Graba prompts efectivos**: Compártelos en el chat para que copien

**Solución:** "Es como ponerle una etiqueta a tu código explicando qué hace"

### Manejo del tiempo:

---- Ejercicio 1 (Documentación): 25 min - No recortar, es fundamental

- Ejercicio 2 (Vulnerabilidades): 20 min - Puede reducirse a 15 si es necesario

## 🎓 Conceptos Clave a Transmitir- Ejercicio 3 (Tests): 20 min - Core de la sesión, mantener tiempo



### Testing:---

- **Test = Verificación automática** de que algo funciona

- **Assert = Afirmar** que algo es verdad## Flujo de Ejemplo: Documentar Stored Procedure

- **Casos de prueba = Ejemplos** que deberían funcionar

### Paso 1: Código Legacy Sin Documentación

### Documentación:

- **JSDoc = Formato estándar** para documentar JavaScript```sql

- **README = Página de bienvenida** de tu proyectoCREATE OR REPLACE PROCEDURE sp_validar_billete(

- **Buena documentación = Menos preguntas** a futuro  p_billete_id INTEGER,

  p_zona_destino INTEGER,

---  p_tipo_validacion VARCHAR

) AS

## 🔗 Conexión con Sesión AnteriorBEGIN

  -- 50 líneas de código sin comentarios

**Sesión 1 vimos:**  -- Lógica compleja de validación

- Generar código básicoEND;

- Explicar código existente```

- SQL simple

### Paso 2: Prompt a Copilot

**Hoy agregamos:**

- Verificar que el código funciona (tests)```

- Explicar el código para otros (documentación)Contexto: Stored procedure de Metro Bilbao para validar billetes.

- Presentar proyectos (README)

Tarea: Genera documentación completa en español:

**Próxima sesión:**1. Descripción de alto nivel de qué hace

- Testing de frontend2. Documentación Gherkin con escenarios principales

- Documentación de arquitectura3. Explicación de parámetros y retornos

- Mejores prácticas completas4. Casos de uso reales

5. Diagrama de flujo en formato Mermaid

---

[Pegar código del procedure]

## 💡 Mensajes Clave para Cerrar```



1. **Tests = Seguridad:** Puedes cambiar código sin miedo### Paso 3: Copilot Genera

2. **Documentación = Claridad:** Tu yo del futuro te lo agradecerá

3. **Copilot acelera ambos:** No tienes que escribir todo desde cero- Documentación Gherkin estructurada

4. **Práctica constante:** Úsalo en tu trabajo diario- README técnico del módulo

- Comentarios descriptivos

---- Diagrama visual



## 📝 Tarea para Participantes### Paso 4: Iterar y Refinar



**Para la próxima sesión (09/12/2025):**Pedir mejoras específicas si es necesario.

1. Encuentra una función en tu código de trabajo

2. Pídele a Copilot que genere tests básicos---

3. Pídele que la documente con JSDoc

4. Trae dudas o casos interesantes para discutir## Ejemplo de Output: Documentación Gherkin



**Opcional:****Lo que Copilot generará:**

- Crea un README para algún script que uses

- Experimenta pidiendo diferentes estilos de documentación```gherkin

Característica: Validación de Billetes en Metro Bilbao

Como: Sistema de control de acceso
Quiero: Validar billetes antes de permitir entrada
Para: Asegurar que solo usuarios con billetes válidos accedan

Escenario: Validar billete con saldo suficiente en zona correcta
  Dado que existe un billete activo con saldo de 10€
  Y el billete es válido para zona 1
  Cuando el usuario valida en una estación de zona 1
  Entonces la validación es exitosa
  Y se descuenta la tarifa correspondiente

Escenario: Rechazar billete sin saldo
  Dado que existe un billete con saldo de 0€
  Cuando el usuario intenta validar
  Entonces la validación falla
  Y se muestra mensaje "Saldo insuficiente"

[... más escenarios]
```

---

## Ejemplo: Análisis de Vulnerabilidades

### Código Vulnerable

```csharp
public class ValidacionController {
    private string connectionString = "Server=prod;Password=admin123"; // ❌
    
    public IActionResult Buscar(string filtro) {
        var sql = $"SELECT * FROM validaciones WHERE {filtro}"; // ❌
        var results = _db.Query(sql);
        return Json(results); // ❌
    }
}
```

### Prompt a Copilot

```
Analiza este código C# en busca de vulnerabilidades de seguridad.
Identifica problemas de:
- SQL Injection
- Credenciales hardcodeadas
- Exposición de datos
- Falta de validación

Para cada vulnerabilidad:
1. Nivel de severidad (Crítico/Alto/Medio/Bajo)
2. Explicación del riesgo
3. Ejemplo de exploit
4. Corrección recomendada

[Pegar código]
```

### Copilot Identificará

1. **CRÍTICO: SQL Injection**
2. **CRÍTICO: Credenciales en código**
3. **ALTO: Exposición de datos sensibles**
4. **MEDIO: Falta de autenticación**

Y proporcionará código corregido.

---

## Diferencia con SC2

| Aspecto | SC2 (Pasado) | SC6 (Hoy) |
|---------|--------------|-----------|
| **Foco** | Generar y optimizar código | Documentar y asegurar código |
| **Input** | Requisitos de negocio | Código existente sin docs |
| **Output** | Código funcional | Docs + Tests + Análisis |
| **Herramientas** | Chat, Suggest | Chat + Instructions + Modes |
| **Pain Point** | SQL lento | Código sin documentar |

---

## Preparación Entre Sesiones

Si los participantes quieren practicar antes de SC7:

1. **Traer código legacy real** (anonimizado si es necesario)
2. **Documentar al menos un módulo** con Copilot
3. **Identificar vulnerabilidades** en código de producción
4. **Generar tests** para una función crítica

---

## Recursos Adicionales

### 📚 Frameworks de Testing
- **utPLSQL:** [utplsql.org](https://www.utplsql.org/)
- **xUnit:** [xunit.net](https://xunit.net/)
- **Jest:** [jestjs.io](https://jestjs.io/)

### 🔒 Seguridad
- **OWASP Top 10:** [owasp.org/Top10](https://owasp.org/www-project-top-ten/)
- **SQL Injection Prevention:** [cheatsheetseries.owasp.org](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)

### 📖 Documentación
- **Gherkin:** [cucumber.io/docs/gherkin](https://cucumber.io/docs/gherkin/)
- **Mermaid:** [mermaid.js.org](https://mermaid.js.org/)

---

## Siguiente Sesión: SC7

En SC7 ejecutaremos tests, integraremos todo y crearemos documentación completa del proyecto.

¡Nos vemos el 09/12/2025!
