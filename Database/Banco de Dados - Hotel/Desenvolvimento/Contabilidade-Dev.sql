USE UniHotel_Desenvolvimento
GO

CREATE TABLE Contabilidade
(
Centro_Custo TINYINT PRIMARY KEY NOT NULL,
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
--Altera��o de nome da PK (atrav�s de stored procedure) para melhor identifica��o externa:
EXEC sp_rename
		'Contabilidade.Centro_Custo',
		'CC_Contabil', --Centro de custo da contabilidade
		'COLUMN'

SELECT * FROM Contabilidade;

BEGIN TRAN

ALTER TABLE Contabilidade DROP COLUMN Ramal_Principal;
ALTER TABLE Contabilidade DROP COLUMN Email_Principal;

COMMIT

--Tratamento para receber dados da reserva:
ALTER TABLE [dbo].[Contabilidade] ALTER COLUMN Cod_OP INT;

--FK retorna reserva registrada:
ALTER TABLE Contabilidade ADD CONSTRAINT FK_Cod_Reserva FOREIGN KEY (Cod_OP) REFERENCES Hospedagens(Cod_Reserva);
--C�digo da opera��o retorna reserva

--Tratamento para receber dados de compras:
EXEC sp_rename 'Contabilidade.Status_CC', 'Pedido_Compra', 'COLUMN';
EXEC sp_rename 'Contabilidade.Cod_OP', 'Reserva_Hospedagem', 'COLUMN';

ALTER TABLE [dbo].[Contabilidade] ALTER COLUMN Pedido_Compra VARCHAR(30);

--FK retorna compra registrada:
ALTER TABLE Contabilidade ADD CONSTRAINT FK_ID_PedidoCompra FOREIGN KEY (Pedido_Compra) REFERENCES Compras(Num_Pedido);
--C�digo da opera��o retorna pedido de compra