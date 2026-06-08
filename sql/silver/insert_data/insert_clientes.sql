-- ============================================================
-- Script : INSERT SELECT — Bronze → Silver
-- Tabla  : silver.clientes
-- Origen : bronze.clientes
-- Destino: silver.clientes
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 7 de junio 2026
-- ============================================================

INSERT INTO silver.clientes (nombre, email, telefono, ciudad, pais, fecha_registro, activo, created_at)

SELECT
    nombre,
    email,
    telefono,
    ciudad,
    pais,
    fecha_registro,
    activo,
    created_at
FROM bronze.clientes;