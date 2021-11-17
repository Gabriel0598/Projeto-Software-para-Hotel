USE UniHotel_Testes
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
CVV1 SMALLINT, --Código de verificação
Tipo2 VARCHAR(10),
Banco_Adm2 VARCHAR(30),
Bandeira2 VARCHAR(20),
Num_Cartao2 BIGINT,
Dt_Validade2 DATE,
CVV2 SMALLINT,
Tipo3 VARCHAR(10),
Banco_Adm3 VARCHAR(30),
Bandeira3 VARCHAR(20),
Num_Cartao3 BIGINT,
Dt_Validade3 DATE,
CVV3 SMALLINT,
)

SELECT * FROM Dados_Financeiros_Clientes;