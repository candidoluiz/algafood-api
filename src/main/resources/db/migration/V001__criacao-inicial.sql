create table cozinha
(
	id bigserial not null
		constraint cozinha_pk
			primary key,
	nome varchar(60)
);