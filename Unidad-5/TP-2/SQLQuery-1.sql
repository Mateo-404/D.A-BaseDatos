USE DABD_TP2;
-- HOTELES
	-- a
	CREATE TABLE HOTEL(
		hotelNo INT PRIMARY KEY NOT NULL,
		hotelName VARCHAR(25) UNIQUE,
		city VARCHAR(25)
	);
	-- b
	CREATE TABLE ROOM(
		RoomNo INT CHECK(RoomNo BETWEEN 1 AND 100),
		type VARCHAR(10) CHECK(type in('Single', 'Double', 'Family')),
		price FLOAT CHECK(price BETWEEN 10 AND 100),
		hotelNo INT FOREIGN KEY REFERENCES HOTEL(hotelNo),
		PRIMARY KEY (RoomNo, hotelNo)
	);
	CREATE TABLE GUEST(
		guestNo INT PRIMARY KEY,
		guestName VARCHAR(15),
		guestAdress VARCHAR(20)
	);

	CREATE TABLE BOOKING(
		dateFrom DATE, -- CHECK(dateFrom > GETDATE())
		dateTo DATE, -- CHECK(dateFrom > GETDATE())
		hotelNo INT,
		guestNo INT FOREIGN key references GUEST(guestNo), --CHECK(guestNo NOT IN (SELECT guestNo FROM BOOKING WHERE dateFrom > GETDATE()))
		roomNo int,
		FOREIGN KEY (RoomNo, hotelNo) REFERENCES ROOM(RoomNo, hotelNo),
		PRIMARY KEY(hotelNo, guestNo, dateFrom)
	);

	-- C
	CREATE TABLE BOOKING_HIST(
		dateFrom DATE,
		dateTo DATE,
		hotelNo INT FOREIGN KEY REFERENCES HOTEL(hotelNo),
		guestNo INT FOREIGN key references GUEST(guestNo),
		roomNo int foreign key references ROOM(RoomNo),
		PRIMARY KEY(hotelNo, guestNo, dateFrom)
	);
	-- d
	CREATE VIEW vHotel_Huesped (NombreHotel, NombreHuesped) 
	AS SELECT h.hotelName, g.guestName
	FROM BOOKING b
	JOIN HOTEL h ON h.hotelNo = b.hotelNo
	JOIN GUEST g ON g.guestNo = b.guestNo;
	-- e
	CREATE VIEW Grossvennor (NombreHuesped)
	AS SELECT g.guestName
	FROM BOOKING b
	JOIN HOTEL h ON h.hotelNo = b.hotelNo
	JOIN GUEST g ON g.guestNo = b.guestNo
	WHERE h.hotelName = 'Grosvennor';

-- 2
	-- b
	CREATE TABLE USUARIOS(
		Usr VARCHAR(50) PRIMARY KEY NOT NULL,
		Psw VARCHAR(50) NOT NULL,
		Nombre VARCHAR(150),
		DNI INT UNIQUE NOT NULL
	);
	-- c
	CREATE TABLE NOTICIAS(
		NroNoticia INT PRIMARY KEY NOT NULL,
		Titulo VARCHAR(150) NOT NULL,
		Texto VARCHAR(5000) NOT NULL,
		FechaArticulo DATE NOT NULL CHECK(FechaArticulo > '2015-01-01'),
		UsrCarga VARCHAR(50) FOREIGN KEY REFERENCES USUARIOS(Usr)
	);
	-- d
	CREATE TABLE SECCIONES(
		IdSeccion INT PRIMARY KEY NOT NULL,
		NomSeccion VARCHAR(150) NOT NULL,
		Descripcion VARCHAR(150) NOT NULL,
		UsrCarga VARCHAR(50) FOREIGN KEY REFERENCES USUARIOS(Usr)
	);
	-- e
	CREATE TABLE NoticiasSecciones(
		NroNoticia INT FOREIGN KEY REFERENCES NOTICIAS(NroNoticia),
		IdSeccion INT FOREIGN KEY REFERENCES SECCIONES(Idseccion),
		UsrCarga VARCHAR(50) FOREIGN KEY REFERENCES USUARIOS(Usr),
		PRIMARY KEY(NroNoticia, IdSeccion)
	);
	-- f
	ALTER TABLE Noticias ADD FechaCaducada DATE;
	ALTER TABLE Noticias ADD EscritoPor VARCHAR(100);
	ALTER TABLE Noticias ADD Fuente VARCHAR(100);
	ALTER TABLE Noticias ADD FechaActualizacion DATE DEFAULT GETDATE();
	-- g
	ALTER TABLE USUARIOS ADD Activo BIT NOT NULL;
	ALTER TABLE USUARIOS ADD Apellido VARCHAR(150);
	-- h
	DROP TABLE NoticiasSecciones;
	-- j
	CREATE VIEW Ultimas10Noticias (Titulo, fechaArticulo, UsrCarga)
	AS SELECT Titulo, FechaArticulo, UsrCarga
	FROM NOTICIAS
	ORDER BY FechaArticulo DESC; -- Falta Seleccionar Top 10
	-- k
	ALTER VIEW Ultimas10Noticias DROP COLUMN UsrCarga;
	ALTER VIEW Ultimas10Noticias ADD NomSeccion VARCHAR(25);
