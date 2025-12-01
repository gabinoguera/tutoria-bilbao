# Casos de Uso Rápidos con Copilot

## 🎯 Objetivo
Mostrar cómo Copilot acelera tareas cotidianas repetitivas que todos hacemos.

---

## Caso 1: Generar DTOs desde Tablas Oracle

### Escenario
Tienes una tabla en Oracle y necesitas crear la clase C# equivalente.

**Tabla Oracle:**
```sql
CREATE TABLE ESTACIONES (
    ID NUMBER PRIMARY KEY,
    CODIGO VARCHAR2(10) NOT NULL,
    NOMBRE VARCHAR2(100),
    LINEA VARCHAR2(50),
    ZONA NUMBER,
    ACTIVA NUMBER(1) DEFAULT 1,
    FECHA_APERTURA DATE
);
```

**Prompt a Copilot:**
```
Convierte esta definición de tabla Oracle a una clase C# (DTO).

Usa anotaciones de datos para:
- [Key] en el ID
- [Required] en campos NOT NULL
- [MaxLength] en VARCHAR

Convierte NUMBER a int, NUMBER(1) a bool, DATE a DateTime
```

**Resultado:**
```csharp
using System;
using System.ComponentModel.DataAnnotations;

public class Estacion
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(10)]
    public string Codigo { get; set; }

    [MaxLength(100)]
    public string Nombre { get; set; }

    [MaxLength(50)]
    public string Linea { get; set; }

    public int? Zona { get; set; }

    public bool Activa { get; set; } = true;

    public DateTime? FechaApertura { get; set; }
}
```

---

## Caso 2: Convertir VB.NET a C#

### Escenario
Tienes código legacy en Visual Basic que necesitas migrar a C#.

**Código VB.NET:**
```vb
Public Function CalcularTarifa(origen As Integer, destino As Integer) As Decimal
    Dim zonas As Integer = Math.Abs(destino - origen)
    
    If zonas = 0 Then
        Return 1.50D
    ElseIf zonas = 1 Then
        Return 1.80D
    Else
        Return 2.20D
    End If
End Function
```

**Prompt:**
```
Convierte este código VB.NET a C#:

[Pegar código VB]
```

**Resultado:**
```csharp
public decimal CalcularTarifa(int origen, int destino)
{
    int zonas = Math.Abs(destino - origen);
    
    if (zonas == 0)
    {
        return 1.50m;
    }
    else if (zonas == 1)
    {
        return 1.80m;
    }
    else
    {
        return 2.20m;
    }
}
```

**Mejorar aún más:**
```
Ahora mejora este código usando un switch expression de C# moderno.
```

**Resultado optimizado:**
```csharp
public decimal CalcularTarifa(int origen, int destino) =>
    Math.Abs(destino - origen) switch
    {
        0 => 1.50m,
        1 => 1.80m,
        _ => 2.20m
    };
```

---

## Caso 3: Validaciones de Negocio

### Escenario
Necesitas validar datos de entrada antes de procesarlos.

**Prompt:**
```
Genera una clase ValidadorBillete que valide:

1. Código del billete: exactamente 8 caracteres alfanuméricos
2. Saldo: mayor que 0 y menor que 100
3. Fecha expiración: no puede ser en el pasado

Devuelve una lista de errores. Si está todo OK, lista vacía.

Usa expresiones regulares para el código.
```

**Resultado:**
```csharp
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class ValidadorBillete
{
    public List<string> Validar(string codigo, decimal saldo, DateTime fechaExpiracion)
    {
        var errores = new List<string>();

        // Validar código
        if (string.IsNullOrWhiteSpace(codigo))
        {
            errores.Add("El código no puede estar vacío");
        }
        else if (!Regex.IsMatch(codigo, @"^[A-Za-z0-9]{8}$"))
        {
            errores.Add("El código debe tener 8 caracteres alfanuméricos");
        }

        // Validar saldo
        if (saldo <= 0)
        {
            errores.Add("El saldo debe ser mayor a 0");
        }
        else if (saldo > 100)
        {
            errores.Add("El saldo no puede exceder 100€");
        }

        // Validar fecha
        if (fechaExpiracion < DateTime.Now)
        {
            errores.Add("La fecha de expiración no puede estar en el pasado");
        }

        return errores;
    }
}
```

**Uso:**
```csharp
var validador = new ValidadorBillete();
var errores = validador.Validar("ABC12345", 50.0m, DateTime.Now.AddMonths(6));

if (errores.Count > 0)
{
    foreach (var error in errores)
        Console.WriteLine($"✗ {error}");
}
else
{
    Console.WriteLine("✓ Validación OK");
}
```

---

## Caso 4: Generar Queries Dinámicos

### Escenario
Necesitas construir queries Oracle con filtros opcionales.

**Prompt:**
```
Genera un método C# que construya un query SELECT dinámico para la tabla BILLETES.

Filtros opcionales (si vienen null, no se aplican):
- codigo: LIKE
- saldoMinimo: mayor o igual
- tipoUsuario: igual
- soloActivos: WHERE ACTIVO = 1

Usa StringBuilder y parámetros SQL (no concatenación).
```

**Resultado:**
```csharp
using System.Text;
using Oracle.ManagedDataAccess.Client;

public class QueryBuilder
{
    public OracleCommand BuildBilleteQuery(
        OracleConnection connection,
        string codigo = null,
        decimal? saldoMinimo = null,
        string tipoUsuario = null,
        bool soloActivos = false)
    {
        var query = new StringBuilder("SELECT * FROM BILLETES WHERE 1=1");
        var command = new OracleCommand { Connection = connection };

        if (!string.IsNullOrEmpty(codigo))
        {
            query.Append(" AND CODIGO LIKE :codigo");
            command.Parameters.Add("codigo", OracleDbType.Varchar2).Value = $"%{codigo}%";
        }

        if (saldoMinimo.HasValue)
        {
            query.Append(" AND SALDO >= :saldoMinimo");
            command.Parameters.Add("saldoMinimo", OracleDbType.Decimal).Value = saldoMinimo.Value;
        }

        if (!string.IsNullOrEmpty(tipoUsuario))
        {
            query.Append(" AND TIPO_USUARIO = :tipoUsuario");
            command.Parameters.Add("tipoUsuario", OracleDbType.Varchar2).Value = tipoUsuario;
        }

        if (soloActivos)
        {
            query.Append(" AND ACTIVO = 1");
        }

        command.CommandText = query.ToString();
        return command;
    }
}
```

---

## Caso 5: Mapeo Automático de DataReader a Objeto

### Escenario
Cansado de escribir `reader.GetString(0)`, `reader.GetInt32(1)`, etc.

**Prompt:**
```
Genera un método genérico MapTo<T> que tome un OracleDataReader y lo convierta automáticamente a un objeto T usando reflection.

Las propiedades del objeto deben coincidir con los nombres de las columnas.
```

**Resultado (simplificado):**
```csharp
using System;
using System.Reflection;
using Oracle.ManagedDataAccess.Client;

public static class DataReaderExtensions
{
    public static T MapTo<T>(this OracleDataReader reader) where T : new()
    {
        var obj = new T();
        var properties = typeof(T).GetProperties();

        foreach (var prop in properties)
        {
            try
            {
                var columnName = prop.Name.ToUpper();
                var ordinal = reader.GetOrdinal(columnName);
                
                if (!reader.IsDBNull(ordinal))
                {
                    var value = reader.GetValue(ordinal);
                    prop.SetValue(obj, Convert.ChangeType(value, prop.PropertyType));
                }
            }
            catch
            {
                // Columna no encontrada o error de conversión, skip
            }
        }

        return obj;
    }
}
```

**Uso:**
```csharp
using (var reader = command.ExecuteReader())
{
    while (reader.Read())
    {
        var billete = reader.MapTo<Billete>(); // ¡Magia!
        billetes.Add(billete);
    }
}
```

---

## Caso 6: Logging y Auditoría

**Prompt:**
```
Genera una clase AuditLogger que registre operaciones en una tabla AUDIT_LOG.

Campos: usuario, accion, tabla_afectada, fecha_hora, ip_origen

Debe tener métodos: LogInsert, LogUpdate, LogDelete
```

**Uso común:**
Copilot generará código que puedes integrar fácilmente en tu app para cumplir con requerimientos de auditoría.

---

## 💡 Patrón Común

Para TODOS estos casos:

1. **Describe** lo que necesitas en lenguaje natural
2. **Especifica** detalles técnicos (nombres de tablas, tipos de datos)
3. **Itera** si no te convence el primer resultado
4. **Adapta** el código generado a tu contexto específico

**Tiempo ahorrado:** De 30-60 min a 2-3 min por tarea
