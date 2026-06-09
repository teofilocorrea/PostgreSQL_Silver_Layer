-- ============================================================
-- Tabla: silver.categorias
-- Descripción: Almacena la información básica de las categorias
-- --              de la empresa. Cada registro representa una
-- --              categoria adquirida.
-- Autor: Teofilo Correa Rojas
-- Fecha: 31 de mayo 2026
-- ============================================================

CREATE TABLE IF NOT EXISTS silver.categorias (

    id SERIAL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(2000) NOT NULL,
    activo BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,

   -- Contraint: silver.categorias
    CONSTRAINT pk_categorias PRIMARY KEY (id),
    CONSTRAINT uq_categorias_nombre UNIQUE (nombre)
);