CREATE DATABASE CineMarvelDC;

USE CineMarvelDC;

CREATE TABLE vilao (
	idVilao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    codinome VARCHAR(100),
    origem VARCHAR(50)
);

ALTER TABLE vilao ADD nivel_periculosidade INT;

INSERT INTO vilao (nome, codinome, origem, nivel_periculosidade)
VALUES ('Arthur fleck', 'coringa', 'DC', '10'),
	   ('Oswald Cobblepot', 'Pinguim', 'DC', '7'),
	   ('Edward Nigma', 'Charada', 'DC', '8'),
	   ('Thanos', 'Thanos', 'Marvel', '10'),
	   ('Erik Lehnsherr', 'Magneto', 'Marvel', '9'),
	   ('Norman Osborn', 'Duende Verde', 'Marvel', '8'),
	   ('Tommy Shelby', 'Tommy', 'Peaky Blinders', '6'),
	   ('Annie Wilkes', 'Annie Wilkes', 'Stephen King', '7'),
	   ('Lord Voldemort', 'Voldemort', 'Harry Potter', '10'),
	   ('Darth Vader', 'Darth Vader', 'Star Wars', '10'),
	   ('Hannibal Lecter', 'Hannibal', 'Silêncio dos Inocentes', '9'),
	   ('Light Yagami', 'Kira', 'Death Note', '9'),
	   ('Sephiroth', 'Sephiroth', 'Final Fantasy', '9'),
	   ('Michael Myers', 'Michael Myers', 'Halloween', '8'),
	   ('Homelander', 'Capitão Pátria', 'The Boys', '10');


CREATE TABLE heroi (
	idHeroi INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    codinome VARCHAR(100),
    origem VARCHAR(50)
);

ALTER TABLE heroi ADD nivel_periculosidade INT;

INSERT INTO heroi (nome, codinome, origem, nivel_periculosidade)
VALUES ('clark kent', 'Superman', 'DC', '10'),
	   ('Bruce wayne', 'Batman', 'DC', '10'),
	   ('Illyana rasputin', 'Magik', 'Marvel', '10'),
	   ('Peter parker', 'Spiderman', 'Marvel', '10'),
	   ('Scott summers', 'ciclope', 'Marvel', '7'),
	   ('bob', 'senturion', 'Marvel', '10'),
	   ('william bruto', 'billy bruto', 'image comics', '10'),
	   ('mark grayson', 'invencivel', 'image comics', '10');

INSERT INTO heroi (nome, codinome, origem, nivel_periculosidade)
VALUES ('steve rogers', 'Capitao America', 'Marvel', '10');

CREATE TABLE confronto (
	idConfronto INT AUTO_INCREMENT PRIMARY KEY,
    localc VARCHAR(100),
    resultado VARCHAR(100),
    id_Heroi INT,
    id_Vilao INT,
    FOREIGN KEY (id_Heroi) REFERENCES heroi(idHeroi),
    FOREIGN KEY (id_Vilao) REFERENCES vilao(idVilao)
);

SELECT * FROM heroi;

INSERT INTO confronto (localc, resultado, id_Heroi, id_Vilao)
VALUES 
('Gotham City', 'Vitória do Herói', 2, 1),
('Gotham Docks', 'Vitória do Vilão', 2, 2),
('Museu de Gotham', 'Empate', 2, 3),
('Planeta Vormir', 'Vitória do Vilão', 1, 4),
('Genosha', 'Vitória do Vilão', 5, 5),
('Nova York', 'Vitória do Herói', 4, 6),
('Birmingham', 'Vitória do Vilão', 7, 7),
('Cabana isolada', 'Vitória do Vilão', 3, 8),
('Hogwarts', 'Vitória do Herói', 8, 9),
('Estrela da Morte', 'Empate', 1, 10),
('Hospital psiquiátrico', 'Vitória do Vilão', 6, 11),
('Tóquio', 'Vitória do Vilão', 3, 12),
('Nibelheim', 'Vitória do Vilão', 3, 13),
('Haddonfield', 'Vitória do Vilão', 8, 14),
('Nova York', 'Empate', 7, 15);

SELECT * FROM vilao WHERE nivel_periculosidade > 7;

SELECT * FROM heroi WHERE codinome LIKE 'S%';

SELECT * FROM confronto ORDER BY localc DESC;

SELECT 
    h.nome AS nome_heroi,
    v.nome AS nome_vilao,
    c.resultado
FROM confronto c
JOIN heroi h ON c.id_Heroi = h.idHeroi
JOIN vilao v ON c.id_Vilao = v.idVilao;

SELECT DISTINCT v.nome
FROM confronto c
JOIN heroi h ON c.id_Heroi = h.idHeroi
JOIN vilao v ON c.id_Vilao = v.idVilao
WHERE h.codinome = 'Capitão América';

SELECT COUNT(*) AS total_viloes
FROM vilao;

SELECT origem, AVG(nivel_periculosidade) AS media_periculosidade
FROM vilao
GROUP BY origem;

SELECT origem, COUNT(*) AS quantidade_viloes
FROM vilao
GROUP BY origem
HAVING COUNT(*) > 2;











