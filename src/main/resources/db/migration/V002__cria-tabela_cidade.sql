-- auto-generated definition
create table cidade
(
    id          bigserial   not null
        constraint cidade_pk
            primary key,
    nome_cidade varchar(80) not null,
    nome_estado varchar(80) not null
);

alter table cidade
    owner to postgres;

