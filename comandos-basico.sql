-- selecionar apenas uma tupla da tabela
select * from amigos where id = 5;

-- selecionando apenas uma tupla com o nome aparecendo
select amigos.nome, telefones.id_amigo from amigos, telefones where amigos.id = telefones.id_amigo and telefones.id_amigo = 5;

-- selecionando apenas o telefone da Cristina
select amigos.nome, telefones.numero
from amigos, telefones 
where amigos.id = telefones.id_amigo 
and amigos.nome = "Cristina;"

-- Na mesma query consultar o nome da coluna sendo igual ao nome escolhido
select telefones.nome 'Cristina' 
from amigos, telefones
where amigos.id = telefones.id_amigo 
and amigos.nome = "Cristina";

-- selecionando apenas uma coluna da tabela
select nome from amigos;

-- Obter dados dos clientes ordenados por ordem alfabetica do nome
select * from amigos order by nome ASC;
select nome from amigos order by ASC;

-- Obter todos os números que comecem com 5
select * from telefones where numero LIKE '5%' order by numero asc;

-- Obter todos os nomes que comecem com J
select * from amigos where nome LIKE 'J%' order by nome desc;

-- selecionando dois atributos de uma mesma tabela
select id, nome from amigos;

-- CRUD
--Update
UPDATE amigos set nome = "Maria" where nome = "Cristina";