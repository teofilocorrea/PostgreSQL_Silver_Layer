-- ============================================================
-- Script : INSERT SELECT — Bronze → Silver
-- Tabla  : silver.proveedores
-- Origen : bronze.proveedores
-- Destino: silver.proveedores
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 6 de junio 2026
-- ============================================================

INSERT INTO silver.proveedores (nombre, contacto, email, telefono, pais, activo, created_at)

SELECT
    nombre,
    contacto,
    email,
    telefono,
    pais,
    activo,
    created_at
FROM
    bronze.proveedores;