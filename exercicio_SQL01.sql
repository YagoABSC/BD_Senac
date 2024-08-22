CREATE DATABASE `exercicio_SQL01`;

use exercicio_SQL01;

CREATE TABLE `Alunos` (
`id_aluno` INT(4) NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(50) NOT NULL,
`sobrenome` VARCHAR (50) NOT NULL,
PRIMARY KEY (`id_aluno`)
);

INSERT INTO `Alunos` (`nome`, `sobrenome`) VALUES 
('Arthur', 'Amorim'),
('David', 'Jesus'),
('Leandro', 'Cirillo'),
('Yago', 'Aparecido');

SELECT nome FROM Alunos;

CREATE TABLE `Cursos` (
`id_curso` INT(4) NOT NULL AUTO_INCREMENT,
`nome_curso` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id_curso`)
);

INSERT INTO `Cursos`(`nome_curso`) VALUES 
('Informática para Internet'),
('Administração'),
('Games'),
('Marketing');

SELECT Cursos.nome_curso, Alunos.nome FROM Cursos, Alunos WHERE Alunos.id_aluno = 3;

CREATE TABLE `Clientes`(
`id_cliente` INT(4) NOT NULL AUTO_INCREMENT,
`nome` VARCHAR (50) NOT NULL,
`idade` INT (2) NOT NULL,
`cidade` VARCHAR (30),
PRIMARY KEY (`id_cliente`)
);

INSERT INTO `Clientes`(`nome`, `idade`, `cidade`) VALUES
('Camila', 32, 'Sâo Paulo'),
('Brenda', 30, 'Porto Alegre'),
('Gabriel', 28, 'Curitiba'),
('Yago', 31, 'Sâo Paulo'),
('Jesualdo', 32, 'Goiás'),
('Jorciane', 35, 'Cuiabá');


SELECT * FROM Clientes;

CREATE TABLE `Pedidos` (
`id_pedidos` INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`clienteID` INT (4) NOT NULL,
`data_pedido` DATE NOT NULL, 
`valor_total` decimal NOT NULL,
CONSTRAINT `FK_pedidos_clientes` FOREIGN KEY(`clienteID`) REFERENCES `Clientes` (`id_cliente`)
)ENGINE = InnoDB;

INSERT INTO `Pedidos` (`clienteID`, `data_pedido`, `valor_total`) VALUES
(1,'2024-05-22', 89.90),
(1,'2024-05-23', 56.60),
(2,'2024-05-23', 150.00);

SELECT Clientes.nome, Pedidos.data_pedido, Pedidos.valor_total 
FROM Clientes, Pedidos
WHERE Clientes.nome = "Camila";

SELECT nome, cidade FROM Clientes WHERE Clientes.idade >+ 30 ORDER BY cidade ASC;

CREATE TABLE `Produtos`(
`id_produto` INT(4) NOT NULL AUTO_INCREMENT,
`nome_produto` VARCHAR(30) NOT NULL,
`categoria` VARCHAR(30) NOT NULL,
`preco` DECIMAL NOT NULL,
PRIMARY KEY (`id_produto`)
)ENGINE = InnoDB;

INSERT INTO `Produtos` (`nome_produto`, `categoria`, `preco`) VALUES
('Echo DOT 5 Geração', 'Eletrônicos', 150.50),
('Headphone Havit', 'Eletrônicos', 89.90),
('Sofá 3 lugares', 'Móveis', 300.00),
('Guarda-roupa 6 portas', 'Móveis', 699.90);

SELECT * FROM `Produtos`;

SELECT AVG (`preco`) FROM Produtos WHERE Produtos.categoria = "Eletrônicos";

SELECT AVG (`preco`) FROM Produtos WHERE Produtos.categoria = "Móveis";

SELECT Clientes.nome, Clientes.cidade, Pedidos.data_pedido FROM Clientes, Pedidos WHERE clienteID = TRUE;

SELECT nome, cidade FROM Clientes, Pedidos WHERE Clientes.id_cliente = Pedidos.clienteID;