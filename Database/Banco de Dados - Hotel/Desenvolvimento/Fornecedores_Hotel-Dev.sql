USE UniHotel_Desenvolvimento
GO

CREATE TABLE Fornecedores_Hotel
(
--DADOS DE IDENTIFICAÇÃO:
Cod_Fornec INT IDENTITY (1,1),
Status_Fornecedor BIT, --Ativo ou inativo
CNPJ BIGINT NOT NULL PRIMARY KEY,
Razao_Social VARCHAR(50) NOT NULL,
Nome_Fantasia VARCHAR(50),
Inscr_Estad INT,

--CONTATO:
DDD_Comercial1 TINYINT NOT NULL,
Tel_Comercial1 INT NOT NULL,
DDD_Comercial2 TINYINT,
Tel_Comercial2 INT,
Email VARCHAR(50) NOT NULL,
Funcionario_Contato VARCHAR(50), --Contato no fornecedor

--ENDERECO:
Logradouro VARCHAR(50) NOT NULL,
Numero VARCHAR(10) NOT NULL,
Complemento VARCHAR(50),
Bairro_Regiao VARCHAR(30) NOT NULL,
Cidade VARCHAR(50) NOT NULL,
CEP INT NOT NULL,
Estado_Provincia VARCHAR(30),
Pais VARCHAR(50) NOT NULL
)

SELECT * FROM Fornecedores_Hotel;