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


-- QUARTO VIP (SOLTEIRO, DUPLO, CASAL)
INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Quarto', 'VIP', 'Solteiro', '15', '16M2', '1', '1','1', '1', '1', '1');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Quarto', 'VIP', 'Duplo', '17', '20M2', '1', '1','1', '1', '1', '1');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Quarto', 'VIP', 'Casal', '19', '20M2', '1', '0','0', '0', '1', '0');



-- QUARTO SIMPLES (SOLTEIRO, DUPLO, CASAL)
INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Quarto', 'Simples', 'Solteiro', '21', '11M2', '1', '1','1', '0', '1', '1');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Quarto', 'Simples', 'Duplo', '23', '16M2', '1', '0','0', '0', '1', '0');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Quarto', 'Simples', 'Casal', '25', '16M2', '1', '0','0', '0', '1', '0');



-- ESCRITÓRIO VIP (SOLTEIRO, DUPLO, CASAL)
INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Escritorio', 'VIP', 'Solteiro', '27', '16M2', '1', '1','1', '0', '1', '1');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Escritorio', 'VIP', 'Duplo', '29', '20M2', '1', '0','0', '0', '1', '0');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Escritorio', 'VIP', 'Casal', '31', '20M2', '1', '1','0', '0', '1', '0');



-- ESCRITÓRIO SIMPLES (SOLTEIRO, DUPLO, CASAL)
INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Escritorio', 'Simples', 'Solteiro', '33', '11M2', '1', '1','1', '0', '1', '1');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Escritorio', 'Simples', 'Duplo', '35', '16M2', '1', '0','0', '0', '1', '0');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Escritorio', 'Simples', 'Casal', '37', '16M2', '1', '1','0', '0', '1', '0');



-- FLEX OFFICE VIP (SOLTEIRO, DUPLO, CASAL)
INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Flex Office', 'VIP', 'Solteiro', '39', '16M2', '1', '1','1', '0', '1', '1');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Flex Office', 'VIP', 'Duplo', '41', '20M2', '1', '0','0', '0', '1', '0');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Flex Office', 'VIP', 'Casal', '43', '20M2', '1', '1','0', '0', '1', '0');



-- FLEX OFFICE SIMPLES (SOLTEIRO, DUPLO, CASAL)
INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Flex Office', 'Simples', 'Solteiro', '45', '11M2', '1', '1','1', '0', '1', '1');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Flex Office', 'Simples', 'Duplo', '47', '16M2', '1', '0','0', '0', '1', '0');

INSERT INTO Acomodacoes (Tipo_acomodacao, Nivel, Categoria, Num_Ap, Tam_App, Telefone, TV, TV_Serv_Assin, Area_Lazer, Frigobar, Hidromassagem)
VALUES ('Flex Office', 'Simples', 'Casal', '49', '16M2', '1', '1','0', '0', '1', '0');

SELECT * FROM Acomodacoes;