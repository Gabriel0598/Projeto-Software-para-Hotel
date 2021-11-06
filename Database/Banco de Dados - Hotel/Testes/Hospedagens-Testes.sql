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