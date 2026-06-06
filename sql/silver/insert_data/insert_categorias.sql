-- ============================================================
-- Script : INSERT SELECT — Bronze → Silver
-- Tabla  : silver.categorias
-- Origen : bronze.categorias
-- Destino: silver.categorias
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 6 de junio 2026
-- ============================================================

INSERT INTO silver.categorias (nombre, descripcion, activo, created_at)

SELECT
    nombre,
    descripcion,
    activo,
    created_at
FROM bronze.categorias;