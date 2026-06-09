-- ============================================================
-- Script : INSERT SELECT — Bronze → Silver
-- Tabla  : silver.ordenes_detalle
-- Origen : bronze.ordenes_detalle
-- Destino: silver.ordenes_detalle
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 7 de junio 2026
-- ============================================================

INSERT INTO silver.orden_detalle (orden_id, producto_id, cantidad, precio_unitario, subtotal, created_at)

SELECT
    orden_id,
    producto_id,
    cantidad,
    precio_unitario,
    subtotal,
    created_at
FROM bronze.orden_detalle;