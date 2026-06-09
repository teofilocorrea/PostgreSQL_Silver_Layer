-- ============================================================
-- Script : INSERT SELECT — Bronze → Silver
-- Tabla  : silver.ordenes
-- Origen : bronze.ordenes
-- Destino: silver.ordenes
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 7 de junio 2026
-- ============================================================

INSERT INTO silver.ordenes (cliente_id, empleado_id, fecha_orden, estado, total, created_at)

SELECT
    cliente_id,
    empleado_id,
    fecha_orden,
    estado,
    total,
    created_at
FROM bronze.ordenes;