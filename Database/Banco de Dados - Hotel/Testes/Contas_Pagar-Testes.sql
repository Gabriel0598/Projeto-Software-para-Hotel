USE UniHotel_Testes
GO

CREATE TABLE Contas_Pagar
(
CC_Contas_Pagar TINYINT PRIMARY KEY NOT NULL,
--Comunicação:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),
--Dados de pagamentos:
Ordem_Pgto INT,
CC_Origem TINYINT,
Natureza_Pgto VARCHAR(50),
Descricao_Pgto VARCHAR(1000),
Observacao_Pgto VARCHAR(500),
Dt_Vencto DATE, --Data prevista para pgto
Cod_Benef INT, --Beneficiário
Razao_Social VARCHAR(50),
Valor_Bruto DECIMAL(12,2),
Tributos DECIMAL(12,2),
Valor_Liquido DECIMAL(12,2),
Despesa BIGINT, --Classificação contábil
Tipo_Pgto VARCHAR(30),
Cod_Compens TINYINT, --Código de compensacao bancaria
Banco VARCHAR(50),
Dt_Liquidacao DATE --Data da efetiva compensação do pgto
)

SELECT * FROM Contas_Pagar;


INSERT INTO Contas_Pagar

( Ramal_Principal,
Email_Principal,

Ordem_Pgto,
CC_Origem,
Natureza_Pgto,
Descricao_Pgto,
Observacao_Pgto,
Dt_Vencto, --Data prevista para pgto
Cod_Benef, --Beneficiário
Razao_Social,
Valor_Bruto,
Tributos,
Valor_Liquido,
Despesa, --Classificação contábil
Tipo_Pgto,
Cod_Compens, --Código de compensacao bancaria
Banco,
Dt_Liquidacao --Data da efetiva compensação do pgto
)



VALUES

(
'',
'financeiro@unihotel.com.br',

'056210',
'1021843-2',
'12',
'Contas a Pagar Caled Limpeza e Higiene'
'2 Unidades de Detergente Líquido Clear Ypê 500ml CX 24',
'2021-11-15',
'356',
'Caleb Distribuidora de Limpeza Ltda',
'81,50',
'45',
'81,50',
'23',
'Cartão Crédito',
'422'
'Banco Safra S.A.',
'2021-11-18'
)

-- 2

INSERT INTO Contas_Pagar

( 
Ramal_Principal,
Email_Principal,

Ordem_Pgto,
CC_Origem,
Natureza_Pgto,
Descricao_Pgto,
Observacao_Pgto,
Dt_Vencto, --Data prevista para pgto
Cod_Benef, --Beneficiário
Razao_Social,
Valor_Bruto,
Tributos,
Valor_Liquido,
Despesa, --Classificação contábil
Tipo_Pgto,
Cod_Compens, --Código de compensacao bancaria
Banco,
Dt_Liquidacao --Data da efetiva compensação do pgto
)

VALUES

'123',
'financeiro@unihotel.com.br',

'152132',
'1021843-2',
'434',
'Contas a Pagar Caled Limpeza e Higiene'
'36 unidades Papel Higiênico 30m Folha Simples Branco PT 4 RL Golden',
'2021-09-15',
'3245',
'Caleb Distribuidora de Limpeza Ltda', 
'226,40',
'242',
'226,40',
'122',
'Cartão Crédito',
'422'
'Banco Safra S.A.',
'2021-09-18'
)

SELECT * FROM Contas_Pagar;