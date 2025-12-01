# Ejercicio 2: Conectar C# con Oracle

## 🎯 Objetivo
Aprender a usar Copilot para generar código que conecte aplicaciones C# con Oracle Database, sin ser experto en ninguna de las dos tecnologías.

---

## Parte A: Setup Inicial

### Paso 1: Instalar el paquete NuGet
Primero necesitamos el driver de Oracle para .NET.

**Prompt a Copilot:**
```
¿Qué paquete NuGet necesito para conectar C# con Oracle Database?
Dame el comando para instalarlo.
```

**Respuesta esperada:**
```bash
dotnet add package Oracle.ManagedDataAccess.Core
```

---

## Parte B: Código de Conexión Básico

### Paso 2: Generar clase de conexión

**Prompt a Copilot:**
```
Genera una clase C# llamada OracleConnection Helper que:

1. Tenga un método para conectarse a Oracle
2. Reciba el connection string como parámetro
3. Use try-catch para manejar errores de conexión
4. Devuelva true si conectó, false si falló
5. Escriba el error en consola si falla

Connection string de ejemplo:
"Data Source=localhost:1521/FREEPDB1;User Id=metro_user;Password=mypassword;"
```

**Código generado (ejemplo):**

```csharp
using System;
using Oracle.ManagedDataAccess.Client;

namespace Metro.DataAccess
{
    public class OracleConnectionHelper
    {
        private string _connectionString;

        public OracleConnectionHelper(string connectionString)
        {
            _connectionString = connectionString;
        }

        public bool TestConnection()
        {
            try
            {
                using (var connection = new OracleConnection(_connectionString))
                {
                    connection.Open();
                    Console.WriteLine("✓ Conexión exitosa a Oracle Database");
                    return true;
                }
            }
            catch (OracleException ex)
            {
                Console.WriteLine($"✗ Error de Oracle: {ex.Message}");
                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"✗ Error general: {ex.Message}");
                return false;
            }
        }
    }
}
```

---

## Parte C: Ejecutar un SELECT Simple

### Paso 3: Obtener datos de una tabla

**Prompt:**
```
Ahora genera un método GetBilletes() que:
1. Ejecute "SELECT ID, CODIGO, SALDO FROM BILLETES WHERE SALDO > 0"
2. Devuelva una lista de objetos Billete
3. Mapee cada fila del resultado a un objeto
4. Cierre la conexión correctamente (using)

Primero define la clase Billete con las propiedades necesarias.
```

**Código generado:**

```csharp
// Clase DTO (Data Transfer Object)
public class Billete
{
    public int Id { get; set; }
    public string Codigo { get; set; }
    public decimal Saldo { get; set; }
}

// Método de acceso a datos
public List<Billete> GetBilletes()
{
    var billetes = new List<Billete>();

    try
    {
        using (var connection = new OracleConnection(_connectionString))
        {
            connection.Open();
            
            string query = "SELECT ID, CODIGO, SALDO FROM BILLETES WHERE SALDO > 0";
            
            using (var command = new OracleCommand(query, connection))
            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    var billete = new Billete
                    {
                        Id = reader.GetInt32(0),           // Columna ID
                        Codigo = reader.GetString(1),      // Columna CODIGO
                        Saldo = reader.GetDecimal(2)       // Columna SALDO
                    };
                    billetes.Add(billete);
                }
            }
        }
        
        Console.WriteLine($"✓ Se obtuvieron {billetes.Count} billetes");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"✗ Error al obtener billetes: {ex.Message}");
    }

    return billetes;
}
```

---

## Parte D: Ejecutar un Procedimiento Almacenado

### Paso 4: Llamar al SP_VALIDAR_BILLETE

**Prompt:**
```
Genera un método C# ValidarBillete(int idBillete, int idEstacion) que:

1. Llame al procedimiento almacenado SP_VALIDAR_BILLETE
2. Pase los parámetros idBillete, idEstacion y la fecha actual
3. Reciba el parámetro OUT p_resultado
4. Devuelva el string resultado ('OK', 'SALDO_INSUFICIENTE', etc.)

Usa OracleParameter para los parámetros.
```

**Código generado:**

```csharp
public string ValidarBillete(int idBillete, int idEstacion)
{
    string resultado = "";

    try
    {
        using (var connection = new OracleConnection(_connectionString))
        {
            connection.Open();
            
            using (var command = new OracleCommand("SP_VALIDAR_BILLETE", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                
                // Parámetros de entrada
                command.Parameters.Add("p_id_billete", OracleDbType.Int32).Value = idBillete;
                command.Parameters.Add("p_id_estacion", OracleDbType.Int32).Value = idEstacion;
                command.Parameters.Add("p_fecha_hora", OracleDbType.Date).Value = DateTime.Now;
                
                // Parámetro de salida
                var paramResultado = new OracleParameter("p_resultado", OracleDbType.Varchar2, 50);
                paramResultado.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(paramResultado);
                
                // Ejecutar
                command.ExecuteNonQuery();
                
                // Obtener resultado
                resultado = paramResultado.Value.ToString();
                
                Console.WriteLine($"✓ Validación: {resultado}");
            }
        }
    }
    catch (Exception ex)
    {
        Console.WriteLine($"✗ Error al validar billete: {ex.Message}");
        resultado = "ERROR";
    }

    return resultado;
}
```

---

## Parte E: Programa de Prueba

### Paso 5: Probar todo junto

**Prompt:**
```
Genera un método Main() que:
1. Cree una instancia de OracleConnectionHelper
2. Pruebe la conexión
3. Obtenga la lista de billetes
4. Valide el billete con ID 1001 en la estación 5
5. Muestre todos los resultados en consola
```

**Código generado:**

```csharp
class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("=== Sistema Metro Bilbao - Prueba de Conexión ===\n");

        string connString = "Data Source=localhost:1521/FREEPDB1;User Id=metro_user;Password=MetroPass123;";
        var helper = new OracleConnectionHelper(connString);

        // 1. Probar conexión
        if (!helper.TestConnection())
        {
            Console.WriteLine("No se pudo conectar. Verifica Docker y connection string.");
            return;
        }

        Console.WriteLine();

        // 2. Obtener billetes
        Console.WriteLine("--- Listado de Billetes ---");
        var billetes = helper.GetBilletes();
        foreach (var b in billetes)
        {
            Console.WriteLine($"ID: {b.Id} | Código: {b.Codigo} | Saldo: {b.Saldo:C}");
        }

        Console.WriteLine();

        // 3. Validar un billete
        Console.WriteLine("--- Validando Billete 1001 ---");
        string resultado = helper.ValidarBillete(1001, 5);
        Console.WriteLine($"Resultado: {resultado}");

        Console.WriteLine("\nPresiona cualquier tecla para salir...");
        Console.ReadKey();
    }
}
```

---

## 💡 Tips Prácticos

### Si no tienes Oracle instalado:
- El código sigue siendo válido
- Úsalo como plantilla para cuando lo tengas
- Puedes mostrar el código sin ejecutarlo

### Errores comunes:
1. **"ORA-12541: TNS no listener"**
   → Oracle no está corriendo o el puerto es incorrecto
   
2. **"ORA-01017: invalid username/password"**
   → Verifica user y password en el connection string

3. **"Could not load file Oracle.ManagedDataAccess"**
   → Instalar el paquete NuGet

### Para debuggear:
Pregunta a Copilot:
```
¿Qué significa este error de Oracle: [pegar el mensaje]?
```

### Siguiente nivel:
Una vez que funcione, pide a Copilot:
```
Convierte este código en un patrón Repository con una interfaz.
```
