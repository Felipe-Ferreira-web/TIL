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
VALUES (*insira valores de placeholder genérico*)

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