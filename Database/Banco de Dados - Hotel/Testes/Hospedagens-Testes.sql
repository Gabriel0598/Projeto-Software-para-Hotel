USE UniHotel_Testes
GO

CREATE TABLE Hospedagens
(
--DADOS DOS HÓSPEDE E ACOMPANHANTES:
Cod_Reserva INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
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

INSERT INTO Hospedagens
(
Nome_Hospede,
CPF_Hospede,
Passaporte_Hospede,

Mat_Func_Reserva,
Num_Ap,
Dt_Reserva,

ID_Checkin,
Dt_Entrada,
Mat_Func_Checkin,
ID_Checkout,
Dt_Saida,
Mat_Func_Checkout,

Num_NFS,
Cod_Verif,
Dt_Hora_Emissao,
CNPJ_Prestador,
Razao_Social,
CPF_Tomador,
Nome_Tomador,
Valor_Total,
Valor_ISS,
Observacoes,

Tipo_Pgto,
Dt_Pgto,
Quant_Parc,
Valor_Parc,
Valor_Pgto
)

VALUES

(
'Isaac Fernando Leonardo Baptista',
'56723554558',
'121',

'58456',
'39',
'2021-11-21',

'1234',
'2021-11-2021',
'12',
'4321',
'23-11-2021',
'321',

'000.001',
'57 EA B1',
'2021-11-21',
'310.044.003.130',
'UNIPIM HOTEL BRASIL LTDA',
'56723554558',
'Isaac Fernando Leonardo Baptista',
'291,00',
'5,82',
'13',

'Cartão Débito',
'2021-11-23',
'0',
'123',
'296,82'
)

-- 2 -----------------



INSERT INTO Hospedagens
(
Nome_Hospede,
CPF_Hospede,
Passaporte_Hospede,

Mat_Func_Reserva,
Num_Ap,
Dt_Reserva,

ID_Checkin,
Dt_Entrada,
Mat_Func_Checkin,
ID_Checkout,
Dt_Saida,
Mat_Func_Checkout,

Num_NFS,
Cod_Verif,
Dt_Hora_Emissao,
CNPJ_Prestador,
Razao_Social,
CPF_Tomador,
Nome_Tomador,
Valor_Total,
Valor_ISS,
Observacoes,

Tipo_Pgto,
Dt_Pgto,
Quant_Parc,
Valor_Parc,
Valor_Pgto

Acompanhante1,
CPF_Acomp1,
Passap_Acomp1
)

INSERT INTO Hospedagens
(
'Pedro Henrique Felipe Almeida',
'91740166280',
'23',

'58456',
'15',
'10-09-2021',

'1234',
'2021-09-10',
'58456',
'4321',
'2021-09-17',
'12',

'000.002',
'60 EA B2',
'2021-09-11',
'310.044.003.130',
'UNIPIM HOTEL BRASIL LTDA',
'91740166280',
'Pedro Henrique Felipe Almeida',
'2465,00',
'49,30',
'Suite Vip Casal',

'Cartão Crédito',
'2021-09-17',
'2',
'1257,15',
'2514,30'

'Sabrina Rosângela Bruna Rocha',
'12729003800',
'464'
)

SELECT * FROM Hospedagens;