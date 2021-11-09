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