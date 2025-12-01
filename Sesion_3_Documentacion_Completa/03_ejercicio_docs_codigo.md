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

### Parte B: Documentación de Legacy Oracle (PL/SQL)

**Paso 1: Análisis de Procedimiento**
Abre `ejemplos/oracle/PKG_VALIDACION.sql`.

**Prompt (Chain of Thought):**
> "Analiza el procedimiento `VALIDAR_SALDO`.
> 1. Identifica qué tablas se leen y cuáles se modifican.
> 2. Lista los posibles códigos de error que puede devolver.
> 3. Genera un bloque de comentarios estilo Javadoc/PLDoc para poner antes del procedimiento."

**Paso 2: Generar Guía de Uso**
A veces el código está bien, pero falta saber cómo usarlo.

**Prompt:**
> "Basado en este paquete, genera un ejemplo de código PL/SQL anónimo que llame a `VALIDAR_SALDO` para probarlo, manejando las excepciones posibles."
/// </returns>
/// <exception cref="TarjetaNotFoundException">Lanzada si el ID no existe.</exception>
/// <example>
/// <code>
/// var result = service.ValidarTransbordo(12345, 5, DateTime.Now);
/// if (result.EsTransbordo) Console.WriteLine("Transbordo OK");
/// </code>
/// </example>
public ValidationResult ValidarTransbordo(int tarjetaId, int estacionId, DateTime tiempo)
{ ... }
```

### Parte B: Documentación de Paquetes Oracle (PL/SQL)

**Paso 1:**
Abre un archivo SQL con un paquete o procedimiento.

```sql
-- Código SIN documentar
PROCEDURE SP_REGISTRAR_VIAJE(
    p_tarjeta_id IN NUMBER,
    p_estacion_origen IN NUMBER,
    p_estacion_destino IN NUMBER
);
```

**Paso 2: Prompt a Copilot**
> "Documenta este procedimiento almacenado usando el formato estándar Javadoc/PLDoc.
> Describe los parámetros de entrada y qué tablas modifica (INSERT en VIAJES, UPDATE en SALDOS)."

**Resultado Esperado:**
```sql
/**
 * Registra un viaje completado y descuenta el saldo correspondiente.
 *
 * <p>Este procedimiento realiza dos operaciones atómicas:
 * 1. Inserta el registro en la tabla HISTORICO_VIAJES.
 * 2. Actualiza el saldo en la tabla TARJETAS.</p>
 *
 * @param p_tarjeta_id       ID único de la tarjeta del usuario.
 * @param p_estacion_origen  ID de la estación de entrada.
 * @param p_estacion_destino ID de la estación de salida.
 *
 * @throws ORA-20001 Si el saldo es insuficiente para el trayecto.
 * @throws ORA-20002 Si la tarjeta está bloqueada.
 *
 * @author Equipo Metro Bilbao
 * @version 1.2
 */
PROCEDURE SP_REGISTRAR_VIAJE(
    p_tarjeta_id IN NUMBER,
    p_estacion_origen IN NUMBER,
    p_estacion_destino IN NUMBER
);
```

## 🧠 Reto Adicional
Pide a Copilot que genere un diagrama de clases Mermaid basado en la interfaz `IValidationService` documentada.

> "Genera un diagrama de clases Mermaid basado en esta interfaz y sus comentarios XML."
