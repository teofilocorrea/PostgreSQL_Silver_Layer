SELECT 'silver.categorias' AS tabla, COUNT(*) AS registro FROM silver.categorias UNION ALL
SELECT 'silver.proveedores' AS tabla, COUNT(*) AS registro FROM silver.proveedores UNION ALL
SELECT 'silver.productos' AS tabla, COUNT(*) AS registro FROM silver.productos UNION ALL
SELECT 'silver.empleados' AS tabla, COUNT(*) AS registro FROM silver.empleados UNION ALL
SELECT 'silver.clientes' AS tabla, COUNT(*) AS registro FROM silver.clientes UNION ALL
SELECT 'silver.ordenes' AS tabla, COUNT(*) AS registro FROM silver.ordenes UNION ALL
SELECT 'silver.orden_detalle' AS tabla, COUNT(*) AS registro FROM silver.orden_detalle