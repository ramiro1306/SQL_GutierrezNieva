USE cafeteria;

DELIMITER $$

CREATE PROCEDURE listar_pedidos_cliente(IN p_dni_cliente INT)
BEGIN
    SELECT pe.id_pedido, pe.fecha, p.nombre_producto, d.cantidad, d.cantidad * p.precio AS subtotal
    FROM pedidos pe
    JOIN detalles_pedidos d ON pe.id_pedido = d.idx_pedidos
    JOIN productos p ON d.idx_productos = p.id_producto
    WHERE pe.dni_cliente = p_dni_cliente;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE agregar_producto(
    IN p_nombre VARCHAR(100),
    IN p_categoria INT,
    IN p_precio DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO productos (nombre_producto, categoria, precio, stock)
    VALUES (p_nombre, p_categoria, p_precio, p_stock);
END$$

DELIMITER ;