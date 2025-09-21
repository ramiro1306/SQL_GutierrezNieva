USE cafeteria;

-- Consultas: Obtener la cantidad de pedidos del dni ingresado:
SELECT cafeteria.contar_pedidos_cliente(12345678) AS pedidos_cliente;

-- Consultas: Obtener el producto mas vendido:
SELECT cafeteria.producto_mas_vendido();

-- Consultas: Obtener el pedido de un cliente:
CALL listar_pedidos_cliente(12345678);

-- Consultas: Agregar productos:
CALL cafeteria.agregar_producto('Lemon pie', 2, 1200, 15);