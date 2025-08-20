use mercado;

SELECT * FROM vendas_has_produto;

SELECT SUM(vhp.quantidade) AS total_venda_escovas
FROM vendas_has_produto vhp
JOIN produto p ON vhp.idproduto = p.idproduto
WHERE p.descricao = 'Escova dental';

SELECT SUM(p.preco * vhp.quantidade) AS valor_total
FROM vendas_has_produto vhp
JOIN produto p ON vhp.idproduto = p.idproduto
WHERE vhp.idvenda = 2;

SELECT p.*, c.descricao AS categoria
FROM produto p
JOIN categoria c ON p.idcategoria = c.idcategoria
WHERE c.descricao = 'Higiene pessoal'
  AND p.descricao LIKE '%dental';
  
SELECT p.*, c.descricao AS categoria
FROM produto p
JOIN categoria c ON p.idcategoria = c.idcategoria
WHERE c.descricao IN ('Higiene pessoal', 'Limpeza');

SELECT AVG(p.preco) AS media_produtos
FROM vendas v
JOIN vendas_has_produto vhp ON v.idvenda = vhp.idvenda
JOIN produto p ON vhp.idproduto = p.idproduto
WHERE v.data_venda = '2023-01-23';

SELECT p.*
FROM produto p
JOIN categoria c ON p.idcategoria = c.idcategoria
WHERE c.descricao NOT IN ('cama, mesa e banho', 'limpeza');

SELECT p.descricao, p.preco
FROM produto p
ORDER BY p.preco DESC
LIMIT 1;

SELECT p.descricao, SUM(vhp.quantidade) AS Total_de_Vendas
FROM vendas_has_produto vhp
JOIN produto p ON vhp.idproduto = p.idproduto
GROUP BY p.descricao
ORDER BY Total_de_Vendas DESC
LIMIT 1;

SELECT v.data_venda, SUM(vhp.quantidade) AS total_vendido
FROM vendas v
JOIN vendas_has_produto vhp ON v.idvenda = vhp.idvenda
GROUP BY v.data_venda
ORDER BY total_vendido ASC
LIMIT 1;

SELECT DISTINCT c.descricao
FROM categoria c
JOIN produto p ON c.idcategoria = p.idcategoria
JOIN vendas_has_produto vhp ON p.idproduto = vhp.idproduto;

SELECT SUM(vhp.quantidade) AS total_vendido
FROM vendas v
JOIN vendas_has_produto vhp ON v.idvenda = vhp.idvenda
WHERE v.data_venda BETWEEN '2023-07-08' AND '2023-07-10';
