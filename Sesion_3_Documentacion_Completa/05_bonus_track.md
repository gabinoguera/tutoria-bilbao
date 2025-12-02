## 🧠 Reto Adicional: Visualización de Datos Reales del Metro Bilbao

**Objetivo:** Demostrar el poder de Copilot para transformar datos abiertos en documentación visual automática.

### 📊 Contexto
El Metro de Bilbao publica datos abiertos en https://www.metrobilbao.eus/es/open-data/dataset/estaciones

Vamos a usar Copilot para analizar el CSV de estaciones reales y generar:
1. Una tabla SQL normalizada
2. Un diagrama Mermaid de la topología de la red

---

### Paso 1: Analizar el CSV con Chain of Thought

Abre el archivo `estaciones.csv` y ejecuta este prompt:

**Prompt (CoT):**
> "Analiza este archivo CSV de estaciones del Metro de Bilbao.
> 1. Identifica las columnas clave: `stop_id`, `stop_name`, `parent_station`, `location_type`
> 2. Agrupa las estaciones por `parent_station` (cada parent_station es una estación física con múltiples accesos)
> 3. Genera un script SQL CREATE TABLE que modele esta estructura con:
>    - Tabla `LINEAS_METRO` (extrae las líneas de los códigos como 'ABA', 'ABT', etc.)
>    - Tabla `ESTACIONES_METRO` (una fila por parent_station con coordenadas GPS)
>    - Tabla `ACCESOS_ESTACION` (entradas/ascensores de cada estación)
> 4. Incluye coordenadas GPS (`stop_lat`, `stop_lon`) en ESTACIONES_METRO
> 5. Inserta datos de ejemplo de las primeras 5 estaciones"

**💡 Tip:** Guarda el resultado en `casos_metro/schema_opendata_metro.sql`

---

### Paso 2: Generar Diagrama de Red (Mermaid)

Una vez modelado, pide a Copilot que visualice la topología:

**Prompt:**
> "Basado en el CSV de estaciones, genera un diagrama Mermaid (`graph LR`) que muestre:
> 1. Las 2 líneas principales del metro: L1 (Plentzia-Etxebarri) y L2 (Kabiezes-Basauri)
> 2. Las estaciones conectadas en orden secuencial
> 3. Usa subgrafos para cada línea con colores distintivos (azul L1, naranja L2)
> 4. Marca con emoji 🚉 las estaciones intercambiador (Abando, San Mamés, Barakaldo)
> 5. Limita a 15 estaciones por línea para legibilidad"

**💡 Tip:** Guarda el resultado en un nuevo archivo `.md` y visualízalo con `Cmd+Shift+V`


---

### 🎯 Impacto del Ejercicio:

| Antes | Después |
|-------|---------|
| CSV crudo con 100+ filas | Script SQL normalizado |
| Datos sin contexto | Diagrama visual de la red |
| Manual (horas de trabajo) | Automatizado con Copilot (minutos) |

**💡 Mensaje Clave:**
"Copilot no solo genera código, también transforma datos públicos en documentación técnica profesional. Esto es Reverse Engineering de datos en tiempo real."

---

### 🚀 Variante Avanzada (Opcional):

Genera un **mapa interactivo** con las coordenadas GPS reales:

**Prompt (con especificaciones técnicas):**
> "Genera un archivo HTML completo con un mapa interactivo usando Leaflet.js que visualice todas las estaciones del Metro Bilbao. Requisitos:
> 
> 1. **Parseo de datos del CSV:**
>    - Lee las columnas `stop_id`, `stop_name`, `stop_lat`, `stop_lon`
>    - Agrupa por código de estación (columna 2: ABA, ETX, SAM, etc.)
>    - Extrae línea de cada estación (L1 si está en ruta Plentzia-Etxebarri, L2 si está en Kabiezes-Basauri)
> 
> 2. **Mapa base:**
>    - Usa Leaflet.js desde CDN (https://unpkg.com/leaflet@1.9.4/dist/leaflet.js)
>    - Centro en Bilbao: [43.2627, -2.9253], zoom inicial 11
>    - Tiles de OpenStreetMap
> 
> 3. **Marcadores personalizados:**
>    - Color azul (#0066CC) para L1, naranja (#FF6600) para L2
>    - Círculos de 14px para estaciones normales, 18px para intercambiadores
>    - Marcadores dorados para intercambiadores (San Mamés, Casco Viejo)
> 
> 4. **Popups informativos:**
>    - Nombre de la estación en negrita con color de línea
>    - Código de estación (ej: 'ABA', 'ETX')
>    - Número de línea (L1 o L2)
>    - Coordenadas GPS con 5 decimales
> 
> 5. **Líneas de conexión:**
>    - Dibuja polylines conectando estaciones secuencialmente
>    - Grosor 3px, opacidad 0.7, mismo color que la línea
> 
> 6. **Panel informativo:**
>    - Contador total de estaciones (top-right)
>    - Leyenda de colores (bottom-left)
> 
> Guarda como `mapa_metro_interactivo.html` con todo el CSS inline y JavaScript embebido (sin archivos externos)."

---

**🔧 Para visualizar el resultado:**

```bash
cd Anexos
python3 -m http.server 8080
```

Luego abre en VS Code: **Simple Browser** → `http://localhost:8080/mapa_metro_interactivo.html`

**💡 Tip:** Puedes usar `Cmd+Shift+P` → "Simple Browser: Show" para abrir el navegador integrado.