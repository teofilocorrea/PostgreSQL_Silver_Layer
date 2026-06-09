# Silver Layer — PostgreSQL Silver Layer

## ¿Qué es esta capa?

La capa Silver es la tercera capa de la arquitectura Medallion.
Es la capa de datos limpios y validados. Los datos vienen de Bronze
y se aplican constraints formales para garantizar la calidad del dato.

---

## 📋 Reglas de esta capa

- PRIMARY KEY con nombre definido
- NOT NULL estricto en campos obligatorios
- UNIQUE en campos identificadores de negocio
- CHECK para validar rangos y valores permitidos
- FK con REFERENCES para relaciones formales
- Sin columnas de auditoría
- Datos cargados con INSERT SELECT desde Bronze

---

## 📊 Tablas

| Tabla | Descripción | Origen |
|---|---|---|
| `silver.categorias` | Categorías de productos | `bronze.categorias` |
| `silver.proveedores` | Proveedores de la empresa | `bronze.proveedores` |
| `silver.productos` | Catálogo de productos | `bronze.productos` |
| `silver.empleados` | Empleados de la empresa | `bronze.empleados` |
| `silver.clientes` | Clientes registrados | `bronze.clientes` |
| `silver.ordenes` | Órdenes de compra | `bronze.ordenes` |
| `silver.orden_detalle` | Detalle de cada orden | `bronze.orden_detalle` |

---

## 📖 Diccionario de Datos

### Convención de nombres para constraints

| Tipo | Prefijo | Ejemplo |
|---|---|---|
| PRIMARY KEY | `pk_` | `pk_categorias` |
| UNIQUE | `uq_` | `uq_categorias_nombre` |
| CHECK | `chk_` | `chk_productos_precio` |
| FOREIGN KEY | `fk_` | `fk_productos_categoria` |

### Documentación completa
📄 [data_dictionary_silver.md](data_dictionary_silver.md)

---

## 🔗 Relaciones formales — FK

| Tabla origen | Campo | Tabla destino |
|---|---|---|
| `silver.productos` | `categoria_id` | `silver.categorias` |
| `silver.productos` | `proveedor_id` | `silver.proveedores` |
| `silver.ordenes` | `cliente_id` | `silver.clientes` |
| `silver.ordenes` | `empleado_id` | `silver.empleados` |
| `silver.orden_detalle` | `orden_id` | `silver.ordenes` |
| `silver.orden_detalle` | `producto_id` | `silver.productos` |

---

## 🔄 Proceso de carga — INSERT SELECT

Los datos se copian desde Bronze hacia Silver usando INSERT SELECT:

```sql
INSERT INTO silver.categorias (
    nombre,
    descripcion,
    activo,
    created_at
)
SELECT
    nombre,
    descripcion,
    activo,
    created_at
FROM bronze.categorias;
```

---

## 🗂️ Estructura de archivos

```
03_silver/
├── asset/
│   └── table_design_SQL_silver.png
├── create_tables/
│   ├── 01_create_categorias.sql
│   ├── 02_create_proveedores.sql
│   ├── 03_create_productos.sql
│   ├── 04_create_empleados.sql
│   ├── 05_create_clientes.sql
│   ├── 06_create_ordenes.sql
│   └── 07_create_orden_detalle.sql
├── add_constraints/
│   └── 01_add_fk_silver.sql
├── insert_data/
│   ├── 01_insert_categorias.sql
│   ├── 02_insert_proveedores.sql
│   ├── 03_insert_productos.sql
│   ├── 04_insert_empleados.sql
│   ├── 05_insert_clientes.sql
│   ├── 06_insert_ordenes.sql
│   └── 07_insert_orden_detalle.sql
├── README.md
└── data_dictionary_silver.md
```

---

## 🔗 Capas relacionadas

| Capa | Descripción |
|---|---|
| ⬆️ Bronze | Origen de los datos — datos con auditoría |
| ➡️ **Silver** | Estás aquí — datos limpios y validados |
| ⬇️ Gold | Próxima capa — modelo dimensional |