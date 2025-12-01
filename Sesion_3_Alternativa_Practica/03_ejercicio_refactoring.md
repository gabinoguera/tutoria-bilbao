# Ejercicio 3: Refactoring y Debugging con Copilot

## 🎯 Objetivo
Usar Copilot para mejorar código legacy, encontrar bugs y hacer el código más mantenible.

---

## Parte A: Refactorizar un Método Complejo

### Escenario
Tienes un método largo con demasiada lógica mezclada. Es difícil de entender y probar.

### Código Original (Ejemplo)

```csharp
public string ProcesarValidacion(int billeteId, int estacionId)
{
    var conn = new OracleConnection(connString);
    conn.Open();
    var cmd = new OracleCommand("SELECT SALDO, TIPO, FECHA_EXP FROM BILLETES WHERE ID=" + billeteId, conn);
    var reader = cmd.ExecuteReader();
    if (reader.Read())
    {
        decimal saldo = reader.GetDecimal(0);
        string tipo = reader.GetString(1);
        DateTime exp = reader.GetDateTime(2);
        if (exp < DateTime.Now)
        {
            return "EXPIRADO";
        }
        decimal tarifa = 1.50m;
        if (tipo == "JOVEN") tarifa = 0.75m;
        if (tipo == "JUBILADO") tarifa = 0.40m;
        if (saldo < tarifa)
        {
            return "SALDO_INSUFICIENTE";
        }
        var cmd2 = new OracleCommand("UPDATE BILLETES SET SALDO=SALDO-" + tarifa + " WHERE ID=" + billeteId, conn);
        cmd2.ExecuteNonQuery();
        var cmd3 = new OracleCommand("INSERT INTO HISTORICO VALUES (" + billeteId + "," + estacionId + ",SYSDATE," + tarifa + ")", conn);
        cmd3.ExecuteNonQuery();
        conn.Close();
        return "OK";
    }
    conn.Close();
    return "NO_EXISTE";
}
```

### Paso 1: Pedir a Copilot que identifique problemas

**Prompt:**
```
Analiza este código C# y lista todos los problemas que encuentres:
- Seguridad
- Rendimiento
- Mantenibilidad
- Buenas prácticas

[Pegar el código]
```

**Respuesta esperada de Copilot:**
```
Problemas identificados:

1. 🔴 CRÍTICO - SQL Injection: Concatenación directa de valores en queries
2. 🔴 CRÍTICO - Conexión no cerrada en caso de error (falta using o try-finally)
3. ⚠️ ALTO - Método hace demasiadas cosas (viola Single Responsibility)
4. ⚠️ MEDIO - Magic numbers (1.50, 0.75, 0.40) hardcodeados
5. ⚠️ MEDIO - No hay manejo de excepciones
6. ⚠️ BAJO - Nombres de variables poco descriptivos (cmd2, cmd3)
```

### Paso 2: Refactorizar con Copilot

**Prompt:**
```
Refactoriza este código siguiendo estas reglas:

1. Usa parámetros SQL para evitar injection
2. Separa la lógica en métodos pequeños (ObtenerBillete, ValidarBillete, DescontarSaldo, RegistrarHistorico)
3. Extrae las tarifas a una clase de constantes o diccionario
4. Usa using para las conexiones
5. Añade try-catch adecuados
6. Devuelve un objeto ValidationResult en lugar de string
```

**Código Refactorizado (Ejemplo):**

```csharp
// Clase de resultado
public class ValidationResult
{
    public bool Success { get; set; }
    public string Message { get; set; }
    public string ErrorCode { get; set; }
}

// Clase de tarifas
public static class TarifasConfig
{
    public static readonly Dictionary<string, decimal> Tarifas = new()
    {
        { "NORMAL", 1.50m },
        { "JOVEN", 0.75m },
        { "JUBILADO", 0.40m }
    };
}

// Clase refactorizada
public class ValidacionService
{
    private readonly string _connectionString;

    public ValidacionService(string connectionString)
    {
        _connectionString = connectionString;
    }

    public ValidationResult ProcesarValidacion(int billeteId, int estacionId)
    {
        try
        {
            using var connection = new OracleConnection(_connectionString);
            connection.Open();

            var billete = ObtenerBillete(connection, billeteId);
            if (billete == null)
                return Failure("NO_EXISTE", "El billete no existe");

            var validacion = ValidarBillete(billete);
            if (!validacion.Success)
                return validacion;

            var tarifa = ObtenerTarifa(billete.Tipo);

            DescontarSaldo(connection, billeteId, tarifa);
            RegistrarHistorico(connection, billeteId, estacionId, tarifa);

            return Success("Validación exitosa");
        }
        catch (Exception ex)
        {
            return Failure("ERROR", $"Error en validación: {ex.Message}");
        }
    }

    private BilleteDto ObtenerBillete(OracleConnection conn, int billeteId)
    {
        const string query = "SELECT SALDO, TIPO, FECHA_EXP FROM BILLETES WHERE ID = :id";
        
        using var cmd = new OracleCommand(query, conn);
        cmd.Parameters.Add("id", OracleDbType.Int32).Value = billeteId;
        
        using var reader = cmd.ExecuteReader();
        
        if (reader.Read())
        {
            return new BilleteDto
            {
                Saldo = reader.GetDecimal(0),
                Tipo = reader.GetString(1),
                FechaExpiracion = reader.GetDateTime(2)
            };
        }
        
        return null;
    }

    private ValidationResult ValidarBillete(BilleteDto billete)
    {
        if (billete.FechaExpiracion < DateTime.Now)
            return Failure("EXPIRADO", "El billete ha expirado");

        var tarifa = ObtenerTarifa(billete.Tipo);
        
        if (billete.Saldo < tarifa)
            return Failure("SALDO_INSUFICIENTE", "Saldo insuficiente");

        return Success("");
    }

    private decimal ObtenerTarifa(string tipoBillete)
    {
        return TarifasConfig.Tarifas.GetValueOrDefault(tipoBillete, TarifasConfig.Tarifas["NORMAL"]);
    }

    private void DescontarSaldo(OracleConnection conn, int billeteId, decimal importe)
    {
        const string query = "UPDATE BILLETES SET SALDO = SALDO - :importe WHERE ID = :id";
        
        using var cmd = new OracleCommand(query, conn);
        cmd.Parameters.Add("importe", OracleDbType.Decimal).Value = importe;
        cmd.Parameters.Add("id", OracleDbType.Int32).Value = billeteId;
        cmd.ExecuteNonQuery();
    }

    private void RegistrarHistorico(OracleConnection conn, int billeteId, int estacionId, decimal importe)
    {
        const string query = @"INSERT INTO HISTORICO (BILLETE_ID, ESTACION_ID, FECHA, IMPORTE) 
                               VALUES (:billeteId, :estacionId, SYSDATE, :importe)";
        
        using var cmd = new OracleCommand(query, conn);
        cmd.Parameters.Add("billeteId", OracleDbType.Int32).Value = billeteId;
        cmd.Parameters.Add("estacionId", OracleDbType.Int32).Value = estacionId;
        cmd.Parameters.Add("importe", OracleDbType.Decimal).Value = importe;
        cmd.ExecuteNonQuery();
    }

    private ValidationResult Success(string message) => 
        new() { Success = true, Message = message };

    private ValidationResult Failure(string code, string message) => 
        new() { Success = false, ErrorCode = code, Message = message };
}

// DTO
public class BilleteDto
{
    public decimal Saldo { get; set; }
    public string Tipo { get; set; }
    public DateTime FechaExpiracion { get; set; }
}
```

---

## Parte B: Generar Tests Unitarios

### Paso 3: Crear tests con Copilot

**Prompt:**
```
Genera tests unitarios usando xUnit para el método ValidarBillete.

Casos de prueba:
1. Billete expirado → debe devolver "EXPIRADO"
2. Saldo insuficiente → debe devolver "SALDO_INSUFICIENTE"
3. Billete válido → debe devolver Success

Usa Moq para mockear la base de datos.
```

**Tests Generados:**

```csharp
using Xunit;
using Moq;

public class ValidacionServiceTests
{
    [Fact]
    public void ValidarBillete_BilleteExpirado_DebeRetornarExpirado()
    {
        // Arrange
        var billete = new BilleteDto
        {
            Saldo = 10.0m,
            Tipo = "NORMAL",
            FechaExpiracion = DateTime.Now.AddDays(-1) // Ayer
        };

        var service = new ValidacionService("fake_connection");

        // Act
        var result = service.ValidarBillete(billete);

        // Assert
        Assert.False(result.Success);
        Assert.Equal("EXPIRADO", result.ErrorCode);
    }

    [Fact]
    public void ValidarBillete_SaldoInsuficiente_DebeRetornarError()
    {
        // Arrange
        var billete = new BilleteDto
        {
            Saldo = 1.0m, // Menos de 1.50
            Tipo = "NORMAL",
            FechaExpiracion = DateTime.Now.AddDays(30)
        };

        var service = new ValidacionService("fake_connection");

        // Act
        var result = service.ValidarBillete(billete);

        // Assert
        Assert.False(result.Success);
        Assert.Equal("SALDO_INSUFICIENTE", result.ErrorCode);
    }

    [Fact]
    public void ValidarBillete_BilleteValido_DebeRetornarSuccess()
    {
        // Arrange
        var billete = new BilleteDto
        {
            Saldo = 10.0m,
            Tipo = "NORMAL",
            FechaExpiracion = DateTime.Now.AddDays(30)
        };

        var service = new ValidacionService("fake_connection");

        // Act
        var result = service.ValidarBillete(billete);

        // Assert
        Assert.True(result.Success);
    }
}
```

---

## Parte C: Debugging con Copilot

### Escenario: Código con bug oculto

```csharp
public decimal CalcularDescuento(decimal precio, int porcentaje)
{
    return precio - (precio * porcentaje / 100);
}

// Uso:
var precioFinal = CalcularDescuento(100, 20); // Esperado: 80
```

**Prompt:**
```
Este código a veces da resultados incorrectos. ¿Ves algún problema?
```

**Copilot responde:**
```
Problema: División entera

Si 'porcentaje' es int y el resultado de 'precio * porcentaje' también,
la división /100 se hace con enteros y pierde decimales.

Ejemplo: precio=100, porcentaje=15
→ 100 * 15 = 1500
→ 1500 / 100 = 15 (correcto)

Pero: precio=50.75, porcentaje=15
→ Si precio se trunca, el cálculo falla

Solución: Convertir a decimal:
return precio - (precio * porcentaje / 100.0m);
```

---

## 💡 Resumen

**Copilot te ayuda a:**
- ✅ Identificar code smells y anti-patterns
- ✅ Refactorizar código legacy de forma segura
- ✅ Generar tests automáticamente
- ✅ Encontrar bugs que no ves a simple vista

**Recuerda:**
- Copilot sugiere, tú validas
- No es infalible, pero acelera el proceso
- Ideal para código que "funciona pero da miedo tocar"
