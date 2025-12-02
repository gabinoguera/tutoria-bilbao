# Ejercicio 3: Documentación y Comprensión de Código (C# y PL/SQL)

## 🎯 Objetivo
Usar Copilot para **entender** lógica compleja heredada y luego generar documentación técnica de alta calidad (comentarios XML, PLDoc) que explique el *porqué* y no solo el *qué*.

## 📝 Contexto
Tenemos código complejo en el núcleo de validación que necesitamos mantener.
1. Una clase C# `TarifasService.cs` con reglas de negocio.
2. Un paquete Oracle `PKG_VALIDACION.sql` con procedimientos críticos.

## 🔧 Pasos del Ejercicio

### Parte A: Comprensión y Documentación C#

**Paso 1: Entender la lógica (Explain)**
Abre el archivo `ejemplos/csharp/TarifasService.cs`.
Selecciona el método `CalcularPrecio`.

**Prompt (Copilot Chat):**
> "Explica la lógica de cálculo de precios en este método. ¿Qué reglas de negocio se están aplicando para los descuentos? Resúmelo en 3 puntos."

**Paso 2: Generar Documentación XML**
Una vez entendida la lógica, pidamos documentación formal.

**Prompt:**
> "Genera comentarios de documentación XML para este método.
> Incluye:
> - `<summary>` explicando el propósito.
> - `<remarks>` mencionando las reglas de descuento identificadas (Jóvenes, Mayores).
> - `<example>` mostrando cómo llamar al método."

**Resultado Esperado:**
```csharp
/// <summary>
/// Calcula el precio final del viaje aplicando descuentos por perfil.
/// </summary>
/// <remarks>
/// Reglas aplicadas:
/// - Menores de 26 años: 50% descuento.
/// - Mayores de 65 años: 75% descuento.
/// </remarks>
// ...
```

**Paso 3: Comparar Antes y Después**
Observa la diferencia entre código sin documentar y documentado.

**💡 Beneficio:**
La documentación XML es el estándar de C#/.NET. Aunque en archivos sueltos no se ve IntelliSense, en proyectos reales esta documentación:
1. Aparece automáticamente al escribir código (autocompletado)
2. Se exporta a archivos `.xml` que acompañan los `.dll`
3. Permite generar sitios web de documentación automáticamente

---

### Parte B: Documentación de Legacy Oracle (PL/SQL)

**Paso 1: Análisis de Procedimiento**
Abre `ejemplos/oracle/PKG_VALIDACION.sql`.

**Prompt (Chain of Thought):**
> "Analiza el procedimiento `REGISTRAR_PASO`.
> 1. Identifica qué tablas se leen y cuáles se modifican.
> 2. ¿Qué hace el `COMMIT` al final? ¿Es una buena práctica en este contexto?
> 3. Genera un bloque de comentarios estilo Javadoc/PLDoc para poner antes del procedimiento."



**Paso 2: Generar Guía de Uso**
A veces el código está bien, pero falta saber cómo usarlo.

**Prompt:**
> "Basado en este paquete, genera un ejemplo de código PL/SQL anónimo que:
> 1. Primero valide el saldo con `VALIDAR_SALDO`
> 2. Si hay saldo, registre el paso con `REGISTRAR_PASO`
> 3. Muestre mensajes informativos con DBMS_OUTPUT"


PROCEDURE SP_REGISTRAR_VIAJE(
    p_tarjeta_id IN NUMBER,
    p_estacion_origen IN NUMBER,
    p_estacion_destino IN NUMBER
);
```
