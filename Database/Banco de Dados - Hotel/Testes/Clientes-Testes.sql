USE UniHotel_Testes
GO

CREATE TABLE Clientes
(
--DADOS DE IDENTIFICAÇÃO:
Cod_Cliente INT IDENTITY(1,1) PRIMARY KEY,
Nome_Completo VARCHAR(100) NOT NULL,
CPF BIGINT,
RG INT,
Num_Passaporte VARCHAR(15),
Data_Nascimento DATE NOT NULL,
Genero VARCHAR(15),
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
DDI_Tel_Comercial TINYINT,
DDD_Tel_Comercial TINYINT,
Num_Tel_Comercial BIGINT,
Email_Principal VARCHAR(100) NOT NULL,
Email_Secundario VARCHAR(100),
--DADOS DO ENDEREÇO:
Logradouro VARCHAR(50) NOT NULL,
Numero VARCHAR(10) NOT NULL,
Complemento VARCHAR(50),
Bairro_Regiao VARCHAR(30) NOT NULL,
Cidade VARCHAR(50) NOT NULL,
CEP_ZipCode VARCHAR(20),
Estado_Provincia VARCHAR(30),
Pais VARCHAR(50) NOT NULL
)

SELECT * FROM Clientes;


INSERT INTO Clientes 

(Nome_Completo,
CPF,
RG,
Num_Passaporte,
Data_Nascimento,
Genero,

DDI_Tel_Fixo,
DDD_Tel_Fixo,
Num_Tel_Fixo,
DDI_Tel_Celular,
DDD_Tel_Celular,
Num_Tel_Celular,
DDI_Tel_Recado,
DDD_Tel_Recado,
Num_Tel_Recado,
DDI_Tel_Comercial,
DDD_Tel_Comercial,
Num_Tel_Comercial,
Email_Principal,
Email_Secundario,

Logradouro,
Numero,
Complemento,
Bairro_Regiao,
Cidade,
CEP_ZipCode,
Estado_Provincia,
Pais)

VALUES 

('Isaac Fernando Leonardo Baptista',
'56723554558',
'361747433',
'BR34045',
'1952-10-24',
'Masculino',

'55',
'27',
'25715879',
'55',
'27',
'996594151',
'55',
'27',
'996594151',
'55',
'11',
'996594151',
'isaacfernandoleonardobaptista-89@mirafactoring.com.br',
'isaacfernandoleonardobaptista-89@mirafactoring.com.br',

'Rua B',
'144',
'Casa 2',
'Aparecida',
'Cariacica',
'29152855',
'ES',
'Brasil')

-- 2 


INSERT INTO Clientes 

(Nome_Completo,
CPF,
RG,
Num_Passaporte,
Data_Nascimento,
Genero,

DDI_Tel_Fixo,
DDD_Tel_Fixo,
Num_Tel_Fixo,
DDI_Tel_Celular,
DDD_Tel_Celular,
Num_Tel_Celular,
DDI_Tel_Recado,
DDD_Tel_Recado,
Num_Tel_Recado,
DDI_Tel_Comercial,
DDD_Tel_Comercial,
Num_Tel_Comercial,
Email_Principal,
Email_Secundario,

Logradouro,
Numero,
Complemento,
Bairro_Regiao,
Cidade,
CEP_ZipCode,
Estado_Provincia,
Pais)

VALUES 

('Pedro Henrique Felipe Almeida',
'91740166280',
'365137297',
'BR34045',
'1969-02-16',
'Masculino',

'55',
'75',
'36125006',
'55',
'75',
'988983287',
'55',
'75',
'988983287',
'55',
'75',
'988983287',
'pedrohenriquefelipealmeida_@eximiart.com.br',
'pedrohenriquefelipealmeida_@eximiart.com.br',

'Rua Major Moacir',
'933',
'Casa 1',
'Gabriela',
'Feira de Santana',
'44028601',
'BA',
'Brasil')

SELECT * FROM Clientes;