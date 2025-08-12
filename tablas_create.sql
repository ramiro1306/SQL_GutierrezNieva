CREATE DATABASE IF NOT EXISTS cafeteria;
USE cafeteria;

-- creacion de tablas:


CREATE TABLE IF NOT EXISTS clientes(
	dni VARCHAR(20) PRIMARY KEY NOT NULL, 
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(150) NOT NULL,
    email VARCHAR(150) DEFAULT NULL,
    telefono VARCHAR(25) DEFAULT NULL,
    puntos_acumulados INT DEFAULT NULL 
);

CREATE TABLE IF NOT EXISTS empleados(
	id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR (20) NOT NULL UNIQUE,
    edad INT DEFAULT NULL,
    sexo VARCHAR(50) DEFAULT NULL,
    email VARCHAR(150) DEFAULT NULL,
    direccion VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50) DEFAULT NULL,
    telefono VARCHAR(25) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedidos(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT, 
    dni_cliente VARCHAR(20),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni)
);

CREATE TABLE IF NOT EXISTS categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS productos(
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT,
	FOREIGN KEY (categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE IF NOT EXISTS detalles_pedidos( -- tabla para detallar cuando piden mas de un producto por pedido.
	idx_pedidos INT,
    idx_productos INT,
    cantidad INT,
    PRIMARY KEY(idx_pedidos,idx_productos),
    FOREIGN KEY (idx_pedidos) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (idx_productos) REFERENCES productos(id_producto)
);

CREATE TABLE IF NOT EXISTS ingredientes(
	id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    stock INT NOT NULL,
    unidad_de_medida VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS recetas(
	idx_producto INT,
    idx_ingredientes INT,
    cantidad INT NOT NULL,
    PRIMARY KEY(idx_producto,idx_ingredientes),
    FOREIGN KEY (idx_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (idx_ingredientes) REFERENCES ingredientes(id_ingrediente)
);

CREATE TABLE IF NOT EXISTS proveedores(
	id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    email VARCHAR(150) DEFAULT NULL
);


