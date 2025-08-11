CREATE DATABASE IF NOT EXISTS cafeteria;

CREATE TABLE IF NOT EXISTS clientes(
	dni VARCHAR(15) PRIMARY KEY NOT NULL, -- usamos dni como PK para que sea facil de recordar al cliente.
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(150) NOT NULL,
    email VARCHAR(200) DEFAULT NULL,
    telefono INT DEFAULT NULL,
    puntos_acumulados INT DEFAULT NULL -- puntos que acumula el cliente por las compras que hace.
);

CREATE TABLE IF NOT EXISTS pedidos(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT, 
    dni_cliente INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni)
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
    PRIMARY KEY(idx_pedidos,idx_productos),
    FOREIGN KEY (idx_pedidos) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (idx_productos) REFERENCES productos(id_producto)
);

CREATE TABLE IF NOT EXISTS categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100)
);





