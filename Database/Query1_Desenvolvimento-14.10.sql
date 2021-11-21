CREATE DATABASE UniHotel_Desenvolvimento
CREATE DATABASE UniHotel_Testes
CREATE DATABASE UniHotel_Producao
GO

USE UniHotel_Desenvolvimento
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
Num_Tel_Celular BIGINT NOT NULL, --APENAS DDI e Num do Celular estão com NOT NULL devido a não haver obrigatoriedade de informar tel fixo;
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
CEP INT,
ZipCode VARCHAR(20),
Estado_Provincia VARCHAR(30),
Pais VARCHAR(50) NOT NULL
)

--VERIFICAÇÃO DAS COLUNAS:
SELECT * FROM Clientes

--PARA DESENVOLVIMENTO E TESTE DE CLIENTES É UTILIZADO O GERADOR DE PESSOAS DO SITE 4DEVS, CONFORME LINK:
--https://www.4devs.com.br/gerador_de_pessoas
INSERT INTO dbo.Clientes(Nome_Completo, CPF, RG, Data_Nascimento, Genero, DDI_Tel_Fixo, DDD_Tel_Fixo,
Num_Tel_Fixo, DDD_Tel_Celular, DDI_Tel_Celular,Num_Tel_Celular, Email_Principal, Logradouro, Numero,
Bairro_Regiao, Cidade, Estado_Provincia, CEP, Pais)
VALUES
('Clara Beatriz Moraes', 09896601097, 369615402, '13/06/1993', 'Feminino', 55, 91, 36198064,
55, 91, 991371786, 'clarabeatrizmoraes__clarabeatrizmoraes@zf-lenksysteme.com',
'Quadra Cento e Trinta e Oito', '924', 'Maguari', 'Ananindeua', 'Pará', 67145087, 'Brasil');

SELECT * FROM Clientes;
SELECT Email_Principal FROM Clientes WHERE Nome_Completo = 'Clara Beatriz Moraes';