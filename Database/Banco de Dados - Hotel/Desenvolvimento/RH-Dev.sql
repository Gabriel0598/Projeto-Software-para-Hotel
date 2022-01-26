USE UniHotel_Desenvolvimento
GO

CREATE TABLE RH
(
Centro_Custo TINYINT,

Matricula INT IDENTITY(1,1) PRIMARY KEY NOT NULL, --Matricula recebida automaticamente por incremento
Cod_Funcionario INT NOT NULL, --Codigo que é recebido da tabela funcionários
Sit_Cadastral BIT NOT NULL, --Ativo ou inativo

--FK para receber dados da tabela funcionário:
CONSTRAINT FK_CodFuncionario FOREIGN KEY (Cod_Funcionario) REFERENCES Funcionarios(Cod_Funcionario),

--Comunicação:
Ramal SMALLINT,
Email VARCHAR(50),
Cargo VARCHAR(50),

--Datas:
Dt_Ingresso DATE,
Dt_Admissao DATE NOT NULL,
Dt_Deslig_Afast DATE
)

BEGIN TRAN

ALTER TABLE RH ADD Dt_Ingresso DATE, Dt_Admissao DATE NOT NULL, Dt_Deslig_Afast DATE;
SELECT * FROM RH;

COMMIT

SELECT * FROM RH;