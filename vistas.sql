USE cafeteria;

CREATE VIEW vista_pedidos_clientes AS
SELECT c.dni, c.nombre, c.apellido, p.nombre_producto, d.cantidad
FROM clientes c
INNER JOIN pedidos pe ON pe.dni_cliente = c.dni
INNER JOIN detalles_pedidos d ON d.idx_pedidos = pe.id_pedido
INNER JOIN productos p ON d.idx_productos = p.id_producto;

CREATE VIEW vistas_disponibilidad_productos AS
SELECT id_producto, nombre_producto, stock, 
	CASE
    WHEN stock > 0 THEN "Disponible"
    ELSE "Agotado"
    END AS estado
FROM productos;