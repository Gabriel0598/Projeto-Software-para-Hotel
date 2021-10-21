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