# Ejercicio 2 - Documentar Código con Copilot

## ⏱️ Duración: 25 minutos
## 🎯 Objetivo: Usar Copilot para crear documentación clara de código

---

## ¿Por Qué Documentar?

### 🤔 Problemas sin documentación:
- No sabes qué hace una función sin leer todo el código
- Otros desarrolladores no saben cómo usarla
- Tú mismo olvidas qué hace después de 6 meses

### ✅ Beneficios de documentar:
- Entiendes el código más rápido
- Otros pueden usar tu código sin ayuda
- Reduces preguntas y confusión

---

## Parte A: Documentar una Función Simple (10 min)

### 📝 Paso 1: Código sin documentar

1. Crea un archivo: `validacion.js`
2. Copia este código:

```javascript
function validarBillete(billete) {
  if (!billete) return false;
  if (!billete.id) return false;
  if (!billete.tipo) return false;
  if (billete.saldo < 0) return false;
  if (billete.caducado) return false;
  return true;
}
```

### 📝 Paso 2: Pedirle documentación a Copilot

3. **Selecciona toda la función**
4. **Abre Copilot Chat**
5. **Copia este prompt:**

```
Documenta esta función usando JSDoc.
Explica qué hace, qué parámetros recibe, qué retorna, y da un ejemplo de uso.
```

6. **Copilot generará algo como:**

```javascript
/**
 * Valida que un billete tenga todos los campos requeridos y esté activo
 * 
 * @param {Object} billete - El objeto billete a validar
 * @param {number} billete.id - ID único del billete
 * @param {string} billete.tipo - Tipo de billete (normal, estudiante, etc)
 * @param {number} billete.saldo - Saldo restante en euros
 * @param {boolean} billete.caducado - Si el billete está caducado
 * 
 * @returns {boolean} true si el billete es válido, false en caso contrario
 * 
 * @example
 * const billete = { id: 123, tipo: 'normal', saldo: 5.50, caducado: false };
 * validarBillete(billete); // returns true
 */
function validarBillete(billete) {
  // ... código
}
```

### 📝 Paso 3: Revisar y ajustar

7. **Lee la documentación generada**
8. **Pregúntate:**
   - ¿Está claro qué hace la función?
   - ¿El ejemplo ayuda a entender cómo usarla?
   - ¿Falta algo importante?

### 🤔 Preguntas para discutir:
- ¿La documentación es clara?
- ¿El formato JSDoc te parece útil?
- ¿Cambiarías algo?

---

## Parte B: Documentar Código Legacy Complejo (15 min)

### 📝 Paso 1: Código legacy sin documentar

1. Crea un archivo: `calculo_tarifa.js`
2. Copia este código (simulando código legacy):

```javascript
function ct(zo, zd, tu) {
  const t = {1: 1.5, 2: 2.0, 3: 2.5};
  let p = t[Math.max(zo, zd)];
  if (tu === 'e') p *= 0.7;
  else if (tu === 'te') p *= 0.5;
  return Number(p.toFixed(2));
}
```

### 📝 Paso 2: Pedirle a Copilot que explique Y documente

3. **Selecciona la función**
4. **Click derecho → "Copilot: Explain This"**
5. **Lee la explicación**
6. **Luego en Copilot Chat, pide:**

```
Esta función tiene nombres poco claros.
Por favor:
1. Explica qué hace cada parte
2. Sugiere nombres mejores para variables
3. Agrega documentación completa
4. Reescribe la función con nombres claros
```

7. **Copilot debería generar algo como:**

```javascript
/**
 * Calcula la tarifa de viaje en Metro Bilbao según zonas y tipo de usuario
 * 
 * @param {number} zonaOrigen - Zona de origen (1-3)
 * @param {number} zonaDestino - Zona de destino (1-3)
 * @param {string} tipoUsuario - Tipo: 'e' (estudiante), 'te' (tercera edad), 'r' (regular)
 * 
 * @returns {number} Tarifa en euros con descuento aplicado
 * 
 * @example
 * calcularTarifaMetro(1, 3, 'e'); // returns 1.75 (estudiante zona 3 con 30% descuento)
 */
function calcularTarifaMetro(zonaOrigen, zonaDestino, tipoUsuario) {
  const tarifasPorZona = {
    1: 1.50,
    2: 2.00,
    3: 2.50
  };
  
  // Usamos la tarifa de la zona más alta
  const zonaMaxima = Math.max(zonaOrigen, zonaDestino);
  let precio = tarifasPorZona[zonaMaxima];
  
  // Aplicar descuentos según tipo de usuario
  if (tipoUsuario === 'e') {
    precio *= 0.70; // 30% descuento estudiantes
  } else if (tipoUsuario === 'te') {
    precio *= 0.50; // 50% descuento tercera edad
  }
  
  return Number(precio.toFixed(2));
}
```

### 🤔 Preguntas para discutir:
- ¿La versión documentada es más clara?
- ¿Los nombres de variables ayudan?
- ¿Cuánto tiempo te habría tomado hacer esto manualmente?

---

## Parte C: Agregar Comentarios Inline (Opcional)

### 📝 Si te sobra tiempo:

1. Toma código con lógica compleja
2. **Pídele a Copilot:**

```
Agrega comentarios inline explicando cada paso de esta lógica.
Los comentarios deben ser concisos y claros.
```

3. **Ejemplo de resultado:**

```javascript
function procesarValidacion(validacion) {
  // Verificar que la validación no sea nula
  if (!validacion) return null;
  
  // Buscar la estación donde ocurrió
  const estacion = buscarEstacion(validacion.estacionId);
  
  // Calcular tarifa según zonas
  const tarifa = calcularTarifa(estacion.zona, validacion.tipo);
  
  // Aplicar descuentos si aplican
  const tarifaFinal = aplicarDescuentos(tarifa, validacion.usuario);
  
  // Registrar en el sistema
  return registrarValidacion(validacion, tarifaFinal);
}
```

---

## 🆘 Si Te Atascas

### Problema: La documentación es muy técnica
**Solución:**
Pregunta a Copilot: "Explica esta documentación en términos más simples"

### Problema: Falta información importante
**Solución:**
Pide: "Agrega ejemplos de casos de error a la documentación"

### Problema: No sabes qué formato usar
**Solución:**
- JavaScript: JSDoc (`/** */`)
- Python: Docstrings (`""" """`)
- C#: XML Comments (`/// <summary>`)

---

## 💡 TIPS para Buena Documentación

### ✅ Documentación Buena:
- Explica el **QUÉ** y el **POR QUÉ**, no el **CÓMO**
- Incluye ejemplos prácticos
- Menciona casos especiales o limitaciones
- Usa lenguaje claro (no jerga innecesaria)

### ❌ Documentación Mala:
```javascript
// Esta función suma dos números
function sumar(a, b) {
  return a + b; // Retorna la suma
}
```
☝️ **Obvio y redundante**

### ✅ Mejor:
```javascript
/**
 * Suma dos valores numéricos con validación de tipos
 * 
 * @throws {TypeError} Si algún parámetro no es un número
 */
function sumarConValidacion(a, b) {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new TypeError('Ambos parámetros deben ser números');
  }
  return a + b;
}
```

---

## 🎯 Patrón para Prompts de Documentación

### Template efectivo:

```
Documenta esta función [NOMBRE].
Incluye:
- Descripción clara de qué hace
- Todos los parámetros con tipos y significado
- Qué retorna
- Ejemplo de uso
- Posibles errores o excepciones
```

---

## 📝 Tipos de Documentación

### 1. Inline Comments (Comentarios en línea)
Para explicar **por qué** se hace algo complejo:
```javascript
// Usamos zona máxima porque el precio se basa en el destino más lejano
const zonaMax = Math.max(origen, destino);
```

### 2. Function Documentation (JSDoc, etc.)
Para explicar **qué hace** la función y cómo usarla:
```javascript
/**
 * @param {number} zona - Zona tarifaria (1-3)
 * @returns {number} Precio en euros
 */
```

### 3. README Files
Para explicar el proyecto completo (siguiente ejercicio)

---

## ✅ Cierre del Ejercicio

### Lo que aprendimos:
- ✅ Copilot puede generar documentación estructurada
- ✅ JSDoc es un estándar para JavaScript
- ✅ Buenos nombres + documentación = código mantenible
- ✅ Documentar código legacy lo hace más entendible

### Para practicar:
- Encuentra función sin documentar en tu código
- Pídele a Copilot que la documente
- Revisa y ajusta según necesites
- Agrega ejemplos de uso

---

## 🔜 Siguiente Ejercicio

Ahora vamos a escalar: crear un **README completo** para un proyecto usando Copilot.
