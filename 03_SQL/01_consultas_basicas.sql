USE inventario_db;

-- 1. Recupera todos los productos disponibles en el inventario.
SELECT id_producto, nombre, precio, cantidad FROM productos 
WHERE cantidad > 0;

-- 2. Recupera todos los proveedores que suministran el producto 'Laptop HP Pavilion'.
SELECT DISTINCT prov.nombre, prov.telefono
FROM proveedores prov
JOIN transacciones t ON prov.id_proveedor = t.id_proveedor
JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'Compra' AND p.nombre = 'Laptop HP Pavilion';

-- 3. Consulta las transacciones realizadas en una fecha específica (ejemplo: 2024-01-15).
SELECT * FROM transacciones
WHERE DATE(fecha) = '2024-01-15';

-- 4. Consulta con COUNT(): Número total de transacciones completadas.
SELECT COUNT(id_transaction) AS total_transacciones_completadas
FROM transacciones
WHERE estado = 'Completada';

-- 5. Consulta con SUM(): Valor total de las compras realizadas.
SELECT 
    SUM(t.cantidad * p.precio) AS valor_total_compras
FROM transacciones t
JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'Compra' AND t.estado = 'Completada';