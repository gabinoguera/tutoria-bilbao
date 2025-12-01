# Guion Práctico - Sesión SC6
## Copilot para el Trabajo Diario: Oracle + C#

**Perfil:** Desarrolladores Senior (Metro Bilbao)  
**Stack Real:** Visual Studio 2022, C#, Oracle, scripts complejos  
**Duración:** 90 minutos  
**Enfoque:** Casos de uso reales, menos teoría

---

## 🎯 Objetivos Prácticos

Al finalizar esta sesión, los participantes sabrán usar Copilot para:
1. **Escribir y entender** scripts Oracle complejos (procedimientos, funciones, queries)
2. **Conectar C# con Oracle** y generar código de acceso a datos
3. **Refactorizar y debuggear** código legacy en C#
4. **Automatizar tareas repetitivas** (generación de DTOs, mapeos, etc.)

---

## 📋 Estructura (90 minutos)

| Tiempo | Tema | Qué hacemos |
|--------|------|-------------|
| 10 min | **Intro rápida** | Copilot en VS 2022, diferencias con VS Code |
| 20 min | **Oracle: Scripts y Procedimientos** | Generar, explicar y optimizar SQL/PL-SQL |
| 25 min | **C# ↔ Oracle: Conexión práctica** | Código para conectar, ejecutar queries, mapear resultados |
| 20 min | **Refactoring y Debug con Copilot** | Mejorar código legacy, encontrar bugs |
| 10 min | **Casos de Uso Rápidos** | DTOs, validaciones, conversiones |
| 5 min | **Cierre y Q&A** | Próximos pasos |

---

## 📝 Desarrollo de la Sesión

### BLOQUE 1: Introducción (10 min)

**Mensaje clave:** *"Copilot no es magia, es un autocomplete muy inteligente que conoce Oracle y C#"*

**Demo rápida:**
1. Abrir Visual Studio 2022 (o VS Code como alternativa para mostrar)
2. Mostrar GitHub Copilot Chat (View → GitHub Copilot Chat)
3. Hacer una pregunta simple: 
   > "¿Cómo conecto C# con Oracle Database?"

**Mostrar las 3 formas de usar Copilot:**
- **Inline suggestions** (autocompletar mientras escribes)
- **Copilot Chat** (hacer preguntas, explicar código)
- **Slash commands** (/explain, /fix, /doc)

---

### BLOQUE 2: Oracle - Scripts y Procedimientos (20 min)

**Escenario Real:** Necesitamos un procedimiento almacenado que valide billetes y actualice el historial.

#### Ejercicio 1: Generar procedimiento desde descripción

**Prompt:**
```
Contexto: Sistema de validación de billetes de Metro Bilbao.

Genera un procedimiento almacenado en Oracle PL/SQL que:
1. Reciba como parámetros: id_billete, id_estacion, fecha_hora
2. Valide que el billete existe y tiene saldo suficiente
3. Descuente 1.50€ del saldo
4. Inserte un registro en la tabla HISTORICO_VALIDACIONES
5. Devuelva 'OK' si todo bien, 'SALDO_INSUFICIENTE' o 'BILLETE_NO_EXISTE' si hay error

Usa manejo de excepciones y transacciones.
```

**Resultado esperado:** Un procedimiento completo y funcional.

#### Ejercicio 2: Explicar un script complejo

**Prompt:**
```
Explica línea por línea qué hace este código SQL:

[Pegar un JOIN complejo o un cursor que tengan en su código real]
```

**Valor:** Copilot actúa como mentor, explicando en lenguaje natural.

#### Ejercicio 3: Optimizar una query lenta

**Prompt:**
```
Esta query tarda 5 segundos en ejecutarse. ¿Cómo puedo optimizarla?

[Pegar query problemática]

Sugerencias: Revisa índices, JOINs innecesarios, subconsultas.
```

**Archivo de trabajo:** `01_ejercicio_oracle.md`

---

### BLOQUE 3: C# ↔ Oracle - Conexión Práctica (25 min)

**Escenario:** Necesitamos conectarnos a Oracle desde una aplicación C# y ejecutar consultas.

#### Ejercicio 4: Setup de conexión

**Prompt a Copilot:**
```
Genera código C# para conectarme a Oracle Database usando Oracle.ManagedDataAccess.

Incluye:
1. El código de conexión con try-catch
2. Cómo ejecutar un SELECT simple
3. Cómo llamar a un procedimiento almacenado
4. Cómo mapear los resultados a objetos C#

ConnectionString: "Data Source=localhost:1521/FREEPDB1;User Id=metro_user;Password=***"
```

**Resultado esperado:**
```csharp
// Código funcional de conexión, query y mapeo
using Oracle.ManagedDataAccess.Client;

public class OracleRepository
{
    private string connectionString = "...";
    
    public List<Billete> ObtenerBilletes()
    {
        var billetes = new List<Billete>();
        
        using (var conn = new OracleConnection(connectionString))
        {
            conn.Open();
            var cmd = new OracleCommand("SELECT * FROM BILLETES", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    billetes.Add(new Billete
                    {
                        Id = reader.GetInt32(0),
                        Codigo = reader.GetString(1),
                        Saldo = reader.GetDecimal(2)
                    });
                }
            }
        }
        
        return billetes;
    }
}
```

#### Ejercicio 5: Ejecutar procedimiento almacenado desde C#

**Prompt:**
```
Ahora muéstrame cómo llamar al procedimiento SP_VALIDAR_BILLETE desde C#, 
pasándole los parámetros y recibiendo el resultado.
```

**Archivo de trabajo:** `02_ejercicio_csharp_oracle.md`

---

### BLOQUE 4: Refactoring y Debug (20 min)

**Escenario:** Tenemos código legacy que funciona pero es difícil de mantener.

#### Ejercicio 6: Refactorizar método complejo

**Seleccionar un método largo** (puede ser de ejemplo o uno real que ellos traigan).

**Prompt:**
```
/fix Este método tiene demasiada lógica mezclada. 
Refactorízalo en métodos más pequeños y con nombres descriptivos.
```

#### Ejercicio 7: Encontrar bugs

**Prompt:**
```
Revisa este código y dime si ves algún problema potencial:
- Memory leaks
- Excepciones no manejadas
- SQL injection
- Problemas de concurrencia
```

#### Ejercicio 8: Generar tests unitarios

**Prompt:**
```
Genera tests unitarios usando xUnit para el método ValidarBillete.
Casos a probar:
- Billete válido con saldo suficiente
- Billete sin saldo
- Billete inexistente
- Excepción de conexión a BD
```

**Archivo de trabajo:** `03_ejercicio_refactoring.md`

---

### BLOQUE 5: Casos de Uso Rápidos (10 min)

Mostrar casos comunes del día a día:

#### 1. Generar DTOs desde tabla Oracle
**Prompt:**
```
Tengo esta tabla Oracle:

CREATE TABLE BILLETES (
    ID NUMBER PRIMARY KEY,
    CODIGO VARCHAR2(50),
    SALDO NUMBER(10,2),
    FECHA_EXPIRACION DATE
);

Genera una clase C# (DTO) que mapee esta tabla.
```

#### 2. Convertir código VB.NET a C#
**Prompt:**
```
Convierte este código VB.NET a C#:

[Pegar código VB]
```

#### 3. Generar código de validación
**Prompt:**
```
Genera un método C# que valide:
- El código del billete tiene formato válido (8 caracteres alfanuméricos)
- La fecha de expiración no ha pasado
- El saldo es mayor a 0

Devuelve una lista de errores de validación.
```

**Archivo de trabajo:** `04_casos_uso_rapidos.md`

---

### BLOQUE 6: Cierre (5 min)

**Recap:**
- Copilot puede generar código Oracle y C# desde cero
- Explica código complejo que no entendemos
- Ayuda a conectar tecnologías (C# ↔ Oracle)
- Acelera tareas repetitivas (DTOs, validaciones)

**Tarea práctica:**
"Prueben esta semana usar Copilot para:
1. Explicar un script Oracle que no entienden del todo
2. Generar una clase C# de acceso a datos
3. Refactorizar un método largo"

**Próxima sesión:** Testing automático y análisis de vulnerabilidades

---

## 🛠️ Setup Técnico (Para el instructor)

### Requisitos mínimos:
- Visual Studio Code (más fácil de configurar que VS 2022 para demo)
- GitHub Copilot activo
- Docker con Oracle Database Free (opcional, se puede simular)
- .NET SDK 8.0

### Si no tienes Oracle funcionando:
- Puedes hacer los ejercicios "en seco" (escribir código sin ejecutar)
- Copilot genera código válido sin necesidad de conexión real
- Enfatizar: "Ustedes lo probarán en su entorno real con sus datos"

### Archivos de ejemplo:
- `ejemplos/oracle/` → Scripts SQL de ejemplo
- `ejemplos/csharp/` → Clases C# base para refactorizar
- `ejemplos/conexion/` → Código de conexión C# ↔ Oracle

---

## 💡 Consejos para la Sesión

### Si preguntan sobre VS 2022 vs VS Code:
"Copilot funciona igual en ambos. En VS 2022 el Chat está en View → GitHub Copilot Chat. 
Las sugerencias inline son idénticas."

### Si no dominas Oracle:
"No necesito ser experto en Oracle, Copilot lo es por mí. 
Ustedes validan si el código generado tiene sentido en su contexto."

### Si algo no funciona:
"Copilot a veces se equivoca. Por eso es importante revisar el código.
Pero incluso cuando falla, da una base para iterar."

### Engagement:
- Preguntar: "¿Alguien tiene un script complejo que quiera que expliquemos con Copilot?"
- Usar ejemplos REALES de ellos si los comparten
- Ser honesto: "No sé Oracle a fondo, pero Copilot sí, y eso es lo poderoso"
