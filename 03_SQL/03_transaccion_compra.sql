USE inventario_db;

-- Cambiar delimitador para permitir la definicion del procedimiento
DELIMITER //

CREATE PROCEDURE registrar_compra_transaccional(
    IN p_cantidad_comprada INT,
    IN p_id_producto INT,
    IN p_id_proveedor INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION -- Si ocurre algun error (ej. FK no existe)
    BEGIN
        ROLLBACK;
        SELECT 'Error: Transacción de compra CANCELADA. Verifique IDs de producto/proveedor.' AS Resultado;
    END;
    
    START TRANSACTION; -- Iniciar el bloque atómico
    
    -- 1. Insertar la Transacción (tipo: Compra)
    INSERT INTO transacciones (tipo, fecha, cantidad, estado, id_producto, id_proveedor)
    VALUES ('Compra', NOW(), p_cantidad_comprada, 'Completada', p_id_producto, p_id_proveedor);

    -- 2. Actualizar el Inventario: sumar la cantidad comprada
    UPDATE productos 
    SET cantidad = cantidad + p_cantidad_comprada
    WHERE id_producto = p_id_producto;
    
    -- Si los pasos 1 y 2 se ejecutan sin errores, confirmar:
    COMMIT; 
    
    SELECT CONCAT('Compra de ', p_cantidad_comprada, ' unidades completada EXITOSAMENTE. Inventario actualizado.') AS Resultado;
END //

-- Volver al delimitador original
DELIMITER ;

-- Llamar al procedimiento para probar la transacción
CALL registrar_compra_transaccional(15, 2, 2);