USE UniHotel_Producao
GO

BEGIN TRANSACTION

DROP TABLE [dbo].[Acomodacoes];
DROP TABLE [dbo].[ADM_Hotel];
DROP TABLE [dbo].[Clientes];
DROP TABLE [dbo].[Compras];
DROP TABLE [dbo].[Contabilidade];
DROP TABLE [dbo].[Contas_Pagar];
DROP TABLE [dbo].[Contas_Receber];
DROP TABLE [dbo].[Dados_Financeiros_Clientes];
DROP TABLE [dbo].[Fornecedores_Hotel];
DROP TABLE [dbo].[Funcionarios];
DROP TABLE [dbo].[Hospedagens];
DROP TABLE [dbo].[RH];
DROP TABLE [dbo].[Users_Clientes];
DROP TABLE [dbo].[Users_Funcionarios];

COMMIT