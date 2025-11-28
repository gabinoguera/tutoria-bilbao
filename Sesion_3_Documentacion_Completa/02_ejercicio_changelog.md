# Ejercicio 1: Generación de CHANGELOG

## 🎯 Objetivo
Aprender a generar un historial de cambios (CHANGELOG) profesional y legible automáticamente a partir del análisis de código y commits, ahorrando horas de redacción manual al final de un sprint o release.

## 📝 Contexto
Acabamos de terminar el **Sprint 24** del sistema de validación de Metro Bilbao. Se han realizado cambios importantes en:
1. La lógica de cálculo de tarifas (C#).
2. Los procedimientos almacenados de validación (Oracle).
3. Se corrigió un bug crítico en la validación de tarjetas caducadas.

Necesitamos generar el archivo `CHANGELOG.md` para entregar al cliente.

## 🔧 Pasos del Ejercicio

### Paso 1: Analizar los cambios
Abre el archivo `src/Metro.Validation.Service/TarifasService.cs` (o el ejemplo proporcionado). Observa que hay nuevos métodos para "Tarifas Fin de Semana".

### Paso 2: Prompt a Copilot
Abre Copilot Chat y usa el siguiente prompt (ajústalo según necesites):

> "Actúa como un Technical Writer. Analiza los cambios recientes en el código de `TarifasService.cs` y genera una entrada para el archivo CHANGELOG.md.
>
> Usa el formato 'Keep a Changelog'.
> Agrupa los cambios en:
> - 🚀 Added (Nuevas funcionalidades)
> - 🐛 Fixed (Correcciones de errores)
> - ⚠️ Changed (Cambios en comportamiento existente)
>
> Versión: 2.1.0
> Fecha: Hoy"

### Paso 3: Refinar el resultado
Es probable que Copilot genere algo genérico. Pídele que sea más específico con el lenguaje de negocio:

> "Reescribe los puntos usando terminología de Metro Bilbao: usa 'Validación en torniquete' en lugar de 'check-in', y 'Título de transporte' en lugar de 'ticket'."

### Paso 4: Incorporar cambios de Base de Datos
Ahora, dile que también considere los cambios en el script SQL:

> "Añade a la sección 'Changed' que se modificó el procedimiento `SP_CALCULAR_SALDO` para optimizar el rendimiento en un 40%."

### 💡 Resultado Esperado (Ejemplo)

```markdown
## [2.1.0] - 2025-11-28

### 🚀 Added
- Nueva lógica de **Tarifas Fin de Semana** en `TarifasService`.
- Soporte para títulos de transporte temporales (24h).

### ⚠️ Changed
- Optimización del procedimiento `SP_CALCULAR_SALDO` (Oracle): reducción de tiempo de ejecución de 500ms a 300ms.
- Actualización de la entidad `Billete` para incluir campo `UltimaValidacion`.

### 🐛 Fixed
- Error que permitía validar tarjetas caducadas si el saldo era positivo.
- Corrección en el redondeo de céntimos en recargas web.
```

## 🧠 Reto Adicional
Si tienes acceso al historial de git (en Codespaces), intenta generar el changelog basándote en los commits reales:

> "@workspace Analiza los commits de la última semana y genera el CHANGELOG resumen."
