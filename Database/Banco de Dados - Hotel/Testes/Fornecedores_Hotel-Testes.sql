USE UniHotel_Testes
GO

CREATE TABLE Fornecedores_Hotel
(
--DADOS DE IDENTIFICAÇÃO:
Cod_Fornec INT IDENTITY (1,1),
Status_Fornecedor BIT, --Ativo ou inativo
CNPJ BIGINT NOT NULL PRIMARY KEY,
Razao_Social VARCHAR(50) NOT NULL,
Nome_Fantasia VARCHAR(50),
Inscr_Estad INT,

--CONTATO:
DDD_Comercial1 TINYINT NOT NULL,
Tel_Comercial1 INT NOT NULL,
DDD_Comercial2 TINYINT,
Tel_Comercial2 INT,
Email VARCHAR(50) NOT NULL,
Funcionario_Contato VARCHAR(50), --Contato no fornecedor

--ENDERECO:
Logradouro VARCHAR(50) NOT NULL,
Numero VARCHAR(10) NOT NULL,
Complemento VARCHAR(50),
Bairro_Regiao VARCHAR(30) NOT NULL,
Cidade VARCHAR(50) NOT NULL,
CEP INT NOT NULL,
Estado_Provincia VARCHAR(30),
Pais VARCHAR(50) NOT NULL
)

SELECT * FROM Fornecedores_Hotel;

 INSERT INTO Fornecedores_Hotel

(
Cod_Fornec,
Status_Fornecedor, 
CNPJ, -- NOT NULL PRIMARY KEY, -- Chave primaria deveria ser o Cod_Fornec ??
Razao_Social,
Nome_Fantasia,
Inscr_Estad,

DDD_Comercial1,
Tel_Comercial1,
DDD_Comercial2,
Tel_Comercial2,
Email,
Funcionario_Contato,

Logradouro,
Numero,
Complemento,
Bairro_Regiao,
Cidade,
CEP,
Estado_Provincia,
Pais VARCHAR
)

VALUES

(
'123',
'1',
'35.020.790/0001-51',
'Caleb Distribuidora de Limpeza Ltda',
'Caled Limpeza e Higiene',
'110826542444',

'11',
'28719740',
'11',
'998691760',
'calebdistribuidira@hotmail.com.br',
'(11)99336-0300 - Alex',

'Rua Virgílio de Lemos',
'845',
'223',
'Jardim Jabaquara',
'São Paulo',
'04384000',
'SP',
'Brasil'
)


-- 2

INSERT INTO UniHotel_Testes

(
Cod_Fornec,
Status_Fornecedor, 
CNPJ, -- NOT NULL PRIMARY KEY, -- Chave primaria deveria ser o Cod_Fornec ??
Razao_Social,
Nome_Fantasia,
Inscr_Estad,

DDD_Comercial1,
Tel_Comercial1,
DDD_Comercial2,
Tel_Comercial2,
Email,
Funcionario_Contato,

Logradouro,
Numero,
Complemento,
Bairro_Regiao,
Cidade,
CEP,
Estado_Provincia,
Pais VARCHAR
)

VALUES

(
'231',
'1',
'35.020.790/0001-51',
'Supremo Lavanderia e serviços Ltda',
'Alta Lavanderia',
'370863748870',

'11',
'37799727',
'11',
'984196913',
'contatolavanderia@hotmail.com.br',
'(11) 999057646 - Bruna',

'Rua Senador Feijó 69',
'265',
'131',
'Sé',
'São Paulo',
'01006900',
'SP',
'Brasil'
)

SELECT * FROM Fornecedores_Hotel;