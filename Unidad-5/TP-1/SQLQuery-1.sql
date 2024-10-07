-- TP 1
-- Consultas Simples
  -- a
  SELECT * FROM HOTEL;
  -- b
  SELECT * FROM HOTEL WHERE city = 'London';
  -- c
  SELECT guestaddress, guestname 
  FROM guest 
  WHERE guestaddress LIKE '%London'
  ORDER BY guestname ASC;
  -- d
  SELECT * 
  FROM room 
  WHERE (type = 'double' OR type = 'family') AND price < 40
  ORDER BY price DESC;
  -- e
  SELECT * FROM booking WHERE dateto IS NULL;
  
-- Funciones de Agregación
  -- f
  SELECT COUNT(hotelno) FROM hotel;
  -- g
  SELECT AVG(price) FROM room;
  -- h
  SELECT SUM(price) FROM room WHERE type = 'double';
  -- i
  SELECT COUNT(DISTINCT guestno) AS unique_guests
  FROM booking
  WHERE MONTH(dateFrom) = 8;

-- Subconsultas y Agrupaciones
  -- j
  SELECT price, type FROM room NATURAL JOIN hotel WHERE hotelname = 'Grosvenor';
  -- k
  SELECT guest.*, dateto
  FROM guest
  NATURAL JOIN booking
  WHERE dateto >= '01-10-24';
  -- l (???)
  SELECT r.*, guest.guestname
  FROM booking b
  JOIN hotel h USING (hotelno)
  JOIN guest USING (guestno)
  JOIN room r USING (roomno)
  WHERE b.dateto > '04-10-24'
  AND h.hotelname = 'Grosvenor';
  -- m
  SELECT SUM(price) AS TOTAL
  FROM room
  NATURAL JOIN booking
  NATURAL JOIN hotel
  WHERE dateto > '04-10-24'
  AND hotelname = 'Grosvenor'
  GROUP BY hotelno;
  -- N (???)
  SELECT room.*
  FROM room
  JOIN booking USING (roomno)
  WHERE booking.guestno IS NULL;
  -- o (???)
  
-- Agrupamientos
  -- p
  SELECT hotel.hotelname, COUNT(DISTINCT room.roomno) AS NroHabitaciones
  FROM room
  JOIN booking ON room.roomno = booking.roomno
  JOIN hotel ON hotel.hotelno = booking.hotelno
  GROUP BY hotel.hotelno;


  