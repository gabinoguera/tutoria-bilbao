# Ejercicio 1 - Crear Tests Simples con Copilot

## ⏱️ Duración: 25 minutos
## 🎯 Objetivo: Generar y ejecutar tests básicos con ayuda de Copilot

---

## Parte A: Test de una Función Simple (10 min)

### 📝 Paso 1: Crear la función

1. Crea un archivo: `tarifa.js`
2. Copia este código:

```javascript
function calcularTarifa(zona) {
  if (zona === 1) return 1.50;
  if (zona === 2) return 2.00;
  if (zona === 3) return 2.50;
  return 0;
}
```

### 📝 Paso 2: Pedirle tests a Copilot

3. **Abre Copilot Chat** (Ctrl+Alt+I o Cmd+Alt+I)
4. **Copia este prompt EXACTO:**

```
Crea tests simples para esta función.
Usa console.log para verificar que funciona.
Prueba estos casos:
- zona 1 debe dar 1.50
- zona 2 debe dar 2.00  
- zona 3 debe dar 2.50
- zona 99 debe dar 0

[Pega aquí la función calcularTarifa]
```

5. **Copilot te dará código de tests → Cópialo debajo de tu función**

### 📝 Paso 3: Ejecutar los tests

6. **En la terminal:**
```bash
node tarifa.js
```

7. **Deberías ver algo como:**
```
✅ Test zona 1: pasó
✅ Test zona 2: pasó
✅ Test zona 3: pasó
✅ Test zona inválida: pasó
```

### 🤔 Preguntas para discutir:
- ¿Los tests pasaron todos?
- ¿El código de tests es fácil de leer?
- ¿Qué otros casos probarías?

---

## Parte B: Test con Validación de Errores (15 min)

### 📝 Paso 1: Crear función con descuento

1. Crea un archivo: `descuento.js`
2. Copia este código:

```javascript
function aplicarDescuento(precio, porcentaje) {
  if (precio < 0) {
    throw new Error("El precio no puede ser negativo");
  }
  if (porcentaje < 0 || porcentaje > 100) {
    throw new Error("El porcentaje debe estar entre 0 y 100");
  }
  return precio * (1 - porcentaje / 100);
}
```

### 📝 Paso 2: Pedirle tests a Copilot

3. **Abre Copilot Chat**
4. **Copia este prompt:**

```
Crea tests para esta función que valida entradas.
Incluye:
- Casos normales que deberían funcionar
- Casos que deberían lanzar errores
- Usa try/catch para capturar errores

[Pega la función aplicarDescuento]
```

5. **Copilot generará tests → Cópialos en tu archivo**

### 📝 Paso 3: Ejecutar y analizar

6. **Ejecuta:**
```bash
node descuento.js
```

7. **Revisa los resultados**

### 🤔 Preguntas para discutir:
- ¿Copilot incluyó tests para los errores?
- ¿Los mensajes de error son claros?
- ¿Qué casos de borde (edge cases) agregarías?

---

## Parte C: Mejorar Tests Existentes (Opcional)

### 📝 Si te sobra tiempo:

1. Toma los tests que generó Copilot
2. Pregúntale: **"¿Qué otros casos debería probar?"**
3. Copilot sugerirá casos adicionales
4. Agrega los que tengan sentido

### Ejemplos de casos adicionales:
- Precio = 0
- Descuento = 0 (sin descuento)
- Descuento = 100 (gratis)
- Números decimales

---

## 🆘 Si Te Atascas

### Problema: Los tests no se ejecutan
**Solución:**
1. Verifica que guardaste el archivo
2. Ejecuta: `node nombre_archivo.js`
3. Si hay error de sintaxis, copia el error a Copilot

### Problema: No entiendes el código del test
**Solución:**
1. Selecciona el código del test
2. Click derecho → "Copilot: Explain This"
3. Lee la explicación

### Problema: Un test falla
**Solución:**
1. Lee el mensaje de error
2. Pregunta a Copilot: "¿Por qué falla este test?"
3. Revisa si la función o el test está mal

---

## 💡 TIPS para Escribir Buenos Tests

### ✅ Tests Buenos:
- Prueban UN caso específico
- Tienen nombres descriptivos
- Son independientes (no dependen de otros)
- Son rápidos de ejecutar

### ❌ Tests Malos:
- Prueban muchas cosas a la vez
- Tienen nombres vagos: "test1", "test2"
- Dependen del orden de ejecución
- Son lentos o complejos

---

## 🎯 Patrón para Prompts de Tests

### Template que funciona bien:

```
Crea tests para la función [NOMBRE].
Prueba estos casos:
1. [Caso normal con valores típicos]
2. [Caso con valor mínimo]
3. [Caso con valor máximo]
4. [Caso que debería fallar]

Usa console.log para mostrar resultados.
```

---

## ✅ Cierre del Ejercicio

### Lo que aprendimos:
- ✅ Copilot puede generar tests básicos rápidamente
- ✅ Los tests verifican que nuestro código funciona
- ✅ Es importante probar casos normales Y casos de error
- ✅ Los prompts específicos dan mejores tests

### Para practicar:
- Toma una función de tu trabajo
- Pídele a Copilot que genere tests
- Ejecútalos y revisa los resultados
- Agrega casos que Copilot no pensó

---

## 📚 Conceptos Clave

### Assert (Afirmar):
Verificar que algo es verdad.
```javascript
console.assert(resultado === esperado, "El resultado no es correcto");
```

### Try/Catch:
Capturar errores esperados.
```javascript
try {
  miFuncion(-1); // Debería fallar
} catch (error) {
  console.log("✅ Error capturado correctamente");
}
```

### Edge Cases (Casos límite):
Valores en los extremos: 0, -1, 100, null, undefined, "", etc.

---

## 🔜 Siguiente Ejercicio

Ahora que sabemos crear tests, vamos a aprender a **documentar código** con Copilot.
