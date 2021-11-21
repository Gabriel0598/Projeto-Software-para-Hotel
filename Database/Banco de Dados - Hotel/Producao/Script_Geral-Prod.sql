/****** Object:  Database [UniHotel_Desenvolvimento]    Script Date: 20/11/2021 21:11:03 ******/
CREATE DATABASE [UniHotel_Desenvolvimento]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET  MULTI_USER 
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET ENCRYPTION ON
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET QUERY_STORE = ON
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  User [preadilok]    Script Date: 20/11/2021 21:11:03 ******/
CREATE USER [preadilok] WITH PASSWORD=N'5Liit3EtYDet5jX6X3SAxTfMugmWR9GqWeK94O7vIMc=', DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Diego_Anjos]    Script Date: 20/11/2021 21:11:03 ******/
CREATE USER [Diego_Anjos] WITH PASSWORD=N'1YxHUqr/acCM7u3dewx45TLNfO4TQRuOysuzzL/4GRw=', DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'preadilok'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'Diego_Anjos'
GO
/****** Object:  Table [dbo].[Acomodacoes]    Script Date: 20/11/2021 21:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acomodacoes](
	[ID_Acomod] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Acomodacao] [varchar](15) NOT NULL,
	[Nivel] [varchar](10) NULL,
	[Categoria] [varchar](10) NULL,
	[Num_Ap] [varchar](5) NOT NULL,
	[Tam_Ap] [tinyint] NOT NULL,
	[Telefone] [bit] NULL,
	[TV] [bit] NULL,
	[TV_Serv_Assin] [bit] NULL,
	[Area_Lazer] [bit] NULL,
	[Frigobar] [bit] NULL,
	[Hidromassagem] [bit] NULL,
 CONSTRAINT [Pk_ID_Acomod] PRIMARY KEY CLUSTERED 
(
	[ID_Acomod] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADM_Hotel]    Script Date: 20/11/2021 21:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_Hotel](
	[CC_ADM] [tinyint] NULL,
	[CNPJ] [bigint] NOT NULL,
	[Razao_Social] [varchar](50) NULL,
	[Nome_Fantasia] [varchar](50) NULL,
	[Inscr_Estad] [int] NULL,
	[Ramal_Principal] [smallint] NULL,
	[Email_Principal] [varchar](50) NULL,
	[DDD_Comercial1] [tinyint] NOT NULL,
	[Tel_Comercial1] [int] NOT NULL,
	[DDD_Comercial2] [tinyint] NULL,
	[Tel_Comercial2] [int] NULL,
	[Logradouro] [varchar](50) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Complemento] [varchar](50) NULL,
	[Bairro_Regiao] [varchar](30) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[CEP] [int] NOT NULL,
	[Estado_Provincia] [varchar](30) NULL,
	[Pais] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CNPJ] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Cod_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nome_Completo] [varchar](100) NOT NULL,
	[CPF] [varchar](64) NULL,
	[RG] [varchar](64) NULL,
	[Num_Passaporte] [varchar](64) NULL,
	[Data_Nascimento] [date] NOT NULL,
	[Genero] [varchar](15) NULL,
	[DDI_Tel_Fixo] [tinyint] NULL,
	[DDD_Tel_Fixo] [tinyint] NULL,
	[Num_Tel_Fixo] [varchar](64) NULL,
	[DDI_Tel_Celular] [tinyint] NOT NULL,
	[DDD_Tel_Celular] [tinyint] NULL,
	[Num_Tel_Celular] [varchar](64) NULL,
	[DDI_Tel_Recado] [tinyint] NULL,
	[DDD_Tel_Recado] [tinyint] NULL,
	[Num_Tel_Recado] [varchar](64) NULL,
	[DDI_Tel_Comercial] [tinyint] NULL,
	[DDD_Tel_Comercial] [tinyint] NULL,
	[Num_Tel_Comercial] [varchar](64) NULL,
	[Email_Principal] [varchar](64) NULL,
	[Email_Secundario] [varchar](64) NULL,
	[Logradouro] [varchar](50) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Complemento] [varchar](50) NULL,
	[Bairro_Regiao] [varchar](30) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[CEP_ZipCode] [varchar](20) NULL,
	[Estado_Provincia] [varchar](30) NULL,
	[Pais] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Cliente] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[CC_Compras] [tinyint] NOT NULL,
	[Num_Pedido] [varchar](30) NOT NULL,
	[Emissao_Pedido] [date] NULL,
	[Status_Pedido] [bit] NULL,
	[Cod_Fornec] [bigint] NULL,
	[Fornecedor] [varchar](50) NULL,
	[Cod_Item] [varchar](30) NULL,
	[Descricao] [varchar](50) NULL,
	[Unid_Medida] [varchar](10) NULL,
	[Qt_Itens] [decimal](8, 2) NULL,
	[Peso_Unidade] [decimal](8, 2) NULL,
	[Peso_Total] [decimal](8, 2) NULL,
	[Valor_Bruto] [decimal](12, 2) NULL,
	[Desconto] [decimal](3, 1) NULL,
	[Valor_Liquido] [decimal](12, 2) NULL,
	[Dt_Entrega] [date] NULL,
	[Tipo_Frete] [char](3) NULL,
	[Frete] [decimal](12, 2) NULL,
	[Seguro] [decimal](12, 2) NULL,
	[Cond_Pagamento] [varchar](30) NULL,
	[Parcelas] [tinyint] NULL,
	[Valor_Parcela] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Num_Pedido] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contabilidade]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contabilidade](
	[CC_Contabil] [tinyint] NOT NULL,
	[Cod_CC] [bigint] NULL,
	[Descr_CC] [varchar](50) NULL,
	[Pedido_Compra] [varchar](30) NULL,
	[Reserva_Hospedagem] [int] NULL,
	[Dt_OP] [date] NULL,
	[Tipo_Doc_OP] [varchar](15) NULL,
	[Doc_OP] [bigint] NULL,
	[Historico] [varchar](100) NULL,
	[Debito] [decimal](12, 2) NULL,
	[Credito] [decimal](12, 2) NULL,
	[Saldo] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CC_Contabil] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contas_Pagar]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contas_Pagar](
	[CC_Contas_Pagar] [tinyint] NULL,
	[Ordem_Pgto] [int] NOT NULL,
	[Cod_PedidoCompra] [varchar](30) NULL,
	[Natureza_Pgto] [varchar](50) NULL,
	[Descricao_Pgto] [varchar](1000) NULL,
	[Observacao_Pgto] [varchar](500) NULL,
	[Dt_Vencto] [date] NULL,
	[Cod_Benef] [int] NULL,
	[Razao_Social] [varchar](50) NULL,
	[Valor_Bruto] [decimal](12, 2) NULL,
	[Tributos] [decimal](12, 2) NULL,
	[Valor_Liquido] [decimal](12, 2) NULL,
	[Despesa] [bigint] NULL,
	[Tipo_Pgto] [varchar](30) NULL,
	[Cod_Compens] [tinyint] NULL,
	[Banco] [varchar](50) NULL,
	[Dt_Liquidacao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ordem_Pgto] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contas_Receber]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contas_Receber](
	[CC_Contas_Receber] [tinyint] NULL,
	[Ordem_Recebimento] [int] NOT NULL,
	[ID_Reserva] [int] NULL,
	[Natureza_Cred] [varchar](50) NULL,
	[Descricao_Cred] [varchar](1000) NULL,
	[Observacao_Cred] [varchar](500) NULL,
	[Tipo_Doc] [varchar](30) NULL,
	[Num_Doc] [bigint] NULL,
	[Dt_Vencto] [date] NULL,
	[Cod_Pagador] [int] NULL,
	[Nome_Razao_Social] [varchar](100) NULL,
	[Valor_Bruto] [decimal](12, 2) NULL,
	[Tributos] [decimal](12, 2) NULL,
	[Valor_Liquido] [decimal](12, 2) NULL,
	[Despesa] [bigint] NULL,
	[Cod_Compens] [tinyint] NULL,
	[Banco] [varchar](50) NULL,
	[Dt_Liquidacao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ordem_Recebimento] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dados_Financeiros_Clientes]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dados_Financeiros_Clientes](
	[ID_Cartao] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Cliente] [int] NULL,
	[Tipo1] [varchar](10) NULL,
	[Banco_Adm1] [varchar](30) NULL,
	[Bandeira1] [varchar](20) NULL,
	[Num_Cartao1] [varchar](64) NULL,
	[Dt_Validade1] [date] NULL,
	[CVV1] [varchar](64) NULL,
	[Tipo2] [varchar](10) NULL,
	[Banco_Adm2] [varchar](30) NULL,
	[Bandeira2] [varchar](20) NULL,
	[Num_Cartao2] [varchar](64) NULL,
	[Dt_Validade2] [date] NULL,
	[CVV2] [varchar](64) NULL,
	[Tipo3] [varchar](10) NULL,
	[Banco_Adm3] [varchar](30) NULL,
	[Bandeira3] [varchar](20) NULL,
	[Num_Cartao3] [varchar](64) NULL,
	[Dt_Validade3] [date] NULL,
	[CVV3] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cartao] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedores_Hotel]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedores_Hotel](
	[Cod_Fornec] [int] IDENTITY(1,1) NOT NULL,
	[Status_Fornecedor] [bit] NULL,
	[CNPJ] [bigint] NOT NULL,
	[Razao_Social] [varchar](50) NOT NULL,
	[Nome_Fantasia] [varchar](50) NULL,
	[Inscr_Estad] [int] NULL,
	[DDD_Comercial1] [tinyint] NOT NULL,
	[Tel_Comercial1] [int] NOT NULL,
	[DDD_Comercial2] [tinyint] NULL,
	[Tel_Comercial2] [int] NULL,
	[Email] [varchar](50) NOT NULL,
	[Funcionario_Contato] [varchar](50) NULL,
	[Logradouro] [varchar](50) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Complemento] [varchar](50) NULL,
	[Bairro_Regiao] [varchar](30) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[CEP] [int] NOT NULL,
	[Estado_Provincia] [varchar](30) NULL,
	[Pais] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CNPJ] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionarios]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionarios](
	[Cod_Funcionario] [int] IDENTITY(1,1) NOT NULL,
	[Nome_Completo] [varchar](100) NOT NULL,
	[Data_Nasc] [date] NOT NULL,
	[Genero] [varchar](15) NULL,
	[Estado_Civil] [varchar](10) NULL,
	[Tipo_Contrato] [varchar](15) NOT NULL,
	[Cargo] [varchar](40) NOT NULL,
	[Nivel] [varchar](30) NOT NULL,
	[DDI_Tel_Fixo] [tinyint] NULL,
	[DDD_Tel_Fixo] [tinyint] NULL,
	[Num_Tel_Fixo] [varchar](64) NULL,
	[DDI_Tel_Celular] [tinyint] NOT NULL,
	[DDD_Tel_Celular] [tinyint] NULL,
	[Num_Tel_Celular] [varchar](64) NULL,
	[DDI_Tel_Recado] [tinyint] NULL,
	[DDD_Tel_Recado] [tinyint] NULL,
	[Num_Tel_Recado] [varchar](64) NULL,
	[Email_Principal] [varchar](64) NULL,
	[Email_Secundario] [varchar](64) NULL,
	[Email_Corporativo] [varchar](64) NULL,
	[Logradouro] [varchar](50) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Complemento] [varchar](50) NULL,
	[Bairro_Regiao] [varchar](30) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[Cep_ZipCode] [varchar](20) NOT NULL,
	[Estado_Provincia] [varchar](30) NULL,
	[Pais] [varchar](50) NOT NULL,
	[CPF] [varchar](64) NULL,
	[RG] [varchar](64) NULL,
	[UF_RG] [char](2) NULL,
	[RNE] [varchar](64) NULL,
	[Val_RNE] [date] NULL,
	[Num_Passaporte] [varchar](64) NULL,
	[Num_CTPS] [varchar](64) NULL,
	[UF_CTPS] [char](2) NULL,
	[PIS] [varchar](64) NULL,
	[Num_Titulo_Eleitor] [varchar](64) NULL,
	[UF_Titulo_Eleitor] [char](2) NULL,
	[Num_Reservista] [varchar](64) NULL,
	[RegistCivil_Mat] [varchar](64) NULL,
	[RegistCivil_UF] [char](2) NULL,
	[Nivel_Formacao] [varchar](30) NULL,
	[Situac_Formacao] [varchar](10) NULL,
	[Curso] [varchar](50) NULL,
	[Instituicao] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Funcionario] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospedagens]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospedagens](
	[Cod_Reserva] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Cliente] [int] NULL,
	[Nome_Hospede] [varchar](100) NOT NULL,
	[CPF_Hospede] [varchar](64) NULL,
	[Passaporte_Hospede] [varchar](64) NULL,
	[Mat_Func_Reserva] [int] NULL,
	[Num_Ap] [int] NULL,
	[Dt_Hora_Reserva] [datetime] NOT NULL,
	[ID_Checkin] [varchar](10) NULL,
	[Dt_Entrada] [datetime] NULL,
	[Mat_Func_Checkin] [varchar](10) NULL,
	[ID_Checkout] [varchar](10) NULL,
	[Dt_Saida] [datetime] NULL,
	[Mat_Func_Checkout] [varchar](10) NULL,
	[Num_NFS] [bigint] NOT NULL,
	[Cod_Verif] [varchar](10) NULL,
	[Dt_Hora_Emissao] [datetime] NOT NULL,
	[CNPJ_Prestador] [bigint] NOT NULL,
	[Razao_Social] [varchar](50) NOT NULL,
	[CPF_Tomador] [varchar](64) NULL,
	[Nome_Tomador] [varchar](100) NOT NULL,
	[Valor_Total] [decimal](8, 2) NOT NULL,
	[Valor_ISS] [decimal](8, 2) NULL,
	[Observacoes] [varchar](100) NULL,
	[Tipo_Pgto] [varchar](20) NOT NULL,
	[Dt_Pgto] [date] NULL,
	[Quant_Parc] [tinyint] NULL,
	[Valor_Parc] [decimal](8, 2) NULL,
	[Valor_Pgto] [decimal](8, 2) NOT NULL,
	[Acompanhante1] [varchar](100) NULL,
	[CPF_Acomp1] [varchar](64) NULL,
	[Passap_Acomp1] [varchar](64) NULL,
	[Acompanhante2] [varchar](100) NULL,
	[CPF_Acomp2] [varchar](64) NULL,
	[Passap_Acomp2] [varchar](64) NULL,
	[Acompanhante3] [varchar](100) NULL,
	[CPF_Acomp3] [varchar](64) NULL,
	[Passap_Acomp3] [varchar](64) NULL,
	[Acompanhante4] [varchar](100) NULL,
	[CPF_Acomp4] [varchar](64) NULL,
	[Passap_Acomp4] [varchar](64) NULL,
	[Acompanhante5] [varchar](100) NULL,
	[CPF_Acomp5] [varchar](64) NULL,
	[Passap_Acomp5] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Reserva] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RH]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RH](
	[Centro_Custo] [tinyint] NULL,
	[Matricula] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Funcionario] [int] NOT NULL,
	[Sit_Cadastral] [bit] NOT NULL,
	[Ramal] [smallint] NULL,
	[Email] [varchar](50) NULL,
	[Cargo] [varchar](50) NULL,
	[Dt_Ingresso] [date] NULL,
	[Dt_Admissao] [date] NOT NULL,
	[Dt_Deslig_Afast] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teste_Criptografia]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teste_Criptografia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](10) NULL,
	[Senha] [varchar](150) NULL,
	[Nome] [varchar](100) NULL,
	[CPF] [bigint] NULL,
	[Endereco] [varchar](300) NULL,
	[Genero] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Clientes]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Clientes](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](12) NOT NULL,
	[Email_Login] [varchar](100) NOT NULL,
	[Senha] [varchar](64) NOT NULL,
	[Cod_Cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Funcionarios]    Script Date: 20/11/2021 21:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Funcionarios](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](12) NOT NULL,
	[Senha] [varchar](64) NOT NULL,
	[Matricula] [varchar](10) NOT NULL,
	[Cod_Funcionario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_CNPJ_Forn] FOREIGN KEY([Cod_Fornec])
REFERENCES [dbo].[Fornecedores_Hotel] ([CNPJ])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_CNPJ_Forn]
GO
ALTER TABLE [dbo].[Contabilidade]  WITH CHECK ADD  CONSTRAINT [FK_Cod_Reserva] FOREIGN KEY([Reserva_Hospedagem])
REFERENCES [dbo].[Hospedagens] ([Cod_Reserva])
GO
ALTER TABLE [dbo].[Contabilidade] CHECK CONSTRAINT [FK_Cod_Reserva]
GO
ALTER TABLE [dbo].[Contabilidade]  WITH CHECK ADD  CONSTRAINT [FK_ID_PedidoCompra] FOREIGN KEY([Pedido_Compra])
REFERENCES [dbo].[Compras] ([Num_Pedido])
GO
ALTER TABLE [dbo].[Contabilidade] CHECK CONSTRAINT [FK_ID_PedidoCompra]
GO
ALTER TABLE [dbo].[Contas_Pagar]  WITH CHECK ADD  CONSTRAINT [FK_Pgto_Compra] FOREIGN KEY([Cod_PedidoCompra])
REFERENCES [dbo].[Compras] ([Num_Pedido])
GO
ALTER TABLE [dbo].[Contas_Pagar] CHECK CONSTRAINT [FK_Pgto_Compra]
GO
ALTER TABLE [dbo].[Contas_Receber]  WITH CHECK ADD  CONSTRAINT [FK_ID_Reserva] FOREIGN KEY([ID_Reserva])
REFERENCES [dbo].[Hospedagens] ([Cod_Reserva])
GO
ALTER TABLE [dbo].[Contas_Receber] CHECK CONSTRAINT [FK_ID_Reserva]
GO
ALTER TABLE [dbo].[Dados_Financeiros_Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Cod_Cliente] FOREIGN KEY([Cod_Cliente])
REFERENCES [dbo].[Clientes] ([Cod_Cliente])
GO
ALTER TABLE [dbo].[Dados_Financeiros_Clientes] CHECK CONSTRAINT [FK_Cod_Cliente]
GO
ALTER TABLE [dbo].[Hospedagens]  WITH CHECK ADD FOREIGN KEY([Cod_Cliente])
REFERENCES [dbo].[Clientes] ([Cod_Cliente])
GO
ALTER TABLE [dbo].[Hospedagens]  WITH NOCHECK ADD  CONSTRAINT [FK_CNPJ_Hotel] FOREIGN KEY([CNPJ_Prestador])
REFERENCES [dbo].[ADM_Hotel] ([CNPJ])
GO
ALTER TABLE [dbo].[Hospedagens] CHECK CONSTRAINT [FK_CNPJ_Hotel]
GO
ALTER TABLE [dbo].[Hospedagens]  WITH CHECK ADD  CONSTRAINT [FK_ID_Funcionario] FOREIGN KEY([Mat_Func_Reserva])
REFERENCES [dbo].[Funcionarios] ([Cod_Funcionario])
GO
ALTER TABLE [dbo].[Hospedagens] CHECK CONSTRAINT [FK_ID_Funcionario]
GO
ALTER TABLE [dbo].[Hospedagens]  WITH NOCHECK ADD  CONSTRAINT [FK_ID_Quarto] FOREIGN KEY([Num_Ap])
REFERENCES [dbo].[Acomodacoes] ([ID_Acomod])
GO
ALTER TABLE [dbo].[Hospedagens] CHECK CONSTRAINT [FK_ID_Quarto]
GO
ALTER TABLE [dbo].[RH]  WITH CHECK ADD  CONSTRAINT [FK_CodFuncionario] FOREIGN KEY([Cod_Funcionario])
REFERENCES [dbo].[Funcionarios] ([Cod_Funcionario])
GO
ALTER TABLE [dbo].[RH] CHECK CONSTRAINT [FK_CodFuncionario]
GO
ALTER TABLE [dbo].[Users_Clientes]  WITH CHECK ADD  CONSTRAINT [fk_ClienteLogin] FOREIGN KEY([Cod_Cliente])
REFERENCES [dbo].[Clientes] ([Cod_Cliente])
GO
ALTER TABLE [dbo].[Users_Clientes] CHECK CONSTRAINT [fk_ClienteLogin]
GO
ALTER TABLE [dbo].[Users_Funcionarios]  WITH CHECK ADD  CONSTRAINT [fk_FuncLogin] FOREIGN KEY([Cod_Funcionario])
REFERENCES [dbo].[Funcionarios] ([Cod_Funcionario])
GO
ALTER TABLE [dbo].[Users_Funcionarios] CHECK CONSTRAINT [fk_FuncLogin]
GO
ALTER DATABASE [UniHotel_Desenvolvimento] SET  READ_WRITE 
GO
