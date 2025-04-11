create or replace procedure registrar_venta(product_id int, cantidad_venta int, fecha date, cliente_id int)
language plpgsql
as $$
declare 
	cant_stock int;
begin

	select stock into cant_stock from productos where id_producto = product_id;

	if not found then
		raise exception 'El producto con id % no existe.', product_id;
	end if;

	if cant_stock < cantidad_venta then
		raise exception 'No hay stock suficiente';
	end if;

	insert into ventas (id_producto, cantidad, fecha_venta, id_cliente)
	values (product_id, cantidad_venta, fecha, cliente_id);

	raise notice 'Venta registrada correctamente.';
end;
$$;

call procedure registrar_venta();
