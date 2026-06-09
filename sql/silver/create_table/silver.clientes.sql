-- ============================================================
-- Tabla: silver.clientes
-- Descripción: Almacena la información básica de los clientes
-- --              de la empresa. Cada registro representa un
-- --              clientes.
-- Autor: Teofilo Correa Rojas
-- Fecha: 3 de junio 2026
-- ============================================================

CREATE TABLE IF NOT EXISTS silver.clientes (

    id                  SERIAL,
    nombre              VARCHAR(250)     NOT NULL,
    email               VARCHAR(100)     NOT NULL,
    telefono            VARCHAR(30)      NOT NULL,
    ciudad              VARCHAR(250)     NOT NULL,
    pais                VARCHAR(250)     NOT NULL,
    fecha_registro      DATE             NOT NULL,
    activo              BOOLEAN          NOT NULL,
    created_at          TIMESTAMP        NOT NULL,

-- Contraint: silver.clientes
    CONSTRAINT pk_clientes          PRIMARY KEY (id),
    CONSTRAINT uq_clientes_email    UNIQUE (email)
);