USE `mercado`;

SELECT * FROM produto;
SELECT * FROM categoria;
SELECT * FROM vendas;

CREATE TABLE vendas(
 idvenda INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 data_venda DATE
);

CREATE TABLE vendas_has_produto(
	idvenda INT,
    idproduto INT,
    quantidade INT,
CONSTRAINT fkvenda FOREIGN KEY (idvenda)
REFERENCES vendas(idvenda),
CONSTRAINT fkproduto FOREIGN KEY (idproduto)
REFERENCES produto(idproduto),
PRIMARY KEY(idvenda, idproduto));

INSERT INTO vendas (data_venda) VALUES
('2025-08-01'),
('2025-08-02'),
('2025-08-03'),
('2025-08-04'),
('2025-08-05'),
('2025-08-06');

INSERT INTO vendas_has_produto (idvenda, idproduto, quantidade) VALUES
(1, 1, 5),
(1, 2, 2),
(1, 4, 6),
(3, 1, 4),
(3, 4, 1),
(4, 1, 3),
(4, 2, 2),
(5, 4, 4),
(6, 2, 1);

SELECT v.*
FROM vendas v
INNER JOIN vendas_has_produto vp ON v.idvenda = vp.idvenda
INNER JOIN produto p ON vp.idproduto = p.idproduto
WHERE p.descricao = 'Escova dental';

SELECT v.data_venda
FROM vendas v
INNER JOIN vendas_has_produto vp ON v.idvenda = vp.idvenda
INNER JOIN produto p ON vp.idproduto = p.idproduto
WHERE p.descricao = 'Creme dental';

SELECT p.descricao
FROM vendas v
INNER JOIN vendas_has_produto vp ON v.idvenda = vp.idvenda
INNER JOIN produto p ON vp.idproduto = p.idproduto
WHERE v.data_venda = '2025-01-23';

SELECT DISTINCT c.descricao
FROM categoria c
INNER JOIN produto p ON c.idcategoria = p.idcategoria
INNER JOIN vendas_has_produto vp ON p.idproduto = vp.idproduto;

SELECT DISTINCT v.*
FROM vendas v
INNER JOIN vendas_has_produto vp ON v.idvenda = vp.idvenda
INNER JOIN produto p ON vp.idproduto = p.idproduto
INNER JOIN categoria c ON p.idcategoria = c.idcategoria
WHERE c.descricao <> 'Higiene pessoal';
