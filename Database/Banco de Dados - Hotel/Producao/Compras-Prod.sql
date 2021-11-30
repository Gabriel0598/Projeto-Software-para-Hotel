USE UniHotel_Producao
GO

CREATE TABLE Compras
(
CC_Compras TINYINT PRIMARY KEY NOT NULL,
--Comunicação:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),

--PEDIDO DE COMPRA:
Num_Pedido VARCHAR(30),
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