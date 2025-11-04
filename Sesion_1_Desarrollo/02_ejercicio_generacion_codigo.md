# Ejercicio 1 - Generación de Código SIMPLE con GitHub Copilot

## ⏱️ Duración: 20 minutos
## 🎯 Objetivo: Ver cómo Copilot genera código básico

---

## ✅ LO QUE VAMOS A HACER

1. Crear una calculadora muy simple
2. Crear una función para calcular tarifas de Metro
3. Discutir qué funcionó y qué no

**IMPORTANTE:** No te preocupes por escribir código perfecto. Solo queremos VER cómo funciona Copilot.

---

## Ejercicio A: Calculadora Básica (5 min)

### 📝 Qué hacer:

1. Abre VS Code
2. Crea un nuevo archivo: `calculadora.js`
3. Abre Copilot Chat (Ctrl+Alt+I o Cmd+Alt+I)
4. **Copia este prompt EXACTO:**

```
Crea una función en JavaScript que sume dos números y retorne el resultado.
La función debe llamarse sumar y recibir dos parámetros: a y b
```

5. **Copilot te dará código →  Cópialo en tu archivo**
6. **Prueba que funciona:**
   - Abre la terminal en VS Code
   - Ejecuta: `node calculadora.js`

### 🤔 Preguntas para discutir:
- ¿Funcionó a la primera?
- ¿El código es fácil de leer?
- ¿Qué harías diferente?

---

## Ejercicio B: Tarifa Metro Bilbao (15 min)

### � Contexto simple:

El Metro de Bilbao tiene 3 zonas:
- Zona 1: €1.50
- Zona 2: €2.00
- Zona 3: €2.50

### 📝 Qué hacer:

1. Crea un nuevo archivo: `tarifa.js`
2. Abre Copilot Chat
3. **Copia este prompt EXACTO:**

```
Crea una función JavaScript llamada calcularTarifa.
La función recibe un número de zona (1, 2, o 3).
Debe retornar el precio:
- Zona 1 cuesta 1.50 euros
- Zona 2 cuesta 2.00 euros  
- Zona 3 cuesta 2.50 euros
```

4. **Copilot te dará código → Cópialo en tu archivo**

5. **Prueba con estos ejemplos:**
```javascript
console.log(calcularTarifa(1));  // Debería mostrar 1.50
console.log(calcularTarifa(2));  // Debería mostrar 2.00
console.log(calcularTarifa(3));  // Debería mostrar 2.50
```

6. **Ejecuta:** `node tarifa.js`

### 🤔 Preguntas para discutir:
- ¿Funcionó como esperabas?
- ¿Qué pasa si pones zona 5?
- ¿Cómo mejorarías el código?

---

## 💡 TIPS para Copilot

### ✅ Prompts Buenos:
- Son claros y cortos
- Dicen EXACTAMENTE qué quieres
- Dan ejemplos de entrada/salida

### ❌ Prompts Malos:
- "Haz algo con tarifas"
- "Crea una función"
- Muy largos y confusos

---

## 🆘 Si Te Atascas

### Problema: Copilot no responde
**Solución:** Revisa que Copilot esté activado (icono en la esquina inferior derecha)

### Problema: El código tiene errores
**Solución:** Copia el error y pregúntale a Copilot "¿Cómo arreglo este error?"

### Problema: No entiendes el código
**Solución:** Selecciona el código, click derecho → "Copilot: Explain This"

---

## ✅ Cierre del Ejercicio

### Lo que aprendimos hoy:
- Copilot puede generar código simple muy rápido
- Los prompts claros = mejores resultados
- Siempre hay que PROBAR el código generado

### Para practicar en casa:
- Intenta crear una función que reste dos números
- Intenta crear una función que multiplique dos números
- Experimenta cambiando los prompts

---

## 📚 Recursos Útiles

- Documentación oficial Copilot: https://docs.github.com/copilot
- Si algo no funciona: Pregunta en el chat del curso

Ahora vamos a guiar a Copilot con un patrón específico:

```
Contexto: Sistema de Metro Bilbao con validaciones estrictas.

Ejemplo de función con nuestro estándar:

function validarZona(zona) {
  if (!Number.isInteger(zona) || zona < 1 || zona > 3) {
    throw new Error(`Zona inválida: ${zona}. Debe ser 1, 2 o 3.`);
  }
  return zona;
}

Siguiendo este patrón, crea la función calcularTarifa que:
1. Valide entradas (zonas 1-3, tipoUsuario válido)
2. Lance errores descriptivos si hay problemas
3. Calcule tarifa usando zona máxima
4. Aplique descuentos según tipo
5. Retorne precio con 2 decimales

Tipos de usuario válidos: 'regular', 'estudiante', 'tercera_edad'
Tarifas: zona 1 = 1.50€, zona 2 = 2.00€, zona 3 = 2.50€
Descuentos: estudiante 30%, tercera_edad 50%
```

### ✅ Resultado Esperado (con Validaciones)

```javascript
function calcularTarifa(zonaOrigen, zonaDestino, tipoUsuario) {
  // Validar zonas
  if (!Number.isInteger(zonaOrigen) || zonaOrigen < 1 || zonaOrigen > 3) {
    throw new Error(`Zona origen inválida: ${zonaOrigen}. Debe ser 1, 2 o 3.`);
  }
  if (!Number.isInteger(zonaDestino) || zonaDestino < 1 || zonaDestino > 3) {
    throw new Error(`Zona destino inválida: ${zonaDestino}. Debe ser 1, 2 o 3.`);
  }
  
  // Validar tipo de usuario
  const tiposValidos = ['regular', 'estudiante', 'tercera_edad'];
  if (!tiposValidos.includes(tipoUsuario)) {
    throw new Error(`Tipo de usuario inválido: ${tipoUsuario}. Debe ser: ${tiposValidos.join(', ')}`);
  }
  
  // Tarifas base
  const tarifas = {
    1: 1.50,
    2: 2.00,
    3: 2.50
  };
  
  // Calcular tarifa base (zona más alta)
  const zonaMax = Math.max(zonaOrigen, zonaDestino);
  let precio = tarifas[zonaMax];
  
  // Aplicar descuentos
  const descuentos = {
    'estudiante': 0.70,
    'tercera_edad': 0.50,
    'regular': 1.00
  };
  
  precio *= descuentos[tipoUsuario];
  
  return Number(precio.toFixed(2));
}
```

### 🔍 Validación con Tests

Pide a Copilot que genere tests:

```
Genera tests para validar:
1. Cálculos correctos para todas las combinaciones de zonas
2. Errores cuando zonas son inválidas (0, 4, null, string)
3. Errores cuando tipoUsuario es inválido
4. Descuentos aplicados correctamente
```

---

## Parte C: PL/SQL - Generación Multi-lenguaje

### 🎯 Prompt para PL/SQL

```
Convierte la función calcularTarifa a un stored procedure de Oracle PL/SQL.

Especificaciones:
- Nombre: SP_CALCULAR_TARIFA
- Parámetros IN: p_zona_origen NUMBER, p_zona_destino NUMBER, p_tipo_usuario VARCHAR2
- Parámetro OUT: p_precio NUMBER
- Incluye manejo de excepciones personalizadas
- Valida entradas antes de calcular
- Retorna precio con 2 decimales

Crea también el bloque de prueba anónimo para testearlo.
```

### ✅ Resultado Esperado

```sql
CREATE OR REPLACE PROCEDURE SP_CALCULAR_TARIFA (
    p_zona_origen IN NUMBER,
    p_zona_destino IN NUMBER,
    p_tipo_usuario IN VARCHAR2,
    p_precio OUT NUMBER
) AS
    v_zona_max NUMBER;
    v_tarifa_base NUMBER;
    v_descuento NUMBER := 1.0;
    
    -- Excepciones personalizadas
    ex_zona_invalida EXCEPTION;
    ex_tipo_invalido EXCEPTION;
    
BEGIN
    -- Validar zonas
    IF p_zona_origen NOT IN (1, 2, 3) THEN
        RAISE ex_zona_invalida;
    END IF;
    
    IF p_zona_destino NOT IN (1, 2, 3) THEN
        RAISE ex_zona_invalida;
    END IF;
    
    -- Validar tipo de usuario
    IF p_tipo_usuario NOT IN ('regular', 'estudiante', 'tercera_edad') THEN
        RAISE ex_tipo_invalido;
    END IF;
    
    -- Determinar zona máxima
    v_zona_max := GREATEST(p_zona_origen, p_zona_destino);
    
    -- Asignar tarifa base
    CASE v_zona_max
        WHEN 1 THEN v_tarifa_base := 1.50;
        WHEN 2 THEN v_tarifa_base := 2.00;
        WHEN 3 THEN v_tarifa_base := 2.50;
    END CASE;
    
    -- Aplicar descuento
    CASE p_tipo_usuario
        WHEN 'estudiante' THEN v_descuento := 0.70;
        WHEN 'tercera_edad' THEN v_descuento := 0.50;
        ELSE v_descuento := 1.0;
    END CASE;
    
    -- Calcular precio final
    p_precio := ROUND(v_tarifa_base * v_descuento, 2);
    
EXCEPTION
    WHEN ex_zona_invalida THEN
        RAISE_APPLICATION_ERROR(-20001, 'Zona inválida. Debe ser 1, 2 o 3.');
    WHEN ex_tipo_invalido THEN
        RAISE_APPLICATION_ERROR(-20002, 'Tipo de usuario inválido.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20999, 'Error al calcular tarifa: ' || SQLERRM);
END SP_CALCULAR_TARIFA;
/

-- Bloque de prueba
DECLARE
    v_precio NUMBER;
BEGIN
    SP_CALCULAR_TARIFA(1, 3, 'estudiante', v_precio);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio); -- Esperado: 1.75
    
    SP_CALCULAR_TARIFA(2, 2, 'tercera_edad', v_precio);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio); -- Esperado: 1.00
END;
/
```

---

## Parte D: C# - API Service

### 🎯 Prompt para C#

```
Crea una clase C# llamada TarifaService con un método CalcularTarifa.

Requisitos:
- Usar record para parámetros: TarifaRequest(int ZonaOrigen, int ZonaDestino, string TipoUsuario)
- Retornar record TarifaResponse(decimal Precio, string Mensaje)
- Validar entradas y lanzar ArgumentException con mensajes descriptivos
- Usar enums para TipoUsuario
- Seguir convenciones C# modernas (.NET 6+)
- Incluir XML comments para documentación
```

### ✅ Resultado Esperado

```csharp
public enum TipoUsuario
{
    Regular,
    Estudiante,
    TerceraEdad
}

public record TarifaRequest(int ZonaOrigen, int ZonaDestino, TipoUsuario Tipo);
public record TarifaResponse(decimal Precio, string Mensaje);

/// <summary>
/// Servicio para cálculo de tarifas del Metro de Bilbao
/// </summary>
public class TarifaService
{
    private readonly Dictionary<int, decimal> _tarifasBase = new()
    {
        { 1, 1.50m },
        { 2, 2.00m },
        { 3, 2.50m }
    };
    
    /// <summary>
    /// Calcula la tarifa de un viaje entre dos zonas
    /// </summary>
    /// <param name="request">Datos del viaje</param>
    /// <returns>Precio calculado con descuentos aplicados</returns>
    /// <exception cref="ArgumentException">Si las zonas son inválidas</exception>
    public TarifaResponse CalcularTarifa(TarifaRequest request)
    {
        // Validar zonas
        if (!_tarifasBase.ContainsKey(request.ZonaOrigen))
            throw new ArgumentException($"Zona origen inválida: {request.ZonaOrigen}", nameof(request.ZonaOrigen));
            
        if (!_tarifasBase.ContainsKey(request.ZonaDestino))
            throw new ArgumentException($"Zona destino inválida: {request.ZonaDestino}", nameof(request.ZonaDestino));
        
        // Obtener zona máxima
        var zonaMax = Math.Max(request.ZonaOrigen, request.ZonaDestino);
        var precioBase = _tarifasBase[zonaMax];
        
        // Aplicar descuento
        var descuento = request.Tipo switch
        {
            TipoUsuario.Estudiante => 0.70m,
            TipoUsuario.TerceraEdad => 0.50m,
            TipoUsuario.Regular => 1.00m,
            _ => throw new ArgumentException($"Tipo de usuario no válido: {request.Tipo}")
        };
        
        var precioFinal = Math.Round(precioBase * descuento, 2);
        
        return new TarifaResponse(
            precioFinal,
            $"Tarifa calculada: Zona {zonaMax}, Usuario {request.Tipo}, Descuento {(1 - descuento) * 100}%"
        );
    }
}
```

---

## Comparación: Zero-Shot vs Few-Shot

| Aspecto | Zero-Shot | Few-Shot |
|---------|-----------|----------|
| **Velocidad** | ⚡ Muy rápido | 🐢 Requiere preparar ejemplos |
| **Precisión** | 🎲 Variable | 🎯 Más consistente |
| **Validaciones** | ❌ Básicas o ausentes | ✅ Robustas |
| **Estilo de código** | 📝 Genérico | 🎨 Alineado a tu estándar |
| **Cuándo usar** | Prototipos, exploración | Producción, código crítico |

---

## Ejercicio de Clase

### 🎯 Desafío Individual (10 minutos)

Elige **uno** de los siguientes y genera el código con Copilot:

**Opción 1: Validación de Billetes**
```
Función que valide si un billete es válido para viajar:
- Input: número de billete, zona del billete, zona destino
- Lógica: billete zona 1 solo para zona 1, zona 2 para 1-2, zona 3 para todas
- Output: true/false con mensaje explicativo
```

**Opción 2: Cálculo de Tiempo Estimado**
```
Función que calcule tiempo de viaje entre estaciones:
- Input: estación origen, estación destino
- Lógica: 3 minutos entre estaciones consecutivas + 2 minutos por cambio de línea
- Output: minutos estimados
```

**Opción 3: Descuento por Bono**
```
Función que calcule precio con bono mensual:
- Input: número de viajes en el mes, tipo de bono
- Lógica: Bono 10 viajes = 10% descuento, Bono 30 = 25% descuento
- Output: precio con descuento aplicado
```

### 📢 Compartir Resultados

- ¿Qué prompt usaste?
- ¿Funcionó en el primer intento?
- ¿Qué tuviste que iterar?

---

## Tips Clave para Generación Efectiva

1. **Contexto antes de código**: Explica el dominio primero
2. **Sé explícito con validaciones**: Copilot no siempre las incluye por defecto
3. **Pide tests**: Agregar "incluye 3 tests unitarios" mejora la calidad
4. **Especifica el lenguaje y versión**: "JavaScript ES6+", "C# .NET 6", "PL/SQL Oracle 19c"
5. **Itera incrementalmente**: Genera básico → Añade validaciones → Añade tests

---

## Siguiente Paso

Ahora que sabes generar código, vamos a optimizar código existente (especialmente SQL legacy).

👉 **Siguiente:** `03_ejercicio_optimizacion_sql.md`
