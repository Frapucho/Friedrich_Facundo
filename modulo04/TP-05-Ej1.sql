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