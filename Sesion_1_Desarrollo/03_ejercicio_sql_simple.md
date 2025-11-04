# Ejercicio 2 - SQL Básico con Copilot

## ⏱️ Duración: 20 minutos (MUY IMPORTANTE)
## 🎯 Objetivo: Pedirle a Copilot que explique queries SQL

---

## ⚠️ NOTA IMPORTANTE

**NO vamos a instalar bases de datos ni Docker.**
Solo vamos a pedirle a Copilot que **lea y explique** SQL.

---

## Contexto Simple: Metro Bilbao

Tenemos 3 tablas básicas:
- `estaciones`: id, nombre, zona
- `billetes`: id, tipo, precio
- `validaciones`: id, estacion_id, billete_id, fecha

---

## Ejercicio A: Entender una Query (10 min)

### 📝 Qué hacer:

1. Crea un archivo: `query.sql`
2. Copia esta query en el archivo:

```sql
SELECT e.nombre, COUNT(*) as total_validaciones
FROM validaciones v
JOIN estaciones e ON e.id = v.estacion_id
WHERE v.fecha >= '2024-01-01'
GROUP BY e.nombre
ORDER BY total_validaciones DESC;
```

3. **Selecciona TODO el código** (Ctrl+A o Cmd+A)
4. **Click derecho → "Copilot: Explain This"**
5. **Lee la explicación que da Copilot**

### 🤔 Preguntas para discutir:
- ¿La explicación tiene sentido?
- ¿Qué hace el `JOIN`?
- ¿Qué hace el `GROUP BY`?

---

## Ejercicio B: Pedirle a Copilot que Cree una Query (10 min)

### 📝 Qué hacer:

1. Abre Copilot Chat (Ctrl+Alt+I o Cmd+Alt+I)
2. **Copia este prompt EXACTO:**

```
Crea una query SQL que:
- Cuente cuántos billetes hay de cada tipo
- Use la tabla billetes
- Muestre el tipo y el total
- Ordene de mayor a menor
```

3. **Copilot te dará SQL → Cópialo en tu archivo**
4. **Míralo y discute:** ¿Es correcto? ¿Hace lo que pediste?

### 🤔 Preguntas para discutir:
- ¿La query tiene sentido?
- ¿Usó SELECT, COUNT, GROUP BY?
- ¿Cómo cambiarías el prompt para mejorarla?

---

## 💡 TIPS Importantes

### ✅ Lo que SÍ puedes hacer con Copilot:
- Pedir explicaciones de queries existentes
- Pedir que genere queries básicas
- Pedir que agregue comentarios al código

### ❌ Lo que NO haremos hoy (pero podrías):
- Ejecutar queries (necesitas BD)
- Optimizar performance (tema avanzado)
- Crear esquemas completos

---

## 🆘 Si Te Atascas

### Problema: No entiendo el SQL que generó Copilot
**Solución:** Selecciona el código → Click derecho → "Copilot: Explain This"

### Problema: Copilot generó algo raro
**Solución:** Cambia el prompt para ser más específico

---

## ✅ Cierre del Ejercicio

### Lo que aprendimos:
- Copilot puede explicar SQL existente
- Copilot puede generar queries básicas
- Los prompts claros dan mejores resultados

### Para practicar en casa:
- Busca queries SQL en tu trabajo
- Pídele a Copilot que las explique
- Experimenta pidiendo queries simples

---

## 📚 Nota para Avanzados

Si ya dominas SQL y quieres más:
- Pregúntale a Copilot sobre índices
- Pídele que optimice queries
- Experimenta con EXPLAIN ANALYZE

Pero recuerda: **hoy el objetivo es solo familiarizarse con Copilot**, no dominar SQL.
