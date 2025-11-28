# Ejercicio 4: Documentación Técnica Avanzada

## 🎯 Objetivo
Generar documentación técnica de alta calidad directamente en el código (comentarios XML, JSDoc, PLDoc) para facilitar el mantenimiento y generar documentación automática de APIs.

## 📝 Contexto
Tenemos código complejo en el núcleo de validación que nadie entiende del todo.
1. Un método C# `ValidarTransbordo` con mucha lógica de negocio.
2. Un paquete Oracle `PKG_VALIDACION` con procedimientos críticos.

Queremos documentarlos para que el IDE (Visual Studio) muestre ayuda inteligente (IntelliSense) a otros desarrolladores.

## 🔧 Pasos del Ejercicio

### Parte A: Documentación XML en C# (.NET)

**Paso 1:**
Abre el archivo `src/Metro.Validation.Service/ValidationService.cs` (o usa el código de ejemplo abajo).

```csharp
// Código SIN documentar
public ValidationResult ValidarTransbordo(int tarjetaId, int estacionId, DateTime tiempo)
{
    // ... lógica compleja ...
}
```

**Paso 2: Prompt a Copilot**
Selecciona el método y pide:

> "Genera comentarios de documentación XML para este método.
> Incluye:
> - `<summary>` explicando qué hace.
> - `<param>` para cada parámetro.
> - `<returns>` explicando el objeto resultado.
> - `<exception>` si la tarjeta no existe.
> - `<example>` con un caso de uso."

**Resultado Esperado:**
```csharp
/// <summary>
/// Valida si una operación de validación cuenta como transbordo gratuito
/// dentro de la ventana de tiempo permitida (45 min).
/// </summary>
/// <param name="tarjetaId">Identificador único de la tarjeta Barik.</param>
/// <param name="estacionId">ID de la estación donde se realiza el transbordo.</param>
/// <param name="tiempo">Marca de tiempo de la validación actual.</param>
/// <returns>
/// Un objeto <see cref="ValidationResult"/> indicando si es transbordo válido
/// y el tiempo restante de la ventana de transbordo.
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
