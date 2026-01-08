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

