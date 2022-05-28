DROP DATABASE IF EXISTS MercadaoShow ;
CREATE DATABASE MercadaoShow;
USE MercadaoShow;

CREATE TABLE loja(
	ID_loja int NOT NULL AUTO_INCREMENT,
	endereco varchar (150),
	primary key (ID_loja)
);

CREATE TABLE cargo(
	ID_cargo int NOT NULL AUTO_INCREMENT,
	descricao varchar(100),
	primary key (ID_cargo)
);

CREATE TABLE funcionario(
	ID_func int NOT NULL AUTO_INCREMENT,
	nome varchar(100) NOT NULL,
	email varchar(100),
	salario int,
	cargo int NOT NULL,
	primary key (ID_func),
	foreign key (cargo) references cargo(ID_cargo)
);

CREATE TABLE funcionario_loja(
	ID_loja int NOT NULL,
	ID_func int NOT NULL,
	foreign key (ID_loja) references loja(ID_loja),
	foreign key (ID_func) references funcionario(ID_func)
);

CREATE TABLE dependentes(
	ID_depe int NOT NULL AUTO_INCREMENT, 
	nome varchar(100),
	primary key (ID_depe)
);

CREATE TABLE funcionario_dependente(
	ID_func int NOT NULL,
	ID_depe int NOT NULL,
	foreign key (ID_func) references funcionario(ID_func),
	foreign key (ID_depe) references dependentes(ID_depe)
);

CREATE TABLE departamento(
	ID_dpto int NOT NULL AUTO_INCREMENT,
	nome varchar(100),
	primary key(ID_dpto)
);

CREATE TABLE loja_departamento(
	ID_loja int NOT NULL,
	ID_dpto int NOT NULL,
	foreign key (ID_loja) references loja(ID_loja),
	foreign key (ID_dpto) references departamento (ID_dpto)
);

CREATE TABLE produto(
	ID_prod int NOT NULL AUTO_INCREMENT,
	nome varchar(100),
	valor int, 
	qntd int,
	validade date,
	ID_dpto int NOT NULL,
	primary key (ID_prod),
	foreign key (ID_dpto) references departamento(ID_dpto)
);

CREATE TABLE fornecedor(
	ID_for int NOT NULL AUTO_INCREMENT,
	nome varchar(100),
	primary key (ID_for)
);

CREATE TABLE produto_fornecedor(
	ID_prod int NOT NULL,
	ID_for int NOT NULL,
	valor_entrega int,
	data_for date,
	qntd int,
	foreign key (ID_prod) references produto(ID_prod),
	foreign key (ID_for) references fornecedor(ID_for)
);

CREATE TABLE cliente(
	ID_cli int NOT NULL AUTO_INCREMENT,
	nome varchar(100),
	senha varchar(100),
	email varchar(100),
	endereco varchar(100),
	telefone varchar(20),
	CPF varchar(11),
	primary key (ID_cli)
);

CREATE TABLE compras(
	ID_prod int NOT NULL,
	ID_cli int NOT NULL,
	ID_loja int NOT NULL,
	data_compra date,
	qntd int,
	foreign key (ID_prod) references produto(ID_prod),
	foreign key (ID_cli) references cliente(ID_cli),
	foreign key (ID_loja) references loja(ID_loja)
);

### POPULACAO DO BANCO DE DADOS

## ID DEIXA NULO PRA AUTO INCREMENTAR

# adicionando lojas
#(id, endereco)
INSERT INTO loja VALUES 
(NULL, "rua muito legal"),
(NULL, "rua sim");

# adicionando clientes:
#(id, nome, senha, email, endereco, telefone, cpf(11 digitos))
INSERT INTO cliente VALUES 
(NULL, "leo", "bomdia123", "leo@leo123.com", "rua muito legal", "992334455", "12345678910"),
(NULL, "matthew", "batata", "aaaa@bbbb.com", "rua nao muito legal", "991314686", "35613458734"),
(NULL, "knight", "senha", "email@email.com", "rua rua", "987421543", "85346523412"),
(NULL, "sim", "aiai", "muito@massa.com", "rua sim", "912341234", "98765432100");

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
(NULL, "cara", "cara@znl.com", 1500, 1),
(NULL, "joni", "joni233223@znl.com", 5600, 2),
(NULL, "mari", "maaari@znl.com", 2100, 3),
(NULL, "mario", "mwahahah@ser.com", 2500, 4);

# adicionando dependentes 
#(id, endereco)
INSERT INTO dependentes VALUES 
(NULL, "jonas"),
(NULL, "jonus"),
(NULL, "luigi");

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
#(id prod, id cliente, id loja, data, qntd)
INSERT INTO compras VALUES 
(1, 1, 1, "2022-04-09", 2),
(2, 1, 1, "2022-04-09", 1),
(2, 2, 1, "2022-02-22", 1),
(4, 1, 1, "2022-04-09", 1),
(6, 3, 1, "2020-06-16", 1),
(3, 2, 1, "2022-04-20", 3),
(8, 2, 2, "2022-04-20", 2),
(9, 2, 2, "2022-04-20", 5),
(6, 1, 1, "2021-07-20", 1);

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












