insert into cozinha (nome) values ('Tailandesa');
insert into cozinha (nome) values ('Indiana');

insert into forma_pagamento(descricao) values ('A vista');
insert into forma_pagamento(descricao) values ('Cartão');

insert into permissao(nome, descricao) values ('Inserir','Permite inserir dados no banco de dados');

insert into estado(nome) values ('São Paulo');
insert into estado(nome) values ('Minas Gerais');

insert into cidade (nome, estado_id) values ('Birigui', 1);
insert into cidade (nome, estado_id) values ('Araçatuba', 1);
insert into cidade (nome, estado_id) values ('Coroados', 1);



insert into restaurante (nome, taxa_frete, cozinha_id) values ('Lagurmet',5.00, 1);
insert into restaurante (nome, taxa_frete, cozinha_id) values ('Olivier',3.99, 1);
insert into restaurante (nome, taxa_frete, cozinha_id) values ('Tuk Tuk',15.99, 2);


