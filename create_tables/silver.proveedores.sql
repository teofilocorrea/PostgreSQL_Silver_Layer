-- ============================================================
-- Tabla: silver.proveedores
-- Descripción: Almacena la información básica de los proveedores
-- --              de la empresa. Cada registro representa
-- --              proveedores adquirido.
-- Autor: Teofilo Correa Rojas
-- Fecha: 1 de junio 2026
-- ============================================================

CREATE TABLE IF NOT EXISTS silver.proveedores (

    id SERIAL,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(150),
    email VARCHAR(150) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    pais VARCHAR(100),
    activo BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,

    -- Contraint: silver.proveedores
    CONSTRAINT pk_proveedores PRIMARY KEY (id),
    CONSTRAINT uq_proveedores_nombre UNIQUE (nombre),
    CONSTRAINT uq_proveedores_email UNIQUE (email)
);