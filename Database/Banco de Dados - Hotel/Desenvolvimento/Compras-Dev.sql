USE UniHotel_Desenvolvimento
GO

CREATE TABLE Compras
(
CC_Compras TINYINT NOT NULL,
--Comunicação:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),

--PEDIDO DE COMPRA:
Num_Pedido VARCHAR(30) PRIMARY KEY, --RecebeFK
Emissao_Pedido DATE,
Status_Pedido BIT, --Aprovado ou negado pelo gestor
Cod_Fornec INT,
Fornecedor VARCHAR(50),
Cod_Item VARCHAR(30), --Dados do material no almoxarifado
Descricao VARCHAR(50),
Unid_Medida VARCHAR(10),
Qt_Itens DECIMAL(8,2),
Peso_Unidade DECIMAL(8,2),
Peso_Total DECIMAL(8,2),
Valor_Bruto DECIMAL(12,2),
Desconto DECIMAL(3,1),
Valor_Liquido DECIMAL(12,2),
Dt_Entrega DATE,
Tipo_Frete CHAR(3), --FOB ou CIF
Frete DECIMAL(12,2),
Seguro DECIMAL(12,2),
Cond_Pagamento VARCHAR(30),
Parcelas TINYINT,
Valor_Parcela DECIMAL(12,2),
)

SELECT * FROM Compras;

BEGIN TRAN

ALTER TABLE Compras DROP COLUMN Ramal_Principal;
ALTER TABLE Compras DROP COLUMN Email_Principal;

COMMIT

ALTER TABLE [dbo].[Compras] ALTER COLUMN Cod_Fornec BIGINT;

--FK retorna registro do fornecedor:
ALTER TABLE [dbo].[Compras] ALTER COLUMN Cod_Fornec BIGINT;
ALTER TABLE Compras ADD CONSTRAINT FK_CNPJ_Forn FOREIGN KEY (Cod_Fornec) REFERENCES Fornecedores_Hotel(CNPJ);