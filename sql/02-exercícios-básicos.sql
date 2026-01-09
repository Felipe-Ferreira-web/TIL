-- 1) Insira 5 usuários
-- 2) Insira 5 perfís para os usuários inseridos
-- 3) Insira permissões (roles) para os usuários inseridos
-- 4) Selecione os últimos 5 usuários por ordem decrescente
-- 5) Atualize o último usuário inserido
-- 6) Remova uma permissão de algum usuário
-- 7) Remova um usuário que tem a permissão "PUT"
-- 8) Selecione usuários com perfís e permissões (obrigatório)
-- 9) Selecione usuários com perfís e permissões (opcional)
-- 10) Selecione usuários com perfís e permissões ordenando por salário

-- 1) Insira 5 usuários
Insert into users (
first_name,
last_name,
email,
password_hash
)
VALUES (
"Josías",
"Mileto",
"josias@gmail.com",
"123123123123"
),
(
"Marcelo",
"Monte",
"marcelo@gmail.com",
"345345345"
),
(
"Larissa",
"Manoela",
"larrisa@gmail.com",
"34534534534"
),
(
"Gabriel",
"Rodrigues",
"gabrield@gmail.com",
"4534534534"
),
(
"Matheus",
"Fontes",
"matheus@gmail.com",
"435322342342"
);

-- 2) Insira 5 perfís para os usuários inseridos
insert into profiles (bio, description, user_id)
select 
concat("Bio de ", first_name), concat("Description de ", first_name), id
from users
where first_name in ( "Josías", "Marcelo", "Larissa", "Gabriel", "Matheus");

-- 3) Insira permissões (roles) para os usuários inseridos
insert into users_roles (user_id, role_id)
select id, 5
from users
where id in (112, 113, 114, 115, 116);

-- 4) Selecione os últimos 5 usuários por ordem decrescente
select * from users
where id in (112, 113, 114, 115, 116)
order by id desc;

-- 5) Atualize o último usuário inserido
update users set last_name = 'Fonseca'
where id = 116;

-- 6) Remova uma permissão de algum usuário
delete from users_roles
where user_id = 113 and role_id = 5;

-- 7) Remova um usuário que tem a permissão "PUT"
insert into users_roles (user_id, role_id) -- Adicionarei a permissão antes
select id, 3 -- ID da permissão PUT
from users
where id in 115;

delete from users_roles -- Agora que o usuário 115 tem a permissão PUT, eu posso remova-la especificando seu ID e qual permissão eu quero remove-la
where user_id = 115 and role_id = 3;

-- 8) Selecione usuários com perfís e permissões (obrigatório)
select u.id as uid, u.first_name, p.bio, r.name as role_name -- Seleciona q quais campos eu quero que sejam trazidos
from users as u -- Seleciona a tabela principal que será relacionada com as outras
inner join profiles as p on u.id = p.user_id -- Seleciona apenas os usuários que tem perfil filtrando pelo id
inner join users_roles as ur on u.id = ur.user_id -- Seleciona todos os usuários que tem permições
inner join roles as r; -- Seleciona todas as permições de cada usuário (Não foi solicitado, mas ajuda na leiturada da tabela)

-- 9) Selecione usuários com perfís e permissões (opcional)
select u.id as uid, u.first_name, p.bio, r.name as role_name -- Seleciona q quais campos eu quero que sejam trazidos
from users as u -- Seleciona a tabela principal que será relacionada com as outras
left join profiles as p on u.id = p.user_id -- Seleciona todos os usuários da tabela e aqueles que não tem perfil, mas ainda filtra o restante pelo id
left join users_roles as ur on u.id = ur.user_id -- Mesma coisa que profiles, usando o filtro por id
inner join roles as r; -- Seleciona todas as permições de cada usuário (Não foi solicitado, mas ajuda na leiturada da tabela)

-- 10) Selecione usuários com perfís e permissões ordenando por salário
select u.id as uid, u.first_name, p.bio, r.name as role_name, u.salary -- Seleciona q quais campos eu quero que sejam trazidos
from users as u -- Seleciona a tabela principal que será relacionada com as outras
left join profiles as p on u.id = p.user_id -- Seleciona todos os usuários da tabela e aqueles que não tem perfil, mas ainda filtra o restante pelo id
left join users_roles as ur on u.id = ur.user_id -- Mesma coisa que profiles, usando o filtro por id
inner join roles as r -- Seleciona todas as permições de cada usuário (Não foi solicitado, mas ajuda na leiturada da tabela)
order by salary asc;
