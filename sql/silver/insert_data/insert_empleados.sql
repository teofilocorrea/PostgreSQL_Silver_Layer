-- ============================================================
-- Script : INSERT SELECT — Bronze → Silver
-- Tabla  : silver.empleados
-- Origen : bronze.empleados
-- Destino: silver.empleados
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 7 de junio 2026
-- ============================================================

INSERT INTO silver.empleados (nombre, email, cargo, fecha_ingreso, activo, created_at)

SELECT
    nombre,
    email,
    cargo,
    fecha_ingreso,
    activo,
    created_at
FROM bronze.empleados;