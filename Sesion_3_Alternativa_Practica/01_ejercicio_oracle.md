# Ejercicio 1: Trabajar con Oracle usando Copilot

## 🎯 Objetivo
Aprender a usar Copilot para escribir, entender y optimizar código Oracle PL/SQL sin ser experto.

---

## Parte A: Generar un Procedimiento Almacenado

### Escenario
Necesitamos validar billetes en el sistema del Metro. El procedimiento debe ser transaccional y manejar errores.

### Paso 1: Descripción en lenguaje natural
Abre Copilot Chat y escribe:

```
Genera un procedimiento almacenado en Oracle PL/SQL llamado SP_VALIDAR_BILLETE que:

1. Reciba estos parámetros de entrada:
   - p_id_billete: NUMBER
   - p_id_estacion: NUMBER
   - p_fecha_hora: DATE

2. Valide que:
   - El billete existe en la tabla BILLETES
   - Tiene saldo >= 1.50 (tarifa mínima)

3. Si todo OK:
   - Descuente 1.50€ del saldo
   - Inserte registro en HISTORICO_VALIDACIONES (id_billete, id_estacion, fecha_hora, importe)

4. Devuelva un parámetro OUT:
   - p_resultado: VARCHAR2 ('OK', 'SALDO_INSUFICIENTE', 'BILLETE_NO_EXISTE')

Usa transacciones (COMMIT/ROLLBACK) y manejo de excepciones.
```

### Paso 2: Revisar el código generado
Copilot generará algo como:

```sql
CREATE OR REPLACE PROCEDURE SP_VALIDAR_BILLETE(
    p_id_billete IN NUMBER,
    p_id_estacion IN NUMBER,
    p_fecha_hora IN DATE,
    p_resultado OUT VARCHAR2
) IS
    v_saldo NUMBER;
    v_existe NUMBER;
BEGIN
    -- Verificar si existe el billete
    SELECT COUNT(*) INTO v_existe
    FROM BILLETES
    WHERE ID = p_id_billete;
    
    IF v_existe = 0 THEN
        p_resultado := 'BILLETE_NO_EXISTE';
        RETURN;
    END IF;
    
    -- Obtener saldo actual
    SELECT SALDO INTO v_saldo
    FROM BILLETES
    WHERE ID = p_id_billete;
    
    -- Validar saldo suficiente
    IF v_saldo < 1.50 THEN
        p_resultado := 'SALDO_INSUFICIENTE';
        RETURN;
    END IF;
    
    -- Descontar saldo
    UPDATE BILLETES
    SET SALDO = SALDO - 1.50
    WHERE ID = p_id_billete;
    
    -- Registrar en histórico
    INSERT INTO HISTORICO_VALIDACIONES (ID_BILLETE, ID_ESTACION, FECHA_HORA, IMPORTE)
    VALUES (p_id_billete, p_id_estacion, p_fecha_hora, 1.50);
    
    COMMIT;
    p_resultado := 'OK';
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_resultado := 'ERROR: ' || SQLERRM;
END SP_VALIDAR_BILLETE;
/
```

### Paso 3: Pedir mejoras
Si quieres agregar validaciones adicionales:

```
Añade una validación para verificar que la fecha de expiración del billete no haya pasado.
Si está expirado, devuelve 'BILLETE_EXPIRADO'.
```

---

## Parte B: Explicar un Script Complejo

### Escenario
Tienes un script Oracle que no entiendes completamente (puede ser uno real tuyo).

### Paso 1: Pegar el código
Selecciona el código y usa el comando `/explain` en Copilot Chat.

Ejemplo:
```sql
SELECT b.CODIGO, b.SALDO, e.NOMBRE, COUNT(h.ID) as NUM_VALIDACIONES
FROM BILLETES b
LEFT JOIN HISTORICO_VALIDACIONES h ON b.ID = h.ID_BILLETE
LEFT JOIN ESTACIONES e ON h.ID_ESTACION = e.ID
WHERE b.FECHA_EXPIRACION > SYSDATE
  AND b.SALDO > 0
GROUP BY b.CODIGO, b.SALDO, e.NOMBRE
HAVING COUNT(h.ID) > 5
ORDER BY NUM_VALIDACIONES DESC;
```

### Paso 2: Copilot explicará
```
Esta consulta SQL hace lo siguiente:

1. **FROM y JOINs**: 
   - Parte de la tabla BILLETES
   - Une con HISTORICO_VALIDACIONES (LEFT JOIN: incluye billetes sin validaciones)
   - Une con ESTACIONES para obtener el nombre

2. **WHERE**: Filtra solo billetes:
   - No expirados (fecha > hoy)
   - Con saldo positivo

3. **GROUP BY**: Agrupa resultados por billete y estación

4. **HAVING**: Solo muestra billetes con más de 5 validaciones

5. **ORDER BY**: Ordena de mayor a menor número de validaciones

Resultado: Billetes activos más usados por estación.
```

---

## Parte C: Optimizar una Query Lenta

### Escenario
Una query tarda mucho en ejecutarse.

### Paso 1: Pedir análisis
```
Esta query tarda 8 segundos en mi base de datos con 1 millón de registros.
¿Cómo puedo optimizarla?

[Pegar tu query]
```

### Paso 2: Copilot sugerirá
```
Sugerencias de optimización:

1. **Falta índice en HISTORICO_VALIDACIONES.ID_BILLETE**
   CREATE INDEX IDX_HIST_BILLETE ON HISTORICO_VALIDACIONES(ID_BILLETE);

2. **El LEFT JOIN podría ser INNER JOIN** si solo te interesan billetes con validaciones

3. **La subconsulta COUNT puede optimizarse** usando una CTE (Common Table Expression)

4. **Agregar índice compuesto**:
   CREATE INDEX IDX_BILLETES_ACTIVOS ON BILLETES(FECHA_EXPIRACION, SALDO);

Query optimizada:
[Copilot reescribirá la query mejorada]
```

---

## 💡 Tips Prácticos

### ¿Qué pasa si Copilot genera código incorrecto?
- Es normal, no es perfecto
- Úsalo como punto de partida
- Ajusta los nombres de tablas/campos a tu esquema real

### ¿Cómo saber si el código es bueno?
Pregúntale a Copilot:
```
¿Este código tiene algún problema de seguridad o rendimiento?
```

### ¿Puedo usarlo con mi base de datos real?
Sí, pero OJO:
- No pegues datos sensibles en Copilot Chat
- Cambia nombres de tablas/datos por genéricos si es confidencial
- Usa entornos de desarrollo/prueba, no producción
