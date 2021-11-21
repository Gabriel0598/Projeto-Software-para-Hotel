USE UniHotel_Testes
GO

CREATE TABLE Clientes
(
--DADOS DE IDENTIFICAÇÃO:
Cod_Cliente INT IDENTITY(1,1) PRIMARY KEY,
Nome_Completo VARCHAR(100) NOT NULL,
CPF BIGINT,
RG INT,
Num_Passaporte VARCHAR(15),
Data_Nascimento DATE NOT NULL,
Genero VARCHAR(15),
--DADOS DE CONTATO:
DDI_Tel_Fixo TINYINT,
DDD_Tel_Fixo TINYINT,
Num_Tel_Fixo BIGINT,
DDI_Tel_Celular TINYINT NOT NULL,
DDD_Tel_Celular TINYINT,
Num_Tel_Celular BIGINT NOT NULL, --APENAS DDI e Num do Celular estão com NOT NULL devido a não haver obrigatoriedade de informar tel fixo, recado e comercial;
DDI_Tel_Recado TINYINT,
DDD_Tel_Recado TINYINT,
Num_Tel_Recado BIGINT,
DDI_Tel_Comercial TINYINT,
DDD_Tel_Comercial TINYINT,
Num_Tel_Comercial BIGINT,
Email_Principal VARCHAR(100) NOT NULL,
Email_Secundario VARCHAR(100),
--DADOS DO ENDEREÇO:
Logradouro VARCHAR(50) NOT NULL,
Numero VARCHAR(10) NOT NULL,
Complemento VARCHAR(50),
Bairro_Regiao VARCHAR(30) NOT NULL,
Cidade VARCHAR(50) NOT NULL,
CEP_ZipCode VARCHAR(20),
Estado_Provincia VARCHAR(30),
Pais VARCHAR(50) NOT NULL
)

SELECT * FROM Clientes;