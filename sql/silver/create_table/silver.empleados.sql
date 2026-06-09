-- ============================================================
-- Tabla: silver.empleados
-- Descripción: Almacena la información básica de los empleados
--              de la empresa. Cada registro representa
--              un empleado.
-- Autor: Teofilo Correa Rojas
-- Fecha: 3 de junio 2026
-- ============================================================

CREATE TABLE IF NOT EXISTS silver.empleados (

    id SERIAL,
    nombre VARCHAR(250) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cargo VARCHAR(250) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    activo BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,

    -- Contraint: silver.empleados
    CONSTRAINT pk_empleados PRIMARY KEY (id),
    CONSTRAINT uq_empleados_email UNIQUE (email)
);