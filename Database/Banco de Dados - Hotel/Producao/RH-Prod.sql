USE UniHotel_Producao
GO

CREATE TABLE RH
(
Centro_Custo TINYINT PRIMARY KEY NOT NULL,
--Comunicação:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),
Cargos VARCHAR(50),
Ficha_Func VARCHAR(50),
Contrat_Trab INT,
)

SELECT * FROM RH;