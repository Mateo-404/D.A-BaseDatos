# LENGUAJE DE MANIPULACIÓN DE DATOS (DML)

## Aclaraciones
Para que podamos ver los resultados y comprobar si nuestra Query funciona el profesor nos dejó el siguiente script para que tengamos datos de prueba en la Base de Datos:
```sql

-- CREACION DE TABLAS e INSERCION DE DATOS

create table HOTEL(
	hotelno 	varchar(4),
	hotelname 	varchar(20),
	city 		varchar(20),
	primary key (hotelno)
);


insert into hotel values('fb01', 'Grosvenor', 'London');
insert into hotel values('fb02', 'Watergate', 'Paris');
insert into hotel values('ch01', 'Omni Shoreham', 'London');
insert into hotel values('ch02', 'Phoenix Park', 'London');
insert into hotel values('dc01', 'Latham', 'Berlin');


create table ROOM(
	roomno 		numeric(5),
	hotelno 	varchar(4),
	type 		varchar(10),
	price 		decimal(5,2),
	primary key (roomno, hotelno),
	foreign key (hotelno) REFERENCES hotel(hotelno)
);


insert into room values(501, 'fb01', 'single', 19);
insert into room values(601, 'fb01', 'double', 29);
insert into room values(701, 'fb01', 'family', 39);
insert into room values(1001, 'fb02', 'single', 58);
insert into room values(1101, 'fb02', 'double', 86);
insert into room values(1001, 'ch01', 'single', 29.99);
insert into room values(1101, 'ch01', 'family', 59.99);
insert into room values(701, 'ch02', 'single', 10);
insert into room values(801, 'ch02', 'double', 15);
insert into room values(901, 'dc01', 'single', 18);
insert into room values(1001, 'dc01', 'double', 30);
insert into room values(1101, 'dc01', 'family', 35);




create table GUEST(
	guestno 	numeric(5),
	guestname 	varchar(20),
	guestaddress 	varchar(50),
	primary key (guestno)
);


insert into guest values(10001, 'John Kay', '56 High St, London');
insert into guest values(10002, 'Mike Ritchie', '18 Tain St, London');
insert into guest values(10003, 'Mary Tregear', '5 Tarbot Rd, Aberdeen');
insert into guest values(10004, 'Joe Keogh', '2 Fergus Dr, Aberdeen');
insert into guest values(10005, 'Carol Farrel', '6 Achray St, Glasgow');
insert into guest values(10006, 'Tina Murphy', '63 Well St, Glasgow');
insert into guest values(10007, 'Tony Shaw', '12 Park Pl, Glasgow');

create table BOOKING(
    hotelno 	varchar(4),
    guestno 	numeric(5),
    datefrom 	DATETIME,
    dateto 	DATETIME,
    roomno 	numeric(5),
    primary key (hotelno, guestno, datefrom), 
    foreign key (roomno, hotelno) REFERENCES room(roomno, hotelno),
    foreign key (guestno) REFERENCES guest(guestno)
);

     

insert into booking values('fb01', 10001, '04-04-01', '04-04-08', 501);
insert into booking values('fb01', 10004, '04-04-15', '04-05-15', 601);
insert into booking values('fb01', 10005, '04-05-02', '04-05-07', 501);
insert into booking values('fb01', 10002, '04-05-16', '04-05-29', 601);
insert into booking values('fb01', 10001, '04-05-01', null, 701);
insert into booking values('fb02', 10003, '04-04-05', '04-04-10', 1001);
insert into booking values('fb02', 10005, '04-05-12', '04-05-30', 1101);
insert into booking values('ch01', 10006, '04-04-21', null, 1101);
insert into booking values('ch02', 10002, '04-04-25', '04-05-06', 801);
insert into booking values('dc01', 10007, '04-05-13', '04-05-15', 1001);
insert into booking values('dc01', 10003, '04-05-20', null, 1001);


CREATE TABLE booking_hist(
	hotel_no 	varchar(4) NOT NULL,
	guest_no 	numeric(5) NOT NULL,
	date_from 	DATETIME NOT NULL,
	date_to 	DATETIME NULL,
	room_no 	numeric(5) NOT NULL
);

/*
OBSERVACION:
Para CREAR un dominio en MICROSOFT SQL SERVER (no existe CREATE DOMAIN)

CREATE TYPE Dominio1 FROM VARCHAR(20) NOT NULL
*/  
```

### Parte I: Manipulación de datos

1. Para los siguientes ejercicios, utilice el siguiente esquema de relaciones:

   - **HOTEL** (hotelNo, hotelName, city)
   - **ROOM** (RoomNo, hotelNo, type, price)
   - **BOOKING** (hotelNo, guestNo, dateFrom, dateTo, @roomNo)
   - **GUEST** (guestNo, guestName, guestAddress)

   Donde:
   - **HOTEL** contiene los detalles de un hotel y **hotelNo** (número del hotel) es la clave principal.
   - **ROOM** contiene los detalles de las habitaciones para cada hotel y (roomNo, hotelNo) forma la clave principal.
   - **BOOKING** contiene detalles de las reservas y (hotelNo, guestNo, dateFrom) forma la clave principal.
   - **GUEST** contiene los detalles de los huéspedes y **guestNo** es la clave principal.

### Consultas simples

- a. Generar un listado con todos los detalles de los hoteles.
- b. Generar un listado con todos los detalles de todos los hoteles situados en Londres.
- c. Generar un listado con los nombres y direcciones de todos los huéspedes que viven en Londres, ordenado alfabéticamente por nombre.
- d. Generar un listado de todas las habitaciones dobles o familiares cuyo precio sea inferior a 40 euros por noche, en orden descendente de precios.
- e. Generar un listado con todas las reservas para las que no se haya especificado un valor de **dateTo**.

### Funciones de agregación

- f. ¿Cuántos hoteles hay?
- g. ¿Cuál es el precio medio de una habitación?
- h. ¿Cuál es el ingreso total por noche generado por todas las habitaciones dobles?
- i. ¿Cuántos huéspedes diferentes han hecho reservas para agosto?

### Subconsultas y combinaciones

- j. Generar un listado con el precio y el tipo de todas las habitaciones del Grosvenor Hotel.
- k. Generar un listado con todos los huéspedes que actualmente tiene el Grosvenor Hotel.
- l. Generar un listado con los detalles de todas las habitaciones del Grosvenor Hotel, incluyendo el nombre del huésped que ocupa la habitación, si es que la habitación está ocupada.
- m. ¿Cuál es el ingreso total correspondiente a las reservas realizadas en el Grosvenor Hotel hoy?
- n. Generar un listado con las habitaciones actualmente no ocupadas en el Grosvenor Hotel.
- o. ¿Cuál es la pérdida de ingresos debido a habitaciones no ocupadas en el Grosvenor Hotel?

### Agrupamientos

- p. Generar un listado con la cantidad de habitaciones de cada hotel.
- q. Generar un listado con el número de habitaciones en cada hotel de Londres.
- r. ¿Cuál es la cantidad de reservas para cada hotel en agosto?
- s. ¿Cuál es el tipo de habitación más comúnmente reservada para cada hotel de Londres?
- t. ¿Cuál es la pérdida de ingresos debida a habitaciones no ocupadas en cada hotel hoy?
- u. Muestre el precio mínimo y el precio máximo que se puede pagar por una habitación del Hotel “London Park”.
- v. Para todos los hoteles de Londres, muestre el precio promedio a pagar, agrupando por tipo de habitación. Ordene por nombre de hotel y tipo de habitación.

### Otras operaciones sobre tablas

- w. Inserte filas en cada una de estas tablas.
- x. Actualice el precio de todas las habitaciones en un +5%.
- y. Elimine todas las reservas realizadas para el **HotelNo** = 15 con fecha **dateFrom** mayor a “01/01/2022”.
- z. Suponga la existencia de una tabla **Booking_Hist** que tiene una estructura idéntica a **Booking**. Se requiere “mover” todos los registros de **Booking** cuya fecha **dateFrom** es anterior al “01/01/2021” a la tabla **Booking_Hist**. Para ello, debe realizar las inserciones en la tabla histórica y luego las eliminaciones en la tabla **Booking**.

2. Dada la siguiente Base de Datos: **Noticias_BD**

   - **USUARIOS** (Usr, Pwd, Nombre, Apellido, DNI, Activo)
   - **NOTICIAS** (NroNoticia, Título, Texto, FechaArtículo, @UsrCarga, EscritoPor, Fuente)
   - **NOTICIAS_SECCIONES** (@NroNoticia, @IdSeccion, Destacada)
   - **SECCIONES** (IdSeccion, NomSeccion, Descripcion, @UsrCarga)

### Consultas simples

- a. Recuperar título y fecha de registros correspondientes a noticias con fecha 26/07/2022.
- b. Generar un listado de todos los campos de los registros de usuarios con DNI mayor a 27000000, ordenados por DNI ascendente.
- c. Recuperar los nombres de sección de los registros de secciones 2, 4, 7 y 11.
- d. Devolver los registros de noticias que contengan la palabra ‘maratón’ en el título; ordenado por fecha descendente y título ascendente.
- e. Mostrar los registros de secciones que tengan la letra ‘e’ en el segundo carácter del nombre.
- f. Exhibir el campo **Activo** del registro del usuario que tiene nombre de usuario ‘RAMON’ y contraseña ‘rr7854sd’.
- g. Listar los identificadores de las noticias que están asignadas a la sección 5.
- h. Recuperar los registros de noticias con fecha mayor a 21/08/2021 y autor distinto de NULO; ordenados por título.
- i. Recuperar los identificadores de las noticias destacadas, junto con los identificadores de las secciones.
- j. Recuperar el título, la fecha y el texto de la noticia número 129.
- k. Recuperar los títulos de las noticias cuyo texto comienza con ‘El ’.
- l. Recuperar todos los registros de noticias con fecha entre 10/07/2022 y 30/08/2022 ordenado descendentemente por número de noticia.

### Consultas más complejas

- m. Recuperar el nombre y apellido de aquellos usuarios activos que hayan cargado al menos una noticia.
- n. De los usuarios que cargaron noticias, recuperar nombre de usuario y la cantidad de noticias cargadas.
- o. Recuperar la cantidad de noticias cargadas por usuario y por día.
- p. Devolver el primero y el último número de noticia cargada el 10/08/2022.
- q. Generar un listado de la cantidad de noticias por Sección.
- r. Recuperar Nombre de secciones con menos de 10 noticias asignadas.
- s. Recuperar número, título y texto de aquellas noticias que estén asignadas en por lo menos 3 secciones.
- t. Mostrar título y fecha de actualización de todas las noticias escritas por ‘Cristina Perez’, entre los años 2013 y 2015 (ambos inclusive) y que no correspondan a la sección 5.
- u. Listar los nombres de usuarios que cargaron más de 2 noticias en la sección 7.
- v. Mostrar el nombre de todas las secciones y la cantidad de noticias, de todas aquellas secciones que tienen al menos 3 noticias.
- w. ¿Cuál es la sección con mayor número de noticias publicadas? Mostrar su código y su nombre.
- x. Devolver el nombre de la sección que tiene más noticias destacadas.
- y. Listar nombre y apellido de los usuarios que han creado al menos una noticia pero que no han creado ninguna sección.
- z. Generar un listado que muestre la fecha de Artículo más antigua (la menor) por cada sección, exhibiendo el nombre de la sección, su descripción, la fecha del primer artículo y su título.

### Otras consultas

- aa. Actualizar los registros de noticias que tengan fuente ‘PM’ y en su lugar colocarle ‘Prensa Multimedia’.
- bb. Actualizar el registro correspondiente al usuario ‘JFLORES’ para marcarlo como “activo”.
- cc. Actualizar la descripción y el usuario de carga de las secciones 4 y 5, colocando ‘---’ y ‘JFLORES’.
- dd. Actualizar el registro correspondiente a la sección 3 y colocarle NULO en la descripción.
- ee. Actualizar los registros de noticias cuya fuente sea ‘Prensa Multimedia’ y el escritor sea NULO, estableciendo como escritor ‘Anónimo’.
- ff. Actualizar registros indicando que ninguna noticia está destacada en ninguna sección.
- gg. Eliminar registros de sección 7 y de sección 3.
- hh. Eliminar el registro que indica que la noticia 130 está asignada a la sección 7.
- ii. Eliminar todos los datos referidos a la noticia 127 (ver dependencias: más de una sentencia).

3. Dada la siguiente Base de Datos: **UTN_BD**

   - **ALUMNOS** (LegajoAlum, NomAlum, ApellidoAlum, F_nacimiento, @CodLocalidad, TEL, Estado)
   - **MATERIAS** (NroMateria, NomMateria, @CodCarrera, TipoDuración)
   - **PROFESORES** (LegajoProf, NomProf, ApellidoProf, Domicilio, @CodLocalidad, TE, Titulo, InstitEstudio)
   - **PROFESORES_MATERIAS** (@LegajoProf, @NroMateria)
   - **ALUMNOS_MATERIAS** (@LegajoAlum, @NroMateria, AnioCursado, CalifFinal)
   - **LOCALIDADES** (CodLocalidad, Localidad, Provincia)
   - **CARRERAS** (CodCarrerra, NomCarrera, AniosDuracion)

### Consultas

- a. Listar el nombre y apellido de los alumnos que hayan cursado materias en el año 2014.
- b. Generar un listado con el nombre de las materias dictadas por profesores cuya localidad contenga en el nombre la palabra ‘RAFAELA’.
- c. Recuperar el nombre y apellido de alumnos cuya localidad contenga en el nombre la palabra ‘ATALIVA’.
- d. Devolver número de legajo, número de materia y cantidad de veces que un alumno recursó una materia.
- e. Recuperar la sumatoria y el promedio de calificaciones de todas las materias de cada alumno (sin importar si tuvo que recursar una materia o no). Se deberán tener en cuenta sólo aquellos registros que tengan cargada una calificación final mayor o igual que cero.
- f. Listar número de legajo, nombre de alumno, y carrera que cursa, de aquellos alumnos que registran más de 5 aplazos.
- g. Informar las materias que son dictadas por profesores que no viven ni en ‘Rafaela’ ni en ‘Sunchales’, y las carreras a la que pertenecen tales materias.
- h. Recuperar los docentes cuyo título no contenga las palabras ‘sistemas’ ni ‘informática’ y que dictan materias de las carreras ‘Ingeniería Industrial’ o ‘Tecnicatura en Programación’.
- i. Informar el nombre de las tres localidades que tienen mayor cantidad de alumnos.
- j. Recuperar legajo y nombre de los alumnos que no han desaprobado ninguna materia.
- k. Recuperar el Nombre de la carrera que tiene más materias de TipoDuración ‘Anual’.
- l. Recuperar al nombre de todas las materias de TipoDuración ‘Cuatrimestral’, ordenadas por carrera, informando además el nombre del profesor que la dicta.
- m. Recuperar por carrera, la cantidad de materias de TipoDuración ‘Cuatrimestral’ y ‘Anual’.

