DROP DATABASE IF EXISTS MercadaoShow ;
CREATE DATABASE MercadaoShow;
USE MercadaoShow;

CREATE TABLE municipio(
	ID_mun int NOT NULL AUTO_INCREMENT,
	nome varchar(100),
	primary key(ID_mun)
);

CREATE TABLE loja(
	ID_loja int NOT NULL AUTO_INCREMENT,
	rua varchar(150),
	bairro varchar(100),
	numero varchar(20),
	CEP char(8),
	ID_mun int NOT NULL,
	primary key (ID_loja),
	foreign key (ID_mun) references municipio(ID_mun)
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
	CPF char(11),
	nome varchar(100),
	senha varchar(100),
	email varchar(100),
	telefone varchar(20),
	rua varchar(150),
	bairro varchar(100),
	numero varchar(20),
	CEP char(8),
	ID_mun int NOT NULL,
	n_casa_apt varchar(20),
	primary key (CPF),
	foreign key (ID_mun) references municipio(ID_mun)
);

CREATE TABLE compras(
	ID_prod int NOT NULL,
	CPF_cli char(11) NOT NULL,
	ID_loja int NOT NULL,
	data_compra date,
	qntd int,
	foreign key (ID_prod) references produto(ID_prod),
	foreign key (CPF_cli) references cliente(CPF),
	foreign key (ID_loja) references loja(ID_loja)
);









