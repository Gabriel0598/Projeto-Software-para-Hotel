USE UniHotel_Producao
GO

CREATE TABLE Contas_Receber
(
CC_Contas_Receber TINYINT PRIMARY KEY NOT NULL,
--Comunica��o:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),
--Dados de pagamentos:
Ordem_Recebimento INT,
CC_Origem TINYINT,
Natureza_Cred VARCHAR(50),
Descricao_Cred VARCHAR(1000),
Observacao_Cred VARCHAR(500),
Tipo_Doc VARCHAR(30), --Boleto/ Transfer�ncia/ etc
Num_Doc BIGINT, --Num NF/ Boleto/ etc
Dt_Vencto DATE, --Data prevista para recebimento
Cod_Pagador INT, --Benefici�rio
Nome_Razao_Social VARCHAR(100),
Valor_Bruto DECIMAL(12,2),
Tributos DECIMAL(12,2),
Valor_Liquido DECIMAL(12,2),
Despesa BIGINT, --Classifica��o cont�bil
Cod_Compens TINYINT, --C�digo de compensacao bancaria
Banco VARCHAR(50),
Dt_Liquidacao DATE --Data da efetiva compensa��o do recebimento
)

SELECT * FROM Contas_Receber;