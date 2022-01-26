USE UniHotel_Desenvolvimento
GO

CREATE TABLE Contas_Pagar
(
CC_Contas_Pagar TINYINT,

--Dados de pagamentos:
Ordem_Pgto INT PRIMARY KEY,
Cod_PedidoCompra VARCHAR(30), ----Recebe FK do Pedido de Compra 
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

BEGIN TRAN

ALTER TABLE Contas_Pagar DROP COLUMN Ramal_Principal;
ALTER TABLE Contas_Pagar DROP COLUMN Email_Principal;

COMMIT

BEGIN TRAN

DROP TABLE Contas_Pagar;

COMMIT

ALTER TABLE Contas_Pagar ADD CONSTRAINT FK_Pgto_Compra FOREIGN KEY (Cod_PedidoCompra) REFERENCES Compras(Num_Pedido);