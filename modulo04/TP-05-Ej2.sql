--PUNTO Nª 1
--1
select apellido from empleados 

--2
select distinct apellido from empleados 

--3
select idemplaedo, cuil_cuit, nombre, apellido, id_departamento, estado  from empleados

--4
select nombre, apellido from empleados 

--5
select cuil_cuit  from empleados

--6
select concat (nombre ," ", apellido)  from empleados 

--7
select upper (concat (nombre ," ", apellido))  from empleados 

--8
select lower (concat (nombre ," ", apellido))  from empleados 

--9
select nombre, presupuesto  from departamentos 
order by presupuesto asc 

--10
select nombre  from departamentos 
order by nombre  asc 

--11
select nombre  from departamentos 
order by nombre  desc 

--12
select nombre, apellido  from empleados  
order by apellido, nombre  asc 

--13
SELECT nombre, presupuesto  FROM departamentos 
 ORDER BY presupuesto  DESC
 LIMIT 03

--14
SELECT nombre, presupuesto  FROM departamentos 
 ORDER BY presupuesto  ASC  
 LIMIT 03

--15
SELECT nombre, presupuesto  FROM departamentos 
where presupuesto >150000

--16
SELECT nombre, presupuesto  FROM departamentos 
where presupuesto >= 100000
and presupuesto <= 200000

--17
SELECT nombre, presupuesto  FROM departamentos 
where presupuesto <= 100000
or presupuesto >= 200000

--18
SELECT nombre, presupuesto  FROM departamentos where presupuesto between 100000 and 200000

--19
SELECT nombre, presupuesto  FROM departamentos where presupuesto not between 100000 and 200000

--20
select e.nombre, e.apellido, d.nombre  from sistema.empleados e join sistema.departamentos d 
on e.id_departamento = d.iddepartamento 

--21
select e.nombre, e.apellido, d.*  from sistema.empleados e join sistema.departamentos d 
order by d.nombre, e.apellido, e.nombre asc 

--22
select distinct d.nombre, d.iddepartamento from departamentos d join empleados e 
where id_departamento = true 

--23
select d.nombre, e.cuil_cuit , e.nombre  from empleados e join departamentos d
where d.iddepartamento = e.id_departamento 
and e.cuil_cuit  = '27-38382980-3'

--24
select e.nombre, e.apellido , d.nombre  from empleados e join departamentos d
where e.nombre = 'Pepe' and e.apellido = 'Ruiz'
and d.iddepartamento = e.id_departamento 

--25
select e.* , d.nombre  from empleados e join departamentos d 
where d.iddepartamento  = '5'
order by e.apellido , e.nombre asc 

--26
select e.* , d.nombre  from empleados e join departamentos d 
where d.iddepartamento  = '2' or d.iddepartamento  = '4' or d.iddepartamento  = '5'
order by e.apellido , e.nombre asc 

--27
select e.* , d.nombre, d.presupuesto  from empleados e join departamentos d 
where d.presupuesto not between 100000 and 200000
and presupuesto >=1
order by e.apellido , e.nombre asc 
 
-- PUNTO Nª 2
--1
select p.id, p.cantidad, p.fecha from pedidos p order by p.fecha desc 

--2
select p.* from pedidos p 
order by p.cantidad desc
limit 2

--3
select distinct c.id from clientes c join pedidos p 
where c.id = p.id_cliente 

--4
select p.* from pedidos p 
where p.fecha between '20220101' and '20221231'
and p.cantidad >= 500

--5
select v.nombre, v.apellido from vendedores v 
where v.comisión  between '0.05' and '0.11'

--6
select v.nombre, v.apellido, v.comisión from vendedores v 
order by v.comisión desc
limit 1

--7
select c.nombre, c.apellido, c.id  from clientes c 
where c.cuitcuil >1 order by c.apellido, c.nombre asc 

--8
select c.nombre  from clientes c 
where c.nombre like 'A%n'
or c.nombre like 'P%'
order by c.nombre asc 

--9
select c.nombre  from clientes c 
where not c.nombre like 'A%'
order by c.nombre asc 

--10
select distinct c.nombre  from clientes c 
where c.nombre like '%el' or c.nombre like '%o'
order by c.nombre asc 

--11
select distinct c.nombre, c.apellido, c.id  from clientes c join pedidos p 
where c.id = p.id_cliente 
order by c.apellido, c.nombre asc 

--12
select distinct c.*, p.*  from clientes c join pedidos p 
where c.id = p.id_cliente 
order by c.apellido, c.nombre asc 


--13
select distinct v.*, p.*  from vendedores v  join pedidos p 
where v.id = p.id_vendedor  
order by v.apellido, v.nombre asc 

--14
select distinct c.*, v.*, p.*  from vendedores v  join pedidos p join clientes c 
where c.id = p.id_cliente and v.id = p.id_vendedor  
order by c.apellido, c.nombre asc 

--15
select c.apellido, c.nombre  from clientes c join pedidos p 
where p.fecha between '20220101' and '20221231'
and p.cantidad between 300 and 1000
order by c.apellido, c.nombre asc 

--16
select v.apellido, v.nombre, p.id from vendedores v  join pedidos p join clientes c 
where c.nombre = 'Maria' and c.apellido = 'Santana' and p.id_vendedor = v.id 

--17
select distinct c.nombre, c.apellido from clientes c join pedidos p join vendedores v 
where v.id = (select v2.id from vendedores v2 where v2.nombre = 'Daniel' and v2.apellido = 'Sáez')
order by c.apellido, c.nombre asc 

--18
select c.nombre, c.apellido, p.* from clientes c left join pedidos p 
on c.id = p.id_cliente 
order by c.apellido , c.nombre asc 

--19
select v.nombre, v.apellido, p.* from vendedores v left join pedidos p 
on v.id = p.id_vendedor  
order by v.apellido , v.nombre asc 

--20
select * from clientes c where id not in (select id_cliente from pedidos p)

--21
select * from vendedores v  where id not in (select id_vendedor from pedidos p)

--22
select v.nombre, v.apellido, '' as cliente_id, v.id as vendedor_id from pedidos p 
right join vendedores v on p.id_vendedor = v.id where p.id_vendedor is null 
union 
select c. nombre, c.apellido, c.id as clientes_id, '' from pedidos p 
right join clientes c on p.id_cliente = c.id where p.id_cliente is null 
order by apellido, nombre asc 

--23
select sum(cantidad) as total from pedidos p 

--24
select (sum(cantidad)/2) as mitad from pedidos p   

--25
select count(distinct id_vendedor) as vendedores from pedidos p   

--26
select count(id) as clientes from clientes c 

--27
select max( p.cantidad) from pedidos p  

--28
select min( p.cantidad) from pedidos p 

--29
SELECT max(clientes.categoria), clientes.ciudad from ventas.clientes group BY ciudad
--30
select c.id, c.nombre, c.apellido, p.fecha, p.cantidad  from clientes c join pedidos p 
where c.id = p.id_cliente 
order by c.id, p.fecha, p.cantidad  desc

--31
select c.id, c.nombre, c.apellido, p.fecha, p.cantidad  from clientes c join pedidos p 
where c.id = p.id_cliente and p.cantidad >= 2000
order by c.id, p.fecha, p.cantidad  desc

--32
select distinct v.id, v.apellido, v.nombre, p.cantidad  from vendedores v left join pedidos p 
on v.id = p.id_vendedor  and p.fecha = (20210817)
order by v.id, p.cantidad desc 

--33
select c.id, c.apellido, c.nombre, count(p.id_cliente) as CantPed  from clientes c left join pedidos p  
on p.id_cliente  = c.id group by c.id

--34
select c.id, c.apellido, c.nombre, count(p.id_cliente) as CantPed, p.fecha  from clientes c left join pedidos p  
on p.id_cliente  = c.id and p.fecha between 20200101 and 20201231 group by c.id

--35
select distinct year(p.fecha) as Año, max(p.cantidad) as MaxVal 
from pedidos p 
group by Año 

--36
select distinct year(p.fecha) as Año, count(p.id) as CantPed
from pedidos p 
group by Año 

--37
SELECT p.* FROM pedidos p  
WHERE p.id_cliente = (SELECT c.id FROM clientes c WHERE c.nombre = 'Adela' AND c.apellido = 'Salas' )

--38
SELECT count(*) FROM pedidos p  
WHERE p.id_vendedor = (SELECT v.id FROM vendedores v WHERE v.nombre = 'Daniel' AND v.apellido = 'Sáez' )

--39
SELECT c.* FROM clientes c 
WHERE c.id = (SELECT id_cliente FROM pedidos p WHERE p.cantidad = (SELECT MAX(p.cantidad) FROM pedidos p WHERE p.fecha LIKE '%2020%'))

--40
SELECT p.fecha, min(p.cantidad) FROM pedidos p WHERE p.id_cliente = (SELECT id FROM clientes c WHERE c.nombre = 'Pepe' AND c.apellido = 'Ruiz' )

--41
SELECT * FROM clientes c 
WHERE c.id NOT IN (SELECT p.id_cliente FROM pedidos p)

--42
SELECT * FROM vendedores v 
WHERE v.id NOT IN (SELECT p.id_vendedor FROM pedidos p)

--43
SELECT *FROM clientes c 
WHERE NOT EXISTS (SELECT p.id_cliente FROM pedidos p WHERE c.id = p.id_cliente)

--44
SELECT *FROM vendedores v 
WHERE NOT EXISTS (SELECT p.id_vendedor FROM pedidos p WHERE v.id = p.id_vendedor)