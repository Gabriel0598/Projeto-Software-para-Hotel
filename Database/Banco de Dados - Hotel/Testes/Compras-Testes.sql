USE UniHotel_Testes
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

INSERT INTO Compras

(Ramal_Principal
Email_Principal

Num_Pedido,
Emissao_Pedido,
Status_Pedido,
Cod_Fornec,
Fornecedor,
Cod_Item, --Dados do material no almoxarifado
Descricao,
Unid_Medida,
Qt_Itens,
Peso_Unidade,
Peso_Total,
Valor_Bruto,
Desconto,
Valor_Liquido,
Dt_Entrega,
Tipo_Frete,
Frete,
Seguro,
Cond_Pagamento,
Parcelas,
Valor_Parcela,
)

VALUES

('',
'compras@unihotel.com.br',

'NP20213864729'
'2021-11-10',
'1',
'324100', -- COD FORNECEDOR ((Tabela))
'Caleb Distribuidora de Limpeza Ltda', -- FORNECEDOR , não há necessidade do nome do fornecedor uma vez que o cod_fornecedor já exista na tabela
'3', -- COD ITEM ?? codigo na tabela ou ficticio 
'Caled Limpeza e Higiene - Detergente Líquido Clear Ypê 500ml CX 24',
'1',
'2',
'14400',
'28800',
'88,80',
'7,30',
'81,50',
'2021-11-13',
'CIF',
'00,00',
'12',
'Cartão Débito',
'1',
'81,50')

-- 2

INSERT INTO Compras

(Ramal_Principal
Email_Principal

Num_Pedido,
Emissao_Pedido,
Status_Pedido,
Cod_Fornec,
Fornecedor,
Cod_Item, --Dados do material no almoxarifado
Descricao,
Unid_Medida,
Qt_Itens,
Peso_Unidade,
Peso_Total,
Valor_Bruto,
Desconto,
Valor_Liquido,
Dt_Entrega,
Tipo_Frete,
Frete,
Seguro,
Cond_Pagamento,
Parcelas,
Valor_Parcela,
)

VALUES

('',
'compras@unihotel.com.br',

'FF20218753412'
'2021-09-09',
'1',
'12', -- COD FORNECEDOR
'34', -- FORNECEDOR , não há necessidade do nome do fornecedor uma vez que o cod_fornecedor já exista na tabela
'53', -- COD ITEM ?? codigo na tabela ou ficticio 
'Caled Limpeza e Higiene - Papel Higiênico 30m Folha Simples Branco PT 4 RL Golden',
'12',
'64',
'600',
'38400',
'246,40',
'20,00',
'226,40',
'2021-09-11',
'CIF',
'00,00',
'34',
'Cartão',
'1',
'226,40')

SELECT * FROM Compras;