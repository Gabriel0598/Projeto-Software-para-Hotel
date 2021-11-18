USE UniHotel_Desenvolvimento
GO

CREATE TABLE Users_Funcionarios
(
ID_User INT IDENTITY(1,1) PRIMARY KEY,
UserName VARCHAR(12) NOT NULL,
Senha VARCHAR(50) NOT NULL,
Matricula VARCHAR(10) NOT NULL,
Cod_Login INT,
CONSTRAINT fk_FuncLogin FOREIGN KEY (Cod_Login) REFERENCES Funcionarios(Cod_Funcionario)
)

SELECT * FROM Users_Funcionarios;

INSERT INTO Users_Funcionarios(UserName, Senha, Matricula)
VALUES('TESTE12', 'senha1234', 'F3150R5');

SELECT * FROM Users_Funcionarios;

--//////////////

--Com criptografia:

BEGIN TRANSACTION

--Convertendo tipo para alocar espaço para a Hash:
ALTER TABLE [dbo].[Users_Funcionarios] ALTER COLUMN Senha VARCHAR(64) NOT NULL;
--///////////////////

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Preparar hash:
ALTER TABLE [dbo].[Users_Funcionarios] ALTER COLUMN Senha VARCHAR(64);

--Criação de trigger para efetivar criptografia:
CREATE TRIGGER TGR_Users_Funcionarios
ON [dbo].[Users_Funcionarios]
FOR INSERT
AS
BEGIN
	DECLARE
	@criptoSenha AS VARCHAR(MAX),
	@id AS INT

	SELECT @criptoSenha = Senha, @id = ID_User FROM INSERTED
	SET @criptoSenha = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoSenha), 2) -- SHA2_256 para criptografia geral
	UPDATE [dbo].[Users_Funcionarios] SET Senha = @criptoSenha WHERE ID_User = @id
END
GO

--Ao longo dos testes foi criada e apagada diversas vezes esta trigger para alterar o tipo de hash (MD2, MD4, MD5, SHA1, SHA2_256, SHA2_512)

--Habilitaçãoo da trigger:
ALTER TABLE [dbo].[Users_Funcionarios] ENABLE TRIGGER [TGR_Users_Funcionarios]
GO

--/////////////////////

INSERT INTO Users_Funcionarios(UserName, Senha, Matricula)
VALUES('KAMILLYF55',')C#Za5gn^#','FG3470');

INSERT INTO Users_Funcionarios(UserName, Senha, Matricula)
VALUES('ENRICO44','0wsaDfWc','FG5538');

SELECT * FROM Users_Funcionarios;

COMMIT

--Fim da definição de criptografia

BEGIN TRAN

--Alteração de nome da constraint para adequar a necessidade:
EXEC sp_rename 'Users_Funcionarios.Cod_Login', 'Cod_Funcionario', 'COLUMN'; --Renomeada coluna para adequação

SELECT * FROM Users_Funcionarios;

COMMIT