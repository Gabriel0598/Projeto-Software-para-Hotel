USE UniHotel_Testes
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

--ADICIONAIS:
Matricula VARCHAR(10),
Ramal SMALLINT
)

SELECT * FROM Funcionarios;


 INSERT INTO Funcionarios
(
Sit_Cadastral,
Nome_Completo,
Data_Nasc,
Genero,
Estado_Civil,

Tipo_Contrato,
Cargo,
Nivel,

DDI_Tel_Fixo,
DDD_Tel_Fixo,
Num_Tel_Fixo,
DDI_Tel_Celular,
DDD_Tel_Celular,
Num_Tel_Celular, 
DDI_Tel_Recado,
DDD_Tel_Recado,
Num_Tel_Recado,
Email_Principal,
Email_Secundario,
Email_Corporativo,

Logradouro,
Numero,
Complemento,
Bairro_Regiao,
Cidade,
Cep_ZipCode,
Estado_Provincia,
Pais,

CPF,
RG,
UF_RG,
RNE,
Val_RNE,
Num_Passaporte,
Num_CTPS,
UF_CTPS,
PIS,
Num_Titulo_Eleitor,
UF_Titulo_Eleitor,
Num_Reservista,
RegistCivil_Mat,
RegistCivil_UF,

Nivel_Formacao,
Situac_Formacao,
Curso,
Instituicao,
Dt_Ingresso,

Dt_Admissao,
Dt_Deslig_Afast,

Matricula,
Ramal
)

VALUES

(
'1',
'Jaqueline Elza Moura',
'1991-02-04',
'Feminino',
'Solteira',
 
'CLT',
'Recepcionista',
'Nível II',

'55',
'11',
'38174312',
'55',
'11',
'981565090',
'55',
'11',
'981565090',
'Jaqueline@ficopola.net',
'Jaqueline.moura@uniclinica.com.br',

'Rua Isaías Coelho',
'122',
'2334',
'Jardim Santo Expedito',
'Guarulhos',
'07162210',
'SP',
'Brasil',

'17349455836',
'351162562',
'SP',
'23',
'23',
'342',
'00042000222',
'SP',
'15248562145',
'158765983275',
'SP',
'854763598712',
'99999999991991999999157896879999',
'SP',

'Ensino Médio',
'Completo',
'23',
'4353',
'234',

'2021-08-20',
'324',

'58456',
'3667'
)


-- 2 -------------------------------------------


INSERT INTO Funcionarios
(
Sit_Cadastral,
Nome_Completo,
Data_Nasc,
Genero,
Estado_Civil,

Tipo_Contrato,
Cargo,
Nivel,

DDI_Tel_Fixo,
DDD_Tel_Fixo,
Num_Tel_Fixo,
DDI_Tel_Celular,
DDD_Tel_Celular,
Num_Tel_Celular, 
DDI_Tel_Recado,
DDD_Tel_Recado,
Num_Tel_Recado,
Email_Principal,
Email_Secundario,
Email_Corporativo,

Logradouro,
Numero,
Complemento,
Bairro_Regiao,
Cidade,
Cep_ZipCode,
Estado_Provincia,
Pais,

CPF,
RG,
UF_RG,
RNE,
Val_RNE,
Num_Passaporte,
Num_CTPS,
UF_CTPS,
PIS,
Num_Titulo_Eleitor,
UF_Titulo_Eleitor,
Num_Reservista,
RegistCivil_Mat,
RegistCivil_UF,

Nivel_Formacao,
Situac_Formacao,
Curso,
Instituicao,
Dt_Ingresso,

Dt_Admissao,
Dt_Deslig_Afast,

Matricula,
Ramal
)

VALUES

(
'1',
'Elias Marcos Vinicius Caldeira',
'1981-11-18',
'Masculino',
'Casado',

'CLT',
'Cozinheiro',
'Nível III',

'55',
'11',
'39705816',
'55',
'11',
'991074015',
'55',
'11',
'991074015',
'Eliasmarcos@bakerhughes.com',
'Elias.Caldeira@uniclinica.com.br',

'Viela Joaquim Veríssimo Neto',
'765',
'123',
'Perus',
'São Paulo',
'05201055',
'SP',
'Brasil',

'32414882840',
'204001468',
'SP',
'2323',
'12',
'355',
'00068005545',
'SP',
'65789225486',
'889654485635',
'SP',
'45684456841',
'99999999991981999999458744259999',
'SP',

'Superior',
'Completo',
'Gastronomia',
'FMU',
'2012-07-10',

'2021-04-10',
'213',

'58387',
'1313',
)

SELECT * FROM Funcionarios;