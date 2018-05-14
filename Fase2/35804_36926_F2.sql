CREATE TABLESPACE incidentes 
   DATAFILE 'tbs_f2.dat' SIZE 40M 
   ONLINE;

CREATE USER "LM"
   IDENTIFIED BY password
   DEFAULT TABLESPACE incidentes
   QUOTA 10M ON incidentes
   TEMPORARY TABLESPACE temp
   PASSWORD EXPIRE;

CREATE TABLE LM."Categoria da Aeronave"(
"Categoria" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Tipo de Motor"(
"Tipo de Motor" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Fabricante"(
"Fabricante" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Modelo"(
"Modelo" VARCHAR(45),
"Fabricante" VARCHAR(45),
"Construção Amadora" VARCHAR (3),
PRIMARY KEY("Modelo","Fabricante"),
FOREIGN KEY("Fabricante") REFERENCES "Fabricante"("Fabricante")
)TABLESPACE incidentes;

CREATE TABLE LM."Operação"(
"Operação" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Aeroporto"(
"Código do Aeroporto" VARCHAR(45) PRIMARY KEY,
"Nome do Aeroporto" VARCHAR(45)
)TABLESPACE incidentes;

CREATE TABLE LM."Fase do Voo"(
"Fase do Voo" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Estado do Relatório"(
"Estado do Relatório" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Aeronave"(
"Número de Registo" VARCHAR(45) PRIMARY KEY,
"Fabricante" VARCHAR(45),
"Modelo" VARCHAR(45),
"Categoria" VARCHAR(45),
"Tipo de Motor" VARCHAR(45),
"Número de Motores" VARCHAR(45),
FOREIGN KEY("Modelo","Fabricante") REFERENCES "Modelo"("Modelo","Fabricante"),
FOREIGN KEY("Categoria") REFERENCES "Categoria da Aeronave"("Categoria"),
FOREIGN KEY("Tipo de Motor") REFERENCES "Tipo de Motor"("Tipo de Motor")
)TABLESPACE incidentes;

CREATE TABLE LM."Danos da Aeronave"(
"Danos da Aeronave" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Propósito do Voo"(
"Descrição" VARCHAR(45) PRIMARY KEY
)TABLESPACE incidentes;

CREATE TABLE LM."Acidente"(
"Número de Acidente" VARCHAR(45) PRIMARY KEY,
"Número de Registo" VARCHAR(45),
"Operação" VARCHAR(45),
"Propósito do Voo" VARCHAR(45),
"Companhia" VARCHAR(45),
"Voo Agendado" VARCHAR(45),
"Fase do Voo" VARCHAR(45),
FOREIGN KEY("Número de Registo") REFERENCES "Aeronave"("Número de Registo"),
FOREIGN KEY("Operação") REFERENCES "Operação"("Operação"),
FOREIGN KEY("Propósito do Voo") REFERENCES "Propósito do Voo"("Descrição"),
FOREIGN KEY("Fase do Voo") REFERENCES "Fase do Voo"("Fase do Voo")
)TABLESPACE incidentes;

CREATE TABLE LM."Evento"(
"Número de Acidente" VARCHAR(45),
"Número de Evento" VARCHAR(45),
"Tipo de Investigação" VARCHAR(45) NOT NULL,
"Data do Evento" DATE NOT NULL,
"Condições Meteorológicas" CHAR(3),
"Estado do Relatório" VARCHAR(45) NOT NULL,
"Código do Aeroporto" VARCHAR(45),
"Latitude" VARCHAR(45),
"Longitude" VARCHAR(45),
"País" VARCHAR(45),
"Estado" VARCHAR(45),
"Cidade" VARCHAR(45),
"Danos da Aeronave" VARCHAR(45),
"Severidade das Lesões" VARCHAR(45) NOT NULL,
"Total de Feridos Graves" INTEGER,
"Total de Feridos Ligeiros" INTEGER,
"Total de Não Feridos" INTEGER,
PRIMARY KEY("Número de Acidente","Número de Evento"),
FOREIGN KEY("Número de Acidente") REFERENCES "Acidente"("Número de Acidente"),
FOREIGN KEY("Estado do Relatório") REFERENCES "Estado do Relatório"("Estado do Relatório"),
FOREIGN KEY("Código do Aeroporto") REFERENCES "Aeroporto"("Código do Aeroporto"),
FOREIGN KEY("Danos da Aeronave") REFERENCES "Danos da Aeronave"("Danos da Aeronave")
)TABLESPACE incidentes;

