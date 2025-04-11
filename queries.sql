--Listar los productos con stock menor a 5 unidades.
select * from productos where stock_disponible < 5;

--Calcular ventas totales de un mes específico.
select sum(cantidad) as ventas from ventas where fecha_venta 
between '2025-01-01' and '2025-01-31';

--Obtener el cliente con más compras realizadas.
select c.*, v.cantidad from clientes c 
inner join ventas v on c.id_cliente = v.id_cliente 
order by cantidad desc limit 1;

--Listar los 5 productos más vendidos.
select p.*, sum(v.cantidad) as cantidad from productos p 
inner join ventas v on p.id_producto = v.id_producto 
group by p.id_producto order by cantidad desc limit 5;

--Consultar ventas realizadas en un rango de fechas de tres Días.
select c.nombre as nombre_cliente, p.nombre as nombre_producto, p.categoria, v.cantidad, v.fecha_venta from ventas v 
inner join clientes c on v.id_cliente = c.id_cliente 
inner join productos p on v.id_producto = p.id_producto
where v.fecha_venta between '2024-03-12' and '2024-04-12';

--Consultar ventas realizadas en un rango de fechas de un Mes.
select c.nombre as nombre_cliente, p.nombre as nombre_producto, p.categoria, v.cantidad, v.fecha_venta from ventas v 
inner join clientes c on v.id_cliente = c.id_cliente 
inner join productos p on v.id_producto = p.id_producto
where v.fecha_venta between '2024-03-12' and '2024-03-15';

--Identificar clientes que no han comprado en los últimos 6 meses.
select c.*, v.fecha_venta from clientes c 
inner join ventas v on c.id_cliente = v.id_cliente where fecha_venta < '2024-10-11'); 