# Introducción al Testing Frontend

## ⏱️ Duración: 10 minutos
## 🎯 Objetivo: Entender cómo testear interfaces web

---

## ¿Qué es Testing Frontend?

### 📖 Definición Simple:
**Testear que lo que el usuario VE y HACE funciona correctamente.**

### Ejemplos en Metro Bilbao:
- ✅ Formulario de recarga: ¿Se valida el monto mínimo?
- ✅ Botón de validar billete: ¿Responde correctamente?
- ✅ Mensaje de error: ¿Se muestra cuando falla?

---

## Diferencia con Testing Backend

### Backend (Lo que vimos en Sesión 2):
- Testear funciones puras (input → output)
- No hay interfaz visual
- Ejemplo: `calcularTarifa(1, 3)` → `2.50`

### Frontend (Hoy):
- Testear interacciones del usuario
- SÍ hay interfaz visual
- Ejemplo: Usuario hace clic → Se muestra mensaje

---

## Tipos de Testing Frontend (Simplificado)

### 1. Testing de Validación
**Qué es:** Verificar que los inputs se validen correctamente

**Ejemplo:**
```html
<input type="number" min="1" max="100" id="monto">
```

**Test:** 
- ¿Qué pasa si pongo 0?
- ¿Qué pasa si pongo 101?
- ¿Qué pasa si pongo texto?

### 2. Testing de Eventos
**Qué es:** Verificar que los botones/clicks funcionen

**Ejemplo:**
```html
<button onclick="validarBillete()">Validar</button>
```

**Test:**
- ¿Qué pasa cuando hago clic?
- ¿Se muestra el resultado correcto?

### 3. Testing de UI/Visual
**Qué es:** Verificar que se VEA bien

**Ejemplo:**
- ¿El mensaje de error es rojo?
- ¿El formulario está centrado?

**NOTA:** Hoy nos enfocamos en tipos 1 y 2.

---

## Herramientas de Testing Frontend

### Para Hoy:
**JavaScript simple en el navegador**

```javascript
// Test manual simple
function testFormulario() {
  const input = document.getElementById('monto');
  input.value = -5;
  
  if (input.validity.valid) {
    console.log("❌ ERROR: Aceptó valor negativo");
  } else {
    console.log("✅ OK: Rechazó valor negativo");
  }
}
```

### Para Después (opcional):
- **Playwright:** Testing automatizado de navegadores
- **Cypress:** Testing E2E (end-to-end)
- **Jest + Testing Library:** Testing de componentes React

**NOTA:** Hoy solo conceptos básicos.

---

## Cómo Copilot Ayuda con Testing Frontend

### 🤖 Lo que Copilot puede hacer:
- ✅ Generar código HTML de prueba
- ✅ Crear funciones de validación
- ✅ Sugerir casos de prueba
- ✅ Generar tests básicos de interacciones

### 💡 Prompt Efectivo:
```
❌ Malo: "testea el formulario"

✅ Bueno: 
"Crea un formulario HTML con campo de monto (mínimo 5€, máximo 50€).
Agrega validación JavaScript que muestre error si el monto está fuera de rango.
Incluye tests para verificar casos válidos e inválidos."
```

---

## Casos Típicos a Testear en Formularios

### ✅ Validaciones de Inputs:
1. **Valor válido** → Debería aceptarse
2. **Valor fuera de rango** → Debería rechazarse
3. **Campo vacío** → Debería mostrar error
4. **Tipo incorrecto** (texto en campo numérico) → Debería rechazarse

### ✅ Interacciones:
1. **Click en botón** → Debería ejecutar acción
2. **Submit de formulario** → Debería validar primero
3. **Cambio en select** → Debería actualizar UI

### ✅ Mensajes al Usuario:
1. **Error visible** cuando hay problema
2. **Éxito visible** cuando funciona
3. **Loading** mientras procesa

---

## Patrón AAA en Frontend

### Mismo concepto que backend:

```javascript
// ARRANGE (Preparar)
const boton = document.getElementById('validar');
const resultado = document.getElementById('resultado');

// ACT (Actuar)
boton.click();

// ASSERT (Verificar)
if (resultado.textContent === 'Billete válido') {
  console.log("✅ Test pasó");
} else {
  console.log("❌ Test falló");
}
```

---

## Testing Manual vs Automatizado

### 🖱️ Testing Manual:
- Abrir navegador
- Llenar formulario a mano
- Hacer clic
- Ver qué pasa

**Problema:** Lento, repetitivo, propenso a errores humanos

### 🤖 Testing Automatizado:
- Script que simula usuario
- Se ejecuta en segundos
- Repetible infinitamente

**Hoy:** Aprenderemos conceptos básicos con testing semi-manual

---

## Casos Reales en Metro Bilbao

### Ejemplo 1: Recarga de Billete
```
Usuario ingresa monto → Sistema valida → Procesa pago → Muestra confirmación
```

**Tests necesarios:**
- ¿Valida monto mínimo (5€)?
- ¿Rechaza montos negativos?
- ¿Muestra confirmación al éxito?
- ¿Muestra error si falla?

### Ejemplo 2: Validación de Entrada
```
Usuario escanea billete → Sistema verifica → Abre puerta o muestra error
```

**Tests necesarios:**
- ¿Detecta billete caducado?
- ¿Detecta saldo insuficiente?
- ¿Muestra mensaje claro al usuario?

---

## Mentalidad de Testing Frontend

### 🧠 Piensa como Usuario:
1. **¿Qué veo?** → Elementos visuales
2. **¿Qué puedo hacer?** → Interacciones disponibles
3. **¿Qué espero que pase?** → Resultado esperado
4. **¿Qué puede salir mal?** → Casos de error

### Ejemplo: Formulario de Tarifa
```
1. Veo: 2 dropdowns (zona origen, zona destino), 1 botón "Calcular"
2. Puedo: Seleccionar zonas, hacer clic en calcular
3. Espero: Ver precio calculado
4. Puede fallar: No seleccionar zona, error de cálculo
```

---

## 💬 Preguntas de Reflexión

Antes de empezar los ejercicios:
1. ¿Has encontrado bugs en formularios web? ¿Cuáles?
2. ¿Qué validaciones faltan en las interfaces que usas?
3. ¿Cómo sabes si un formulario funciona bien antes de subirlo a producción?

---

## 🎯 Para Esta Sesión

### Vamos a aprender:
1. Crear formularios simples con validación
2. Testear validaciones con Copilot
3. Verificar interacciones básicas

### NO vamos a:
- Usar frameworks complejos de testing
- Hacer tests E2E automatizados completos
- Configurar pipelines de testing

**Foco:** Conceptos y cómo Copilot acelera el proceso.

---

## ✅ Listo para Empezar

Ahora que entendemos qué es testing frontend, vamos a:
1. **Ejercicio 1:** Crear y testear formulario HTML/JS
2. **Ejercicio 2:** Documentar proyecto completo
3. **Ejercicio 3:** Mejores prácticas y cierre

**¡Última sesión, démoslo todo! 🚀**
