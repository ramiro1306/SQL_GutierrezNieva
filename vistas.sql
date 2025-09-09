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

CREATE VIEW vista_ventas_productos AS
SELECT p.nombre_producto, SUM(d.cantidad) AS total_vendido, SUM(d.cantidad * p.precio) AS ingreso_total
FROM productos p
INNER JOIN detalles_pedidos d ON p.id_producto = d.idx_productos
GROUP BY p.nombre_producto;

CREATE VIEW vista_ingresos_diarios AS
SELECT DATE(pe.fecha) AS fecha, SUM(d.cantidad * p.precio) AS total_diario
FROM pedidos pe
JOIN detalles_pedidos d ON pe.id_pedido = d.idx_pedidos
JOIN productos p ON d.idx_productos = p.id_producto
GROUP BY DATE(pe.fecha);

CREATE VIEW vista_ingresos_mensuales AS
SELECT YEAR(pe.fecha) AS anio, MONTH(pe.fecha) AS mes, SUM(d.cantidad * p.precio) AS total_mensual
FROM pedidos pe
JOIN detalles_pedidos d ON pe.id_pedido = d.idx_pedidos
JOIN productos p ON d.idx_productos = p.id_producto
GROUP BY YEAR(pe.fecha), MONTH(pe.fecha);

