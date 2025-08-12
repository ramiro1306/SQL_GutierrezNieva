USE cafeteria;

-- insertamos algunos datos en las tablas:

-- TABLA CLIENTES
INSERT INTO clientes(dni, nombre, apellido, email, telefono, puntos_acumulados) VALUES
('12345678', 'Juan', 'Pérez', 'juan@example.com', '111-222-333', 50),
('87654321', 'María', 'Gómez', 'maria@example.com', '222-333-444', 120),
('45678912', 'Luis', 'Fernández', 'luis@example.com', '333-444-555', 30);

-- TABLA EMPLEADOS:
INSERT INTO empleados(nombre, apellido, dni, edad, sexo, email, direccion, nacionalidad, telefono, puesto, salario) VALUES
('Ana', 'López', '11111111', 28, 'Femenino', 'ana@example.com', 'Calle 1', 'Argentina', '444-555-666', 'Cajera', 120000.00),
('Pedro', 'Martínez', '22222222', 35, 'Masculino', 'pedro@example.com', 'Calle 2', 'Argentina', '555-666-777', 'Barista', 150000.00),
('Lucía', 'Ruiz', '33333333', 40, 'Femenino', 'lucia@example.com', 'Calle 3', 'Uruguay', '666-777-888', 'Panadera', 170000.00);

-- TABLA PEDIDOS
INSERT INTO pedidos(dni_cliente, total) VALUES
('12345678', 1700.00),
('87654321', 3000.00),
('45678912', 2500.00);

-- TABLA CATEGORIAS
INSERT INTO categorias(nombre_categoria) VALUES
('bebidas'),
('pasteleria'),
('sandwiches');

-- TABLA PRODUCTOS
INSERT INTO productos(nombre_producto, categoria, precio, stock) VALUES
('Café', 1, 1200.00, 50),
('Medialuna', 2, 500.00, 100),
('Sandwich de jamón y queso', 3, 1500.00, 30);

-- TABLA DETALLES_PEDIDOS
INSERT INTO detalles_pedidos(idx_pedidos, idx_productos, cantidad) VALUES
(1, 1, 1),
(1, 2, 1),  
(2, 3, 2);

-- TABLA INGREDIENTES
INSERT INTO ingredientes(nombre, stock, unidad_de_medida) VALUES
('Café molido', 5, 'kg'),
('Harina', 20, 'kg'),
('Jamón', 3, 'kg');

-- TABLA RECETAS
INSERT INTO recetas(idx_producto, idx_ingredientes, cantidad) VALUES
(1, 1, 0.02),
(2, 2, 0.05),
(3, 3, 0.1);

-- TABLA PROVEEDORES
INSERT INTO proveedores(nombre, telefono, email) VALUES
('Proveedor A', '777-888-999', 'provA@example.com'),
('Proveedor B', '888-999-000', 'provB@example.com'),
('Proveedor C', '999-000-111', 'provC@example.com');


