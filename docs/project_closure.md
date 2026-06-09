# Project Closure — PostgreSQL Silver Layer

## 📋 Información del proyecto

| Campo | Detalle |
|---|---|
| **Proyecto** | PostgreSQL Silver Layer |
| **Autor** | Teófilo Correa Rojas |
| **Fecha inicio** | Mayo 2026 |
| **Fecha cierre** | Junio 2026 |
| **Estado** | ✅ Completado |

---

## 🎯 Objetivos — ¿Se cumplieron?

| Objetivo | Estado |
|---|---|
| Implementar constraints formales UNIQUE, CHECK, NOT NULL | ✅ Completado |
| Aplicar relaciones FK con REFERENCES entre tablas | ✅ Completado |
| Garantizar la calidad del dato en la capa Silver | ✅ Completado |
| Cargar datos desde Bronze con INSERT SELECT | ✅ Completado |
| Documentar el modelo como Diccionario de Datos | ✅ Completado |
| Sentar las bases para la capa Gold | ✅ Completado |

---

## 🧱 Lo que se construyó

### Tablas creadas

| Tabla | Constraints aplicados |
|---|---|
| `silver.categorias` | PK + UNIQUE (nombre) |
| `silver.proveedores` | PK + UNIQUE (nombre, email) |
| `silver.productos` | PK + CHECK (precio, stock) |
| `silver.empleados` | PK + UNIQUE (email) |
| `silver.clientes` | PK + UNIQUE (email) |
| `silver.ordenes` | PK + CHECK (estado, total) |
| `silver.orden_detalle` | PK + CHECK (cantidad, precio, subtotal) |

### Relaciones FK implementadas

| Constraint | Relación |
|---|---|
| `fk_productos_categoria` | productos → categorias |
| `fk_productos_proveedor` | productos → proveedores |
| `fk_ordenes_cliente` | ordenes → clientes |
| `fk_ordenes_empleado` | ordenes → empleados |
| `fk_orden_detalle_orden` | orden_detalle → ordenes |
| `fk_orden_detalle_producto` | orden_detalle → productos |

### Scripts creados

| Carpeta | Archivos | Descripción |
|---|---|---|
| `create_tables/` | 7 scripts | CREATE TABLE con CHECK y UNIQUE |
| `add_constraints/` | 1 script | ALTER TABLE con todas las FK |
| `insert_data/` | 7 scripts | INSERT SELECT Bronze → Silver |

---

## 📚 Lo que aprendí en este proyecto

### Nuevos conceptos

| Concepto | Descripción |
|---|---|
| `UNIQUE` | No permite valores duplicados en un campo |
| `CHECK` | Valida que el valor cumpla una condición |
| `REFERENCES` | FK formal que valida integridad referencial |
| `IN` en CHECK | Restringe valores a una lista permitida |
| Constraints nombrados | Prefijos pk_, uq_, chk_, fk_ |
| Orden de inserción | Crítico cuando hay FK activas |

### Decisiones técnicas importantes

- CHECK va dentro del CREATE TABLE con nombre definido
- FK va modular con ALTER TABLE después de crear todas las tablas
- El orden de INSERT SELECT es obligatorio por las FK activas
- Silver no tiene columnas de auditoría — esas pertenecen a Bronze
- UNIQUE en email garantiza que no existan clientes o empleados duplicados

---

## 🔍 Diferencias entre capas

| Aspecto | STG | Bronze | Silver |
|---|---|---|---|
| PRIMARY KEY | ✅ | ✅ | ✅ nombrado |
| NOT NULL | ✅ mínimo | ✅ mínimo | ✅ estricto |
| UNIQUE | ❌ | ❌ | ✅ |
| CHECK | ❌ | ❌ | ✅ |
| FK formal | ❌ | ❌ | ✅ |
| Auditoría | ❌ | ✅ | ❌ |
| Carga de datos | INSERT manual | INSERT SELECT | INSERT SELECT |

---

## 🔑 Lección más importante