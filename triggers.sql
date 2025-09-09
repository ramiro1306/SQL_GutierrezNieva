USE cafeteria;

DELIMITER $$

CREATE TRIGGER trg_descuento_stock
AFTER INSERT ON detalles_pedidos
FOR EACH ROW
BEGIN
    UPDATE productos
    SET cantidad = cantidad - NEW.cantidad
    WHERE idx_productos = NEW.idx_productos;
END$$

DELIMITER ;


CREATE TABLE auditoria_productos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    nombre_producto VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_auditar_producto
AFTER INSERT ON productos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_productos (id_producto, nombre_producto)
    VALUES (NEW.id_producto, NEW.nombre_producto);
END$$

DELIMITER ;

