-- Joan Andoni
-- Alejandra Tubilla

-- Tarea 1
-- DATABASE CREATION in db2

-- 1
CREATE DATABASE eleccion

-- 2
connect to eleccion

-- 3
CREATE TABLE elecciones (id_elecciones INTEGER NOT NULL PRIMARY KEY, localidad VARCHAR(30) NOT NULL, fecha DATE NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME(sys_start, sys_end), EStart DATE NOT NULL, EEnd DATE NOT NULL, PERIOD BUSINESS_TIME(EStart, EEnd))

-- 4
CREATE TABLE colegio (id_colegio INTEGER NOT NULL PRIMARY KEY, numeroElectores INTEGER NOT NULL, id_elecciones INTEGER NOT NULL, FOREIGN KEY (id_elecciones) REFERENCES elecciones(id_elecciones), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME(sys_start, sys_end), EStart DATE NOT NULL, EEnd DATE NOT NULL, PERIOD BUSINESS_TIME(EStart, EEnd))

-- 5
CREATE TABLE mesa (id_mesa INTEGER NOT NULL PRIMARY KEY, noMesa INTEGER NOT NULL, id_colegio INTEGER NOT NULL, FOREIGN KEY (id_colegio) REFERENCES colegio(id_colegio), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN,sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME(sys_start, sys_end), EStart DATE NOT NULL, EEnd DATE NOT NULL, PERIOD BUSINESS_TIME(EStart, EEnd))

-- 6
CREATE TABLE rol (rol VARCHAR(30) NOT NULL, id_mesa INTEGER NOT NULL, FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa), CONSTRAINT PK_rol PRIMARY KEY (rol, id_mesa), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME(sys_start, sys_end), EStart DATE NOT NULL, EEnd DATE NOT NULL, PERIOD BUSINESS_TIME(EStart, EEnd))

-- 7
CREATE TABLE partido (siglas VARCHAR(30) NOT NULL PRIMARY KEY, nombre VARCHAR(30) NOT NULL, presidente VARCHAR(30) NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME(sys_start, sys_end), EStart DATE NOT NULL, EEnd DATE NOT NULL, PERIOD BUSINESS_TIME(EStart, EEnd))


-- 8
CREATE TABLE votante (IFE VARCHAR(30) NOT NULL PRIMARY KEY, nombre VARCHAR(30) NOT NULL, fechaNacimiento DATE NOT NULL, direccion VARCHAR(30) NOT NULL, nacionalidad VARCHAR(30) NOT NULL, id_mesa INTEGER NOT NULL, FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa), id_partido VARCHAR(30), FOREIGN KEY (id_partido) REFERENCES partido(siglas), id_rol VARCHAR(30), mesa_rol INTEGER, CONSTRAINT FK_rol FOREIGN KEY (id_rol, mesa_rol) REFERENCES rol(rol, id_mesa), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME(sys_start, sys_end), EStart DATE NOT NULL, EEnd DATE NOT NULL, PERIOD BUSINESS_TIME(EStart, EEnd))

-- 9
CREATE TABLE apoderados (id_apoderado INTEGER NOT NULL PRIMARY KEY, nombre VARCHAR(30) NOT NULL, id_partido VARCHAR(30) NOT NULL, FOREIGN KEY (id_partido) REFERENCES partido(siglas), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, ts_id TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME(sys_start, sys_end), EStart DATE NOT NULL, EEnd DATE NOT NULL, PERIOD BUSINESS_TIME(EStart, EEnd))

--10
CREATE UNIQUE INDEX index_period_elecciones ON elecciones(id_elecciones, BUSINESS_TIME WITHOUT OVERLAPS)
CREATE UNIQUE INDEX index_period_colegio ON colegio(id_colegio, BUSINESS_TIME WITHOUT OVERLAPS)
CREATE UNIQUE INDEX index_period_mesa ON mesa(id_mesa, BUSINESS_TIME WITHOUT OVERLAPS)
CREATE UNIQUE INDEX index_period_rol ON rol(rol, id_mesa, BUSINESS_TIME WITHOUT OVERLAPS)
CREATE UNIQUE INDEX index_period_partido ON partido(siglas, BUSINESS_TIME WITHOUT OVERLAPS)
CREATE UNIQUE INDEX index_period_votante ON votante(IFE, BUSINESS_TIME WITHOUT OVERLAPS)
CREATE UNIQUE INDEX index_period_apoderados ON apoderados(id_apoderado, BUSINESS_TIME WITHOUT OVERLAPS)

-- 11
CREATE TABLE hist_elecciones LIKE elecciones
CREATE TABLE hist_colegio LIKE colegio
CREATE TABLE hist_mesa LIKE mesa
CREATE TABLE hist_rol LIKE rol
CREATE TABLE hist_partido LIKE partido
CREATE TABLE hist_votante LIKE votante
CREATE TABLE hist_apoderados LIKE apoderados

-- 12
ALTER TABLE elecciones ADD VERSIONING USE HISTORY TABLE hist_elecciones
ALTER TABLE colegio ADD VERSIONING USE HISTORY TABLE hist_colegio
ALTER TABLE mesa ADD VERSIONING USE HISTORY TABLE hist_mesa
ALTER TABLE rol ADD VERSIONING USE HISTORY TABLE hist_rol
ALTER TABLE partido ADD VERSIONING USE HISTORY TABLE hist_partido
ALTER TABLE votante ADD VERSIONING USE HISTORY TABLE hist_votante
ALTER TABLE apoderados ADD VERSIONING USE HISTORY TABLE hist_apoderados