-- ============================================================
-- Tabla: silver.ordenes
-- Descripción: Almacena la información básica de las ordenes
-- --              de la empresa. Cada registro representa una
-- --              orden.
-- Autor: Teofilo Correa Rojas
-- Fecha: 4 de junio 2026
-- ============================================================

CREATE TABLE IF NOT EXISTS silver.ordenes (

    id              SERIAL,
    cliente_id      INTEGER         NOT NULL,
    empleado_id     INTEGER         NOT NULL,
    fecha_orden     DATE            NOT NULL,
    estado          VARCHAR(50)     NOT NULL,
    total           NUMERIC(10,2)   NOT NULL,
    created_at      TIMESTAMP       NOT NULL,

-- Contraint: silver.ordenes
    CONSTRAINT pk_ordenes PRIMARY KEY (id),
    CONSTRAINT chk_ordenes_estado CHECK ( estado IN ('pendiente', 'enviado', 'entregado')),
    CONSTRAINT chk_ordenes_total CHECK ( total > 0)
);