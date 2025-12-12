## 01_DDL: Definición de la Estructura (CREATE TABLE)

Este código SQL define la estructura de la base de datos `inventario_db`.

El archivo `01_create_tables.sql` incluye:
* Definición de Claves Primarias (PK) y Foráneas (FK).
* Restricciones de integridad de datos (NOT NULL, UNIQUE).
* Restricciones CHECK para asegurar que `precio` y `cantidad` sean valores válidos (positivos o no negativos).