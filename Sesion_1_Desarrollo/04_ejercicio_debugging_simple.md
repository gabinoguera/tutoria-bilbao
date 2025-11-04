# Ejercicio 3 (OPCIONAL) - Arreglar un Error Simple

## ⏱️ Duración: 10 minutos
## 🎯 Objetivo: Pedirle ayuda a Copilot cuando algo falla

---

## ⚠️ ESTE EJERCICIO ES OPCIONAL

**Solo hacerlo si nos sobra tiempo.**
Si vamos justos de tiempo, **saltar al cierre.**

---

## Contexto

A veces copiamos código y tiene un error. Copilot puede ayudarnos.

---

## Ejercicio: Código con Error

### 📝 Qué hacer:

1. Crea un archivo: `bug.js`
2. Copia este código (tiene un error a propósito):

```javascript
function dividir(a, b) {
  return a / b
}

console.log(dividir(10, 0))
```

3. **Ejecuta:** `node bug.js`
4. **Verás:** `Infinity` (no es un error fatal, pero es raro)

5. **Abre Copilot Chat** y pregunta:

```
¿Qué problema tiene esta función?
¿Cómo debería manejar la división por cero?
```

6. **Lee la respuesta de Copilot**
7. **Aplica la corrección sugerida**

### 🤔 Preguntas para discutir:
- ¿Copilot identificó el problema?
- ¿La solución propuesta tiene sentido?
- ¿Cómo mejorarías la función?

---

## 💡 TIPS

### Cuando tengas un error:
1. **Copia el mensaje de error**
2. **Pégalo en Copilot Chat**
3. **Pregunta:** "¿Cómo arreglo este error?"

### Copilot puede ayudarte con:
- ✅ Errores de sintaxis
- ✅ Errores de lógica básicos
- ✅ Sugerencias de mejora

---

## ✅ Cierre

### Lo que aprendimos:
- Copilot puede detectar problemas en código
- Podemos pedirle ayuda cuando algo falla
- Es como un compañero que revisa tu código

---

## 📚 Para Practicar

- La próxima vez que tengas un error, pregúntale a Copilot
- No tengas miedo de copiar errores al chat
- Experimenta pidiendo explicaciones
