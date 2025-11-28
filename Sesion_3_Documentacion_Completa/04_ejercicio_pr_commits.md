# Ejercicio 3: Pull Requests y Commits Semánticos

## 🎯 Objetivo
Mejorar la calidad del historial de versiones y facilitar la revisión de código (Code Review) mediante mensajes de commit estandarizados y descripciones de Pull Request (PR) generadas por IA.

## 📝 Contexto
Has implementado una nueva funcionalidad crítica: **"Descuento automático para familias numerosas"**.
Esto implicó cambios en:
1. `TarifasService.cs` (Lógica de negocio)
2. `ITarifasRepository.cs` (Interfaz)
3. `pkg_descuentos.sql` (Base de datos)

Ahora debes subir tus cambios y crear un PR para que tu Tech Lead lo revise.

## 🔧 Pasos del Ejercicio

### Parte A: Commits Semánticos (Conventional Commits)

El estándar "Conventional Commits" ayuda a automatizar changelogs y versionado.
Formatos: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`.

**Paso 1:**
Imagina que acabas de modificar `TarifasService.cs`.

**Paso 2: Prompt a Copilot**
> "Genera un mensaje de commit siguiendo la convención 'Conventional Commits' para los siguientes cambios:
> - Se agregó método `CalcularDescuentoFamiliaNumerosa`
> - Se actualizó la validación para comprobar caducidad del carnet de familia numerosa"

**Resultado esperado:**
```text
feat(tarifas): implementar descuento familia numerosa y validación de carnet

- Agregar método CalcularDescuentoFamiliaNumerosa en TarifasService
- Validar fecha de caducidad del carnet antes de aplicar descuento
```

### Parte B: Descripción de Pull Request (PR)

Un buen PR explica el QUÉ, el POR QUÉ y el CÓMO.

**Paso 1: Prompt a Copilot**
Copia el siguiente prompt en el chat:

> "Escribe una descripción para un Pull Request que implementa los descuentos de familia numerosa.
>
> Incluye las siguientes secciones:
> 1. 🎯 Resumen de cambios
> 2. 🧪 Cómo probarlo (paso a paso)
> 3. ⚠️ Impacto / Riesgos
> 4. ✅ Checklist de revisión
>
> Detalles técnicos:
> - Requiere ejecutar script `update_tarifas_schema.sql`
> - Afecta al cálculo final del precio del viaje"

**Paso 2: Refinar**
Pide a Copilot que añada una tabla comparativa de precios antes/después para facilitar la revisión.

> "Añade una tabla de ejemplo mostrando el precio de un billete Zona A (1.50€) con y sin el descuento (20% y 50%)."

### 💡 Resultado Esperado (Fragmento PR)

```markdown
## 🎯 Resumen de cambios
Este PR implementa la lógica para aplicar descuentos automáticos a perfiles de **Familia Numerosa** (General y Especial) directamente en el paso por torniquete.

### Cambios principales:
- Backend: Nuevo servicio de cálculo en `TarifasService`.
- BD: Actualización de `PKG_DESCUENTOS` para soportar nuevos tipos de perfil.

## 🧪 Cómo probarlo
1. Ejecutar script de migración: `database/update_tarifas_schema.sql`.
2. Usar usuario de prueba `ID: 9999` (Perfil Familia Numerosa General).
3. Simular validación en Zona A.
4. **Resultado esperado:** Se descuenta 1.20€ en lugar de 1.50€.

## 📊 Tabla de Impacto en Precios

| Zona | Precio Base | FN General (-20%) | FN Especial (-50%) |
|------|-------------|-------------------|--------------------|
| A    | 1.50€       | 1.20€             | 0.75€              |
| B    | 1.80€       | 1.44€             | 0.90€              |

## ✅ Checklist
- [ ] Tests unitarios de `TarifasService` pasando.
- [ ] Script SQL ejecutado en entorno de DEV.
- [ ] No afecta a usuarios con perfil 'Normal'.
```

## 🧠 Reto Adicional
Pide a Copilot que genere un **Template de Pull Request** (`.github/pull_request_template.md`) para que todo el equipo use este formato estándar a partir de ahora.
