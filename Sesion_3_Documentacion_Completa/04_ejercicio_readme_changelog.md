# Ejercicio 4: Documentación de Proyecto (README y CHANGELOG)

## 🎯 Objetivo
Cerrar el ciclo de desarrollo creando la documentación que "vende" y mantiene el proyecto: un README profesional para nuevos desarrolladores y un CHANGELOG para el control de versiones.

---

## Parte A: El README Profesional

**Contexto:**
El proyecto "Metro Bilbao Validation Core" ha crecido. Tiene backend .NET, Oracle en Docker y scripts específicos. Un nuevo senior entra mañana y necesita arrancar sin ayuda.

**Pasos:**

1. **Crear Archivo:** Crea un `README.md` vacío.
2. **Prompt Estructural:**
   > "Genera un README.md profesional para el proyecto 'Metro Bilbao Validation Core'.
   > Stack: .NET 8, Oracle 23c (Docker), VS Code.
   > Secciones: Título, Requisitos, Setup (mencionar usuario 'metro_user'), Ejecución y Tests."
3. **Diagrama de Arquitectura (Mermaid):**
   > "Añade una sección 'Arquitectura' con un diagrama de secuencia Mermaid: Usuario -> Torniquete -> API .NET -> Oracle DB (Validar Saldo) -> Respuesta."
4. **Troubleshooting:**
   > "Añade una sección de 'Troubleshooting' con errores comunes como ORA-12541 (Listener) y problemas de ConnectionString."

---

## Parte B: CHANGELOG Automático

**Contexto:**
Entregamos la versión 2.1.0. Hubo cambios en `TarifasService.cs` (nuevas tarifas) y optimizaciones en Oracle.

**Pasos:**

1. **Prompt de Análisis (Role Prompting):**
   > "Actúa como un Technical Writer. Analiza el código de `TarifasService.cs` y genera una entrada para CHANGELOG.md (formato 'Keep a Changelog').
   > Versión: 2.1.0.
   > Categorías: Added, Changed, Fixed."
2. **Refinamiento de Negocio:**
   > "Reescribe los puntos usando terminología de Metro Bilbao: usa 'Título de transporte' en vez de 'ticket' y 'Validación' en vez de 'check-in'."
3. **Integración Manual (Simulada):**
   > "Añade manualmente a la sección 'Changed' que se optimizó el SP `SP_CALCULAR_SALDO` reduciendo la latencia un 40%."

---

## 💡 Resultado Esperado (Fragmento CHANGELOG)

```markdown
## [2.1.0] - 2025-12-01

### 🚀 Added
- Nueva lógica de **Tarifas Fin de Semana** en `TarifasService`.

### ⚠️ Changed
- Optimización del procedimiento `SP_CALCULAR_SALDO` (Oracle).

### 🐛 Fixed
- Error crítico en validación de tarjetas caducadas.
```
