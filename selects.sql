# QUERIES DE EXEMPLO

# 1 Quantos funcionários trabalham em uma loja
SELECT COUNT(*) as quantidade FROM funcionario_loja
WHERE ID_loja = 1

# 2 Quantos dependentes o funcionário tem
SELECT nome, COUNT(*) as quantidade FROM funcionario
INNER JOIN funcionario_dependente ON funcionario.ID_func = funcionario_dependente.ID_func 
WHERE nome = "joni"
GROUP BY nome

# 3 Quanto é gasto pela empresa em salário dos funcionários
SELECT SUM(salario) as Total FROM funcionario

# 4 Qual a quantidade de funcionários que são de uma específica profissão
SELECT COUNT(*) as quantidade FROM cargo
WHERE descricao = "estoqueiro"

# 5 Qual loja tem a maior quantidade de compras durante todo seu tempo de vida ou em uma data determinada
SELECT endereco, COUNT(*) as quantidade FROM loja
INNER JOIN compras ON compras.ID_loja = loja.ID_loja
WHERE compras.data_compra BETWEEN '2020-01-01' AND '2022-04-10' AND loja.ID_loja = 1# so comentar essa linha para mostrar de todo o seu tempo de vida
GROUP BY endereco 
ORDER BY quantidade DESC 
LIMIT 1

# 6 Quais departamentos são os mais lucrativos (nesse caso vai ser os que tem o maior valor na soma do preco dos produtos vezes a quantidade do estoque)
SELECT departamento.nome, SUM(produto.valor*produto.qntd) as total FROM departamento, produto
WHERE departamento.ID_dpto = produto.ID_dpto 
GROUP BY departamento.nome
ORDER BY total DESC
LIMIT 1

# 7 Em quais locais possui uma loja com o departamento em busca
SELECT endereco FROM loja 
INNER JOIN loja_departamento on loja.ID_loja = loja_departamento.ID_loja 
WHERE loja_departamento.ID_dpto = 3

# 8 Quantos produtos cada departamento tem a venda (cada produto diferente, nao adiciona a quantidade que tem de cada)
SELECT departamento.nome, COUNT(*) as quantidade FROM departamento, produto
WHERE departamento.ID_dpto = produto.ID_dpto 
GROUP BY nome

# 9 Quais produtos devem ser trocados por passar da data de validade
SELECT nome, validade FROM produto
WHERE CURRENT_DATE() > validade 

# 10 Quantos produtos foram vendidos durante uma data
SELECT COUNT(*) as quantidade, SUM(compras.qntd) as quantidade_total FROM produto
INNER JOIN compras ON produto.ID_prod = compras.ID_prod
WHERE compras.data_compra BETWEEN '2022-01-01' AND '2022-05-05'

# 11 Qual produto é o mais vendido de todos ou de apenas um departamento
SELECT produto.nome, SUM(compras.qntd) as total FROM produto
INNER JOIN compras ON produto.ID_prod = compras.ID_prod 
WHERE produto.ID_dpto = 1
GROUP BY produto.nome 
ORDER BY total DESC 
LIMIT 1

# 12 Qual é o lucro de um produto em relação ao preço de venda e o preço para o fornecimento
SELECT produto.nome, produto.valor*produto.qntd-produto_fornecedor.valor_entrega FROM produto, produto_fornecedor
WHERE produto.ID_prod = 1
GROUP BY produto.nome

# 13 Quantidade de produtos vendidos em uma determinada data em uma loja especifica e em um departamento especifico e o quanto foi recebido nas vendas
SELECT SUM(compras.qntd) as quantidade_de_produtos, SUM(produto.valor*compras.qntd) as valor_total FROM compras
INNER JOIN produto ON compras.ID_prod = produto.ID_prod 
INNER JOIN departamento ON produto.ID_dpto = departamento.ID_dpto 
INNER JOIN loja ON compras.ID_loja = loja.ID_loja 
WHERE compras.data_compra BETWEEN '2022-02-01' AND '2022-03-01' AND loja.ID_loja = 1 AND departamento.nome = "eletronicos"

# 14 Quanto é gasto no total com fornecedores
SELECT sum(valor_entrega) as total FROM produto_fornecedor

# 15 Quantas compras são feitas em uma data determinada
SELECT COUNT(*) as total FROM compras
WHERE data_compra BETWEEN '2022-02-01' AND '2022-02-31'

# 16 Quais as compras que um cliente fez numa data determinada
SELECT cliente.nome, produto.nome, loja.endereco, compras.data_compra, compras.qntd FROM cliente
INNER JOIN compras ON cliente.ID_cli = compras.ID_cli
INNER JOIN produto ON produto.ID_prod = compras.ID_prod 
INNER JOIN loja ON loja.ID_loja = compras.ID_loja 
WHERE cliente.nome = "leo" 

# 17 Qual o local com a maior quantidade de clientes em geral
SELECT COUNT(*) as quantidade, endereco FROM cliente
GROUP BY endereco
ORDER BY quantidade DESC 
LIMIT 1

# 18 Quanto que um cliente gastou em uma determinada data
SELECT SUM(produto.valor*compras.qntd) as valor FROM compras
INNER JOIN produto ON compras.ID_prod = produto.ID_prod 
INNER JOIN cliente ON cliente.ID_cli = compras.ID_cli 
WHERE cliente.nome = "leo"
GROUP BY cliente.nome 

# 19 Qual dos fornecedores tem a melhor oferta em relação a quantidade de produtos com o preço para o fornecimento.
SELECT fornecedor.nome as nome_fornecedor, produto_fornecedor.valor_entrega/produto_fornecedor.qntd as valor FROM produto_fornecedor
INNER JOIN produto ON produto_fornecedor.ID_prod = produto.ID_prod 
INNER JOIN fornecedor ON produto_fornecedor.ID_for = fornecedor.ID_for 
WHERE produto.nome = "cadeira gamer"
ORDER BY valor ASC
LIMIT 1


# 20 Quantos clientes foram cadastrados no sistema
SELECT COUNT(*) as quantidade FROM cliente



