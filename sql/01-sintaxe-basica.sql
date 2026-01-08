-- Seleciona qual banco usar
use base_de_dados;

-- Mostra as tabelas
show tables;

-- Descreve os valores e tipos da tabela
describe users;

-- Inserir registros
INSERT INTO users (
    first_name,
    last_name,
    email,
    password_hash,
    created_at
  )
VALUES (*insira valores de placeholder*)

-- Seleciona colunas
select
first_name, id, email from users;

-- Especifica o que será e onde será alterado:
select * from users u 
where last_name="Rodrigues" AND created_at > "2026-01-06 16:12:48";

-- Seleciona valores entre os valores específicados BETWEEN
select * from users
where
id between 10 and 30;

-- Seleciona apenas os valores dentro da lista
select * from users
where id in (110, 47, 23);

-- Seleciona resultados semelhantes com a valor posicionado com a porcentagem
select * from users
where email like '%gmail.com';

-- Order defini a ordem em que os dados serão trazidos
select * from users
where id between 20 and 50

-- Defini o limite de valores e quantos serão pulados
select * from users
where id between 20 and 50
order by id asc
limit 6,3;

-- Insert com Select insere valores em uma tabela usando outra + concat que concatena valores e string em uma só celula
insert into profiles 
(bio, description, user_id) 
select 
concat('Bio de ', first_name),
concat('Description de', ' ', first_name),
id 
from users;

-- Deleta apenas os valores selecionados
delete from users where id = 51;

-- Atualiza registros
update users set last_name = "Ferreira" where id between 50 and 54;

-- inner join - Traz resultados de duas tabelas se os dados forem semelhantes
select users.first_name, profiles.bio
from users
inner join profiles
on users.id = profiles.user_id;

-- Left Join busca apenas os valores da tabela da esquerda, e os valores que tem semelhança com a tabela da direita são trazidos como NULL
select users.first_name, profiles.bio
from users
left join profiles
on users.id = profiles.user_id;

-- Right Join busca os valores da tabela da direita e os dados não atrelados há tabela da esquerda são trazidos como NULL (Importante checar se há uma FK, para que as alterações na tabela da esquerda consequentemente não afeta a tabela da direita)
select users.id as uid, profiles.id as pid,
profiles.bio, users.first_name
from users
right join profiles
on users.id = profiles.user_id;

-- Rand cria valores aleatórios e round arredonda valores ( Script que cria um valor aleatório para a coluna salários de usuários)
update users set salary = round(rand() *10000, 2);
select salary from users where salary between 1000 and 1500 order by salary asc limit 10; -- Seleciona os valores da tabela

--Insere permissões na tabela roles
insert into roles (name)
values
('POST'), ('PUT'), ('DELETE'), ('GET'); 

-- atribui roles a usuarios
insert into users_roles (user_id, role_id)
VALUES
(3, 3);

-- Seleciona e busca da tabela users_roles
select user_id, role_id from users_roles where
user_id = 1 and role_id = 1

-- Insere dados que foram selecionados e o que foi selecionado
insert into users_roles (user_id, role_id)
select id, (select id from roles order BY  rand() limit 1) as Permição from users; -- Seleciona IDs de users e seleciona de forma aleatória um valor da tabela roles

-- Insert Ignore insere dados na tabela reconhecendo os erros e pulando os valores que apresentem algum erro
insert ignore into users_roles (user_id, role_id)
select id, (select id from roles order BY  rand() limit 1) as Permição
from users order by rand() limit 3; -- Seleciona IDs de users e seleciona de forma aleatória um valor da tabela roles

-- Usando vários Joins - Seleciona uma tabela como a principal e filtra os dados pelas tabelas de roles e profiles
select
u.id as uid, u.first_name, p.bio, r.name as role_name
from users as u
left join profiles as p on u.id = p.user_id
inner join users_roles as ur on u.id = ur.user_id -- user_roles serve como ponto entre usuers e roles
inner join roles as r on ur.role_id = r.id
where u.id = 25 -- Busca apenas pelo ID selecionado
order by uid asc; -- Define a ordem

-- Update com JOINs - Usado para encontrar e atualizar dados que podem estar relacionados com outras tabelas
update users as u
join profiles as p
on p.user_id = u.id
set p.bio = concat('Bio de ', u.first_name, ' Atualizado')
where u.first_name = "Zia";

-- Usado para encontrar os dados são semelhantes em mais de uma tabela por uma tabela
select u.first_name, p.bio from users as u
join profiles as p
on p.user_id = u.id
where u.first_name = 'Zia';

-- Usado para deletar dados de uma tabela enquanto busca dados semelhantes entre duas tabelas (caso específicado com where)
delete p from users as u
join profiles as p
on p.user_id = u.id
where u.first_name = "Zia";

-- Group By - Usado para agrupar valores semelhantes como se fossem um
select first_name, count(id) as total from users -- count contabiliza os registros do valor inserido como parametro
group by first_name
order by total desc;

-- Exemplo de consulta mais complexa usando GROUP BY
select u.first_name, count(u.id) as total from users as u -- count contabiliza os registros do valor inserido como parametro
left join profiles as p
on p.user_id  = u.id
where u.id IN (12, 27, 23, 45, 67)
group by first_name
order by total desc;

-- Funções
select
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary,
count(salary) as count_salary
from users;

-- Exemplo usando todas as funções para fazer os cálculos do salário de uma equipe e agrupando por pessoa
select
u.first_name,
max(u.salary) as max_salary,
min(u.salary) as min_salary,
avg(u.salary) as avg_salary,
count(u.id) as total
from users u
left join profiles as p
on p.user_id = u.id 
group by  u.first_name
order by total desc;