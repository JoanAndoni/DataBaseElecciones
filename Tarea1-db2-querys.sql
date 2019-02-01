-- Joan Andoni
-- Alejandra Tubilla

-- Tarea 1
-- QUERYS IN THE DATABASE in db2

--INSERTS FOR THE UDATES AND DELETES
INSERT INTO elecciones(id_elecciones, localidad, fecha, EStart, EEnd) VALUES( 5, 'Chetumal', '2017-06-25', '2018-06-10', '2024-06-10')
INSERT INTO colegio(id_colegio, numeroElectores, id_elecciones, EStart, EEnd) VALUES(11, 1322, 5, '2018-06-10', '2018-06-30')
INSERT INTO mesa(id_mesa, noMesa, id_colegio, EStart, EEnd) VALUES(21, 3, 11, '2018-06-10', '2018-06-30')
INSERT INTO rol(rol, id_mesa, EStart, EEnd) VALUES('Presidente', 21, '2018-06-10', '2018-06-30')
INSERT INTO partido(siglas, nombre, presidente, EStart, EEnd) VALUES('ABC','ABECE', 'Armando', '2018-06-10', '2024-06-10')
INSERT INTO votante (IFE, nombre, fechaNacimiento, direccion, nacionalidad, id_mesa, id_partido, EStart, EEnd) VALUES ('A00569929', 'Rosa Cabarcas', '1920-05-10', 'Calle Cartagena 32', 'Mexico', 21, 'ABC', '2018-06-10', '2018-06-30')
INSERT INTO apoderados(id_apoderado, nombre, id_partido, EStart, EEnd) VALUES(16, 'Regina Monroy','ABC', '2018-06-10', '2018-06-30')

-- Apoderados
UPDATE apoderados SET nombre='Serena Monroy' WHERE id_apoderado=16
SELECT * FROM apoderados
DELETE FROM apoderados WHERE id_apoderado=16 AND id_partido='ABC'
SELECT * FROM hist_apoderados

-- Votante
UPDATE votante SET nombre='Delgadina La Niña', direccion='La que sea' WHERE IFE='A00569929'
SELECT * FROM votante
DELETE FROM votante WHERE nombre='Delgadina La Niña'
SELECT * FROM hist_votante

-- Partido
UPDATE partido SET nombre='Americanos Unidos' WHERE siglas='ABC'
SELECT * FROM partido
DELETE FROM partido WHERE siglas='ABC'
SELECT * FROM hist_partido

-- Roles
UPDATE rol SET rol='Vocal' WHERE rol='Presidente' AND id_mesa=21
SELECT * FROM rol
DELETE FROM rol WHERE rol='Vocal' AND id_mesa=21
SELECT * FROM hist_rol

-- Mesas
UPDATE mesa SET noMesa = 1 WHERE id_mesa = 21
SELECT * FROM mesa
DELETE FROM mesa WHERE id_colegio=11 AND noMesa = 1 
SELECT * FROM hist_mesa

-- Colegios
UPDATE colegio SET numeroElectores=732 WHERE id_colegio=11
SELECT * FROM colegio
DELETE FROM colegio WHERE numeroElectores=732 AND id_colegio=11
SELECT * FROM hist_colegio

-- Elecciones
UPDATE elecciones SET localidad='Cuernavaca' WHERE id_elecciones=1
SELECT * FROM elecciones
DELETE FROM elecciones WHERE localidad='Chetumal'
SELECT * FROM hist_elecciones
