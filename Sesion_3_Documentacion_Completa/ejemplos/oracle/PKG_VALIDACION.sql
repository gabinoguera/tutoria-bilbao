-- EJERCICIO: Documentar este paquete con formato Javadoc/PLDoc

CREATE OR REPLACE PACKAGE PKG_VALIDACION AS
    
    -- Valida si una tarjeta tiene saldo suficiente
    FUNCTION VALIDAR_SALDO(
        p_tarjeta_id IN NUMBER,
        p_importe IN NUMBER
    ) RETURN BOOLEAN;

    -- Registra el paso por torniquete
    PROCEDURE REGISTRAR_PASO(
        p_tarjeta_id IN NUMBER,
        p_estacion_id IN NUMBER,
        p_tipo_movimiento IN VARCHAR2 -- 'ENTRADA' o 'SALIDA'
    );

END PKG_VALIDACION;
/

CREATE OR REPLACE PACKAGE BODY PKG_VALIDACION AS

    FUNCTION VALIDAR_SALDO(
        p_tarjeta_id IN NUMBER,
        p_importe IN NUMBER
    ) RETURN BOOLEAN IS
        v_saldo_actual NUMBER;
    BEGIN
        SELECT SALDO INTO v_saldo_actual
        FROM TARJETAS
        WHERE ID = p_tarjeta_id;

        IF v_saldo_actual >= p_importe THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;
    END VALIDAR_SALDO;

    PROCEDURE REGISTRAR_PASO(
        p_tarjeta_id IN NUMBER,
        p_estacion_id IN NUMBER,
        p_tipo_movimiento IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO HISTORICO_MOVIMIENTOS (
            ID, TARJETA_ID, ESTACION_ID, TIPO, FECHA_HORA
        ) VALUES (
            SEQ_MOVIMIENTOS.NEXTVAL, p_tarjeta_id, p_estacion_id, p_tipo_movimiento, SYSDATE
        );
        COMMIT;
    END REGISTRAR_PASO;

END PKG_VALIDACION;
/
