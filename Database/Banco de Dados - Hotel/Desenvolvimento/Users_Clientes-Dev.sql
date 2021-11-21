USE UniHotel_Desenvolvimento
GO

CREATE TABLE Usuarios_Clientes
(
ID_User INT IDENTITY(1,1) PRIMARY KEY,
UserName VARCHAR(12) NOT NULL,
Email_Login VARCHAR(100) NOT NULL,
Senha VARCHAR(50) NOT NULL,
Cod_Login INT,
CONSTRAINT fk_ClienteLogin FOREIGN KEY (Cod_Login) REFERENCES Clientes(Cod_Cliente)
)

SELECT * FROM Usuarios_Clientes;

INSERT INTO Usuarios_Clientes(UserName, Email_Login, Senha)
VALUES('TESTE1', 'teste1@gmail.com', 'senha1234');

SELECT * FROM Usuarios_Clientes;

BEGIN TRAN
EXEC sp_rename
	'Usuarios_Clientes',
	'Users_Clientes';

SELECT * FROM Users_Clientes;
COMMIT

--//////////////

BEGIN TRANSACTION

--Convertendo tipo para alocar espaço para a Hash:
ALTER TABLE [dbo].[Users_Clientes] ALTER COLUMN Senha VARCHAR(64) NOT NULL;
--///////////////////

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Preparar para hash:
ALTER TABLE [dbo].[Users_Clientes] ALTER COLUMN Senha VARCHAR(64) NOT NULL;

--Trigger para efetivar criptografia:
CREATE TRIGGER TGR_Users_Clientes
ON [dbo].[Users_Clientes]
FOR INSERT
AS
BEGIN
	DECLARE
	@criptoSenha AS VARCHAR(MAX),
	@id AS INT

	SELECT @criptoSenha = Senha, @id = ID_User FROM INSERTED
	SET @criptoSenha = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoSenha), 2) -- SHA2_256 para criptografia geral
	UPDATE [dbo].[Users_Clientes] SET Senha = @criptoSenha WHERE ID_User = @id
END
GO

--Ao longo dos testes foi criada e apagada diversas vezes esta trigger para alterar o tipo de hash (MD2, MD4, MD5, SHA1, SHA2_256, SHA2_512)

--Habilitaçãoo da trigger:
ALTER TABLE [dbo].[Users_Clientes] ENABLE TRIGGER [TGR_Users_Clientes]
GO

COMMIT

SELECT * FROM Users_Clientes;

BEGIN TRAN

EXEC sp_rename 'Users_Clientes.Cod_Login', 'Cod_Cliente', 'COLUMN';
SELECT * FROM Users_Clientes;

COMMIT

INSERT INTO Users_Clientes(UserName, Email_Login, Senha)
VALUES('JOAO123P', 'chblkmqtotsgbt@metalunits.com', 'E3cIm8DW');

SELECT * FROM Users_Clientes;