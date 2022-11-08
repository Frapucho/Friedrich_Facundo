
DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;

CREATE TABLE departamentos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

create table PAISES (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

create table PROVINCIAS (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
id_pais INT UNSIGNED,
FOREIGN KEY (id_pais) REFERENCES PAISES(id)
);

create table LOCALIDADES (
id int unsigned auto_increment primary key,
nombre varchar(100) not null, 
cp varchar(100) not null,
id_provincia int unsigned,
foreign key (id_provincia) references PROVINCIAS(id)
);

--2

alter table empleados add column ( 
direccion varchar(100), 
email varchar(100), 
telefono varchar(100),
fecha_ingreso date, 
tms timestamp,
id_localidad int unsigned,
foreign key (id_localidad) references localidades(id)
);

--3

alter table departamentos add column(
gasto double, 
tms timestamp
);

--4



insert into paises values (1, 'Argentina');
insert into paises values (2, 'Peru');
insert into paises values (3, 'Brasil');
insert into paises values (4, 'Chile');
insert into paises values (5, 'Paraguay');

insert into provincias values (1, 'Misiones', 1);
insert into provincias values (2, 'Buenos Aires', 1);
insert into provincias values (3, 'Corrientes', 1);
insert into provincias values (4, 'Cordoba', 1);
insert into provincias values (5, 'Santa Fe', 1);

insert into localidades values (1, 'Alem', '3315', 1);
insert into localidades values (2, 'Obera', '3360', 1);
insert into localidades values (3, 'Posadas', '3300', 1);
insert into localidades values (4, 'San Vicente', '3356', 1);
insert into localidades values (5, 'Apostoles', '3350', 1);

insert into departamentos  values(1, 'guarderia', 10000, 1, 3000, null);
insert into departamentos  values(2, 'cocina', 20000, 1, 5000, null);
insert into departamentos  values(3, 'limpieza', 5000, 1, 2000, null);
insert into departamentos  values(4, 'bar', 10000, 1, 1850, null);
insert into departamentos  values(5, 'gimnasio', 0, 0, 0, null);

insert into empleados  values (1, 2000009, 'Melina', 'Caceres', 1, true, null, 2, null, null,null,null);
insert into empleados  values (2, 2015648, 'Juan', 'Goya', 1, true, null, 2, null, null,null,null);
insert into empleados  values (3, 3055648, 'Armando', 'Paredes', 1, true, null, 2, null, null,null,null);
insert into empleados  values (4, 2045689, 'Morena', 'Zuetta', 1, true, null, 2, null, null,null,null);
insert into empleados  values (5, 1500264, 'Patricio', 'Star', 1, true, null, 2, null, null,null,null);

--5

rename table pedidos to movimientos;

--6
create table Proveedores (
id int unsigned auto_increment primary key,
razon_social varchar(100),
nombre varchar(100) not null,
apellido varchar(100) not null,
naturaleza varchar(100),
cuit varchar(100), 
estado varchar(100),
tms varchar(100),
id_localidad int unsigned,
foreign key (id_localidad) references localidades(id)
);

create table Productos (
id int unsigned auto_increment primary key,
nombre varchar(100) not null, 
descripcion varchar(100) not null,
stock varchar(100), 
precio varchar(100) not null,
estado varchar(100),
tms varchar(100),
id_marca int unsigned,
foreign key (id_marca) references Marcas(id)
);

create table Marcas (
id int unsigned auto_increment primary key,
nombre varchar(100) not null,
descripcion varchar(100), 
imagen varchar(100),
estado varchar(100),
tms varchar(100),
id_proveedor int unsigned,
foreign key (id_proveedor) references Proveedores(id)
);

create table Cajas (
id int unsigned auto_increment primary key,
horainicio datetime,
horacierre datetime, 
estado varchar(100),
tms varchar(100)
);

--7


INSERT INTO proveedores VALUES(1, 'julianes' , 'Julian ', 'Ibañez', 'juridico' , '65456456', 2, true, null);
INSERT INTO proveedores VALUES(2, 'ladistri' , 'Pedro', 'Pilate', 'juridico' , null, 2, true, null);
INSERT INTO proveedores VALUES(3, 'tipo' , 'anabelle', 'zuetta', null , null, 2, true, null);
INSERT INTO proveedores VALUES(4, 'topin' , 'tobias ', 'acapulco', 'juridico' , '54654562', 2, false, null);
INSERT INTO proveedores VALUES(5, 'igorsrl' , 'igor ', 'mambru', 'fisico' , '5468798513', 2, true, null);

INSERT INTO marcas VALUES(1, 'arcor' , 'diabetes', 'img', 1 , true, null);
INSERT INTO marcas VALUES(2, 'yaguar' , 'o mais barato', 'img', 2 , true, null);
INSERT INTO marcas VALUES(3, 'tatin' , 'triple', 'img', 3 , true, null);
INSERT INTO marcas VALUES(4, 'milka' , 'lechita', 'img', 2 , true, null);
INSERT INTO marcas VALUES(5, 'elrey' , 'panaderia', 'img', 1 , true, null);

INSERT INTO productos VALUES(1, 'caramelo' , 'sin tac', 4, 22 ,  50, true, null);
INSERT INTO productos VALUES(2, 'cafe' , '2da mano', 1, 15 ,  90, true, null);
INSERT INTO productos VALUES(3, 'arroz' , '10kg', 4, 22 ,  50, true, null);
INSERT INTO productos VALUES(4, 'alfajor' , 'partidas', 4, 22 ,  50, true, null);
INSERT INTO productos VALUES(5, 'aceite' , 'al natural', 4, 22 ,  50, true, null);

insert into cajas values (1, null, null, null, null);
insert into  cajas values (2, null, null, null, null);
insert into  cajas values (3, null, null, null, null);
insert into  cajas values (4, null, null, null, null);
insert into  cajas values (5, null, null, null, null);

--8

select nombre, presupuesto, gasto, presupuesto-gasto as diferencia from departamentos where estado = 1

--9

select localidades.nombre localidad, paises.nombre pais
from localidades 
join provincias  
on id_provincia = provincias.id 
join paises
on provincias.id_pais = paises.id
order by paises.nombre

--10

UPDATE empleados SET telefono = 37544668592 where id = 2 
UPDATE empleados SET fecha_ingreso = 10-02-10 and localidad= 4 where id = 1 

--11

insert into vendedores values (1, 'Rob', 'erto', '45665875', '5');
insert into vendedores values (2, 'Lucho', 'Cartucho', '456432136', '10');
insert into vendedores values (3, 'Maria', 'Plastilina', '45654313', '6');
insert into vendedores values (4, 'Martin', 'Chupetin', '4654231654', '15');
insert into vendedores values (5, 'Anibal', 'Pachano', '45621321', '20');

--12

alter table movimientos add column ( 
estado boolean,
tipo_movimiento varchar(100), 
tms timestamp,
id_producto int unsigned,
foreign key (id_producto) references Productos(id)
);

--13

insert into movimientos values (1, 'ingreso', null, 3);
insert into movimientos values (1, 'egreso', null, 2);
insert into movimientos values (1, 'egreso', null, 2);
insert into movimientos values (1, 'egreso', null, 1);
insert into movimientos values (1, 'pedido', null, 5);
insert into movimientos values (1, 'pedido', null, 9);
insert into movimientos values (1, 'pedido', null, 7);

--14
UPDATE movimientos
SET estado=0
WHERE movimientos.id=2 OR movimientos.id=5;

ALTER TABLE paises
ADD (estado boolean);
UPDATE paises SET estado = 1 WHERE (id = '1');
UPDATE paises SET estado = 1 WHERE (id = '2');
UPDATE paises SET estado = 1 WHERE (id = '3');
UPDATE paises SET estado = 1 WHERE (id = '4');
UPDATE paises SET estado = 1 WHERE (id = '5');

UPDATE paises SET estado = 0 WHERE (id ='1');

--15

UPDATE productos SET stock = stock -2 WHERE id = 2;
UPDATE productos SET stock = stock -1 WHERE id = 1;
UPDATE productos SET stock = stock +1 WHERE id = 3;

--16

create table parametros (
id int unsigned auto_increment primary key,
tms varchar(100),
cosas json 
id_usuario int unsigned,
);

--17

insert into parametros values (1, null , {"idDeLaCosa": 101, "permisos": "PUT, GET"}, 1);
insert into parametros values (2, null , {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}, 2);
insert into parametros values (3, null , {"zonaHoraria": "America/Argentina/BuenosAires"}, 3);
insert into parametros values (4, null , {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}, 4);
insert into parametros values (5, null , {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso": "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso": "31634912,57","egreso": "9757142,66"}}} , 5);

