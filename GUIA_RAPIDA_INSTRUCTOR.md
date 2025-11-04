# Guía Rápida de Inicio - Instructor

**Para:** Gabriel Noguera  
**Programa:** GitHub Copilot para Metro Bilbao  
**Primera sesión:** 04/11/2025 a las 9:00h

---

## ⚡ Setup Rápido (15 minutos antes de SC2)

### 1. Verificar Herramientas

```bash
# Docker corriendo?
docker ps

# Si no está corriendo:
docker start metro-postgres

# Si no existe:
docker run --name metro-postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  -d postgres:15
```

### 2. Cargar Base de Datos

```bash
# Navegar al directorio
cd /Users/gabrielnoguera/Documents/BrainCode/BILBAO

# Cargar schema
docker exec -i metro-postgres psql -U postgres < Sesion_SC2_Desarrollo/casos_metro/metro_schema.sql

# Cargar datos
docker exec -i metro-postgres psql -U postgres < Sesion_SC2_Desarrollo/casos_metro/seed_data.sql

# Verificar
docker exec -it metro-postgres psql -U postgres -c "SELECT COUNT(*) FROM validaciones;"
# Debería mostrar ~130 registros
```

### 3. Abrir VS Code

```bash
# Abrir el directorio de SC2
code Sesion_SC2_Desarrollo/
```

### 4. Verificar Copilot

- Abre cualquier archivo .md
- Presiona Cmd+I (Mac) o Ctrl+I (Windows)
- Debería abrirse Copilot Chat
- ✅ Si funciona, estás listo

---

## 📋 Flujo de la Sesión SC2 (90 min)

### Minuto 0-10: Introducción (10 min)

**Qué hacer:**
1. Bienvenida y presentación
2. Contexto: "Vamos a usar Copilot para mejorar código de Metro Bilbao"
3. Mostrar estructura del repo
4. Abrir `01_introduccion_vibecoding.md`

**Pantalla compartir:**
- VS Code con el repositorio abierto
- Terminal con BD corriendo

**Qué NO hacer:**
- No entrar en detalles técnicos todavía
- No instalar cosas (debe estar listo)

---

### Minuto 10-25: Vibecoding (15 min)

**Archivo:** `01_introduccion_vibecoding.md`

**Qué hacer:**
1. Leer sección "¿Qué es Vibecoding?"
2. Mostrar ejemplo de calentamiento:
   - Copiar el código de `calcDesc(t,p)`
   - Abrir Copilot Chat (Cmd+I)
   - Pegar el prompt del ejercicio
   - Mostrar cómo Copilot responde

3. Explicar ventajas y desventajas
4. Enfatizar: "No necesitan ser expertos en los lenguajes"

**Tips:**
- Ir rápido en teoría, más tiempo en demo
- Animar a que prueben el ejercicio de calentamiento
- Responder preguntas pero no extenderse

---

### Minuto 25-45: Ejercicio 1 - Generación (20 min)

**Archivo:** `02_ejercicio_generacion_codigo.md`

**Qué hacer:**
1. Explicar caso: Sistema de tarifas Metro Bilbao (2 min)
2. Demo Zero-Shot (5 min):
   - Abrir Copilot Chat
   - Copiar prompt básico del archivo
   - Mostrar código generado
   - Validar con console.log

3. Demo Few-Shot (5 min):
   - Mostrar prompt mejorado con validaciones
   - Comparar resultados

4. Ejercicio individual (8 min):
   - Pedir que elijan Opción 1, 2 o 3
   - Que lo hagan con Copilot
   - Compartir resultados

**Scripts para copiar:**
- Están en el archivo, solo copiar/pegar

**Si algo falla:**
- Usa los ejemplos ya escritos en el archivo
- No improvises código, usa lo preparado

---

### Minuto 45-75: Ejercicio 2 - Optimización SQL ⭐ (30 min)

**Archivo:** `03_ejercicio_optimizacion_sql.md`

**Este es el MÁS IMPORTANTE - No recortar tiempo**

**Qué hacer:**
1. Conectar a PostgreSQL (2 min):
```bash
docker exec -it metro-postgres psql -U postgres
```

2. Mostrar query lenta (3 min):
```sql
-- Copiar de Parte A del archivo
SELECT * FROM validaciones v
JOIN estaciones e...
```

3. Ejecutar EXPLAIN ANALYZE (5 min):
```sql
EXPLAIN (ANALYZE, BUFFERS) [pegar query]
```

4. Copiar output y pedir análisis a Copilot (10 min):
   - Abrir Copilot Chat
   - Pegar el prompt del "Paso 2" del archivo
   - Incluir la query y el EXPLAIN output
   - Revisar sugerencias

5. Aplicar optimizaciones (5 min):
   - Crear índices sugeridos
   - Re-ejecutar EXPLAIN ANALYZE
   - Comparar tiempos

6. Ejercicio Parte B (5 min):
   - Que ellos prueben con la query de agregación

**Comandos útiles:**
```sql
-- Ver índices actuales
\d validaciones

-- Salir de psql
\q
```

**Si no tienes tiempo:**
- Salta Parte B y C
- Enfócate en Parte A (es suficiente)

---

### Minuto 75-85: Ejercicio 3 - Debugging (10 min)

**Archivo:** `04_ejercicio_debugging.md`

**Qué hacer:**
1. Mostrar query con errores (Parte A) (3 min)
2. Pedir a Copilot que identifique errores (4 min)
3. Revisar correcciones (3 min)

**Si no tienes tiempo:**
- Salta este ejercicio
- O hazlo rapidísimo (5 min)
- Diles que lo practiquen después

---

### Minuto 85-90: Cierre (5 min)

**Archivo:** `05_preview_testing.md`

**Qué hacer:**
1. Recap de lo aprendido
2. Preview de SC6: "Próxima sesión: documentación y tests"
3. Tarea opcional: Traer código legacy real
4. Q&A rápido
5. Despedida

---

## 🎯 Mensajes Clave para Transmitir

### 1. No es Magia, es Herramienta
"Copilot es como tener un par programmer que sabe mucho, pero necesita que le guíes"

### 2. Iterar es Normal
"La primera respuesta de Copilot raramente es perfecta. Refinar el prompt es parte del proceso"

### 3. Validar Siempre
"Nunca acepten código sin entenderlo. Copilot ayuda, pero ustedes deciden"

### 4. Aplicable Inmediatamente
"Esto que vimos hoy lo pueden usar el lunes con código real de Metro"

---

## 🚨 Troubleshooting Rápido

### Problema: BD no conecta
```bash
# Reiniciar contenedor
docker restart metro-postgres

# Verificar que está corriendo
docker ps | grep metro-postgres

# Ver logs si hay error
docker logs metro-postgres
```

### Problema: Copilot no responde
- Verificar que está logueado: Click en icono Copilot en barra inferior
- Recargar VS Code: Cmd+Shift+P → "Reload Window"
- Verificar internet (Copilot necesita conexión)

### Problema: Queries no funcionan
- Usar las queries exactas del archivo
- No improvisar sintaxis SQL
- Si algo falla, pasar al siguiente ejercicio

### Problema: Se está quedando sin tiempo
**Prioridades:**
1. ⭐ Ejercicio 2 (Optimización) - NO RECORTAR
2. Ejercicio 1 (Generación) - Mínimo 15 min
3. Introducción - Puede ser 10 min en lugar de 15
4. Ejercicio 3 (Debugging) - Puede saltarse si es necesario

---

## 💡 Tips de Facilitación

### Do's ✅
- Comparte pantalla completa (VS Code + Terminal)
- Lee los prompts en voz alta antes de enviar
- Muestra el proceso, no solo el resultado
- Anima participación: "¿Qué prompt usarían ustedes?"
- Graba la sesión si es posible

### Don'ts ❌
- No improvises código (usa los ejemplos preparados)
- No te preocupes si no sabes PL/SQL a fondo
- No intentes ejecutar todo (algunos ejemplos son ilustrativos)
- No te extiendas en preguntas individuales (toma nota y responde después)

---

## 📱 Checklist Pre-Sesión

**1 hora antes:**
- [ ] Abrir Zoom/Teams y probar conexión
- [ ] Compartir pantalla de prueba
- [ ] Verificar audio y video
- [ ] Tener un vaso de agua cerca 😊

**15 minutos antes:**
- [ ] Docker corriendo ✅
- [ ] BD cargada ✅
- [ ] VS Code abierto ✅
- [ ] Copilot funcionando ✅
- [ ] Archivos abiertos en pestañas:
  - [ ] `00_guion_clase.md`
  - [ ] `01_introduccion_vibecoding.md`
  - [ ] `02_ejercicio_generacion_codigo.md`
  - [ ] `03_ejercicio_optimizacion_sql.md`
  - [ ] `04_ejercicio_debugging.md`

**Durante la sesión:**
- [ ] Grabar (si aplica)
- [ ] Tomar notas de preguntas frecuentes
- [ ] Guardar prompts interesantes que surjan

---

## 📞 Contactos de Emergencia

**Soporte técnico:** [TBD]  
**Contacto Metro Bilbao:** [TBD]  
**Backup plan:** Si BD falla, usar SQLite o ejemplos sin ejecutar

---

## 🎬 Últimas Palabras

**Respira, relájate, disfruta:**
- Eres el experto en Copilot
- Ellos son expertos en Metro Bilbao
- Juntos aprenderán a optimizar su trabajo con IA

**Si algo sale mal:**
- Es una oportunidad de mostrar cómo iterar
- Copilot tampoco es perfecto siempre
- Eso es parte del aprendizaje

**Recuerda:**
> "El mejor curso es el que los participantes pueden aplicar el lunes siguiente"

---

## 🚀 ¡Éxito en SC2!

Tienes todo preparado. El contenido es sólido. Los ejercicios son prácticos. 

**¡A enseñar!** 🎓

---

**Preparado:** 31 de octubre de 2025  
**Para:** Gabriel Noguera  
**Cliente:** Metro Bilbao  
**Next:** SC2 - 04/11/2025 @ 9:00h
