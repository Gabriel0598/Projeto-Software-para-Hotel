USE UniHotel_Desenvolvimento
GO

CREATE TABLE ADM_Hotel
(
--DADOS DE IDENTIFICAÇÃO:
Centro_Custo TINYINT PRIMARY KEY NOT NULL,
CNPJ BIGINT,
Razao_Social VARCHAR(50),
Nome_Fantasia VARCHAR(50),
Inscr_Estad INT,
)

SELECT * FROM ADM_Hotel;

BEGIN TRANSACTION
EXEC sp_rename
	'ADM_Hotel.Centro_Custo',
	'CC_ADM',
	'COLUMN'

SELECT * FROM ADM_Hotel;

ALTER TABLE ADM_Hotel ADD 
	--CONTATO:
	Ramal_Principal SMALLINT,
	Email_Principal VARCHAR(50),
	DDD_Comercial1 TINYINT NOT NULL,
	Tel_Comercial1 INT NOT NULL,
	DDD_Comercial2 TINYINT,
	Tel_Comercial2 INT,

	--ENDERECO:
	Logradouro VARCHAR(50) NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Complemento VARCHAR(50),
	Bairro_Regiao VARCHAR(30) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	CEP INT NOT NULL,
	Estado_Provincia VARCHAR(30),
	Pais VARCHAR(50) NOT NULL

SELECT * FROM ADM_Hotel;
COMMIT