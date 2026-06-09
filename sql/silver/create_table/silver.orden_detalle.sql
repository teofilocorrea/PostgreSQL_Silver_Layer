-- ============================================================
-- Tabla: silver.orden_detalle
-- Descripción: Almacena la información básica de los detalles de las ordenes
-- --              de la empresa. Cada registro representa
-- --              un detalle de la orden adquirida.
-- Autor: Teofilo Correa Rojas
-- Fecha: 4 de junio 2026
-- ============================================================

CREATE TABLE IF NOT EXISTS silver.orden_detalle (

    id                  SERIAL,
    orden_id            INTEGER         NOT NULL,
    producto_id         INTEGER         NOT NULL,
    cantidad            INTEGER         NOT NULL,
    precio_unitario     NUMERIC(10,2)   NOT NULL,
    subtotal            NUMERIC(10,2)   NOT NULL,
    created_at          TIMESTAMP       NOT NULL,

-- Contraint: silver.orden_detalle
    CONSTRAINT pk_orden_detalle PRIMARY KEY (id),
    CONSTRAINT chk_orden_detalle_cantidad CHECK ( cantidad > 0 ),
    CONSTRAINT chk_orden_detalle_precio CHECK ( precio_unitario > 0 ),
    CONSTRAINT chk_orden_detalle_subtotal CHECK ( subtotal > 0 )
);