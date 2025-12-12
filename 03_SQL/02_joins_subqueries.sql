USE inventario_db;

-- 1. Consulta Compleja: Total de ventas de un producto (Laptop) durante el mes anterior.
SELECT 
    p.nombre,
    SUM(t.cantidad) as total_vendido
FROM transacciones t
INNER JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'Venta'
    AND t.estado = 'Completada'
    -- Ejemplo de manejo de fechas para 'mes anterior' (funciona en MySQL/MariaDB)
    AND YEAR(t.fecha) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
    AND MONTH(t.fecha) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
    AND p.nombre = 'Laptop HP Pavilion'
GROUP BY p.nombre;

-- 2. LEFT JOIN para incluir transacciones sin proveedor (Ventas a cliente final)
SELECT 
    t.id_transaction,
    t.tipo,
    t.fecha,
    p.nombre as producto,
    -- COALESCE reemplaza NULL con 'Venta Directa'
    COALESCE(prov.nombre, 'Venta Directa (Sin Proveedor)') as proveedor
FROM transacciones t
INNER JOIN productos p ON t.id_producto = p.id_producto
LEFT JOIN proveedores prov ON t.id_proveedor = prov.id_proveedor
ORDER BY t.fecha DESC;

-- 3. Subconsulta: Productos que nunca han sido vendidos.
SELECT 
    p.id_producto,
    p.nombre,
    p.cantidad as stock_actual
FROM productos p
WHERE p.id_producto NOT IN (
    SELECT DISTINCT t.id_producto
    FROM transacciones t
    WHERE t.tipo = 'Venta'
        AND t.estado = 'Completada'
)
ORDER BY p.nombre;