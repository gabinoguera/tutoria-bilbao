# Ejercicio 3 - Crear README con Copilot

## ⏱️ Duración: 20 minutos
## 🎯 Objetivo: Generar documentación de proyecto completa

---

## ¿Qué es un README?

### 📖 Definición:
Un README es la **primera página** que alguien ve cuando abre tu proyecto.

### ✅ Un buen README debe responder:
1. **¿Qué hace este proyecto?**
2. **¿Cómo lo instalo/uso?**
3. **¿Qué necesito para ejecutarlo?**
4. **¿Dónde obtengo ayuda?**

---

## Parte A: README Básico para Script Simple (10 min)

### 📝 Paso 1: Crear un script simple

1. Crea un archivo: `validador_billetes.js`
2. Copia este código:

```javascript
/**
 * Script para validar billetes de Metro Bilbao
 */

function validarBillete(billete) {
  if (!billete || !billete.id) return false;
  if (billete.saldo < 0) return false;
  if (billete.caducado) return false;
  return true;
}

function procesarValidaciones(billetes) {
  return billetes.filter(validarBillete);
}

// Ejemplo de uso
const billetes = [
  { id: 1, saldo: 5.50, caducado: false },
  { id: 2, saldo: -1.00, caducado: false },
  { id: 3, saldo: 2.00, caducado: true }
];

const validos = procesarValidaciones(billetes);
console.log(`Billetes válidos: ${validos.length} de ${billetes.length}`);
```

### 📝 Paso 2: Pedirle a Copilot que cree README

3. **Abre Copilot Chat**
4. **Copia este prompt:**

```
Crea un README.md para este script.
Incluye:
- Título y descripción breve
- Qué hace el script
- Cómo ejecutarlo
- Ejemplo de salida
- Requisitos (Node.js)

[Pega el código del script]
```

5. **Copilot generará un README → Cópialo a un nuevo archivo `README.md`**

### 📝 Paso 3: Revisar y mejorar

6. **Lee el README generado**
7. **Pregúntale a Copilot:** "¿Qué secciones adicionales debería tener?"
8. **Agrega las que tengan sentido**

### 🤔 Preguntas para discutir:
- ¿El README explica claramente el propósito?
- ¿Alguien nuevo podría usar el script solo leyendo el README?
- ¿Qué mejorarías?

---

## Parte B: README para Proyecto Más Completo (10 min)

### 📝 Contexto:

Imagina que tienes un proyecto con varios archivos:
```
proyecto_metro/
├── validar.js
├── calcular_tarifa.js
├── generar_reporte.js
└── README.md
```

### 📝 Paso 1: Descripción del proyecto

1. **Abre Copilot Chat**
2. **Copia este prompt:**

```
Crea un README.md profesional para un proyecto de scripts de Metro Bilbao.

El proyecto incluye:
- validar.js: Valida billetes
- calcular_tarifa.js: Calcula tarifas por zona
- generar_reporte.js: Genera reportes de validaciones

Incluye estas secciones:
1. Título y descripción
2. Tabla de contenidos
3. Requisitos previos
4. Instalación
5. Uso de cada script
6. Ejemplos
7. Contribución
8. Contacto
```

3. **Revisa el README generado**

### 📝 Paso 2: Personalizar

4. **Si el README es muy genérico, pide:**

```
El README está bien pero muy genérico.
Hazlo más específico para Metro Bilbao.
Menciona que es para análisis de validaciones y optimización de tarifas.
Agrega un emoji de metro 🚇 y hazlo más amigable.
```

5. **Copilot ajustará el tono y contenido**

---

## 🎯 Estructura Típica de un README

### 📋 Secciones Recomendadas:

```markdown
# 🚇 Nombre del Proyecto

Descripción corta (1-2 líneas)

## Tabla de Contenidos
- [Sobre el Proyecto](#sobre-el-proyecto)
- [Instalación](#instalación)
- [Uso](#uso)
- [Ejemplos](#ejemplos)
- [Contacto](#contacto)

## Sobre el Proyecto
Descripción más detallada

## Instalación
```bash
npm install
```

## Uso
```bash
node script.js
```

## Ejemplos
[Ejemplos reales]

## Contacto
Tu info
```

---

## 💡 TIPS para Buenos README

### ✅ README Buenos:
- Empiezan con descripción clara en 1-2 líneas
- Tienen ejemplos ejecutables
- Explican errores comunes
- Incluyen capturas de pantalla (si hay UI)
- Tienen badges (opcional): ![Status](url)

### ❌ README Malos:
- Muy largos y densos
- Sin ejemplos
- Asumen mucho conocimiento previo
- No se actualizan cuando cambia el código

---

## 🆘 Si Te Atascas

### Problema: El README es muy largo
**Solución:**
Pide: "Hazlo más conciso, máximo 50 líneas"

### Problema: Falta información importante
**Solución:**
Pregunta: "¿Qué otras secciones debería incluir para [tipo de proyecto]?"

### Problema: Muy técnico o muy simple
**Solución:**
Especifica la audiencia: "Escribe para desarrolladores junior" o "para usuarios no técnicos"

---

## Parte C: Badges y Formato (Opcional)

### 📝 Si te sobra tiempo:

**Pide a Copilot:**

```
Agrega badges al README para:
- Versión de Node.js requerida
- Estado del proyecto (activo)
- Licencia (MIT)

Usa formato Markdown de badges estándar.
```

**Ejemplo de resultado:**
```markdown
# 🚇 Validador de Billetes Metro Bilbao

![Node](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)
![Status](https://img.shields.io/badge/status-active-success)
![License](https://img.shields.io/badge/license-MIT-blue)
```

---

## 🎯 Patrón para Prompts de README

### Template efectivo:

```
Crea un README.md para [TIPO DE PROYECTO].

Contexto:
- [Qué hace el proyecto]
- [A quién va dirigido]
- [Tecnologías usadas]

Incluye:
1. Título y descripción breve
2. Instrucciones de instalación
3. Ejemplos de uso
4. [Secciones específicas que necesites]

Tono: [Profesional / Amigable / Técnico]
```

---

## 📝 Tipos de README

### 1. README para Scripts
- Corto y directo
- Foco en "cómo ejecutar"
- Ejemplo de salida

### 2. README para Librerías
- Más detallado
- Documentación de API
- Múltiples ejemplos

### 3. README para Aplicaciones
- Incluye capturas
- Guía de instalación paso a paso
- FAQ

---

## ✅ Cierre del Ejercicio

### Lo que aprendimos:
- ✅ Copilot puede generar READMEs completos
- ✅ Un buen README ahorra tiempo a todos
- ✅ Podemos iterar con Copilot para mejorar el README
- ✅ El README debe adaptarse a la audiencia

### Para practicar:
- Encuentra un proyecto sin README (o con README malo)
- Pídele a Copilot que genere uno
- Revisa con alguien que no conoce el proyecto
- Ajusta según feedback

---

## 🎓 Checklist de README Completo

Antes de dar por terminado un README, verifica:

- [ ] ¿Explica qué hace el proyecto en 1-2 líneas?
- [ ] ¿Tiene instrucciones de instalación claras?
- [ ] ¿Incluye al menos un ejemplo de uso?
- [ ] ¿Menciona requisitos previos?
- [ ] ¿Tiene información de contacto?
- [ ] ¿Está actualizado con el código actual?

---

## 🔜 Fin de la Sesión 2

### Resumen de hoy:
1. ✅ Creamos tests simples con Copilot
2. ✅ Documentamos código con JSDoc
3. ✅ Generamos READMEs completos

### Próxima sesión (09/12/2025):
- Testing de frontend (JavaScript, HTML)
- Documentación avanzada de arquitectura
- Mejores prácticas de documentación continua

### Tarea:
1. Toma un script de tu trabajo
2. Crea tests básicos con Copilot
3. Documéntalo con JSDoc
4. Crea un README simple
5. Comparte en el grupo tus resultados

**¡Buen trabajo! 🎉**
