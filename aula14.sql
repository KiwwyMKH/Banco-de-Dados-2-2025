CREATE DATABASE if not exists loja;

use loja;
-- Tabela de categorias
CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de marcas
CREATE TABLE marca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de produtos
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_categoria INT,
    id_marca INT,
    descricao TEXT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_marca) REFERENCES marca(id)
);

-- Tabela de estoque (relacionada a produto)
CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    tamanho VARCHAR(5),
    cor VARCHAR(30),
    preco DECIMAL(10,2),
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- INSERINDO DADOS

-- Inserir categorias
INSERT INTO categoria (nome) VALUES 
('Tênis'), ('Sandália'), ('Bota'), ('Chinelo');

-- Inserir marcas
INSERT INTO marca (nome) VALUES 
('Nike'), ('Adidas'), ('Puma'), ('Havaianas'), ('Timberland');

-- Inserir produtos (10 produtos variados)
INSERT INTO produto (nome, id_categoria, id_marca, descricao) VALUES
('Tênis Nike Air Max', 1, 1, 'Confortável e esportivo'),
('Chinelo Havaianas Slim', 4, 4, 'Modelo feminino com tiras finas'),
('Sandália Adidas Comfort', 2, 2, 'Palmilha anatômica'),
('Bota Timberland Couro', 3, 5, 'Ideal para trilhas e frio'),
('Tênis Puma Runner', 1, 3, 'Modelo leve para corrida'),
('Sandália Nike Solarsoft', 2, 1, 'Para uso casual'),
('Tênis Adidas Street', 1, 2, 'Design urbano'),
('Bota Nike Adventure', 3, 1, 'Robusta e resistente'),
('Chinelo Puma Relax', 4, 3, 'Confortável para o dia a dia'),
('Sandália Havaianas Flat', 2, 4, 'Moderna e colorida');

-- Inserir estoque (amostra com tamanhos, cores, preços e quantidades)
INSERT INTO estoque (id_produto, tamanho, cor, preco, quantidade) VALUES
(1, '42', 'Preto', 399.90, 10),
(2, '38', 'Rosa', 49.90, 25),
(3, '40', 'Azul', 129.90, 15),
(4, '43', 'Marrom', 499.90, 5),
(5, '41', 'Cinza', 199.90, 8),
(6, '39', 'Preto', 99.90, 12),
(7, '42', 'Branco', 299.90, 6),
(8, '44', 'Preto', 449.90, 4),
(9, '40', 'Azul', 59.90, 18),
(10, '37', 'Vermelho', 69.90, 20);

SELECT * FROM produto;
##1 A
insert into produto(nome, id_categoria, id_marca, descricao) VALUES
('Sapatenis Casual Puma',5,3, 'Sapatenis confortavel e resistente');

##1 B
INSERT INTO estoque (id_produto, tamanho, cor, preco, quantidade) VALUES
(5,'40', 'Cinza', 219.90, 6),
(5,'41', 'Preto', 219.90, 4);

##2 
UPDATE produto SET descricao = 'Tenis confortavel com design moderno e amortecimento air' WHERE id = 1;

##3 A
SELECT 
    p.nome AS produto,
    e.preco
FROM 
    produto p
JOIN 
    estoque e ON p.id = e.id_produto;

##3 B
SELECT 
    p.nome AS produto,
    e.tamanho,
    e.cor,
    e.quantidade
FROM 
    produto p
JOIN 
    estoque e ON p.id = e.id_produto;

##3 C
SELECT 
    p.nome AS produto,
    e.tamanho,
    e.cor,
    e.quantidade
FROM 
    produto p
JOIN 
    estoque e ON p.id = e.id_produto
WHERE 
    e.quantidade < 10;

##4 A
SELECT 
    p.nome AS Produto,
    c.nome AS Categoria,
    m.nome AS Marca,
    e.preco AS Preco
FROM 
    produto p
JOIN 
    categoria c ON p.id_categoria = c.id
JOIN 
    marca m ON p.id_marca = m.id
JOIN 
    estoque e ON p.id = e.id_produto;

##4 B
SELECT 
    p.nome AS Produto,
    e.cor,
    e.tamanho,
    e.quantidade
FROM 
    estoque e
JOIN 
    produto p ON e.id_produto = p.id;

##5 A
SELECT 
    SUM(quantidade) AS total_pares_estoque
FROM 
    estoque;

##5 B
SELECT 
    p.nome AS produto,
    SUM(e.quantidade) AS total_pares
FROM 
    produto p
JOIN 
    estoque e ON p.id = e.id_produto
GROUP BY 
    p.nome;

##5 C
SELECT 
    p.nome AS produto,
    SUM(e.quantidade * e.preco) AS valor_total_estoque
FROM 
    produto p
JOIN 
    estoque e ON p.id = e.id_produto
GROUP BY 
    p.nome;

##5 D
SELECT 
    c.nome AS categoria,
    AVG(e.preco) AS media_preco
FROM 
    produto p
JOIN 
    categoria c ON p.id_categoria = c.id
JOIN 
    estoque e ON p.id = e.id_produto
GROUP BY 
    c.nome;
