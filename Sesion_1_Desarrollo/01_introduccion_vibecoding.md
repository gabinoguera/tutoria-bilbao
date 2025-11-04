# Introducción al Vibecoding y GitHub Copilot

## ¿Qué es Vibecoding?

**Vibecoding** es un enfoque de desarrollo donde confías en la IA (como GitHub Copilot) para generar código basándose en tu intención expresada en lenguaje natural, comentarios o contexto del proyecto, sin escribir todo el código manualmente línea por línea.

### Analogía
Es como tener un par programming partner que:
- Entiende lo que quieres hacer
- Propone implementaciones
- Te ayuda a iterar rápidamente

### Recurso clave
📖 [Trucos esenciales para un vibecoding efectivo](https://ghendigital.com/inteligencia-artificial/trucos-escenciales-para-un-vibecodign-efectivo/)

---

## Ventajas del Vibecoding

### ✅ Para Metro Bilbao específicamente:

1. **Acelera trabajo con código legacy PL/SQL**
   - Entender código sin documentación
   - Modernizar queries antiguas
   - Identificar mejoras de rendimiento

2. **Reduce curva de aprendizaje**
   - No necesitas ser experto en todos los lenguajes
   - Copilot adapta patrones a tu stack (PL/SQL, C#, JS)

3. **Mejora consistencia**
   - Patrones de código estandarizados
   - Convenciones de nomenclatura
   - Manejo de errores uniforme

4. **Documentación automática**
   - Genera comentarios descriptivos
   - Crea documentación técnica
   - Explica lógica compleja

5. **Prototipado rápido**
   - Ideas a código en minutos
   - Validar enfoques diferentes
   - Iterar sobre soluciones

---

## Desventajas y Riesgos

### ⚠️ Limitaciones importantes:

1. **No reemplaza el pensamiento crítico**
   - Debes validar el código generado
   - Entender la lógica antes de usarla
   - Verificar edge cases

2. **Puede generar código incorrecto**
   - Sintaxis válida ≠ lógica correcta
   - Puede inventar APIs que no existen
   - Puede tener vulnerabilidades de seguridad

3. **Dependencia del contexto**
   - Resultados varían según el prompt
   - Necesita contexto claro del proyecto
   - Puede malinterpretar intenciones vagas

4. **Riesgo de código "mágico"**
   - Difícil de mantener si no lo entiendes
   - Problemas al debuggear
   - Deuda técnica oculta

5. **Sobreconfianza**
   - Tentación de aceptar sin revisar
   - Saltar pruebas y validaciones
   - No aprender los fundamentos

---

## Mejores Prácticas para Vibecoding Efectivo

### 1. Contexto es Rey 👑

**Mal prompt:**
```
crea una función para calcular tarifas
```

**Buen prompt:**
```javascript
// Contexto: Sistema de Metro Bilbao
// Zonas tarifarias: 1, 2, 3
// Precio base: zona 1 = 1.50€, zona 2 = 2.00€, zona 3 = 2.50€
// Descuento estudiantes: 30%
// Descuento tercera edad: 50%

// Crea una función que calcule la tarifa de un viaje
// Parámetros: zonaOrigen, zonaDestino, tipoUsuario
// Retorna: precio final en euros
function calcularTarifa(zonaOrigen, zonaDestino, tipoUsuario) {
  // [Copilot completará aquí]
}
```

### 2. Sé Específico con el Output

**Especifica:**
- Lenguaje y versión
- Formato de retorno
- Manejo de errores esperado
- Nombres de variables/funciones

**Ejemplo:**
```
En PL/SQL (Oracle 19c), crea un stored procedure llamado 
SP_CALCULAR_TARIFA que reciba zona_origen NUMBER, zona_destino NUMBER,
tipo_usuario VARCHAR2 y retorne el precio DECIMAL(10,2).
Incluye manejo de excepciones para zonas inválidas.
```

### 3. Divide y Vencerás

En lugar de pedir un sistema completo, divide en pasos:

```
Paso 1: Crea la función de cálculo base
Paso 2: Añade validaciones de entrada
Paso 3: Implementa lógica de descuentos
Paso 4: Añade manejo de excepciones
Paso 5: Genera tests unitarios
```

### 4. Itera y Refina

No esperes perfección en el primer intento:

1. **Genera** código inicial
2. **Revisa** y detecta problemas
3. **Pide mejoras** específicas: "Añade validación de nulls"
4. **Repite** hasta obtener calidad deseada

### 5. Valida Siempre

**Checklist de validación:**
- [ ] ¿El código compila/ejecuta?
- [ ] ¿Cubre los casos de uso principales?
- [ ] ¿Maneja edge cases y errores?
- [ ] ¿Tiene vulnerabilidades obvias?
- [ ] ¿Es mantenible y legible?
- [ ] ¿Tiene tests?

---

## Flujo de Trabajo Recomendado

```
1. PLANIFICA
   ↓ Define qué necesitas claramente
   
2. PROMPT
   ↓ Formula un prompt específico con contexto
   
3. GENERA
   ↓ Deja que Copilot proponga solución
   
4. REVISA
   ↓ Lee y entiende el código generado
   
5. PRUEBA
   ↓ Ejecuta y valida funcionalidad
   
6. ITERA
   ↓ Refina con prompts adicionales
   
7. DOCUMENTA
   ↓ Pide a Copilot que documente
```

---

## Casos de Uso en Metro Bilbao

### 🎯 Caso 1: Entender código legacy
```
Pega 200 líneas de PL/SQL antiguo y pide:
"Explica qué hace este código en lenguaje simple y 
crea un diagrama de flujo en formato Mermaid"
```

### 🎯 Caso 2: Optimizar queries lentas
```
Pega query lenta y pide:
"Analiza el plan de ejecución e identifica cuellos de botella.
Sugiere índices y reescribe la query optimizada"
```

### 🎯 Caso 3: Migrar código
```
"Convierte este stored procedure de PL/SQL a un método C#
que use Dapper para llamar al procedure. Incluye manejo
de excepciones y logging"
```

### 🎯 Caso 4: Generar tests
```
"Para esta función de cálculo de tarifas, genera tests
unitarios en xUnit que cubran:
- Casos normales
- Edge cases (zonas inválidas, nulls)
- Descuentos correctos"
```

---

## Antipatrones a Evitar

### ❌ Copy-Paste Ciego
No copies código sin entenderlo. Si no entiendes algo, pide a Copilot que explique.

### ❌ Prompts Vagos
"Haz un sistema de Metro" → Demasiado amplio, resultado impredecible

### ❌ Ignorar Warnings
Si Copilot genera código con warnings, no los ignores. Pide que corrija.

### ❌ No Testear
"Se ve bien" ≠ "Funciona correctamente". Siempre prueba.

### ❌ Aceptar la Primera Solución
Pide alternativas: "Dame 3 formas diferentes de resolver esto"

---

## Ejercicio de Calentamiento

**Prueba este prompt en Copilot Chat:**

```
Contexto: Soy desarrollador de Metro Bilbao trabajando con código legacy.

Tengo esta función en JavaScript que calcula descuentos:

function calcDesc(t,p) {
  if(t=="E") return p*0.7;
  if(t=="T") return p*0.5;
  return p;
}

Tareas:
1. Explica qué hace esta función
2. Sugiere nombres más descriptivos
3. Reescríbela con mejores prácticas
4. Añade validaciones
5. Genera 3 tests unitarios
```

**Observa cómo Copilot:**
- Entiende el contexto
- Mejora la legibilidad
- Añade robustez
- Genera tests relevantes

---

## Recursos Adicionales

- 📖 [Claude Code Prompting Guide](https://docs.anthropic.com/claude/docs/code-prompting)
- 📖 [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- 📖 [Effective Prompting for Code](https://github.blog/2023-06-20-how-to-write-better-prompts-for-github-copilot/)

---

## Siguiente Paso

Ahora que entiendes vibecoding, vamos a aplicarlo en ejercicios prácticos de generación, optimización y debugging de código real de Metro Bilbao.

👉 **Siguiente:** `02_ejercicio_generacion_codigo.md`
