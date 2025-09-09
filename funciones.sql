USE cafeteria;

DELIMITER $$

CREATE FUNCTION contar_pedidos_cliente(p_dni_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad
    FROM pedidos
    WHERE dni_cliente = p_dni_cliente;
    RETURN cantidad;
END$$

DELIMITER ;


DELIMITER $$

CREATE FUNCTION producto_mas_vendido()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nombre_producto VARCHAR(100);

    SELECT p.nombre_producto
    INTO nombre_producto
    FROM productos p
    JOIN detalles_pedidos d ON p.id_producto = d.idx_productos
    GROUP BY p.id_producto, p.nombre_producto
    ORDER BY SUM(d.cantidad) DESC
    LIMIT 1;

    RETURN nombre_producto;
END$$

DELIMITER ;
