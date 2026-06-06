-- ============================================================
-- Script : INSERT SELECT — Bronze → Silver
-- Tabla  : silver.productos
-- Origen : bronze.productos
-- Destino: silver.productos
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 6 de junio 2026
-- ============================================================

INSERT INTO silver.productos (nombre, descripcion, precio, stock, categoria_id, proveedor_id, activo, created_at)

SELECT
    nombre,
    descripcion,
    precio,
    stock,
    categoria_id,
    proveedor_id,
    activo,
    created_at
FROM bronze.productos;