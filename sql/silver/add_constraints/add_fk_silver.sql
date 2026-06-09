-- ============================================================
-- Script : ADD FK — Silver Layer
-- Autor  : Teofilo Correa Rojas
-- Fecha  : 4 de junio 2026
-- ============================================================

-- ==================
-- FK: silver.productos
-- ==================
ALTER TABLE silver.productos
    ADD CONSTRAINT fk_productos_categoria
    FOREIGN KEY (categoria_id)
    REFERENCES silver.categorias(id);

ALTER TABLE silver.productos
    ADD CONSTRAINT fk_productos_proveedor
    FOREIGN KEY (proveedor_id)
    REFERENCES silver.proveedores(id);

-- ==================
-- FK: silver.ordenes
-- ==================
ALTER TABLE silver.ordenes
    ADD CONSTRAINT fk_ordenes_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES silver.clientes(id);

ALTER TABLE silver.ordenes
    ADD CONSTRAINT fk_ordenes_empleado
    FOREIGN KEY (empleado_id)
    REFERENCES silver.empleados(id);

-- ========================
-- FK: silver.orden_detalle
-- ========================
ALTER TABLE silver.orden_detalle
    ADD CONSTRAINT fk_orden_detalle_orden
    FOREIGN KEY (orden_id)
    REFERENCES silver.ordenes(id);

ALTER TABLE silver.orden_detalle
    ADD CONSTRAINT fk_orden_detalle_producto
    FOREIGN KEY (producto_id)
    REFERENCES silver.productos(id);