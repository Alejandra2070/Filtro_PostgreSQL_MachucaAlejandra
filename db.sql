drop table clientes;
create table clientes(
	id_cliente int primary key not null,
	nombre varchar(100) not null,
	email varchar(50) not null,
	telefono int not null
);
drop table proveedor;
create table proveedor(
	id_proveedor int primary key not null,
	nombre varchar(100) not null,
	email varchar(50) not null,
	telefono int not null
);
drop table productos;
create table productos(
	id_producto int primary key not null,
	nombre varchar(100) not null,
	categoria text not null,
	precio numeric(10, 2) not null,
	stock_disponible int not null,
	id_proveedor int not null,
	foreign key (id_proveedor) references proveedor(id_proveedor)
);

drop table ventas;
create table ventas(
	id_venta int primary key not null,
	id_producto int not null,
	cantidad int not null,
	fecha_venta date not null,
	id_cliente int not null,
	foreign key (id_producto) references productos(id_producto),
	foreign key (id_cliente) references clientes(id_cliente)
);