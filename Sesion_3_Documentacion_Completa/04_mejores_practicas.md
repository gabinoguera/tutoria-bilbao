# Mejores Prácticas y Cierre del Curso

## ⏱️ Duración: 20 minutos
## 🎯 Objetivo: Consolidar aprendizajes y crear plan de acción

---

## 🎓 Recap del Curso Completo

### Sesión 1: Desarrollo con Copilot
✅ Qué es GitHub Copilot y vibecoding  
✅ Generar código simple (JavaScript, SQL básico)  
✅ Explicar código existente  
✅ Prompts efectivos

### Sesión 2: Testing y Documentación
✅ Crear tests unitarios simples  
✅ Documentar funciones con JSDoc  
✅ Generar READMEs de proyectos  

### Sesión 3 (Hoy): Frontend y Arquitectura
✅ Testear formularios HTML/JS  
✅ Documentar arquitectura completa  
✅ Mejores prácticas

---

## 📋 Checklist de Mejores Prácticas

### ✅ Al Escribir Prompts:

- [ ] **Sé específico:** "Crea función para calcular X" > "Crea función"
- [ ] **Da contexto:** Menciona el dominio (Metro Bilbao, tarifas, etc.)
- [ ] **Especifica formato:** "Con tests", "Con comentarios", "Solo código"
- [ ] **Incluye restricciones:** "Mínimo 5, máximo 50", "Solo números"
- [ ] **Pide explicaciones:** "Explica por qué elegiste este enfoque"

### ✅ Al Generar Código:

- [ ] **Siempre revisar:** No uses código sin leer
- [ ] **Probar inmediatamente:** Ejecuta y verifica
- [ ] **Refinar si hace falta:** Itera con Copilot
- [ ] **Agregar comentarios:** Explica partes complejas
- [ ] **Seguir estilo del proyecto:** Pide a Copilot que lo respete

### ✅ Al Crear Tests:

- [ ] **Casos normales:** Valores típicos
- [ ] **Casos límite:** Mínimos, máximos, cero
- [ ] **Casos de error:** Valores inválidos
- [ ] **Tests independientes:** Cada uno prueba una cosa
- [ ] **Nombres descriptivos:** "test_monto_negativo_rechazado"

### ✅ Al Documentar:

- [ ] **README siempre:** Todo proyecto debe tener uno
- [ ] **Funciones complejas:** Documentar con JSDoc o similar
- [ ] **Decisiones técnicas:** Explicar el "por qué"
- [ ] **Ejemplos concretos:** Mejor que solo texto
- [ ] **Mantener actualizado:** Documentar cuando cambias código

---

## 🚀 Plan de Acción Post-Curso

### 📅 Primera Semana:
1. **Día 1-2:** Prueba Copilot en tareas simples de tu trabajo
2. **Día 3-4:** Documenta una función que no tenía documentación
3. **Día 5:** Crea un test básico para algo crítico

### 📅 Primer Mes:
1. **Semana 1:** Usa Copilot para todas tus tareas de código
2. **Semana 2:** Documenta un módulo completo
3. **Semana 3:** Crea tests para funciones críticas
4. **Semana 4:** Comparte con tu equipo lo que aprendiste

### 📅 Primeros 3 Meses:
1. Integra Copilot en tu flujo diario
2. Documenta proyectos legacy paulatinamente
3. Aumenta cobertura de tests gradualmente
4. Enseña a colegas lo que sabes

---

## 💡 Casos de Uso Reales en Metro Bilbao

### 🔧 Desarrollo:
- **Generar queries SQL:** Para reportes y consultas ad-hoc
- **Crear funciones de validación:** Billetes, tarifas, usuarios
- **Optimizar código legacy:** Pedirle a Copilot sugerencias

### 📝 Documentación:
- **Documentar stored procedures:** PL/SQL sin documentación
- **Crear READMEs de módulos:** Para cada subsistema
- **Explicar código complejo:** A nuevos miembros del equipo

### 🧪 Testing:
- **Tests de cálculo de tarifas:** Verificar lógica crítica
- **Tests de validaciones:** Billetes, usuarios, zonas
- **Tests de formularios:** Interfaces de usuario

---

## 🎯 Prompts Útiles para Guardar

### Para Desarrollo:

```
1. "Explica esta función en términos simples"
2. "Optimiza este código para mejor rendimiento"
3. "Encuentra posibles bugs en este código"
4. "Reescribe esto con mejores nombres de variables"
5. "Convierte esta query SQL de Oracle a PostgreSQL"
```

### Para Testing:

```
1. "Crea tests para esta función, incluyendo casos de error"
2. "¿Qué casos de prueba adicionales debería considerar?"
3. "Genera tests que verifiquen [comportamiento específico]"
4. "Explica por qué falló este test"
```

### Para Documentación:

```
1. "Documenta esta función con JSDoc completo y ejemplos"
2. "Crea un README para este proyecto"
3. "Explica la arquitectura de este sistema"
4. "Genera diagrama Mermaid mostrando [flujo/arquitectura]"
5. "Documenta esta decisión técnica (ADR format)"
```

---

## 🆘 Troubleshooting Común

### Problema: Copilot genera código incorrecto
**Solución:**
1. Refina el prompt con más detalles
2. Muéstrale ejemplos de lo que quieres
3. Pídele que corrija: "Este código tiene error [X], arréglalo"

### Problema: No sé qué prompt usar
**Solución:**
1. Empieza simple: "Explica qué hace esto"
2. Luego específico: "Genera [X] con estas características [Y]"
3. Itera según resultado

### Problema: Copilot no responde
**Solución:**
1. Verifica conexión y licencia
2. Reinicia VS Code
3. Revisa status en esquina inferior derecha

---

## 📚 Recursos Adicionales

### Documentación Oficial:
- **GitHub Copilot Docs:** https://docs.github.com/copilot
- **Prompting Best Practices:** https://github.com/features/copilot/plans

### Comunidad:
- **GitHub Community:** https://github.com/community
- **VS Code Tips:** https://code.visualstudio.com/docs

### Práctica:
- **Exercism:** https://exercism.org (problemas de código para practicar)
- **LeetCode:** https://leetcode.com (con Copilot como ayuda)

---

## 🎁 Entregables del Curso

### Lo que te llevas:
1. ✅ **Material completo** de las 3 sesiones
2. ✅ **Ejemplos prácticos** aplicables a Metro Bilbao
3. ✅ **Templates de prompts** para diferentes tareas
4. ✅ **Checklist de mejores prácticas**
5. ✅ **Conocimiento práctico** de Copilot

---

## 🌟 Éxitos a Celebrar

### Has aprendido a:
- ✅ Usar GitHub Copilot para acelerar desarrollo
- ✅ Generar código en múltiples lenguajes
- ✅ Crear tests básicos pero efectivos
- ✅ Documentar código y proyectos
- ✅ Aplicar mejores prácticas

### **¡Eso es MUCHO!** 🎉

---

## 💬 Feedback y Mejora Continua

### Por favor, comparte:
1. **¿Qué te pareció más útil?**
2. **¿Qué agregarías al curso?**
3. **¿Qué fue muy complejo o muy simple?**
4. **¿Aplicarás esto en tu trabajo?**

Tu feedback ayuda a mejorar futuras ediciones.

---

## 🎯 Objetivos para Después del Curso

### Corto Plazo (1 mes):
- [ ] Usar Copilot en al menos 3 tareas por semana
- [ ] Documentar 2-3 funciones importantes
- [ ] Crear 5-10 tests básicos

### Mediano Plazo (3 meses):
- [ ] Copilot integrado en flujo diario
- [ ] Proyecto legacy documentado
- [ ] Cobertura de tests en aumento

### Largo Plazo (6 meses):
- [ ] Equipo completo usando Copilot
- [ ] Documentación estándar establecida
- [ ] Testing como parte del proceso

---

## 🤝 Mantengamos Contacto

### Canales de Seguimiento:
- **Grupo de alumni:** [Información de contacto]
- **Sesiones de Q&A:** [Programar según interés]
- **Compartir casos de éxito:** [Canal o email]

### Comparte tus Logros:
- ¿Optimizaste una query con Copilot?
- ¿Documentaste un módulo complejo?
- ¿Encontraste un caso de uso interesante?

**¡Queremos saberlo! 🎉**

---

## ✅ Checklist Final - ¿Estás Listo?

Antes de terminar el curso, verifica:

- [ ] Tengo Copilot instalado y funcionando
- [ ] Entiendo cómo escribir prompts efectivos
- [ ] Sé generar código básico en varios lenguajes
- [ ] Puedo crear tests simples
- [ ] Puedo documentar funciones y proyectos
- [ ] Tengo plan de acción para aplicar esto
- [ ] Guardé los materiales del curso
- [ ] Tengo contactos para dudas futuras

**Si marcaste todo:** ¡Estás listo para aplicarlo! 🚀

---

## 🎓 Certificado de Participación

### Has completado:
**Curso de Desarrollo con GitHub Copilot - Metro Bilbao**

**Módulos:**
- Sesión 1: Generación de código y SQL básico
- Sesión 2: Testing y documentación
- Sesión 3: Testing frontend y arquitectura

**Duración Total:** 4.5 horas  
**Fecha:** 04/11/2025 - 09/12/2025

---

## 🎉 ¡Felicidades!

### Has completado el curso completo.

### Ahora es tu turno:
1. **Aplica** lo aprendido en tu trabajo
2. **Comparte** con tu equipo
3. **Mejora** continuamente
4. **Disfruta** programando más rápido y mejor

### **¡Mucho éxito! 🚀**

---

## 📝 Última Tarea (Opcional)

**Desafío de 30 días:**
1. Usa Copilot todos los días
2. Documenta al menos 5 funciones
3. Crea al menos 10 tests
4. Comparte tu experiencia con el grupo

**Al final del mes:**
- Habrás integrado Copilot en tu flujo
- Tendrás código mejor documentado
- Tendrás más confianza en tus cambios

**¿Te animas? 💪**

---

## 🙏 Gracias por Participar

Ha sido un placer enseñarte a usar GitHub Copilot.

**Recuerda:**
- Copilot es una herramienta, TÚ eres el desarrollador
- Siempre revisa el código generado
- La práctica hace al maestro
- El mejor código es el que funciona y se entiende

**¡Nos vemos pronto! 👋**
