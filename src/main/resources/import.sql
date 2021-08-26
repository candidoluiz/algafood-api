insert into cozinha (id,nome) values (1,'Tailandesa');
insert into cozinha (id,nome) values (2,'Indiana');

insert into forma_pagamento(descricao) values ('A vista');
insert into forma_pagamento(descricao) values ('Cartão');

insert into permissao(nome, descricao) values ('Inserir','Permite inserir dados no banco de dados');

insert into estado(nome) values ('São Paulo');

insert into cidade (nome, estado_id) values ('Birigui', 1);

insert into restaurante (nome, taxa_frete, cozinha_id, forma_pagamento_id) values ('Lagurmet',5.00, 1,1);
insert into restaurante (nome, taxa_frete, cozinha_id, forma_pagamento_id) values ('Olivier',3.99, 1,2);
insert into restaurante (nome, taxa_frete, cozinha_id, forma_pagamento_id) values ('Tuk Tuk',15.99, 2,2);


