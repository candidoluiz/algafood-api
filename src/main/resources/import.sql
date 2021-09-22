insert into cozinha (nome) values ('Tailandesa');
insert into cozinha (nome) values ('Indiana');

insert into forma_pagamento(descricao) values ('Cartão de crédito');
insert into forma_pagamento(descricao) values ('Cartão de débito');
insert into forma_pagamento(descricao) values ('Dinheiro');

insert into permissao(nome, descricao) values ('Inserir','Permite inserir dados no banco de dados');

insert into estado(nome) values ('São Paulo');
insert into estado(nome) values ('Minas Gerais');

insert into cidade (nome, estado_id) values ('Birigui', 1);
insert into cidade (nome, estado_id) values ('Araçatuba', 1);
insert into cidade (nome, estado_id) values ('Coroados', 1);



insert into restaurante (nome, taxa_frete, cozinha_id) values ('Thai Gurmet',10.00, 1);
insert into restaurante (nome, taxa_frete, cozinha_id) values ('Thai Delivery',0.00, 1);
insert into restaurante (nome, taxa_frete, cozinha_id) values ('Olivier',3.99, 1);
insert into restaurante (nome, taxa_frete, cozinha_id) values ('Tuk Tuk Comida Indiana',15.99, 2);

insert into restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1,1), (1,2), (1,3), (2,3), (3,2), (3,3);


