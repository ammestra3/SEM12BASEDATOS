select * from empleado;

select * from compra;
select * from productos;
select * from rol;

-- ELIMINA PRODUCTOS --
delete from productos
where id_producto= 11;
-- ACTUALIZA NPMBRE DE PRODUCTO
update productos
set nombre_producto= 'Cafe Mokka'
where id_producto=3;

update productos
set nombre_producto= 'Croissant de Avellanas y almendras'
where id_producto=10;

update productos
set id_categoria= 2
where id_producto=10;
update productos
set precio_final= 6200
where id_producto=10;

--INSERTA CLIENTE
insert into cliente (id_cliente, nombre_cliente, apellido_cliente,edad,telefono,correo,id_ciudad,id_tipo_cliente,id_rol)
values (266635564, 'Ana Maria', 'Mestra Perez', '26', '3008121400', 'amestra3@cesde.net', '3', '1', '3');

-- VERIFICA VENTAS POR FECHA--
select fecha, SUM (total_pagar) AS total_ventas
from compra
group by fecha
order by total_ventas DESC ;

-- CONSULTA PRODUCTO MAS VENDIDO 
select compra.id_producto, SUM(cantidad) AS total_vendido
from compra
JOIN productos on compra. id_producto= productos.id_producto
group by compra.id_producto
order by total_vendido DESC;

-- EL PRODUCTO MAS VENDIDO ES EL 1--
-- LA COMPRA MAS ALTA DEL DIA 

select *
from compra
where fecha = '2025-03-20'
order by total_pagar;



-- VENDEDOR QUE MAS VENDIO --

select compra.id_empleado, SUM (total_pagar) AS total_vendido
from compra 
join empleado on compra.id_empleado= empleado.id_empleado
group by compra.id_empleado
order by total_vendido DESC;