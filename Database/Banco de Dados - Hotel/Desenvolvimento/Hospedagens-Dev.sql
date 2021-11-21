USE UniHotel_Desenvolvimento
GO

CREATE TABLE Hospedagens
(
--DADOS DOS HÓSPEDE E ACOMPANHANTES:
Cod_Reserva INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Cod_Cliente INT FOREIGN KEY REFERENCES Clientes(Cod_Cliente), --Fk para trazer dados de cliente
Nome_Hospede VARCHAR(100) NOT NULL,
CPF_Hospede BIGINT,
Passaporte_Hospede VARCHAR(15),

--DADOS DA RESERVA:
Mat_Func_Reserva VARCHAR(10),
Num_Ap VARCHAR(5) NOT NULL,
Dt_Reserva DATETIME NOT NULL,

ID_Checkin VARCHAR(10),
Dt_Entrada DATETIME,
Mat_Func_Checkin VARCHAR(10),
ID_Checkout VARCHAR(10),
Dt_Saida DATETIME,
Mat_Func_Checkout VARCHAR(10),

--NFS:
Num_NFS BIGINT NOT NULL,
Cod_Verif VARCHAR(10),
Dt_Hora_Emissao DATETIME NOT NULL,
CNPJ_Prestador BIGINT NOT NULL,
Razao_Social VARCHAR(50) NOT NULL,
CPF_Tomador BIGINT,
Nome_Tomador VARCHAR(100) NOT NULL,
Valor_Total DECIMAL(8,2) NOT NULL,
Valor_ISS DECIMAL(8,2),
Observacoes VARCHAR(100),

--PAGAMENTO:
Tipo_Pgto VARCHAR(20) NOT NULL,
Dt_Pgto DATE,
Quant_Parc TINYINT,
Valor_Parc DECIMAL(8,2),
Valor_Pgto DECIMAL(8,2) NOT NULL,

-- ACOMPANHANTES:
Acompanhante1 VARCHAR(100),
CPF_Acomp1 BIGINT,
Passap_Acomp1 VARCHAR(15),

Acompanhante2 VARCHAR(100),
CPF_Acomp2 BIGINT,
Passap_Acomp2 VARCHAR(15),

Acompanhante3 VARCHAR(100),
CPF_Acomp3 BIGINT,
Passap_Acomp3 VARCHAR(15),

Acompanhante4 VARCHAR(100),
CPF_Acomp4 BIGINT,
Passap_Acomp4 VARCHAR(15),

Acompanhante5 VARCHAR(100),
CPF_Acomp5 BIGINT,
Passap_Acomp5 VARCHAR(15),
)

SELECT * FROM Hospedagens;

--//////////////

--Convertendo tipo para alocar espaço para a Hash:
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN CPF_Hospede VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN Passaporte_Hospede VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN CPF_Tomador VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN CPF_Acomp1 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN Passap_Acomp1 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN CPF_Acomp2 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN Passap_Acomp2 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN CPF_Acomp3 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN Passap_Acomp3 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN CPF_Acomp4 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN Passap_Acomp4 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN CPF_Acomp5 VARCHAR(64);
ALTER TABLE [dbo].[Hospedagens] ALTER COLUMN Passap_Acomp5 VARCHAR(64);

--///////////////////

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

BEGIN TRAN

--Trigger para efetivar criptografia:
CREATE TRIGGER TGR_Hospedagens
ON [dbo].[Hospedagens]
FOR INSERT
AS
BEGIN
	DECLARE
	@criptoCPF_Hospede AS VARCHAR(MAX),
	@criptoPassaporte_Hospede AS VARCHAR(MAX),
	@criptoCPF_Tomador AS VARCHAR(MAX),
	@criptoCPF_Acomp1 AS VARCHAR(MAX),
	@criptoPassap_Acomp1 AS VARCHAR(MAX),
	@criptoCPF_Acomp2 AS VARCHAR(MAX),
	@criptoPassap_Acomp2 AS VARCHAR(MAX),
	@criptoCPF_Acomp3 AS VARCHAR(MAX),
	@criptoPassap_Acomp3 AS VARCHAR(MAX),
	@criptoCPF_Acomp4 AS VARCHAR(MAX),
	@criptoPassap_Acomp4 AS VARCHAR(MAX),
	@criptoCPF_Acomp5 AS VARCHAR(MAX),
	@criptoPassap_Acomp5 AS VARCHAR(MAX),
	@id AS INT

	SELECT @id = Cod_Reserva, @criptoCPF_Hospede = CPF_Hospede,
	@criptoPassaporte_Hospede = Passaporte_Hospede, @criptoCPF_Tomador = CPF_Tomador,
	@criptoCPF_Acomp1 = CPF_Acomp1, @criptoPassap_Acomp1 = Passap_Acomp1,
	@criptoCPF_Acomp2 = CPF_Acomp2, @criptoPassap_Acomp2 = Passap_Acomp2,
	@criptoCPF_Acomp3 = CPF_Acomp3, @criptoPassap_Acomp3 = Passap_Acomp3,
	@criptoCPF_Acomp4 = CPF_Acomp4, @criptoPassap_Acomp4 = Passap_Acomp4,
	@criptoCPF_Acomp5 = CPF_Acomp5, @criptoPassap_Acomp5 = Passap_Acomp5 FROM INSERTED

	SET @criptoCPF_Hospede = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Hospede), 2);
	SET @criptoPassaporte_Hospede = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPassaporte_Hospede), 2);
	SET @criptoCPF_Tomador = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Tomador), 2);
	SET @criptoCPF_Acomp1 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Acomp1), 2);
	SET @criptoPassap_Acomp1 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPassap_Acomp1), 2);
	SET @criptoCPF_Acomp2 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Acomp2), 2);
	SET @criptoPassap_Acomp2 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPassap_Acomp2), 2);
	SET @criptoCPF_Acomp3 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Acomp3), 2);
	SET @criptoPassap_Acomp3 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPassap_Acomp3), 2);
	SET @criptoCPF_Acomp4 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Acomp4), 2);
	SET @criptoPassap_Acomp4 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPassap_Acomp4), 2);
	SET @criptoCPF_Acomp5 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Acomp5), 2);
	SET @criptoPassap_Acomp5 = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPassap_Acomp5), 2);
	-- SHA2_256 para criptografia geral
	
	UPDATE [dbo].[Hospedagens] SET CPF_Hospede = @criptoCPF_Hospede,
	Passaporte_Hospede = @criptoPassaporte_Hospede, CPF_Tomador = @criptoCPF_Tomador,
	CPF_Acomp1 = @criptoCPF_Acomp1, Passap_Acomp1 = @criptoPassap_Acomp1,
	CPF_Acomp2 = @criptoCPF_Acomp2, Passap_Acomp2 = @criptoPassap_Acomp2,
	CPF_Acomp3 = @criptoCPF_Acomp3, Passap_Acomp3 = @criptoPassap_Acomp3,
	CPF_Acomp4 = @criptoCPF_Acomp4, Passap_Acomp4 = @criptoPassap_Acomp4,
	CPF_Acomp5 = @criptoCPF_Acomp5, Passap_Acomp5 = @criptoPassap_Acomp5 WHERE Cod_Reserva = @id
END
GO

-------------------------////////////////////////////////----------------------------

--Habilitaçãoo da trigger:
ALTER TABLE [dbo].[Hospedagens] ENABLE TRIGGER [TGR_Hospedagens]
GO

--Teste:

INSERT INTO Hospedagens(Nome_Hospede, CPF_Hospede, Passaporte_Hospede, Num_Ap, Dt_Reserva, Num_NFS, Cod_Verif, Dt_Hora_Emissao,
CNPJ_Prestador, Razao_Social, CPF_Tomador, Nome_Tomador, Valor_Total, Tipo_Pgto, Valor_Pgto,
Acompanhante1, CPF_Acomp1, Passap_Acomp1, Acompanhante2, CPF_Acomp2, Passap_Acomp2, Acompanhante3, CPF_Acomp3, Passap_Acomp3,
Acompanhante4, CPF_Acomp4, Passap_Acomp4, Acompanhante5, CPF_Acomp5, Passap_Acomp5)
VALUES('Renata Yasmin dos Santos', 26176355893, '47433215429', 12, '20211117', 3456, 'EX43B6', '20211117 10:50:01 AM', 37341013000134,
'UniHotel Serviços Hoteleiros LTDA', 26176355893, 'Renata Yasmin dos Santos', 600.00, 'Credito', 600.00,
'Camila Manuela Alves', 61801320381, '64710443103', 'Sara Eliane Beatriz Galvão', 71342369513, '93564281980', 'Alícia Bianca Caldeira', 59078034440, '12567826160', 'Rafael Leonardo Monteiro',
11505681600, '80045202345', 'Murilo Caleb Anderson Costa', 57024778636, '62246182166');

SELECT * FROM Hospedagens;

COMMIT

SELECT * FROM Hospedagens;