USE inventario_db;

-- 1. Actualizar la dirección de un proveedor
UPDATE proveedores
SET direccion = 'Calle Principal 123, Ciudad Nueva'
WHERE id_proveedor = 1;

-- 2. Actualizar el inventario de un producto después de una VENTA (id_producto = 1, cantidad vendida = 3)
UPDATE productos 
SET cantidad = cantidad - 3 
WHERE id_producto = 1;

-- 3. Eliminar un producto (ejemplo: producto con ID 3)
-- Primero, eliminamos las transacciones relacionadas para mantener la integridad referencial (requisito FK).
DELETE FROM transacciones 
WHERE id_producto = 3;

-- Luego, eliminamos el producto de la tabla principal
DELETE FROM productos 
WHERE id_producto = 3;