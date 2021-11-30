USE UniHotel_Testes
GO

CREATE TABLE Contabilidade
(
CC_Contabil TINYINT PRIMARY KEY NOT NULL,
--Comunica��o:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),

--CONTA CONT�BIL:
Cod_CC BIGINT, --Codigo da conta cont�bil
Descr_CC VARCHAR(50),
Status_CC BIT, --Ativa ou inativa

--LIVRO RAZ�O (Lan�amentos):
Cod_OP BIGINT, --C�digo da opera��o
Dt_OP DATE,
Tipo_Doc_OP VARCHAR(15),
Doc_OP BIGINT,
Historico VARCHAR(100),
Debito DECIMAL(12,2),
Credito DECIMAL(12,2),
Saldo DECIMAL(12,2),
)

SELECT * FROM Contabilidade;

INSERT INTO Contabilidade
(
Ramal_Principal,
Email_Principal,

Cod_CC, --Codigo da conta cont�bil
Descr_CC,
Status_CC, --Ativa ou inativa

--LIVRO RAZ�O (Lan�amentos):
Cod_OP, --C�digo da opera��o
Dt_OP,
Tipo_Doc_OP,
Doc_OP,
Historico,
Debito,
Saldo
)

VALUES 

(
'530',
'contabilidade@unihotel.com.br',

'749381026',
'Ativo Intangivel',
'1',

'241120021',
'24-11-2021',
'Nota Fiscal',
'000.004',
'Renova��o Adobe photoshop assinatura 1 ano',
'1000,00',
'750350000.20'
)

SELECT * FROM Contabilidade;