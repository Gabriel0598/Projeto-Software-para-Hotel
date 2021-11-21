USE UniHotel_Desenvolvimento
GO

--CRIA��O DE TABELA PARA TESTE DE DIVERSOS TIPOS DE CRIPTOGRAFIA:

CREATE TABLE Teste_Criptografia
	(ID INT IDENTITY,
	[Login] VARCHAR(10),
	[Senha] VARCHAR(100),
	[Nome] VARCHAR(100),
	[CPF] BIGINT,
	[Endereco] VARCHAR(300),
	[Genero] CHAR(1))
GO

SELECT * FROM Teste_Criptografia;

--INSER��O DE DADOS PARA TESTE:

--////CRIA��O DE PESSOAS FICT�CIAS ATRAV�S DO SITE 4DEVS;
--Sem criptografia:
INSERT INTO [dbo].[Teste_Criptografia]
			([Login],
			[Senha],
			[Nome],
			[CPF],
			[Endereco],
			[Genero]
			)
		VALUES
			('LUANA90C',
			'Teste-de-Senha',
			'Luana Eduarda Carvalho',
			'13339159939',
			'Rua Dez, 977',
			'F'
			)
GO

SELECT * FROM Teste_Criptografia;

--Com criptografia:

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Cria��o de trigger para efetivar criptografia:
CREATE TRIGGER TGR_teste_cripto
ON [dbo].[Teste_Criptografia]
FOR INSERT
AS
BEGIN
	DECLARE
	@cripto AS VARCHAR(MAX),
	@id AS INT

	SELECT @cripto = Senha, @id = ID FROM INSERTED
	SET @cripto = CONVERT(VARCHAR(300), HASHBYTES('SHA2_512', @cripto), 2) --MD2, MD4, MD5, SHA1, SHA2_256, SHA2_512

	UPDATE Teste_Criptografia SET Senha = @cripto WHERE ID = @id
END
GO

--Ao longo dos testes foi criada e apagada diversas vezes esta trigger para alterar o tipo de hash (MD2, MD4, MD5, SHA1, SHA2_256, SHA2_512)

--Habilita��o da trigger:
ALTER TABLE [dbo].[Teste_Criptografia] ENABLE TRIGGER [TGR_teste_cripto]
GO
--MD2

--Inclus�o de dados:

INSERT INTO [dbo].[Teste_Criptografia]
			([Login],
			[Senha],
			[Nome],
			[CPF],
			[Endereco],
			[Genero]
			)
		VALUES
			('CESAR81',
			'Senha1234', --Encriptado por MD2
			'C�sar Fernando Calebe Rocha',
			'958966851',
			'Rua Terceira, 371',
			'M'
			)
GO

SELECT * FROM Teste_Criptografia;

--///Exclus�o da trigger ap�s seu uso:

DROP TRIGGER TGR_teste_cripto;


-----------/////////////////////////////---------------


--Habilita��o da trigger:
ALTER TABLE [dbo].[Teste_Criptografia] ENABLE TRIGGER [TGR_teste_cripto]
GO
--MD4

INSERT INTO [dbo].[Teste_Criptografia]
			([Login],
			[Senha],
			[Nome],
			[CPF],
			[Endereco],
			[Genero]
			)
		VALUES
			('JOAOP',
			'1234', --Encriptado por MD4
			'Jo�o Pietro Filipe Castro',
			'0502253524',
			'Beco Bom Jesus, 864',
			'M'
			)
GO

SELECT * FROM Teste_Criptografia;

--///Exclus�o da trigger ap�s seu uso:

DROP TRIGGER TGR_teste_cripto;


-----------/////////////////////////////---------------


--Habilita��o da trigger:
ALTER TABLE [dbo].[Teste_Criptografia] ENABLE TRIGGER [TGR_teste_cripto]
GO
--MD5

INSERT INTO [dbo].[Teste_Criptografia]
			([Login],
			[Senha],
			[Nome],
			[CPF],
			[Endereco],
			[Genero]
			)
		VALUES
			('CLARI49P',
			'Clarice1949', --Encriptado por MD5
			'Clarice Elisa Luciana Pinto',
			'258095968',
			'Travessa 1� de Maio, 271',
			'F'
			)
GO

SELECT * FROM Teste_Criptografia;

--///Exclus�o da trigger ap�s seu uso:

DROP TRIGGER TGR_teste_cripto;


-----------/////////////////////////////---------------


--Habilita��o da trigger:
ALTER TABLE [dbo].[Teste_Criptografia] ENABLE TRIGGER [TGR_teste_cripto]
GO
--SHA1

INSERT INTO [dbo].[Teste_Criptografia]
			([Login],
			[Senha],
			[Nome],
			[CPF],
			[Endereco],
			[Genero]
			)
		VALUES
			('ALLANA70M',
			'password1234', --Encriptado por SHA1
			'Allana Carolina Louise Moreira',
			'404223670',
			'Avenida Jos� Rodrigues Santos, 814',
			'F'
			)
GO

SELECT * FROM Teste_Criptografia;

--///Exclus�o da trigger ap�s seu uso:

DROP TRIGGER TGR_teste_cripto;


-----------/////////////////////////////---------------


--Habilita��o da trigger:
ALTER TABLE [dbo].[Teste_Criptografia] ENABLE TRIGGER [TGR_teste_cripto]
GO
--SHA2_256

INSERT INTO [dbo].[Teste_Criptografia]
			([Login],
			[Senha],
			[Nome],
			[CPF],
			[Endereco],
			[Genero]
			)
		VALUES
			('RUAN88S',
			'{script_34678*$}', --Encriptado por SHA2_512
			'Ruan S�rgio Theo Campos',
			'86348408400',
			'Rua S�o Felipe, 268',
			'M'
			)
GO

SELECT * FROM Teste_Criptografia;

--///Exclus�o da trigger ap�s seu uso:

DROP TRIGGER TGR_teste_cripto;


-----------/////////////////////////////---------------


--Habilita��o da trigger:
ALTER TABLE [dbo].[Teste_Criptografia] ENABLE TRIGGER [TGR_teste_cripto]
GO
--SHA2_512

--Altera��o de tamanho de dados em senha para suportar hash SHA2_512:

BEGIN TRAN
ALTER TABLE Teste_Criptografia ALTER COLUMN Senha VARCHAR(150);
COMMIT

--

INSERT INTO [dbo].[Teste_Criptografia]
			([Login],
			[Senha],
			[Nome],
			[CPF],
			[Endereco],
			[Genero]
			)
		VALUES
			('JENNY10M',
			'{*PSWD_123*}', --Encriptado por SHA2_256
			'Jennifer Isabela Carla Moraes',
			'64148360010',
			'Quadra 61, 436',
			'F'
			)
GO

SELECT * FROM Teste_Criptografia;

--Fim das inser��es para teste;


--------------------////////////---------------------


--Compara��o de hashes, basta alterar a senha '1234' por outra para testar os retornos de hashs poss�veis:

DECLARE @ds_senha VARCHAR(100) = 'Senha1234';
PRINT 'Senha..........' + @ds_senha
PRINT 'Hash md2..............' + CONVERT(VARCHAR(300), HASHBYTES('md2', @ds_senha), 2)
PRINT 'Hash md4..............' + CONVERT(VARCHAR(300), HASHBYTES('md4', @ds_senha), 2)
PRINT 'Hash md5..............' + CONVERT(VARCHAR(300), HASHBYTES('md5', @ds_senha), 2)
PRINT 'Hash sha1..............' + CONVERT(VARCHAR(300), HASHBYTES('sha1', @ds_senha), 2)
PRINT 'Hash sha2_256..............' + CONVERT(VARCHAR(300), HASHBYTES('sha2_256', @ds_senha), 2)
PRINT 'Hash sha2_512..............' + CONVERT(VARCHAR(300), HASHBYTES('sha2_512', CONVERT(VARCHAR(300), HASHBYTES('md5', @ds_senha), 2)), 2)
GO

--//Fim da compara��o