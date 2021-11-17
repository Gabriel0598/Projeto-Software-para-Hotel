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