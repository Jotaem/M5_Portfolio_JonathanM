USE inventario_db;

-- Insertar Proveedores
INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('Distribuidora Central S.A.', 'Av. Principal 123, Santiago', '+56912345678', 'ventas@distcentral.cl'),
('Proveedora del Norte Ltda.', 'Calle Norte 456, Antofagasta', '+56987654321', 'contacto@pronorte.cl'),
('Suministros del Sur', 'Pasaje Sur 789, Temuco', '+56923456789', 'pedidos@sumsur.cl'),
('TecnoPartes Chile', 'Industrial 321, Valparaíso', '+56934567890', 'info@tecnopartes.cl');

-- Insertar Productos
INSERT INTO productos (nombre, descripcion, precio, cantidad) VALUES
('Laptop HP Pavilion', 'Laptop HP Pavilion 15.6" Intel i5 8GB RAM 256GB SSD', 599990.00, 25),
('Mouse Inalámbrico Logitech', 'Mouse inalámbrico óptico con receptor USB', 15990.00, 150),
('Monitor Samsung 24"', 'Monitor LED Full HD 1920x1080 24 pulgadas', 179990.00, 30),
('Disco SSD 500GB', 'Unidad SSD SATA 2.5" 500GB alta velocidad', 79990.00, 80);

-- Insertar transacciones (Compras y Ventas)
INSERT INTO transacciones (tipo, fecha, cantidad, estado, id_producto, id_proveedor) VALUES
('Compra', '2024-01-15 10:00:00', 20, 'Completada', 1, 1),  -- Compra de Laptops
('Venta', '2024-01-17 14:30:00', 5, 'Completada', 1, NULL), -- Venta de Laptops (id_proveedor = NULL)
('Compra', '2024-01-16 11:00:00', 100, 'Completada', 2, 2), -- Compra de Mouses
('Venta', '2024-01-19 16:00:00', 10, 'Completada', 2, NULL), -- Venta de Mouses
('Compra', '2024-01-20 09:00:00', 30, 'Completada', 3, 1),  -- Compra de Monitores
('Venta', '2024-01-21 17:00:00', 2, 'Completada', 3, NULL);  -- Venta de Monitores