USE UniHotel_Testes
GO

CREATE TABLE Acomodacoes
(
--DADOS:
ID_Acomod INT IDENTITY(1,1) NOT NULL,
Tipo_Acomodacao VARCHAR(15) NOT NULL, --Quarto/ Escritorio/ Flex Office
Nivel VARCHAR(10), --VIP/ Simples
Categoria VARCHAR(10), --Solteiro/ Duplo/ Casal
Num_Ap VARCHAR(5) NOT NULL,
Tam_Ap TINYINT NOT NULL, --Tamanho em M2

--ITENS
Telefone BIT,
TV BIT,
TV_Serv_Assin BIT,
Area_Lazer BIT,
Frigobar BIT,
Hidromassagem BIT,
)

SELECT * FROM Acomodacoes;