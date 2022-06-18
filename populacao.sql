### POPULACAO DO BANCO DE DADOS

## ID DEIXA NULO PRA AUTO INCREMENTAR

#adicionando municipios
#(id, nome)
INSERT INTO municipio VALUES 
(1, "Curitiba"),
(2, "São Paulo");

# adicionando lojas
#(id, rua, bairro, numero, CEP(8 digitos), id municipio)
INSERT INTO loja VALUES 
(1, "rua muito legal", "bairro extremamente legal", "87", "94670000", 1),
(2, "rua sim", "bairro nao", "99", "12345000", 2);

# adicionando clientes:
#(id, nome, senha, email, telefone, cpf(11 digitos), rua, bairro, numero, CEP(8 digitos), id municipio, numero casa ou apartamento)
INSERT INTO cliente VALUES 
("12345678910", "leo", "bomdia123", "leo@leo123.com", "992334455", "rua muito legal", "bairro extremamente legal", "985", "90710000", 1, "602"),
("35613458734", "matthew", "batata", "aaaa@bbbb.com", "991314686", "rua sim", "bairro nao", "123", "82512000", 2, "710"),
("85346523412", "knight", "senha", "email@email.com", "987421543", "rua fazendinha", "bairro fazenda", "561", "56489000", 1, NULL),
("98765432100", "sim", "aiai", "muito@massa.com", "912341234", "rua chata", "bairro extremamente legal", "23", "86904000", 1, NULL);

# adicionando cargos:
#(id, nome/descricao)
INSERT INTO cargo VALUES 
(1, "gerente"),
(2, "estoqueiro"),
(3, "confeiteiro"),
(4, "açougueiro");

# adicionando funcionarios:
#(id, nome, email, salario, idcargo)
INSERT INTO funcionario VALUES 
(1, "cara", "cara@znl.com", 1500, 1),
(2, "joni", "joni233223@znl.com", 5600, 2),
(3, "mari", "maaari@znl.com", 2100, 3),
(4, "mario", "mwahahah@ser.com", 2500, 4);

# adicionando dependentes 
#(id, endereco)
INSERT INTO dependentes VALUES 
(1, "jonas"),
(2, "jonus"),
(3, "luigi");

# adicionando relacao funcionarios dependentes 
#(idfunc, iddepe)
INSERT INTO funcionario_dependente VALUES 
(2, 1),
(2, 2),
(4, 3);

# adicionando funcionarios que trabalham na loja (dependendo da funcao pode trabalhar em mais que um):
#(id loja, id func)
INSERT INTO funcionario_loja VALUES 
(1, 2),
(1, 1),
(1, 3),
(2, 2);

# adicionando departamentos:
#(id, nome)
INSERT INTO departamento VALUES 
(1, "eletronicos"),
(2, "brinquedos"),
(3, "vestuarios"),
(4, "mobiliario"),
(5, "alimentos");

# adicionando departamentos que estao em quais lojas:
#(id loja, id depto)
INSERT INTO loja_departamento VALUES 
(1, 1),
(1, 2),
(1, 4),
(2, 3);

# adicionando produtos:
#(id, nome, valor, qntd, validade, ID_dep)
INSERT INTO produto VALUES 
(1, "televisao 4k 80 polegadas OLED LG", 1000, 15, NULL, 1),
(2, "Earbuds bluetooth", 120, 22, NULL, 1),
(3, "Sucrilhos Kelloggs", 10, 100, "2022-04-30", 5),
(4, "Fruit Loops", 15, 100, "2022-05-22", 5),
(5, "Mesa de escritorio", 410, 10, NULL, 4),
(6, "Cadeira gamer", 980, 5, NULL, 4),
(7, "Banco de plastico", 39, 25, NULL, 4),
(8, "Pasta de amendoim", 9, 51, "2025-01-01", 5),
(9, "Gelatina de morango", 9, 30, "2025-01-01", 5),
(10, "Regata branca", 20, 25, NULL, 3);

# adicionando as compras que os clientes fizeram:
#(id prod, cpf cliente, id loja, data, qntd)
INSERT INTO compras VALUES 
(1, "12345678910", 1, "2022-04-09", 2),
(2, "12345678910", 1, "2022-04-09", 1),
(2, "35613458734", 1, "2022-02-22", 1),
(4, "12345678910", 1, "2022-04-09", 1),
(6, "85346523412", 1, "2020-06-16", 1),
(3, "35613458734", 1, "2022-04-20", 3),
(8, "35613458734", 2, "2022-04-20", 2),
(9, "35613458734", 2, "2022-04-20", 5),
(6, "12345678910", 1, "2021-07-20", 1);

# adicionando fornecedores:
#(id, nome, qntd, data fornecido, valor)
INSERT INTO fornecedor VALUES 
(1, "Super eletronicos show"),
(2, "Comidas 9000"),
(3, "Irmao mobiliarios"),
(4, "So no compiuter");

# adicionando produtos fornecidos pelos fornecedores:
#(id produto, id fornecedor, valor da entrega, data da entrega, qntd)
INSERT INTO produto_fornecedor VALUES 
(1, 1, 2000, "2022-01-23", 10),
(2, 1, 500, "2022-01-23", 10),
(3, 2, 250, "2022-03-07", 43),
(4, 2, 250, "2022-03-07", 66),
(8, 2, 150, "2022-04-15", 25),
(9, 2, 150, "2022-04-15", 25),
(5, 3, 1400, "2022-04-15", 5),
(6, 3, 1400, "2022-04-15", 5),
(7, 3, 200, "2022-04-15", 15),
(2, 4, 370, "2021-12-28", 6),
(6, 4, 980, "2021-12-28", 5),
(1, 4, 1500, "2021-12-28", 6);