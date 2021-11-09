USE UniHotel_Producao
GO

CREATE TABLE Users_Clientes
(
ID_User INT IDENTITY(1,1) PRIMARY KEY,
UserName VARCHAR(12) NOT NULL,
Email_Login VARCHAR(100) NOT NULL,
Senha VARCHAR(50) NOT NULL,
Cod_Login INT,
CONSTRAINT fk_ClienteLogin FOREIGN KEY (Cod_Login) REFERENCES Clientes(Cod_Cliente)
)

SELECT * FROM Users_Clientes;