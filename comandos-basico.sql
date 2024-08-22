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


-- =========== 09/08/2024

-- crescente
SELECT produto FROM produtos ORDER BY produto ASC;

-- decrescente
SELECT produto FROM produtos ORDER BY produto DESC;

-- Ordernar primeiro por cidade e nome
SELECT id, nome, email, cidade FROM clientes ORDER BY cidade, nome ASC;

-- Ordenar em ordem alfabética simultaneamente crescente
SELECT id, nome, email, cidade FROM clientes ORDER BY cidade ASC, nome ASC;

-- organizar a tabela "produto" do mais caro para o mais barato
SELECT id, produto, preco_unidade FROM produtos ORDER BY preco_unidade DESC;

-- encomenda mais recente:
SELECT * FROM encomendas ORDER BY data_hora DESC;

-- buscar os ultimos 10 dados
SELECT nome, email FROM clientes ORDER BY id ASC LIMIT 10;

-- pegar 20 dados a partir do id 6
SELECT id, nome, email FROM clientes LIMIT 20 OFFSET 5;

/*
==================== 14/08/2024
*/
SELECT id, nome, email FROM clientes LIMIT 10, 3;

-- buscar pelo produto mais caro
select * from produtos ORDER by preco_unidade DESC LIMIT 1
--buscar o produto mais barato
select * from produtos ORDER by preco_unidade ASC LIMIT 1;
-- 3 produtos mais caro
select * from produtos ORDER by preco_unidade DESC LIMIT 2,1;
-- DISTINCT = remove valores duplicados nas querys 
select DISTINCT cidade from clientes;
-- ordenar de forma alfabetica
select DISTINCT cidade from clientes order by cidade;
-- IMPORTANTE: se alguma coluna estiver com valores nulos (NULL), o distinct vai incluir  esse valor na consulta.

-- Buscar apenas dos clientes  que moram na cidade de LISBOA.
select * from clientes where cidade = "Lisboa";
select * from clientes where sexo = "f";
-- Homens que moram em Coimbra
select * from clientes where cidade = "Coimbra" and sexo = "m"; 
-- operadores lógicos usando os diferente "<>"
select * from colaboradores where sexo <> "f";
-- produtos cujo o preço é superior a 1 
select * from produtos where preco_unidade > 1;
-- buscando um intervalo de informações
select * from produtos where preco_unidade >=1 and preco_unidade <= 2;
-- neste caso só funciona com numeros e não com caracteres
-- OR
select nome, email from clientes where cidade = "Paris" OR sexo = "m";
--NOT 
select nome from clientes where NOT sexo = "m";
-- BETWEEN
select * from produtos where preco_unidade BETWEEN 1 and 2

-- buscar as encomendas na ultima 24h do dia 08/03/2030.
select * from encomendas where data_hora BETWEEN '2030-03-08 00:00:00' and '2030-03-08 23:59:59';

-- IN = devolve todos os registros que estejam compreendidos dentro de uma coleção de valores
select * from clientes where cidade IN("Lisboa", "Viseu");

--selecionando dados os caracteres específicos %

--Neste caso o que estiver na frente da% query fará a busca
select nome from clientes where nome LIKE "Daniel%";

--Neste caso os caracteres que estiver entre a % será buscado na query
select nome from clientes where nome LIKE "%Daniel%";

--Neste caso será buscado o que estiver depois da %
select nome, email from clientes where email LIKE "%gmail.com";

--Neste caso será feito uma busca dentro do compo onde o caracter começa com A e termina com S
select nome from clientes where nome LIKE "A%S";

-- Neste caso será buscado o que estiver antes da % e o "_" será mostrará o caractere que representa o espaça (um caracter)
select nome from clientes where nome LIKE "Francisc_%";

-- Neste caso o "_" está buscando caracteres não especificados, poré o terceiro caracter deverá ser a letra "a"
select nome from clientes where nome LIKE "__a%";

--======15/08/2024 ========

-- Bucar as primeiras 5 encomendas, juntando duas tabelas: encomendas e clientes. 

select clientes.nome, encomendas.id
from clientes, encomendas
where clientes.id = encomendas.id_cliente LIMIT 5

-- mesma query com ALIAS

select c.nome, e.*
from clientes c, encomendas e 
where c.id = e.id_cliente LIMIT 5;

-- concateção entre as colunas 
-- CONCAT
select CONCAT('O meu nome é ', nome, 'e meu email é: ', email) frase from clientes LIMIT 10;

--======== JOINS =====

--======== JOINS ======= junção 

/*(INNER) Join == Registros de retorno que têm valores correspondentes em ambas as tabelas

LEFT JOIN == Retorna todos os registros da tabela da esquerda e os registros combinados da tabela da direita

RIGHT JOIN == Retorna todos os registros da tabela da direita, e os registros combinados da tabela da esquerda

FULL JOIN Devolve todos os registros quando há uma correspondência na tabela da esquerda ou da direita 

mostrar a tabela de conjuntos do joins 
https://alyssontmv.wordpress.com/2014/09/30/representando-sql-joins-graficamente-exemplo-usado-em-aula/ 

=== Relações =====
encomendas X clientes
encomendas X colaboradores
encomendas_produtos X encomendas X produtos
*/

-- queremos dados sobre as encomendas de um cliente cujo o id = 20

select c. *, e.*
from cliente c
LEFT Join encomendas e 
on c.id = e.id_cliente
where c.id = 20; 

-- 20 primeiros clientes que fizeram encomendas na loja 

select e.id, e.data_hora, c.nome, c.email
from encomendas e
left join clientes c 
on e.id_cliente = c.id
LIMIT 20;

select count(*) total from encomendas_produtos;

-- detalhes da encomenda 3 
-- quando foi efetuada a compra 
-- que produtos foram comprados e as quantidades 

select
e.data_hora,
p.produto,
ep.quantidade,
CONCAT(round(p.preco_unidade * ep.quantidade,2), ' R$') as total
from encomendas_produtos ep left join
encomendas e 
on e.id = ep.id_encomenda
left join produtos p 
on p.id  = ep.id_produto
where e.id = 3
-- CONCAT == concatenação
-- round == vai arredondar os valores para duas casas decimais.
-- ========== 16/08/2024 ========
/*
Outras formas de agregação

MIN - Permitir ver o valor mínimo em um conjunto de resultados

MAX - Permitir ver o valor máximo em um conjunto de resultados
*/
-- quero saber qual é o primeiro cliente de Lisboa na tabela cliente.
SELECT id from clientes where cidade = "Lisboa" LIMIT 1
SELECT MIN(id) from clientes where cidade = "Lisboa"

SELECT MAX(id) from clientes where email LIKE "%gmail.com"

/*
AVG - Permitir calcular a média de um conjunto de resultados NUMÉRICO
SUM - Permite ver o somatório (calculo total) de um conjunto de resultados.
*/

-- média de preço dos produtos

select round(AVG(preco_unidade),2) preco_medio from produtos

select SUM(preco_unidade) total_preco from produtos

--Vamos calcular uma determinada encomenda, buscando primeiramente seus dados. (id = 50).

select
e.id, --atributo da tabela encomenda
e.data_hora, --atributo da tabela encomenda
p.produto, --atributo da tabela produto
p.preco_unidade, --atributo da tabela produto
ep.quantidade --atributo da tabela encomenda_produto 
from encomendas_produtos ep 
LEFT Join encomendas e 
on ep.id_encomenda = e.id
LEFT JOIN produtos p 
on ep.id_produto = p.id
where e.id = 50;


-- 3 produtos ( preco_unidade * quantidade)
select
e.id, 
e.data_hora, 
p.produto, 
p.preco_unidade, 
ep.quantidade, 
CAST(ep.quantidade * p.preco_unidade As decimal(10,2)) AS total
from encomendas_produtos ep 
LEFT Join encomendas e 
on ep.id_encomenda = e.id
LEFT JOIN produtos p 
on ep.id_produto = p.id
where e.id = 50;

-- subquery 

select id_encomenda, id_cliente, SUM(total) total
from
(
    select
    ep.id_encomenda,
    e.id_cliente,
    ep.quantidade,
    p.produto, CAST(ep.quantidade * p.preco_unidade As decimal(10,2)) AS total
    from encomendas_produtos ep
    left join produtos p on ep.id_produto = p.id
    left join encomendas e on e.id = ep.id_encomenda
    where e.id = 50
)a 
Group by id_encomenda 


