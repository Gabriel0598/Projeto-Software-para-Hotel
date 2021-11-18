USE UniHotel_Desenvolvimento
GO

CREATE TABLE Contas_Receber
(
CC_Contas_Receber TINYINT,

--Dados de pagamentos:
Ordem_Recebimento INT PRIMARY KEY,
ID_Reserva INT, --Recebe FK de Hospedagens
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

BEGIN TRAN

DROP TABLE Contas_Receber;

COMMIT

ALTER TABLE Contas_Receber ADD CONSTRAINT FK_ID_Reserva FOREIGN KEY (ID_Reserva) REFERENCES Hospedagens(Cod_Reserva);