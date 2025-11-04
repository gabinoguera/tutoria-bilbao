# Introducción al Testing con GitHub Copilot

## ⏱️ Duración: 10 minutos
## 🎯 Objetivo: Entender qué es un test y por qué importa

---

## ¿Qué es un Test?

### Definición Simple:
**Un test es código que verifica que otro código funciona correctamente.**

### Analogía:
Imagina que tienes una calculadora:
- Tu código: `function sumar(a, b) { return a + b; }`
- Tu test: "Si le paso 2 y 3, ¿me da 5?"

---

## ¿Por Qué Hacer Tests?

### ✅ Beneficios:
1. **Confianza:** Sabes que tu código funciona
2. **Seguridad:** Si cambias algo, el test te avisa si lo rompiste
3. **Documentación:** Los tests muestran cómo usar tu código
4. **Menos errores:** Detectas problemas antes de producción

### 🏢 En Metro Bilbao:
- Código legacy sin tests → miedo a cambiar algo
- Con tests → puedes refactorizar con confianza
- Especialmente importante en cálculos de tarifas y validaciones

---

## Tipos de Tests (Simplificado)

### 1. Test Unitario
**Qué es:** Prueba una función individual

**Ejemplo:**
```javascript
// Código
function calcularDescuento(precio, porcentaje) {
  return precio * (1 - porcentaje / 100);
}

// Test
console.log(calcularDescuento(100, 10) === 90); // true = test pasó
```

### 2. Test de Integración
**Qué es:** Prueba que varias partes funcionan juntas

**Ejemplo:** Verificar que una API se conecta a la base de datos correctamente

### 3. Test Manual
**Qué es:** Lo que hacemos normalmente - probar a mano

**Ejemplo:** Abrir la app y hacer click en botones

---

## Estructura Básica de un Test

### Patrón AAA (Arrange-Act-Assert):

```javascript
// 1. ARRANGE (Preparar)
const precio = 100;
const descuento = 10;

// 2. ACT (Actuar)
const resultado = calcularDescuento(precio, descuento);

// 3. ASSERT (Verificar)
if (resultado === 90) {
  console.log("✅ Test pasó");
} else {
  console.log("❌ Test falló");
}
```

---

## GitHub Copilot y Testing

### 🤖 Lo que Copilot puede hacer:
- ✅ Generar tests básicos para tus funciones
- ✅ Sugerir casos de prueba que no pensaste
- ✅ Crear estructura de tests
- ✅ Explicar tests existentes

### 💡 Prompts Efectivos:
```
❌ Malo: "crea tests"
✅ Bueno: "Crea tests para la función calcularDescuento. Prueba caso normal y caso con descuento 0"
```

---

## Herramientas de Testing

### Para Hoy:
**Usaremos código JavaScript simple sin frameworks**

```javascript
// Test manual simple
function test(nombre, funcion) {
  try {
    funcion();
    console.log("✅", nombre, "pasó");
  } catch (error) {
    console.log("❌", nombre, "falló:", error.message);
  }
}
```

### Para Después (opcional):
- **JavaScript:** Jest, Mocha
- **C#:** xUnit, NUnit
- **SQL:** utPLSQL

**NOTA:** Hoy nos enfocamos en el concepto, no en herramientas complejas.

---

## Cuándo NO Hacer Tests

### ⚠️ No vale la pena para:
- Scripts de un solo uso
- Prototipos rápidos
- Código que va a cambiar completamente

### ✅ SÍ vale la pena para:
- Código de producción
- Lógica de negocio crítica (tarifas, validaciones)
- Código que otras personas van a usar

---

## Mentalidad de Testing

### 🧠 Piensa como un Tester:
1. **¿Qué debería pasar?** → Caso normal
2. **¿Qué NO debería pasar?** → Casos de error
3. **¿Qué casos raros existen?** → Edge cases

### Ejemplo: Función de división
```javascript
function dividir(a, b) {
  return a / b;
}

// Casos a probar:
// ✅ Caso normal: dividir(10, 2) = 5
// ❌ Caso error: dividir(10, 0) = ???
// 🤔 Caso raro: dividir(0, 5) = 0
```

---

## 🎯 Para Esta Sesión

### Vamos a aprender:
1. Cómo pedirle a Copilot que genere tests simples
2. Cómo ejecutar esos tests
3. Cómo interpretar resultados

### NO vamos a:
- Usar frameworks complejos
- Hacer tests de integración
- Configurar pipelines de CI/CD

**Foco:** Entender el concepto y ver cómo Copilot ayuda.

---

## 💬 Preguntas de Reflexión

Antes de empezar los ejercicios:
1. ¿Alguna vez has encontrado un bug en producción que un test podría haber detectado?
2. ¿Qué parte de tu código te da más miedo cambiar? (Probablemente necesita tests)
3. ¿Cuánto tiempo pasas probando manualmente después de cada cambio?

---

## ✅ Listo para Empezar

Ahora que entendemos qué son los tests y por qué importan, vamos a:
1. **Ejercicio 1:** Crear tests simples con Copilot
2. **Ejercicio 2:** Documentar código existente
3. **Ejercicio 3:** Crear README básico

**¡Empecemos!**
