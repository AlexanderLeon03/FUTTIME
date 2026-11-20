CREATE DATABASE FUTTIME;

USE FUTTIME;	

CREATE TABLE Jugador
(
ti_doc VARCHAR(10) not null,
Doc_jug VARCHAR(20) NOT NULL,
pr_nom_jug VARCHAR(20) NOT NULL,
seg_nom_jug VARCHAR(20),
pr_ape_jug VARCHAR(20) NOT NULL,
seg_ape_jug VARCHAR(20),
tel BIGINT(30) NOT NULL,
PRIMARY KEY (ti_doc,Doc_jug)
);

CREATE TABLE Localidad
(
cod_loc VARCHAR(10) NOT NULL,
loc VARCHAR(20) NOT NULL,
PRIMARY KEY (cod_loc)
);

CREATE TABLE Empresa
(
cod_emp VARCHAR(10) NOT NULL,
nom_emp VARCHAR(25) NOT NULL,
direccion_emp VARCHAR(25) NOT NULL,
tel_emp BIGINT(30) NOT NULL,
tel2_emp BIGINT(30) NOT NULL,
N_canchas INT,
fkloc VARCHAR(10) NOT NULL,
PRIMARY KEY (cod_emp)
);

CREATE TABLE FuttPoints
(
idFP INT NOT NULL,
puntos INT NOT NULL,
fkPrem INT NOT NULL,
fkReser VARCHAR(10) NOT NULL,
PRIMARY KEY (idFP)
);

CREATE TABLE Premios
(
idPremios INT NOT NULL,
desk_Pr VARCHAR(15) NOT NULL,
PRIMARY KEY (idPremios)
);

CREATE TABLE Servicios
(
cod_ser INT  NOT NULL,
inf_ser VARCHAR(15) NOT NULL,
PRIMARY KEY (cod_ser)
);

CREATE TABLE Serv_Emp
(
fpkServ INT NOT NULL,
fpkEmp VARCHAR(10) NOT NULL,
PRIMARY KEY (fpkServ,fpkEmp)
);

CREATE TABLE Rang_Can
(
fpkRang VARCHAR(10) NOT NULL,
fpkCan VARCHAR(10) NOT NULL,
PRIMARY KEY (fpkRang,fpkCan)
);

CREATE TABLE Rango_precio
(
cod_prec VARCHAR(10) NOT NULL,
p_can INT(10) NOT NULL,
PRIMARY KEY (cod_prec)
);

CREATE TABLE Cancha 
(
cod_can VARCHAR(10) NOT NULL,
fkEmp VARCHAR(10) NOT NULL,
fkTpCan INT NOT NULL,
PRIMARY KEY(cod_can)
);

CREATE TABLE Reserva 
(
idReserva VARCHAR(10) NOT NULL,
monto BIGINT NOT NULL,
fecha DATE NOT NULL,
hora_asig TIME NOT NULL,
fkDocju BIGINT(11) NOT NULL,
fkjugti VARCHAR(10) NOT NULL,
fkCan VARCHAR(10) NOT NULL,
PRIMARY KEY(idReserva)
);

CREATE TABLE Tipo_Cancha
(
id_tc INT NOT NULL,
can VARCHAR(15) NOT NULL,
PRIMARY KEY(id_tc)
);

ALTER TABLE FuttPoints
ADD CONSTRAINT Pr_Fu
FOREIGN KEY (fkPrem)
REFERENCES Premios(idPremios);	

ALTER TABLE FuttPoints 
ADD CONSTRAINT Re_Fu
FOREIGN KEY (fkReser)
REFERENCES Reserva(idReserva);

ALTER TABLE Reserva
ADD CONSTRAINT Ju_Re
FOREIGN KEY (fkDocju,fkjugti)
REFERENCES Jugador(ti_doc,Doc_jug);

ALTER TABLE Reserva
ADD CONSTRAINT Ca_Re
FOREIGN KEY (fkCan)
REFERENCES Cancha(cod_can);

ALTER TABLE Rang_Can
ADD CONSTRAINT Ca_Ra_Ra
FOREIGN KEY (fpkCan)
REFERENCES Cancha(cod_can);

ALTER TABLE Rang_Can
ADD CONSTRAINT Ra_Ra_Ca
FOREIGN KEY (fpkRang)
REFERENCES Rango_precio(cod_prec);

ALTER TABLE Cancha
ADD CONSTRAINT Ti_Ca
FOREIGN KEY (fkTpCan)
REFERENCES Tipo_Cancha(id_tc);

ALTER TABLE Cancha
ADD CONSTRAINT Em_Ca
FOREIGN KEY (fkEmp)
REFERENCES Empresa(cod_emp);

ALTER TABLE Empresa
ADD CONSTRAINT Lo_Em
FOREIGN KEY (fkloc)
REFERENCES Localidad(cod_loc);	

ALTER TABLE Serv_Emp
ADD CONSTRAINT Em_Se_Se
FOREIGN KEY (fpkEmp)
REFERENCES Empresa(cod_emp);

ALTER TABLE Serv_Emp
ADD CONSTRAINT Se_Se_Em
FOREIGN KEY (fpkServ)
REFERENCES Servicios(cod_ser);

INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC01', 'Usaquén');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC02', 'Chapinero');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC03', 'Santa Fe');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC04', 'San Cristóbal');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC05', 'Usme');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC06', 'Tunjuelito');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC07', 'Bosa');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC08', 'Kennedy');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC09', 'Fontibón');
INSERT INTO Localidad (cod_loc, loc) 
VALUES ('LOC10', 'Engativá');

INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP01', 'Canchas Gol 5', 'Calle 100 # 15-20', 6011234567, 3101112233, 3, 'LOC01');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP02', 'Futbol Club 90', 'Carrera 15 # 85-10', 6012234567, 3102223344, 2, 'LOC02');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP03', 'Cancha Sintética El Campín', 'Transversal 28', 6013234567, NULL, 4, 'LOC03');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP04', 'Gol de Oro', 'Calle 50 # 20-30', 6014234567, 3104445566, 1, 'LOC04');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP05', 'Canchas La 80', 'Av. 80 # 45-12', 6015234567, 3105556677, 5, 'LOC05');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP06', 'Maracaná Sur', 'Calle 27 Sur # 10', 6016234567, 3106667788, 2, 'LOC06');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP07', 'Arena Bosa', 'Calle 65 Sur # 78', 6017234567, NULL, 3, 'LOC07');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP08', 'Canchas Kennedy', 'Diagonal 40 # 75', 6018234567, 3108889900, 2, 'LOC08');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP09', 'Futbol Play Fontibón', 'Calle 17 # 98-32', 6019234567, 3109990011, 4, 'LOC09');
INSERT INTO Empresa (cod_emp, nom_emp, direccion_emp, tel_emp, tel2_emp, N_canchas, fkloc) 
VALUES ('EMP10', 'Canchas Engativá', 'Calle 72 # 73-15', 6010234567, NULL, 3, 'LOC10');

INSERT INTO Tipo_Cancha (id_tc, can) 
VALUES (005, 'Fútbol 5');
INSERT INTO Tipo_Cancha (id_tc, can) 
VALUES (008, 'Fútbol 8');
INSERT INTO Tipo_Cancha (id_tc, can) 
VALUES (011, 'Fútbol 11');
 
INSERT INTO Rango_precio (cod_prec, p_can) 
VALUES ('Mañana', 50000);
INSERT INTO Rango_precio (cod_prec, p_can) 
VALUES ('Tarde', 70000);
INSERT INTO Rango_precio (cod_prec, p_can) 
VALUES ('Noche', 90000);
INSERT INTO Rango_precio (cod_prec, p_can) 
VALUES ('Fines de Semana', 120000);

INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (100, 'Parqueadero');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (101, 'Duchas');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (102, 'Cafetería');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (103, 'cerveza');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (104, 'Vestieres');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (105, 'Pet Friendly');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (106, 'Iluminación LED');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (107, 'Celebraciones');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (108, 'Hidratación');
INSERT INTO Servicios (cod_ser, inf_ser) 
VALUES (109, 'Alquiler uniformes');

INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012345', 'Juan', 'Sebastian', 'Rico', 'Gómez', 3111234567);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012346', 'María', 'Fernanda', 'Rodríguez', 'López', 3122345678);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012347', 'Juan', NULL, 'Martínez', 'Sánchez', 3133456789);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('TI', '10012348', 'Ana', 'Sofía', 'García', 'Díaz', 3144567890);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012349', 'Luis', 'Miguel', 'Hernández', 'Torres', 3155678901);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012350', 'Laura', 'Camila', 'Ramírez', NULL, 3166789012);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012351', 'Diego', 'Alejandro', 'Cruz', 'Morales', 3177890123);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CE', '10012352', 'Valentina', '', 'Ortiz', 'Castillo', 3188901234);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012353', 'Mateo', 'José', 'Jiménez', 'Ruiz', 3199012345);
INSERT INTO Jugador (ti_doc, Doc_jug, pr_nom_jug, seg_nom_jug, pr_ape_jug, seg_ape_jug, tel) 
VALUES ('CC', '10012354', 'Lucía', 'Victoria', 'Álvarez', NULL, 3200123456);

INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (2500, 'Bono 20% dcto');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (3000, 'Bebidas gratis');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (10000, 'Hora gratis');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (8000, 'Balón oficial');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (6000, 'Camiseta');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (2000, 'Membresía VIP');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (1000, 'Snack cortesía');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (500, 'Parqueadero gratis');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (1500, 'Trofeo express');
INSERT INTO Premios (idPremios, desk_Pr) 
VALUES (5000, 'Bono 50% dcto');

INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN01', 'EMP01', 005);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN02', 'EMP01', 008);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN03', 'EMP02', 005);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN04', 'EMP03', 011);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN05', 'EMP04', 005);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN06', 'EMP05', 008);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN07', 'EMP06', 011);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN08', 'EMP07', 005);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN09', 'EMP08', 011);
INSERT INTO Cancha (cod_can, fkEmp, fkTpCan) 
VALUES ('CAN10', 'EMP09', 005);

INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (100, 'EMP01');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (101, 'EMP01');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (102, 'EMP02');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (103, 'EMP03');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (104, 'EMP04');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (105, 'EMP05');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (106, 'EMP06');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (107, 'EMP07');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (108, 'EMP08');
INSERT INTO Serv_Emp (fpkServ, fpkEmp) 
VALUES (109, 'EMP09');

INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Mañana', 'CAN01');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Mañana', 'CAN02');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Mañana', 'CAN03');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Tarde', 'CAN04');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Tarde', 'CAN05');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Tarde', 'CAN06');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Noche', 'CAN07');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Noche', 'CAN08');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Noche', 'CAN09');
INSERT INTO Rang_Can (fpkRang, fpkCan) 
VALUES ('Fines de Semana', 'CAN10');

INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES01', 25000, '2026-10-15', '18:00:00', 10012345, 'CC', 'CAN01');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES02', 30000, '2026-10-16', '19:00:00', 10012346, 'CC', 'CAN02');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES03', 35000, '2026-10-17', '20:00:00', 10012347, 'CC', 'CAN03');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES04', 60000, '2026-10-18', '17:00:00', 10012348, 'TI', 'CAN04');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES05', 45000, '2026-10-19', '21:00:00', 10012349, 'CC', 'CAN05');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES06', 40000, '2026-10-20', '16:00:00', 10012350, 'CC', 'CAN06');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES07', 35000, '2026-10-21', '18:00:00', 10012351, 'CC', 'CAN07');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES08', 50000, '2026-10-22', '19:00:00', 10012352, 'CE', 'CAN08');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES09', 45000, '2026-10-23', '20:00:00', 10012353, 'CC', 'CAN09');
INSERT INTO Reserva (idReserva, monto, fecha, hora_asig, fkDocju, fkjugti, fkCan) 
VALUES ('RES10', 60000, '2026-10-24', '17:00:00', 10012354, 'CC', 'CAN10');

INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (00, 1000, 500, 'RES01');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (01, 2000, 2000, 'RES02');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (02, 3000, 1000, 'RES03');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (03, 4000, 1500, 'RES04');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (04, 5000, 500, 'RES05');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (05, 6000, 6000, 'RES06');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (06, 7000, 2500, 'RES07');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (07, 8000, 5000, 'RES08');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (08, 9000, 5000, 'RES09');
INSERT INTO FuttPoints (idFP, puntos, fkPrem, fkReser) 
VALUES (09, 10000, 10000, 'RES10');