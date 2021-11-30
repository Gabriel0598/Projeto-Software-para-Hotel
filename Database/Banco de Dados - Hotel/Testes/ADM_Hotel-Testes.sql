USE UniHotel_Testes
GO

CREATE TABLE ADM_Hotel
(
--DADOS DE IDENTIFICAÇÃO:
CC_ADM TINYINT PRIMARY KEY NOT NULL,
CNPJ BIGINT,
Razao_Social VARCHAR(50),
Nome_Fantasia VARCHAR(50),
Inscr_Estad INT,

--CONTATO:
Ramal_Principal SMALLINT,
Email_Principal VARCHAR(50),
DDD_Comercial1 TINYINT NOT NULL,
Tel_Comercial1 INT NOT NULL,
DDD_Comercial2 TINYINT,
Tel_Comercial2 INT,

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

SELECT * FROM ADM_Hotel;


INSERT INTO ADM_Hotel 
(CNPJ,
Razao_Social,
Nome_Fantasia,
Inscr_Estad,

Ramal_Principal,
Email_Principal,
DDD_Comercial1,
Tel_Comercial1,
DDD_Comercial2,
Tel_Comercial2,

Logradouro,
Numero,
Complemento,
Bairro_Regiao,
Cidade,
CEP,
Estado_Provincia,
Pais)

VALUES 
('28.002.520/0001-20',
'UNIPIM HOTEL BRASIL LTDA',
'UNIHOTEL',
'310.044.003.130',

'150',
'contato@unihotel.com.br',
'11',
'3569-9328',
'11',
'2918-7042',

'Rua Marcos Gabriel',
'246',
'',
'Jardim Vila Diego',
'São Paulo',
'06465-570',
'',
'Brasil')

SELECT * FROM ADM_Hotel;