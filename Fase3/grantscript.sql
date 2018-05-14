CREATE ROLE "Gestor de Eventos";
CREATE ROLE "Perito";
CREATE ROLE "Analista";

GRANT "Analista" TO analista;
CREATE VIEW "Evento Analista" AS SELECT "Número de Acidente", "Número de Evento", "Tipo de Investigação", "Data do Evento", "Estado do Relatório","Latitude", "Longitude" ,"País","Estado","Cidade" ,"Danos da Aeronave","Severidade das Lesões","Total de Feridos Graves","Total de Feridos Ligeiros","Total de Não Feridos" FROM "LM"."Evento";                  
GRANT SELECT ON "LM"."Evento Analista" TO analista;        
GRANT SELECT ON "LM"."Acidente" TO analista;
GRANT SELECT ON "LM"."Modelo" TO analista;
GRANT SELECT ON "LM"."Aeroporto" TO analista;
GRANT SELECT ON "LM"."Aeronave" TO analista;

GRANT "Perito" TO perito;
GRANT SELECT ON "LM"."Evento" TO perito;
CREATE VIEW "Evento Perito" AS SELECT "Tipo de Investigação", "Data do Evento","Condições Meteorológicas", "Estado do Relatório","Código do Aeroporto", "Latitude", "Longitude" ,"Danos da Aeronave","Severidade das Lesões","País", "Estado","Cidade", "Total de Feridos Graves","Total de Feridos Ligeiros","Total de Não Feridos" FROM "LM"."Evento";                         
GRANT INSERT ON "LM"."Evento Perito" TO perito;
CREATE VIEW "Evento Perito Update" AS SELECT  "Estado do Relatório","Danos da Aeronave","Severidade das Lesões", "Total de Feridos Graves","Total de Feridos Ligeiros","Total de Não Feridos" FROM "LM"."Evento";        
GRANT UPDATE ON "LM"."Evento Perito Update" TO perito;    
GRANT SELECT ON "LM"."Acidente" TO perito;
GRANT INSERT ON "LM"."Acidente" TO perito;
GRANT UPDATE ON "LM"."Acidente" TO perito;
GRANT SELECT ON "LM"."Modelo" TO perito;
GRANT UPDATE ON "LM"."Modelo" TO perito;
GRANT SELECT ON "LM"."Aeroporto" TO perito;
GRANT UPDATE ON "LM"."Aeroporto" TO perito;
GRANT SELECT ON "LM"."Aeronave" TO perito;
GRANT DELETE ON "LM"."Aeronave" TO perito;
GRANT "Gestor de Eventos" TO gestor;
GRANT SELECT ON "LM"."Evento" TO gestor;
CREATE VIEW "Evento Gestor" AS SELECT "Número de Acidente","Tipo de Investigação", "Data do Evento","Condições Meteorológicas", "Estado do Relatório","Código do Aeroporto", "Latitude", "Longitude" ,"Danos da Aeronave","Severidade das Lesões","País", "Estado","Cidade", "Total de Feridos Graves","Total de Feridos Ligeiros","Total de Não Feridos" FROM "LM"."Evento";                         
GRANT INSERT ON "LM"."Evento Gestor" TO gestor;
CREATE VIEW "Evento Gestor Update Delete" AS SELECT "Tipo de Investigação", "Data do Evento","Condições Meteorológicas", "Estado do Relatório","Código do Aeroporto", "Latitude", "Longitude" ,"Danos da Aeronave","Severidade das Lesões","País", "Estado","Cidade", "Total de Feridos Graves","Total de Feridos Ligeiros","Total de Não Feridos" FROM "LM"."Evento";                         
GRANT DELETE ON "Evento Gestor Update Delete" TO gestor;
GRANT UPDATE ON "Evento Gestor Update Delete" TO gestor;
GRANT SELECT ON "LM"."Acidente" TO gestor;
GRANT INSERT ON "LM"."Acidente" TO gestor;
GRANT UPDATE ON "LM"."Acidente" TO gestor;
GRANT DELETE ON "LM"."Acidente" TO gestor;

GRANT SELECT ON "LM"."Modelo" TO gestor;
GRANT INSERT ON "LM"."Modelo" TO gestor;
GRANT UPDATE ON "LM"."Modelo" TO gestor;

GRANT SELECT ON "LM"."Aeroporto" TO gestor;
GRANT INSERT ON "LM"."Aeroporto" TO gestor;
GRANT DELETE ON "LM"."Aeroporto" TO gestor;
GRANT UPDATE ON "LM"."Aeroporto" TO gestor;

GRANT SELECT ON "LM"."Aeronave" TO gestor;
GRANT UPDATE ON "LM"."Aeronave" TO gestor;
