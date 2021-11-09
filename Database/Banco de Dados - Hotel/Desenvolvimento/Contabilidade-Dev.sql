USE UniHotel_Desenvolvimento
GO

CREATE TABLE Contabilidade
(
Centro_Custo TINYINT PRIMARY KEY NOT NULL,
--Comunicação:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),

--CONTA CONTÁBIL:
Cod_CC BIGINT, --Codigo da conta contábil
Descr_CC VARCHAR(50),
Status_CC BIT, --Ativa ou inativa

--LIVRO RAZÃO (Lançamentos):
Cod_OP BIGINT, --Código da operação
Dt_OP DATE,
Tipo_Doc_OP VARCHAR(15),
Doc_OP BIGINT,
Historico VARCHAR(100),
Debito DECIMAL(12,2),
Credito DECIMAL(12,2),
Saldo DECIMAL(12,2),
)

SELECT * FROM Contabilidade;
--Alteração de nome da PK (através de stored procedure) para melhor identificação externa:
EXEC sp_rename
		'Contabilidade.Centro_Custo',
		'CC_Contabil', --Centro de custo da contabilidade
		'COLUMN'

SELECT * FROM Contabilidade;