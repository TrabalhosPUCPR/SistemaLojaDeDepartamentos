# QUERIES DE EXEMPLO

# 1 Quantos funcionários trabalham em uma loja
SELECT COUNT(*) as quantidade FROM funcionario_loja
WHERE ID_loja = 1;

# 2 Quantos dependentes o funcionário tem
SELECT nome, COUNT(*) as quantidade FROM funcionario
INNER JOIN funcionario_dependente ON funcionario.ID_func = funcionario_dependente.ID_func 
WHERE nome = "joni"
GROUP BY nome;

# 3 Quanto é gasto pela empresa em salário dos funcionários
SELECT SUM(salario) as Total FROM funcionario;

# 4 Qual a quantidade de funcionários que são de uma específica profissão
SELECT COUNT(*) as quantidade FROM cargo
WHERE descricao = "estoqueiro";

# 5 Qual loja tem a maior quantidade de compras durante todo seu tempo de vida ou em uma data determinada
SELECT rua, bairro, numero, CEP, municipio.nome as Municipio, COUNT(*) as quantidade FROM loja
INNER JOIN compras ON compras.ID_loja = loja.ID_loja
INNER JOIN municipio ON municipio.ID_mun = loja.ID_mun 
WHERE compras.data_compra BETWEEN '2020-01-01' AND '2022-04-10' AND loja.ID_loja = 1# so comentar essa linha para mostrar de todo o seu tempo de vida
GROUP BY rua
ORDER BY quantidade DESC 
LIMIT 1;

# 6 Quais departamentos são os mais lucrativos (nesse caso vai ser os que tem o maior valor na soma do preco dos produtos vezes a quantidade do estoque)
SELECT departamento.nome, SUM(produto.valor*produto.qntd) as total FROM departamento, produto
WHERE departamento.ID_dpto = produto.ID_dpto 
GROUP BY departamento.nome
ORDER BY total DESC
LIMIT 1;

# 7 Em quais locais possui uma loja com um departamento especifico
SELECT rua, bairro, numero, CEP, municipio.nome as Municipio FROM loja 
INNER JOIN loja_departamento on loja.ID_loja = loja_departamento.ID_loja 
INNER JOIN municipio ON municipio.ID_mun = loja.ID_mun 
WHERE loja_departamento.ID_dpto = 3;

# 8 Quantos produtos cada departamento tem a venda (cada produto diferente, nao adiciona a quantidade que tem de cada)
SELECT departamento.nome, COUNT(*) as quantidade FROM departamento, produto
WHERE departamento.ID_dpto = produto.ID_dpto 
GROUP BY nome;

# 9 Quais produtos devem ser trocados por ter passado da data de validade
SELECT nome, validade FROM produto
WHERE CURRENT_DATE() > validade;

# 10 Quantos produtos foram vendidos durante uma data
SELECT COUNT(*) as quantidade_produtos_unico, SUM(compras.qntd) as quantidade_total FROM produto
INNER JOIN compras ON produto.ID_prod = compras.ID_prod
WHERE compras.data_compra BETWEEN '2022-01-01' AND '2022-05-05';

# 11 Qual produto é o mais vendido de todos ou de apenas um departamento
SELECT produto.nome, SUM(compras.qntd) as total FROM produto
INNER JOIN compras ON produto.ID_prod = compras.ID_prod 
WHERE produto.ID_dpto = 1 # so tirar essa linha para ver de todos
GROUP BY produto.nome 
ORDER BY total DESC 
LIMIT 1;

# 12 Qual é o lucro de um produto em relação ao preço de venda e o preço para o fornecimento
SELECT produto.nome, produto.valor*produto.qntd-produto_fornecedor.valor_entrega FROM produto, produto_fornecedor
WHERE produto.ID_prod = 1
GROUP BY produto.nome;

# 13 Quantidade de produtos vendidos em uma determinada data em uma loja especifica e em um departamento especifico e o quanto foi recebido nas vendas
SELECT SUM(compras.qntd) as quantidade_de_produtos, SUM(produto.valor*compras.qntd) as valor_total FROM compras
INNER JOIN produto ON compras.ID_prod = produto.ID_prod 
INNER JOIN departamento ON produto.ID_dpto = departamento.ID_dpto 
INNER JOIN loja ON compras.ID_loja = loja.ID_loja 
WHERE compras.data_compra BETWEEN '2022-02-01' AND '2022-03-01' AND loja.ID_loja = 1 AND departamento.nome = "eletronicos";

# 14 Quanto foi gasto no total com fornecedores
SELECT sum(valor_entrega) as total FROM produto_fornecedor;

# 15 Quantos fornecedores o sistema tem
SELECT COUNT(*) as quantidade FROM fornecedor;

# 16 Quais as compras que um cliente fez numa data determinada
SELECT cliente.nome, produto.nome, compras.data_compra, compras.qntd, loja.rua, loja.bairro, loja.numero, loja.CEP, municipio.nome as Municipio FROM cliente
INNER JOIN compras ON cliente.CPF = compras.CPF_cli 
INNER JOIN produto ON produto.ID_prod = compras.ID_prod 
INNER JOIN loja ON loja.ID_loja = compras.ID_loja 
INNER JOIN municipio ON municipio.ID_mun = loja.ID_mun
WHERE cliente.nome = "leo" AND compras.data_compra BETWEEN '2020-01-01' AND '2022-01-01';

# 17 Qual o local com a maior quantidade de clientes em geral?
SELECT COUNT(*) as quantidade, bairro FROM cliente
GROUP BY bairro
ORDER BY quantidade DESC 
LIMIT 1;

# 18 Quanto que um cliente gastou em uma determinada data
SELECT SUM(produto.valor*compras.qntd) as valor FROM compras
INNER JOIN produto ON compras.ID_prod = produto.ID_prod 
INNER JOIN cliente ON cliente.CPF = compras.CPF_cli
WHERE cliente.nome = "leo" AND data_compra BETWEEN '2021-02-01' AND '2022-02-31'
GROUP BY cliente.nome;

# 19 Qual dos fornecedores tem a melhor oferta em relação a quantidade e preço do produto para o fornecimento.
SELECT fornecedor.nome as nome_fornecedor, produto_fornecedor.valor_entrega/produto_fornecedor.qntd as valor FROM produto_fornecedor
INNER JOIN produto ON produto_fornecedor.ID_prod = produto.ID_prod 
INNER JOIN fornecedor ON produto_fornecedor.ID_for = fornecedor.ID_for 
WHERE produto.nome = "cadeira gamer"
ORDER BY valor ASC
LIMIT 1;

# 20 Quantos clientes foram cadastrados no sistema
SELECT COUNT(*) as quantidade FROM cliente;

# 21 Quais funcionarios que tem cargo X tem uma quantidade de dependente igual ou maior que Y
SELECT funcionario.nome, COUNT(*) as qntd FROM funcionario
INNER JOIN funcionario_dependente ON funcionario.ID_func = funcionario_dependente.ID_func
INNER JOIN cargo ON funcionario.cargo = cargo.ID_cargo AND cargo.descricao = "estoqueiro" # o ideial e pegar os funcionarios com o cargo X usando a chave mas pra visualiza melhor vou pegar pela descricao msm
GROUP BY funcionario.nome 
HAVING qntd >= 2;

SELECT funcionario.nome, COUNT(*) as qntd FROM funcionario, cargo, funcionario_dependente
WHERE cargo.descricao = "estoqueiro" AND funcionario_dependente.ID_func = funcionario.ID_func AND funcionario.cargo = cargo
GROUP BY funcionario.nome 
HAVING qntd >= 2;

# 22 Quais as loja que nao possuem menos de 2 departamentos
SELECT ID_loja, municipio.nome as Municipio, rua, bairro, numero, CEP FROM loja, municipio
WHERE ID_loja NOT IN(SELECT ID_loja as qntd  FROM loja_departamento GROUP BY ID_loja HAVING COUNT(*) < 2) AND loja.ID_mun = municipio.ID_mun;







