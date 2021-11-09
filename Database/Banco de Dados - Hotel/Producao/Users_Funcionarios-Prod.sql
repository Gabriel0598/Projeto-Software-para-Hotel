USE UniHotel_Producao
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