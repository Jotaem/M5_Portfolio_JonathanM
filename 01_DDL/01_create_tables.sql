-- Creacion de la Base de Datos
CREATE DATABASE IF NOT EXISTS inventario_db;
USE inventario_db;

-- 1. Tabla Proveedores
CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- 2. Tabla Productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL CHECK (precio > 0),    -- Restricción: El precio debe ser positivo.
    cantidad INT NOT NULL CHECK (cantidad >= 0)           -- Restricción: El stock no puede ser negativo.
);

-- 3. Tabla Transacciones (Entidad Asociativa)
CREATE TABLE transacciones (
    id_transaction INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Compra', 'Venta') NOT NULL,
    fecha DATETIME NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),          -- Restricción: La cantidad de la transacción debe ser positiva.
    estado VARCHAR(20) NOT NULL,
    
    -- Claves Foráneas
    id_producto INT NOT NULL,
    id_proveedor INT, -- Permite NULL si la transaccion es una Venta a un cliente final
    
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);