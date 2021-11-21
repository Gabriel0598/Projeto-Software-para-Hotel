USE UniHotel_Desenvolvimento
GO

CREATE TABLE Dados_Financeiros_Clientes
(
ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
--IDENTIFICAÇÃO:
Nome_Completo VARCHAR(100) NOT NULL,
CPF BIGINT,
Num_Passaporte VARCHAR(15),
--DADOS DE CARTÕES:
Tipo1 VARCHAR(10), --Débito ou crédito
Banco_Adm1 VARCHAR(30), --Administradora do cartão
Bandeira1 VARCHAR(20),
Num_Cartao1 BIGINT,
Dt_Validade1 DATE,
CVV1 TINYINT, --Código de verificação
Tipo2 VARCHAR(10),
Banco_Adm2 VARCHAR(30),
Bandeira2 VARCHAR(20),
Num_Cartao2 BIGINT,
Dt_Validade2 DATE,
CVV2 TINYINT,
Tipo3 VARCHAR(10),
Banco_Adm3 VARCHAR(30),
Bandeira3 VARCHAR(20),
Num_Cartao3 BIGINT,
Dt_Validade3 DATE,
CVV3 TINYINT,
)

SELECT * FROM Dados_Financeiros_Clientes;

BEGIN TRANSACTION

SELECT * FROM Dados_Financeiros_Clientes;

SELECT
	FORMAT (GETDATE(), 'MM-yyyy') Dt_Validade1;
ROLLBACK

BEGIN TRANSACTION

ALTER TABLE Dados_Financeiros_Clientes
ALTER COLUMN CVV1 SMALLINT

COMMIT

BEGIN TRANSACTION

ALTER TABLE Dados_Financeiros_Clientes
ALTER COLUMN CVV2 SMALLINT

ALTER TABLE Dados_Financeiros_Clientes
ALTER COLUMN CVV3 SMALLINT

COMMIT

INSERT INTO Dados_Financeiros_Clientes(Nome_Completo, CPF, Tipo1, Banco_Adm1, Bandeira1, Num_Cartao1, Dt_Validade1, CVV1)
VALUES ('Calebe Iago Julio Lopes', 06452210408, 'Crédito', 'Itaú', 'American Express', 376413808900378, '18/06/2022', 216);

INSERT INTO Dados_Financeiros_Clientes(Nome_Completo, CPF, Tipo1, Banco_Adm1, Bandeira1, Num_Cartao1, Dt_Validade1, CVV1)
VALUES ('Martin Lorenzo Gonçalves', 11150550899, 'Crédito', 'Bradesco', 'American Express', 344355243113803, '18/09/2022', 4717);

INSERT INTO Dados_Financeiros_Clientes(Nome_Completo, CPF, Tipo1, Banco_Adm1, Bandeira1, Num_Cartao1, Dt_Validade1, CVV1)
VALUES ('Geraldo Carlos Benício da Mata', 19476838027, 'Crédito', 'Santander', 'MasterCard', 5295176148913156, '18/09/2023', 825);

BEGIN TRANSACTION

SELECT
	FORMAT (GETDATE(), 'MM-yyyy') Dt_Validade1;

SELECT * FROM Dados_Financeiros_Clientes;
ROLLBACK;

INSERT INTO Dados_Financeiros_Clientes(Nome_Completo, Num_Passaporte, Tipo1, Banco_Adm1, Bandeira1, Num_Cartao1, Dt_Validade1, CVV1)
VALUES ('Pierre Taurant', '05CK02237', 'Crédito', 'Société Générale', 'Visa', 4485751055098192, '18/01/2023', 932);

SELECT * FROM Dados_Financeiros_Clientes;

BEGIN TRAN

EXEC sp_help Dados_Financeiros_Clientes;

EXEC sp_rename
	'Dados_Financeiros_Clientes.ID_Cartoes',
	'ID_Cartao',
	'COLUMN';
GO

--ID_Cartão como PRIMARY KEY;

SELECT * FROM Dados_Financeiros_Clientes;

COMMIT

BEGIN TRAN

ALTER TABLE Dados_Financeiros_Clientes DROP COLUMN Nome_Completo;
ALTER TABLE Dados_Financeiros_Clientes DROP COLUMN Cod_Cliente;

UPDATE Dados_Financeiros_Clientes SET Num_Passaporte = '1' WHERE Nome_Completo = 'Pierre Taurant';

SELECT * FROM Dados_Financeiros_Clientes;

ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ALTER COLUMN Num_Passaporte INT;

COMMIT

EXEC sp_rename
	'Dados_Financeiros_Clientes.Num_Passaporte',
	'Cod_Cliente',
	'COLUMN';
GO

SELECT * FROM Dados_Financeiros_Clientes;

--Chave estrangeira para receber dados de cliente:
ALTER TABLE Dados_Financeiros_Clientes ADD CONSTRAINT FK_Cod_Cliente FOREIGN KEY (Cod_Cliente) REFERENCES Clientes (Cod_Cliente);

--Convertendo tipo para alocar espaço para a Hash:
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ALTER COLUMN Num_Cartao1 VARCHAR(64);
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ALTER COLUMN CVV1 VARCHAR(64);
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ALTER COLUMN Num_Cartao2 VARCHAR(64);
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ALTER COLUMN CVV2 VARCHAR(64);
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ALTER COLUMN Num_Cartao3 VARCHAR(64);
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ALTER COLUMN CVV3 VARCHAR(64);

--///////////////////

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

BEGIN TRAN

--Trigger para efetivar criptografia:
CREATE TRIGGER TGR_Cartoes
ON [dbo].[Dados_Financeiros_Clientes]
FOR INSERT
AS
BEGIN
	DECLARE
	@criptoCartao1 AS VARCHAR(MAX),
	@criptoCVV1 AS VARCHAR(MAX),
	@criptoCartao2 AS VARCHAR(MAX),
	@criptoCVV2 AS VARCHAR(MAX),
	@criptoCartao3 AS VARCHAR(MAX),
	@criptoCVV3 AS VARCHAR(MAX),
	@id AS INT

	SELECT @id = ID_Cartao, @criptoCartao1 = Num_Cartao1,
	@criptoCVV1 = CVV1, @criptoCartao2 = Num_Cartao2,
	@criptoCVV2 = CVV2, @criptoCartao3 = Num_Cartao3,
	@criptoCVV3 = CVV3 FROM INSERTED

	SET @criptoCartao1 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCartao1), 2);
	SET @criptoCVV1 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCVV1), 2);
	SET @criptoCartao2 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCartao2), 2);
	SET @criptoCVV2 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCVV2), 2);
	SET @criptoCartao3 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCartao3), 2);
	SET @criptoCVV3 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCVV3), 2);
	-- SHA2_256 para criptografia geral
	
	UPDATE [dbo].[Dados_Financeiros_Clientes] SET
	Num_Cartao1 = @criptoCartao1, CVV1 = @criptoCVV1,
	Num_Cartao2 = @criptoCartao2, CVV2 = @criptoCVV2,
	Num_Cartao3 = @criptoCartao3, CVV3 = @criptoCVV3 WHERE ID_Cartao = @id
END
GO

-------------------------////////////////////////////////----------------------------

--Habilitaçãoo da trigger:
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] ENABLE TRIGGER [TGR_Cartoes]
GO

SELECT * FROM Dados_Financeiros_Clientes;

COMMIT

INSERT INTO Dados_Financeiros_Clientes(Tipo1, Banco_Adm1, Bandeira1, Num_Cartao1, Dt_Validade1, CVV1,
Tipo2, Banco_Adm2, Bandeira2, Num_Cartao2, Dt_Validade2, CVV2, Tipo3, Banco_Adm3, Bandeira3, Num_Cartao3, Dt_Validade3, CVV3)
VALUES ('Crédito', 'CitiBank', 'MasterCard', '5591882422861224', '2022/08/18', '825',
'Crédito', 'Safra', 'MasterCard', '5365806934713973', '2023/11/18', '775',
'Crédito', 'Banco do Brasil', 'Visa', '4929188439059885', '2025/05/03', '328');

SELECT * FROM Dados_Financeiros_Clientes;