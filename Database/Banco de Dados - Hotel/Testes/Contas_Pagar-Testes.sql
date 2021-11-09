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