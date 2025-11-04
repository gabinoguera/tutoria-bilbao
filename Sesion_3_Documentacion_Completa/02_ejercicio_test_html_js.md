# Ejercicio 1 - Testing de HTML/JavaScript

## ⏱️ Duración: 25 minutos
## 🎯 Objetivo: Crear y testear formulario web con Copilot

---

## Parte A: Formulario Simple de Recarga (15 min)

### 📝 Paso 1: Crear HTML básico

1. Crea un archivo: `recarga_billete.html`
2. **Abre Copilot Chat**
3. **Copia este prompt:**

```
Crea un formulario HTML simple para recargar un billete de Metro Bilbao.

Debe tener:
- Campo para monto (número, mínimo 5€, máximo 50€)
- Campo para número de billete (texto, obligatorio)
- Botón "Recargar"
- Div para mostrar mensajes de resultado

Incluye estilos CSS básicos para que se vea decente.
Incluye validación JavaScript que:
- Verifique que el monto esté entre 5 y 50
- Verifique que el número de billete no esté vacío
- Muestre mensaje de éxito o error
```

4. **Copilot generará el HTML → Cópialo en tu archivo**

### 📝 Paso 2: Probar el formulario manualmente

5. **Abre el archivo en tu navegador:**
   - Click derecho en el archivo → "Open with Live Server"
   - O simplemente arrastra el archivo a tu navegador

6. **Prueba estos casos:**
   - ✅ Monto válido (10€) → Debería mostrar éxito
   - ❌ Monto muy bajo (2€) → Debería mostrar error
   - ❌ Monto muy alto (100€) → Debería mostrar error
   - ❌ Sin número de billete → Debería mostrar error

### 📝 Paso 3: Agregar tests automatizados simples

7. **En Copilot Chat, pide:**

```
Agrega una sección de tests al final del HTML.
Crea una función testFormulario() que:
- Pruebe caso válido: monto 10, billete "12345"
- Pruebe caso inválido: monto 2
- Pruebe caso inválido: monto 100
- Pruebe caso inválido: billete vacío
- Muestre resultados en consola del navegador

La función debe ejecutarse automáticamente al cargar la página.
```

8. **Agrega el código de tests al HTML**

### 📝 Paso 4: Ver resultados

9. **Recarga la página en el navegador**
10. **Abre la consola del navegador:**
    - Windows/Linux: `F12` o `Ctrl+Shift+J`
    - Mac: `Cmd+Option+J`

11. **Deberías ver algo como:**
```
✅ Test caso válido: pasó
✅ Test monto muy bajo: pasó
✅ Test monto muy alto: pasó
✅ Test billete vacío: pasó
```

### 🤔 Preguntas para discutir:
- ¿Los tests detectaron todos los casos?
- ¿El formulario se comporta como esperabas?
- ¿Qué otros casos probarías?

---

## Parte B: Validación Avanzada (10 min)

### 📝 Paso 1: Agregar más validaciones

1. **En Copilot Chat, pide:**

```
Mejora la validación del formulario.
Agrega:
- El número de billete debe tener exactamente 10 dígitos
- El monto debe ser múltiplo de 5 (5, 10, 15, 20, etc.)
- Muestra mensajes de error específicos para cada caso

Actualiza los tests para verificar estas nuevas validaciones.
```

2. **Aplica los cambios al HTML**

### 📝 Paso 2: Probar nuevas validaciones

3. **Recarga el navegador**
4. **Prueba:**
   - Billete con 5 dígitos → Error
   - Billete con letras → Error
   - Monto 7€ (no múltiplo de 5) → Error
   - Monto 15€ (múltiplo de 5) → Éxito

5. **Revisa la consola** para ver tests actualizados

### 🤔 Preguntas para discutir:
- ¿Los mensajes de error son claros?
- ¿Las validaciones tienen sentido para Metro Bilbao?
- ¿Qué validaciones agregarías en un caso real?

---

## 🆘 Si Te Atascas

### Problema: El formulario no se ve
**Solución:**
1. Verifica que guardaste el archivo `.html`
2. Ábrelo directamente en el navegador
3. Si hay error, copia el error a Copilot

### Problema: Los tests no se ejecutan
**Solución:**
1. Abre la consola del navegador (F12)
2. Busca errores en rojo
3. Copia el error a Copilot: "¿Cómo arreglo este error?"

### Problema: Las validaciones no funcionan
**Solución:**
1. Verifica que el JavaScript esté dentro de `<script>` tags
2. Revisa la consola para errores
3. Pregunta a Copilot: "¿Por qué no funciona la validación?"

---

## 💡 TIPS para Testing Frontend

### ✅ Tests Buenos:
- Prueban casos reales de usuario
- Tienen nombres descriptivos
- Son independientes (un test = un caso)
- Muestran mensajes claros

### ❌ Tests Malos:
- Muy genéricos ("test1", "test2")
- Dependen de ejecutarse en orden
- No muestran qué falló

---

## Parte C: Testing de Interacciones (Opcional)

### 📝 Si te sobra tiempo:

1. **Pide a Copilot:**

```
Agrega un select para tipo de billete:
- Normal: sin descuento
- Estudiante: 30% descuento
- Tercera edad: 50% descuento

El cálculo final debe mostrar:
- Monto base
- Descuento aplicado
- Monto final

Agrega tests para cada tipo de billete.
```

2. **Implementa y prueba**

---

## 🎯 Patrón para Prompts de Testing Frontend

### Template efectivo:

```
Crea [ELEMENTO UI] con estas características:
- [Campo 1 con validación]
- [Campo 2 con validación]
- [Acción/botón]

La validación debe:
- [Caso 1]
- [Caso 2]
- [Mensaje de error/éxito]

Incluye tests que verifiquen:
- [Test caso 1]
- [Test caso 2]
```

---

## 📊 Comparación: Backend vs Frontend Testing

| Aspecto | Backend | Frontend |
|---------|---------|----------|
| **Qué testea** | Funciones puras | Interacciones de usuario |
| **Ejecución** | Node.js | Navegador |
| **Verificación** | `console.log` | Consola del navegador |
| **Complejidad** | Más simple | Más visual |

---

## ✅ Cierre del Ejercicio

### Lo que aprendimos:
- ✅ Crear formularios HTML con validación
- ✅ Testear validaciones con JavaScript
- ✅ Ver resultados en consola del navegador
- ✅ Copilot puede generar HTML + JS + tests juntos

### Para practicar:
- Toma un formulario de tu trabajo
- Pídele a Copilot que agregue validaciones
- Crea tests básicos para verificar casos
- Comparte resultados con el equipo

---

## 🔜 Siguiente Ejercicio

Ahora vamos a **documentar un proyecto completo** con Copilot, incluyendo arquitectura y decisiones técnicas.
