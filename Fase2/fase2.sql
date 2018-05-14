CREATE TABLESPACE "Incidentes"  
   DATAFILE 'tbs_f2.dat' SIZE 40M 
   ONLINE;

CREATE USER "LM"
   IDENTIFIED BY password
   DEFAULT TABLESPACE "Incidentes" 
   QUOTA 10M ON "Incidentes" 
   TEMPORARY TABLESPACE temp
   PASSWORD EXPIRE;

CREATE TABLE "Categoria da Aeronave"(
"Categoria" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;

CREATE TABLE "Tipo de Motor"(
"Tipo de Motor" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;


CREATE TABLE "Fabricante"(
"Fabricante" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;

CREATE TABLE "Modelo"(
"Modelo" VARCHAR(45),
"Fabricante" VARCHAR(45),
"Construção Amadora" VARCHAR (3),
PRIMARY KEY("Modelo","Fabricante"),
FOREIGN KEY("Fabricante") REFERENCES "Fabricante"("Fabricante")
)TABLESPACE "Incidentes" ;


CREATE TABLE "Operação"(
"Operação" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;


CREATE TABLE "Aeroporto"(
"Código do Aeroporto" VARCHAR(45) PRIMARY KEY,
"Nome do Aeroporto" VARCHAR(45)
)TABLESPACE "Incidentes" ;

CREATE TABLE "Fase do Voo"(
"Fase do Voo" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;

CREATE TABLE "Estado do Relatório"(
"Estado do Relatório" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;

CREATE TABLE "Aeronave"(
"Número de Registo" VARCHAR(45) PRIMARY KEY,
"Fabricante" VARCHAR(45),
"Modelo" VARCHAR(45),
"Categoria" VARCHAR(45),
"Tipo de Motor" VARCHAR(45),
"Número de Motores" VARCHAR(45),
FOREIGN KEY("Modelo","Fabricante") REFERENCES "Modelo"("Modelo","Fabricante"),
FOREIGN KEY("Categoria") REFERENCES "Categoria da Aeronave"("Categoria"),
FOREIGN KEY("Tipo de Motor") REFERENCES "Tipo de Motor"("Tipo de Motor")
)TABLESPACE "Incidentes" ;

CREATE TABLE "Danos da Aeronave"(
"Danos da Aeronave" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;

CREATE TABLE "Propósito do Voo"(
"Descrição" VARCHAR(45) PRIMARY KEY
)TABLESPACE "Incidentes" ;

CREATE TABLE "Acidente"(
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
)TABLESPACE "Incidentes" ;



CREATE TABLE "Evento"(
"Número de Acidente" VARCHAR(45),
"Número de Evento" VARCHAR(45),
"Tipo de Investigação" VARCHAR(45) NOT NULL,
"Data do Evento" DATE NOT NULL,
"Condições Meteorológicas" CHAR(3),
"Estado do Relatório" VARCHAR(45) NOT NULL,
"Código do Aeroporto" VARCHAR(45),
"Latitude" FLOAT,
"Longitude" FLOAT,
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
)TABLESPACE "Incidentes" ;

