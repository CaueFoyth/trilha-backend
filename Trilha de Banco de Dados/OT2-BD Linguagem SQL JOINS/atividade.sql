SELECT * FROM mercado.categoria;

USE `mercado`;

CREATE TABLE produto (
	idproduto int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao varchar(45),
    preco decimal(5,2) NULL,
    idcategoria int,
    CONSTRAINT fkcategoria FOREIGN KEY (idcategoria)
    REFERENCES categoria (idcategoria));
    
INSERT INTO produto VALUES (5, 'Desinfetante', 6.99, 2);

SELECT * FROM produto;
SELECT * FROM categoria;

SELECT p.*
FROM produto p
INNER JOIN categoria c ON p.idcategoria = c.idcategoria
WHERE c.descricao = 'Higiene pessoal';

SELECT p.preco
FROM produto p
INNER JOIN categoria c ON p.idcategoria = c.idcategoria
WHERE c.descricao = 'Limpeza';

SELECT p.descricao, p.preco, c.descricao
FROM produto p
INNER JOIN categoria c ON p.idcategoria = c.idcategoria;

SELECT p.*
FROM produto p
INNER JOIN categoria c ON p.idcategoria = c.idcategoria
WHERE c.descricao <> 'Frios';

SELECT c.idcategoria, c.descricao AS categoria, p.idproduto, p.descricao AS produto, p.preco
FROM categoria c
LEFT JOIN produto p ON c.idcategoria = p.idcategoria;