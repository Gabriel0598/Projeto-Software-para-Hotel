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
CEP INT,
ZipCode VARCHAR(20),
Estado_Provincia VARCHAR(30),
Pais VARCHAR(50) NOT NULL
)

--VERIFICAÇÃO DAS COLUNAS:
SELECT * FROM Clientes;

--PARA DESENVOLVIMENTO E TESTE DE CLIENTES É UTILIZADO O GERADOR DE PESSOAS DO SITE 4DEVS, CONFORME LINK:
--https://www.4devs.com.br/gerador_de_pessoas
INSERT INTO dbo.Clientes(Nome_Completo, CPF, RG, Data_Nascimento, Genero, DDI_Tel_Fixo, DDD_Tel_Fixo,
Num_Tel_Fixo, DDD_Tel_Celular, DDI_Tel_Celular,Num_Tel_Celular, Email_Principal, Logradouro, Numero,
Bairro_Regiao, Cidade, Estado_Provincia, CEP_ZipCode, Pais)
VALUES
('Clara Beatriz Moraes', 09896601097, 369615402, '13/06/1993', 'Feminino', 55, 91, 36198064,
55, 91, 991371786, 'clarabeatrizmoraes__clarabeatrizmoraes@zf-lenksysteme.com',
'Quadra Cento e Trinta e Oito', '924', 'Maguari', 'Ananindeua', 'Pará', 67145087, 'Brasil');

SELECT * FROM Clientes;
SELECT Email_Principal FROM Clientes WHERE Nome_Completo = 'Clara Beatriz Moraes';

--Alterações de colunas conforme regras de negócio:
BEGIN TRANSACTION
ALTER TABLE dbo.Clientes DROP COLUMN ZipCode;
SELECT * FROM Clientes;
COMMIT

BEGIN TRANSACTION
--Realizando stored procedure para alterar nome de coluna:
EXEC sp_rename
			'Clientes.CEP',
			'CEP/ ZipCode',
			'COLUMN'
SELECT * FROM Clientes;
COMMIT

BEGIN TRANSACTION
EXEC sp_rename
			'Clientes.CEP/ ZipCode',
			'CEP_ZipCode',
			'COLUMN'
SELECT * FROM Clientes;
ALTER TABLE Clientes
ALTER COLUMN CEP_ZipCode VARCHAR(20);
SELECT * FROM Clientes;

COMMIT

--Teste de inserção de dados em todos os campos:
INSERT INTO dbo.Clientes(Nome_Completo, CPF, RG, Num_Passaporte, Data_Nascimento, Genero, DDI_Tel_Fixo, DDD_Tel_Fixo,
Num_Tel_Fixo, DDI_Tel_Celular, DDD_Tel_Celular,Num_Tel_Celular, DDI_Tel_Recado, DDD_Tel_Recado,Num_Tel_Recado, DDI_Tel_Comercial, DDD_Tel_Comercial,Num_Tel_Comercial, Email_Principal, Email_Secundario,
Logradouro, Numero, Complemento, Bairro_Regiao, Cidade, CEP_ZipCode, Estado_Provincia, Pais)
VALUES
('João Macedo Rocha', 7784519046, 567761301, 'BR345981', '01/08/1985', 'Masculino', 55, 11, 43009176,
55, 11, 954087653, 55, 11, 967908451, 55, 11, 44011055, 'macedojoao85@gmail.com', 'joao447_asp@outlook.com',
'Rua Gal. Leite de Castro', '465', 'Casa 2', 'Jardim Santa Cruz', 'São Paulo', 04182020, 'SP', 'Brasil');

SELECT * FROM Clientes;

--//////////////

--Convertendo tipo para alocar espaço para a Hash:
ALTER TABLE [dbo].[Clientes] ALTER COLUMN CPF VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN RG VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN Num_Passaporte VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN Num_Tel_Fixo VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN Num_Tel_Celular VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN Num_Tel_Recado VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN Num_Tel_Comercial VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN Email_Principal VARCHAR(64);
ALTER TABLE [dbo].[Clientes] ALTER COLUMN Email_Secundario VARCHAR(64);

--///////////////////

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

BEGIN TRAN

--Trigger para efetivar criptografia:
CREATE TRIGGER TGR_Clientes
ON [dbo].[Clientes]
FOR INSERT
AS
BEGIN
	DECLARE
	@criptoCPF_Cliente AS VARCHAR(MAX),
	@criptoRG_Cliente AS VARCHAR(MAX),
	@criptoPassaporte_Cliente AS VARCHAR(MAX),
	@criptoTel_Fixo AS VARCHAR(MAX),
	@criptoTel_Cel AS VARCHAR(MAX),
	@criptoTel_Recado AS VARCHAR(MAX),
	@criptoTel_Comercial AS VARCHAR(MAX),
	@criptoEmail_Principal AS VARCHAR(MAX),
	@criptoEmail_Secundario AS VARCHAR(MAX),
	@id AS INT

	SELECT @id = Cod_Cliente, @criptoCPF_Cliente = CPF, @criptoRG_Cliente = RG,
	@criptoPassaporte_Cliente = Num_Passaporte, @criptoTel_Fixo = Num_Tel_Fixo,
	@criptoTel_Cel = Num_Tel_Celular, @criptoTel_Recado = Num_Tel_Recado,
	@criptoTel_Comercial = Num_Tel_Comercial, @criptoEmail_Principal = Email_Principal,
	@criptoEmail_Secundario = Email_Secundario FROM INSERTED

	SET @criptoCPF_Cliente = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Cliente), 2);
	SET @criptoRG_Cliente = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoRG_Cliente), 2);
	SET @criptoPassaporte_Cliente = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPassaporte_Cliente), 2);
	SET @criptoTel_Fixo = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoTel_Fixo), 2);
	SET @criptoTel_Cel = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoTel_Cel), 2);
	SET @criptoTel_Recado = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoTel_Recado), 2);
	SET @criptoTel_Comercial = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoTel_Comercial), 2);
	SET @criptoEmail_Principal = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoEmail_Principal), 2);
	SET @criptoEmail_Secundario = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoEmail_Secundario), 2);
	-- SHA2_256 para criptografia geral
	
	UPDATE [dbo].[Clientes] SET CPF = @criptoCPF_Cliente,
	RG = @criptoRG_Cliente, Num_Passaporte = @criptoPassaporte_Cliente,
	Num_Tel_Fixo = @criptoTel_Fixo, Num_Tel_Celular = @criptoTel_Cel,
	Num_Tel_Recado = @criptoTel_Recado, Num_Tel_Comercial = @criptoTel_Comercial,
	Email_Principal = @criptoEmail_Principal, Email_Secundario = @criptoEmail_Secundario
	WHERE Cod_Cliente = @id
END
GO

-------------------------////////////////////////////////----------------------------

--Habilitaçãoo da trigger:
ALTER TABLE [dbo].[Clientes] ENABLE TRIGGER [TGR_Clientes]
GO

--Teste para verificar criptografia:
INSERT INTO dbo.Clientes(Nome_Completo, CPF, RG, Num_Passaporte, Data_Nascimento, Genero, DDI_Tel_Fixo, DDD_Tel_Fixo,
Num_Tel_Fixo, DDI_Tel_Celular, DDD_Tel_Celular,Num_Tel_Celular, DDI_Tel_Recado, DDD_Tel_Recado,Num_Tel_Recado, DDI_Tel_Comercial, DDD_Tel_Comercial,Num_Tel_Comercial, Email_Principal, Email_Secundario,
Logradouro, Numero, Complemento, Bairro_Regiao, Cidade, CEP_ZipCode, Estado_Provincia, Pais)
VALUES
('João Macedo Rocha', 7784519046, 567761301, 'BR345981', '01/08/1985', 'Masculino', 55, 11, 43009176,
55, 11, 954087653, 55, 11, 967908451, 55, 11, 44011055, 'macedojoao85@gmail.com', 'joao447_asp@outlook.com',
'Rua Gal. Leite de Castro', '465', 'Casa 2', 'Jardim Santa Cruz', 'São Paulo', 04182020, 'SP', 'Brasil');

SELECT * FROM Clientes;

COMMIT