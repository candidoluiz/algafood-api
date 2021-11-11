-- auto-generated definition
create table estado
(
    id   bigserial   not null
        constraint estado_pk
            primary key,
    nome varchar(80) not null
);

alter table estado
    owner to postgres;



insert into estado(nome) select distinct nome_estado from cidade;

ALTER TABLE cidade ADD COLUMN estado_id BIGINT;

update cidade c set estado_id = (select e.id from estado e where e.nome = c.nome_estado);

ALTER TABLE cidade ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id);

ALTER TABLE cidade DROP COLUMN nome_estado;

ALTER TABLE cidade RENAME COLUMN nome_cidade TO nome;

ALTER TABLE cidade ALTER COLUMN nome TYPE VARCHAR(80);

ALTER TABLE cidade ALTER COLUMN nome SET NOT NULL;

ALTER TABLE cidade ALTER COLUMN estado_id SET NOT NULL;