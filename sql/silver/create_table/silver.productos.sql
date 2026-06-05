-- ============================================================
-- Tabla: silver.productos
-- Descripción: Almacena la información básica de los productos
-- --              de la empresa. Cada registro representa un
-- --              producto adquirido.
-- Autor: Teofilo Correa Rojas
-- Fecha: 1 de junio 2026
-- ============================================================

CREATE TABLE IF NOT EXISTS silver.productos (

    id SERIAL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    categoria_id INTEGER NOT NULL,
    proveedor_id INTEGER NOT NULL,
    activo BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,

    -- Contraint: silver.productos
    CONSTRAINT pk_productos PRIMARY KEY (id),
    CONSTRAINT chk_productos_precio CHECK ( precio > 0 ),
    CONSTRAINT chk_productos_stock CHECK ( stock >= 0 )
);