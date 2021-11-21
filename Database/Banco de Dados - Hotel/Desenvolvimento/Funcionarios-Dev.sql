USE UniHotel_Desenvolvimento
GO

CREATE TABLE Funcionarios
(
--DADOS DE IDENTIFICAÇÃO:
Cod_Funcionario INT IDENTITY(1,1) PRIMARY KEY,
Sit_Cadastral BIT NOT NULL,
Nome_Completo VARCHAR(100) NOT NULL,
Data_Nasc DATE NOT NULL,
Genero VARCHAR(15),
Estado_Civil VARCHAR(10),

--DADOS DE CADASTRO:
Tipo_Contrato VARCHAR(15) NOT NULL,
Cargo VARCHAR(40) NOT NULL,
Nivel VARCHAR(30) NOT NULL,

--DADOS DE CONTATO:
DDI_Tel_Fixo TINYINT,
DDD_Tel_Fixo TINYINT,
Num_Tel_Fixo BIGINT,
DDI_Tel_Celular TINYINT NOT NULL,
DDD_Tel_Celular TINYINT,
Num_Tel_Celular BIGINT NOT NULL, --APENAS DDI e Num do Celular estão com NOT NULL devido a não haver obrigatoriedade de informar tel fixo, recado e comercial;
DDI_Tel_Recado TINYINT,
DDD_Tel_Recado TINYINT,
Num_Tel_Recado BIGINT,
Email_Principal VARCHAR(100) NOT NULL,
Email_Secundario VARCHAR(100),
Email_Corporativo VARCHAR(100) NOT NULL,

--DADOS DO ENDEREÇO:
Logradouro VARCHAR(50) NOT NULL,
Numero VARCHAR(10) NOT NULL,
Complemento VARCHAR(50),
Bairro_Regiao VARCHAR(30) NOT NULL,
Cidade VARCHAR(50) NOT NULL,
Cep_ZipCode VARCHAR(20) NOT NULL,
Estado_Provincia VARCHAR(30),
Pais VARCHAR(50) NOT NULL,

--DOCUMENTOS:
CPF BIGINT,
RG INT,
UF_RG CHAR(2),
RNE VARCHAR(10),
Val_RNE DATE,
Num_Passaporte VARCHAR(15),
Num_CTPS VARCHAR(15),
UF_CTPS CHAR(2),
PIS BIGINT,
Num_Titulo_Eleitor BIGINT,
UF_Titulo_Eleitor CHAR(2),
Num_Reservista INT,
RegistCivil_Mat BIGINT,
RegistCivil_UF CHAR(2),

--FORMAÇÃO ACADÊMICA:
Nivel_Formacao VARCHAR(30),
Situac_Formacao VARCHAR(10),
Curso VARCHAR(50),
Instituicao VARCHAR(100),
Dt_Ingresso DATE,

--CONTRATUAL:
Dt_Admissao DATE NOT NULL,
Dt_Deslig_Afast DATE,
)

SELECT * FROM Funcionarios;

ALTER TABLE Funcionarios
ADD Matricula VARCHAR(10);

SELECT * FROM Funcionarios;

ALTER TABLE Funcionarios ADD Ramal SMALLINT;

EXEC sp_rename 'Funcionarios.Matricula', 'Matricula_RH', 'COLUMN';

--Devido a falta de necessidade, retirada de colunas ramal e matricula_rh:
BEGIN TRAN

ALTER TABLE Funcionarios DROP COLUMN Matricula_RH;
ALTER TABLE Funcionarios DROP COLUMN Ramal;
ALTER TABLE Funcionarios DROP COLUMN Dt_Ingresso;
ALTER TABLE Funcionarios DROP COLUMN Dt_Admissao;
ALTER TABLE Funcionarios DROP COLUMN Dt_Deslig_Afast;
ALTER TABLE Funcionarios DROP COLUMN Sit_Cadastral;

SELECT * FROM Funcionarios;

COMMIT

--//////////

--Convertendo tipo para alocar espaço para a Hash:
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Num_Tel_Fixo VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Num_Tel_Celular VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Num_Tel_Recado VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Email_Principal VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Email_Secundario VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Email_Corporativo VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN CPF VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN RG VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN RNE VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Num_Passaporte VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Num_CTPS VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN PIS VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Num_Titulo_Eleitor VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN Num_Reservista VARCHAR(64);
ALTER TABLE [dbo].[Funcionarios] ALTER COLUMN RegistCivil_Mat VARCHAR(64);

--///////////////////

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

BEGIN TRAN

--Trigger para efetivar criptografia:
CREATE TRIGGER TGR_Funcionarios
ON [dbo].[Funcionarios]
FOR INSERT
AS
BEGIN
	DECLARE
	@criptoNum_Tel_Fixo AS VARCHAR(MAX),
	@criptoNum_Tel_Cel AS VARCHAR(MAX),
	@criptoNum_Tel_Recado AS VARCHAR(MAX),
	@criptoEmail_Principal AS VARCHAR(MAX),
	@criptoEmail_Secundario AS VARCHAR(MAX),
	@criptoEmail_Corporativo AS VARCHAR(MAX),
	@criptoCPF_Func AS VARCHAR(MAX),
	@criptoRG_Func AS VARCHAR(MAX),
	@criptoRNE_Func AS VARCHAR(MAX),
	@criptoNumPassap_Func AS VARCHAR(MAX),
	@criptoNum_CTPS AS VARCHAR(MAX),
	@criptoPIS AS VARCHAR(MAX),
	@criptoNum_TituloEleitor AS VARCHAR(MAX),
	@criptoNum_Reservista AS VARCHAR(MAX),
	@criptoRegistro_Civil AS VARCHAR(MAX),
	@id AS INT

	SELECT @id = Cod_Funcionario, @criptoNum_Tel_Fixo = Num_Tel_Fixo,
	@criptoNum_Tel_Cel = Num_Tel_Celular, @criptoNum_Tel_Recado = Num_Tel_Recado,
	@criptoEmail_Principal = Email_Principal, @criptoEmail_Secundario = Email_Secundario,
	@criptoEmail_Corporativo = Email_Corporativo, @criptoCPF_Func = CPF,
	@criptoRG_Func = RG, @criptoRNE_Func = RNE,
	@criptoNumPassap_Func = Num_Passaporte, @criptoNum_CTPS = Num_CTPS,
	@criptoPIS = PIS, @criptoNum_TituloEleitor = Num_Titulo_Eleitor,
	@criptoNum_Reservista = Num_Reservista, @criptoRegistro_Civil = RegistCivil_Mat FROM INSERTED

	SET @criptoNum_Tel_Fixo = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoNum_Tel_Fixo), 2);
	SET @criptoNum_Tel_Cel = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoNum_Tel_Cel), 2);
	SET @criptoNum_Tel_Recado = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoNum_Tel_Recado), 2);
	SET @criptoEmail_Principal = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoEmail_Principal), 2);
	SET @criptoEmail_Secundario = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoEmail_Secundario), 2);
	SET @criptoEmail_Corporativo = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoEmail_Corporativo), 2);
	SET @criptoCPF_Func = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoCPF_Func), 2);
	SET @criptoRG_Func = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoRG_Func), 2);
	SET @criptoRNE_Func = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoRNE_Func), 2);
	SET @criptoNumPassap_Func = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoNumPassap_Func), 2);
	SET @criptoNum_CTPS = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoNum_CTPS), 2);
	SET @criptoPIS = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoPIS), 2);
	SET @criptoNum_TituloEleitor = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoNum_TituloEleitor), 2);
	SET @criptoNum_Reservista = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoNum_Reservista), 2);
	SET @criptoRegistro_Civil = CONVERT(VARCHAR(300), HASHBYTES('SHA2_256', @criptoRegistro_Civil), 2);
	-- SHA2_256 para criptografia geral
	
	UPDATE [dbo].[Funcionarios] SET Num_Tel_Fixo = @criptoNum_Tel_Fixo,
	Num_Tel_Celular = @criptoNum_Tel_Cel, Num_Tel_Recado = @criptoNum_Tel_Recado,
	Email_Principal = @criptoEmail_Principal, Email_Secundario = @criptoEmail_Secundario,
	Email_Corporativo = @criptoEmail_Corporativo, CPF = @criptoCPF_Func,
	RG = @criptoRG_Func, RNE = @criptoRNE_Func,
	Num_Passaporte = @criptoNumPassap_Func, Num_CTPS = @criptoNum_CTPS,
	PIS = @criptoPIS, Num_Titulo_Eleitor = @criptoNum_TituloEleitor,
	Num_Reservista = @criptoNum_Reservista, RegistCivil_Mat = @criptoRegistro_Civil WHERE Cod_Funcionario = @id
END
GO

-------------------------////////////////////////////////----------------------------

--Habilitaçãoo da trigger:
ALTER TABLE [dbo].[Funcionarios] ENABLE TRIGGER [TGR_Funcionarios]
GO

SELECT * FROM Funcionarios;

COMMIT