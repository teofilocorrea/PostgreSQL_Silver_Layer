# Diccionario de Datos — Silver Layer

## Propósito de la capa
Capa de datos limpios y validados. Los datos vienen de Bronze
y se aplican constraints formales para garantizar la calidad del dato.

## Reglas generales de la capa
- PRIMARY KEY con nombre definido
- NOT NULL estricto en campos obligatorios
- UNIQUE en campos identificadores de negocio
- CHECK para validar rangos y valores permitidos
- FK con REFERENCES para relaciones formales
- Datos cargados con INSERT SELECT desde Bronze

## Convención de nombres para constraints

| Tipo | Prefijo | Ejemplo |
|---|---|---|
| PRIMARY KEY | `pk_` | `pk_categorias` |
| UNIQUE | `uq_` | `uq_categorias_nombre` |
| CHECK | `chk_` | `chk_productos_precio` |
| FOREIGN KEY | `fk_` | `fk_productos_categoria` |

---

## Tabla: silver.categorias

### Descripción
Almacena la información básica de las categorias de la empresa.
Cada registro representa a una categoria de los productos.

### Campos

| Campo | ¿Qué guarda? | Obligatorio | Único | Tipo elegido | Constraint | Nombre constraint |
|---|---|---|---|---|---|---|
| id | Identificador único de la categoría | Sí | Sí | SERIAL | PRIMARY KEY | `pk_categorias` |
| nombre | Nombre de la categoría ej: Ropa, Electrónica | Sí | Sí | VARCHAR(100) | NOT NULL + UNIQUE | `uq_categorias_nombre` |
| descripcion | Detalle de qué incluye la categoría | Sí | No | VARCHAR(2000) | NOT NULL | — |
| activo | Si la categoría está disponible o no | Sí | No | BOOLEAN | NOT NULL | — |
| created_at | Cuándo se creó el registro en la BD | Sí | No | TIMESTAMP | NOT NULL | — |

---

## Tabla: silver.proveedores

### Descripción
Almacena la información básica de los proveedores de la empresa.
Cada registro representa un proveedor contratado.

### Campos

| Campo | ¿Qué guarda? | Obligatorio | Único | Tipo elegido | Constraint | Nombre constraint |
|---|---|---|---|---|---|---|
| id | Identificador único del proveedor | Sí | Sí | SERIAL | PRIMARY KEY | `pk_proveedores` |
| nombre | Nombre de la empresa proveedora | Sí | Sí | VARCHAR(100) | NOT NULL + UNIQUE | `uq_proveedores_nombre` |
| contacto | Nombre de la persona de contacto | No | No | VARCHAR(150) | — | — |
| email | Correo electrónico del proveedor | Sí | Sí | VARCHAR(150) | NOT NULL + UNIQUE | `uq_proveedores_email` |
| telefono | Número de teléfono | Sí | No | VARCHAR(15) | NOT NULL | — |
| pais | País de origen del proveedor | No | No | VARCHAR(100) | — | — |
| activo | Si el proveedor está activo | Sí | No | BOOLEAN | NOT NULL | — |
| created_at | Cuándo se creó el registro | Sí | No | TIMESTAMP | NOT NULL | — |

---

## Tabla: silver.productos

### Descripción
Almacena la información básica de los productos de la empresa.
Cada registro representa un producto adquirido.

### Campos

| Campo | ¿Qué guarda? | Obligatorio | Único | Tipo elegido | Constraint | Nombre constraint |
|---|---|---|---|---|---|---|
| id | Identificador único del producto | Sí | Sí | SERIAL | PRIMARY KEY | `pk_productos` |
| nombre | Nombre del producto | Sí | No | VARCHAR(100) | NOT NULL | — |
| descripcion | Descripción detallada del producto | Sí | No | TEXT | NOT NULL | — |
| precio | Precio de venta | Sí | No | NUMERIC(10,2) | NOT NULL + CHECK (precio > 0) | `chk_productos_precio` |
| stock | Cantidad disponible en inventario | Sí | No | INTEGER | NOT NULL + CHECK (stock >= 0) | `chk_productos_stock` |
| categoria_id | FK — a qué categoría pertenece | Sí | No | INTEGER | NOT NULL + FK | `fk_productos_categoria` |
| proveedor_id | FK — quién lo suministra | Sí | No | INTEGER | NOT NULL + FK | `fk_productos_proveedor` |
| activo | Si el producto está disponible | Sí | No | BOOLEAN | NOT NULL | — |
| created_at | Cuándo se creó el registro | Sí | No | TIMESTAMP | NOT NULL | — |

---

## Tabla: silver.empleados

### Descripción
Almacena la información básica de los empleados de la empresa.
Cada registro representa a un empleado.

### Campos

| Campo | ¿Qué guarda? | Obligatorio | Único | Tipo elegido | Constraint | Nombre constraint |
|---|---|---|---|---|---|---|
| id | Identificador único del empleado | Sí | Sí | SERIAL | PRIMARY KEY | `pk_empleados` |
| nombre | Nombre completo | Sí | No | VARCHAR(250) | NOT NULL | — |
| email | Correo corporativo | Sí | Sí | VARCHAR(100) | NOT NULL + UNIQUE | `uq_empleados_email` |
| cargo | Puesto que ocupa ej: Vendedor, Gerente | Sí | No | VARCHAR(250) | NOT NULL | — |
| fecha_ingreso | Cuándo entró a la empresa | Sí | No | DATE | NOT NULL | — |
| activo | Si está activo en la empresa | Sí | No | BOOLEAN | NOT NULL | — |
| created_at | Cuándo se creó el registro en la BD | Sí | No | TIMESTAMP | NOT NULL | — |

---

## Tabla: silver.clientes

### Descripción
Almacena la información básica de los clientes de la empresa.
Cada registro representa a un cliente.

### Campos

| Campo | ¿Qué guarda? | Obligatorio | Único | Tipo elegido | Constraint | Nombre constraint |
|---|---|---|---|---|---|---|
| id | Identificador único del cliente | Sí | Sí | SERIAL | PRIMARY KEY | `pk_clientes` |
| nombre | Nombre completo | Sí | No | VARCHAR(250) | NOT NULL | — |
| email | Correo del cliente | Sí | Sí | VARCHAR(100) | NOT NULL + UNIQUE | `uq_clientes_email` |
| telefono | Teléfono de contacto | Sí | No | VARCHAR(30) | NOT NULL | — |
| ciudad | Ciudad donde vive | Sí | No | VARCHAR(250) | NOT NULL | — |
| pais | País donde vive | Sí | No | VARCHAR(250) | NOT NULL | — |
| fecha_registro | Cuándo se registró como cliente | Sí | No | DATE | NOT NULL | — |
| activo | Si el cliente está activo | Sí | No | BOOLEAN | NOT NULL | — |
| created_at | Cuándo se creó el registro en la BD | Sí | No | TIMESTAMP | NOT NULL | — |

---

## Tabla: silver.ordenes

### Descripción
Almacena la información básica de las ordenes de la empresa.
Cada registro representa a una orden generada.

### Campos

| Campo | ¿Qué guarda? | Obligatorio | Único | Tipo elegido | Constraint | Nombre constraint |
|---|---|---|---|---|---|---|
| id | Identificador único de la orden | Sí | Sí | SERIAL | PRIMARY KEY | `pk_ordenes` |
| cliente_id | FK — quién hizo la compra | Sí | No | INTEGER | NOT NULL + FK | `fk_ordenes_cliente` |
| empleado_id | FK — quién procesó la orden | Sí | No | INTEGER | NOT NULL + FK | `fk_ordenes_empleado` |
| fecha_orden | Cuándo se realizó la compra | Sí | No | DATE | NOT NULL | — |
| estado | Estado ej: pendiente, enviado, entregado | Sí | No | VARCHAR(50) | NOT NULL + CHECK | `chk_ordenes_estado` |
| total | Monto total de la orden | Sí | No | NUMERIC(10,2) | NOT NULL + CHECK (total > 0) | `chk_ordenes_total` |
| created_at | Cuándo se creó el registro en la BD | Sí | No | TIMESTAMP | NOT NULL | — |

### Valores permitidos
| Campo | Valores |
|---|---|
| `estado` | `'pendiente'`, `'enviado'`, `'entregado'` |

---

## Tabla: silver.orden_detalle

### Descripción
Almacena la información básica de los detalles de la orden de la empresa.
Cada registro representa a un detalle de la orden generada.

### Campos

| Campo | ¿Qué guarda? | Obligatorio | Único | Tipo elegido | Constraint | Nombre constraint |
|---|---|---|---|---|---|---|
| id | Identificador único del detalle | Sí | Sí | SERIAL | PRIMARY KEY | `pk_orden_detalle` |
| orden_id | FK — a qué orden pertenece | Sí | No | INTEGER | NOT NULL + FK | `fk_orden_detalle_orden` |
| producto_id | FK — qué producto se compró | Sí | No | INTEGER | NOT NULL + FK | `fk_orden_detalle_producto` |
| cantidad | Cuántas unidades se compraron | Sí | No | INTEGER | NOT NULL + CHECK (cantidad > 0) | `chk_orden_detalle_cantidad` |
| precio_unitario | Precio del producto al momento de compra | Sí | No | NUMERIC(10,2) | NOT NULL + CHECK (precio_unitario > 0) | `chk_orden_detalle_precio` |
| subtotal | cantidad x precio_unitario | Sí | No | NUMERIC(10,2) | NOT NULL + CHECK (subtotal > 0) | `chk_orden_detalle_subtotal` |
| created_at | Cuándo se creó el registro en la BD | Sí | No | TIMESTAMP | NOT NULL | — |

---

## FK — Relaciones formales

| Tabla origen | Campo | Tabla destino | Nombre constraint |
|---|---|---|---|
| `silver.productos` | `categoria_id` | `silver.categorias` | `fk_productos_categoria` |
| `silver.productos` | `proveedor_id` | `silver.proveedores` | `fk_productos_proveedor` |
| `silver.ordenes` | `cliente_id` | `silver.clientes` | `fk_ordenes_cliente` |
| `silver.ordenes` | `empleado_id` | `silver.empleados` | `fk_ordenes_empleado` |
| `silver.orden_detalle` | `orden_id` | `silver.ordenes` | `fk_orden_detalle_orden` |
| `silver.orden_detalle` | `producto_id` | `silver.productos` | `fk_orden_detalle_producto` |~~~~