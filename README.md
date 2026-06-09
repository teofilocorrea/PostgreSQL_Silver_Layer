![Banner](sql/03_silver/asset/table_design_SQL_silver.png)

## 📌 Descripción

Este proyecto tiene como objetivo construir y documentar las **tablas
de la capa Silver** de una plataforma de datos en PostgreSQL,
aplicando la arquitectura Medallion como base de organización.

El enfoque es práctico y progresivo, aprendiendo constraints formales,
relaciones FK y el proceso de carga entre capas con INSERT SELECT
garantizando la calidad del dato.

---

## 🎯 Objetivos del proyecto

- Implementar constraints formales (UNIQUE, CHECK, NOT NULL)
- Aplicar relaciones FK con REFERENCES entre tablas
- Garantizar la calidad del dato en la capa Silver
- Cargar datos entre capas usando INSERT SELECT desde Bronze
- Documentar el modelo de datos como Diccionario de Datos
- Sentar las bases para la capa Gold

---

## 🏗️ Arquitectura — Silver Layer

```
Arquitectura Medallion
│
├── STG     ← Proyecto 2
├── Bronze  ← Proyecto 3
├── Silver  ← este proyecto
└── Gold    ← Proyecto 5
```

La capa Silver es la capa de datos limpios y validados.
Los datos vienen de Bronze y se aplican constraints formales
para garantizar la calidad del dato.

**Reglas de esta capa:**
- PRIMARY KEY con nombre definido
- NOT NULL estricto en campos obligatorios
- UNIQUE en campos identificadores de negocio
- CHECK para validar rangos y valores permitidos
- FK con REFERENCES para relaciones formales
- Sin columnas de auditoría
- Datos cargados con INSERT SELECT desde Bronze

---

## 🧱 Estructura del proyecto

```
PostgreSQL_Silver_Layer/
│
├── asset/
│   └── table_design_SQL_silver.png
│
├── docs/
│   ├── data_dictionary.md
│   └── project_closure.md
│
├── sql/
│   └── 03_silver/
│       ├── asset/
│       │   └── table_design_SQL_silver.png
│       ├── create_tables/
│       │   ├── 01_create_categorias.sql
│       │   ├── 02_create_proveedores.sql
│       │   ├── 03_create_productos.sql
│       │   ├── 04_create_empleados.sql
│       │   ├── 05_create_clientes.sql
│       │   ├── 06_create_ordenes.sql
│       │   └── 07_create_orden_detalle.sql
│       ├── add_constraints/
│       │   └── 01_add_fk_silver.sql
│       ├── insert_data/
│       │   ├── 01_insert_categorias.sql
│       │   ├── 02_insert_proveedores.sql
│       │   ├── 03_insert_productos.sql
│       │   ├── 04_insert_empleados.sql
│       │   ├── 05_insert_clientes.sql
│       │   ├── 06_insert_ordenes.sql
│       │   └── 07_insert_orden_detalle.sql
│       ├── README.md
│       └── data_dictionary_silver.md
│
├── .gitignore
└── README.md
```

---

## 📊 Entidades del modelo

| Tabla | Descripción | Constraints nuevos |
|---|---|---|
| `silver.categorias` | Categorías de productos | PK + UNIQUE |
| `silver.proveedores` | Proveedores de la empresa | PK + UNIQUE |
| `silver.productos` | Catálogo de productos | PK + CHECK |
| `silver.empleados` | Empleados de la empresa | PK + UNIQUE |
| `silver.clientes` | Clientes registrados | PK + UNIQUE |
| `silver.ordenes` | Órdenes de compra | PK + CHECK + FK |
| `silver.orden_detalle` | Detalle de cada orden | PK + CHECK + FK |

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
📄 [data_dictionary_silver.md](sql/03_silver/data_dictionary_silver.md)

---

## 🔗 Relaciones formales — FK

| Tabla origen | Campo | Tabla destino | Constraint |
|---|---|---|---|
| `silver.productos` | `categoria_id` | `silver.categorias` | `fk_productos_categoria` |
| `silver.productos` | `proveedor_id` | `silver.proveedores` | `fk_productos_proveedor` |
| `silver.ordenes` | `cliente_id` | `silver.clientes` | `fk_ordenes_cliente` |
| `silver.ordenes` | `empleado_id` | `silver.empleados` | `fk_ordenes_empleado` |
| `silver.orden_detalle` | `orden_id` | `silver.ordenes` | `fk_orden_detalle_orden` |
| `silver.orden_detalle` | `producto_id` | `silver.productos` | `fk_orden_detalle_producto` |

---

## 🗺️ Diagrama ERD

![ERD Silver](sql/03_silver/asset/diagram_erd_silver.png)

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

## 🔗 Proyectos relacionados

| # | Proyecto | Descripción |
|---|---|---|
| 1 | [PostgreSQL_Database_Infrastructure](https://github.com/teofilocorrea/PostgreSQL_Database_Infrastructure) | Base de datos y esquemas |
| 2 | [PostgreSQL_Table_Design](https://github.com/teofilocorrea/PostgreSQL_Table_Design) | STG Layer |
| 3 | [PostgreSQL_Bronze_Layer](https://github.com/teofilocorrea/PostgreSQL_Bronze_Layer) | Bronze Layer |
| 4 | PostgreSQL_Silver_Layer | Silver Layer ← estás aquí |
| 5 | PostgreSQL_Data_Modeling | Gold + Star Schema |

---

## 👤 Autor

### Teófilo Correa Rojas

**Data Analytics | Data Engineering en formación**

🔗 [LinkedIn](https://www.linkedin.com/in/teófilo-correa-rojas/)