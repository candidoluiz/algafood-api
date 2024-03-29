
begin work;

lock table
cidade,
cozinha,
estado,
forma_pagamento,
grupo,
grupo_permissao,
permissao,
produto,
restaurante,
restaurante_forma_pagamento,
usuario,
usuario_grupo,
restaurante_usuario_responsavel,
pedido,
item_pedido,
foto_produto,
oauth_client_details;

ALTER TABLE cidade DISABLE TRIGGER ALL;
ALTER TABLE cozinha DISABLE TRIGGER ALL;
ALTER TABLE estado DISABLE TRIGGER ALL;
ALTER TABLE forma_pagamento DISABLE TRIGGER ALL;
ALTER TABLE grupo DISABLE TRIGGER ALL;
ALTER TABLE grupo_permissao DISABLE TRIGGER ALL;
ALTER TABLE permissao DISABLE TRIGGER ALL;
ALTER TABLE produto DISABLE TRIGGER ALL;
ALTER TABLE restaurante DISABLE TRIGGER ALL;
ALTER TABLE restaurante_forma_pagamento DISABLE TRIGGER ALL;
ALTER TABLE usuario DISABLE TRIGGER ALL;
ALTER TABLE usuario_grupo DISABLE TRIGGER ALL;
ALTER TABLE restaurante_usuario_responsavel DISABLE TRIGGER ALL;
ALTER TABLE pedido DISABLE TRIGGER ALL;
ALTER TABLE item_pedido DISABLE TRIGGER ALL;
ALTER TABLE foto_produto DISABLE TRIGGER ALL;

delete from cidade;
delete from cozinha;
delete from estado;
delete from forma_pagamento;
delete from grupo;
delete from grupo_permissao;
delete from permissao;
delete from produto;
delete from restaurante;
delete from restaurante_forma_pagamento;
delete from usuario;
delete from usuario_grupo;
delete from restaurante_usuario_responsavel;
delete from pedido;
delete from item_pedido;
delete from foto_produto;
delete from oauth_client_details;


ALTER SEQUENCE cidade_id_seq RESTART WITH 1;
ALTER SEQUENCE cozinha_id_seq RESTART WITH 1;
ALTER SEQUENCE estado_id_seq RESTART WITH 1;
ALTER SEQUENCE forma_pagamento_id_seq RESTART WITH 1;
ALTER SEQUENCE grupo_id_seq RESTART WITH 1;
ALTER SEQUENCE permissao_id_seq RESTART WITH 1;
ALTER SEQUENCE produto_id_seq RESTART WITH 1;
ALTER SEQUENCE restaurante_id_seq RESTART WITH 1;
ALTER SEQUENCE usuario_id_seq RESTART WITH 1;
ALTER SEQUENCE pedido_id_seq RESTART WITH 1;
ALTER SEQUENCE item_pedido_id_seq RESTART WITH 1;

--Começa aqui

insert into cozinha (nome) values ('Tailandesa');
insert into cozinha (nome) values ('Indiana');
insert into cozinha (nome) values ('Argentina');
insert into cozinha (nome) values ('Brasileira');

insert into estado (nome) values ('Minas Gerais');
insert into estado (nome) values ('São Paulo');
insert into estado (nome) values ('Ceará');


insert into cidade (nome, estado_id) values ('Uberlândia', 1);
insert into cidade (nome, estado_id) values ('Belo Horizonte', 1);
insert into cidade (nome, estado_id) values ('São Paulo', 2);
insert into cidade (nome, estado_id) values ('Campinas', 2);
insert into cidade (nome, estado_id) values ('Fortaleza', 3);



insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto,endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values ('Thai Gourmet', 10, 1, timezone('utc', now()), timezone('utc', now()), true, true, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values ('Thai Delivery',9.50, 1, timezone('utc', now()),timezone('utc', now()), true, true);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values ('Olivier',3.99, 1, timezone('utc', now()), timezone('utc', now()), true, true);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values ('Tuk Tuk Comida Indiana',15.99, 2, timezone('utc', now()), timezone('utc', now()), true, true);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values ('Java Steakhouse',12.3, 3, timezone('utc', now()), timezone('utc', now()), true, true);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values ('Lanchonete do Tio Sam',11.4, 4, timezone('utc', now()), timezone('utc', now()), true, true);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values ('Bar da Maria',6, 4, timezone('utc', now()), timezone('utc', now()), true, true);

insert into forma_pagamento(descricao, data_atualizacao) values ('Cartão de crédito', timezone('utc', now()));
insert into forma_pagamento(descricao, data_atualizacao) values ('Cartão de débito', timezone('utc', now()));
insert into forma_pagamento(descricao, data_atualizacao) values ('Dinheiro', timezone('utc', now()));

--insert into permissao (nome, descricao) values ('CONSULTAR_COZINHAS','Permite consultar cozinhas');
insert into permissao (nome, descricao) values ('EDITAR_COZINHAS','Permite editar cozinhas');
--insert into permissao (nome, descricao) values ('CONSULTAR_FORMAS_PAGAMENTO', 'Permite consultar formas de pagamento');
insert into permissao (nome, descricao) values ('EDITAR_FORMAS_PAGAMENTO', 'Permite criar ou editar formas de pagamento');
--insert into permissao (nome, descricao) values ('CONSULTAR_CIDADES', 'Permite consultar cidades');
insert into permissao (nome, descricao) values ('EDITAR_CIDADES', 'Permite criar ou editar cidades');
--insert into permissao (nome, descricao) values ('CONSULTAR_ESTADOS', 'Permite consultar estados');
insert into permissao (nome, descricao) values ('EDITAR_ESTADOS', 'Permite criar ou editar estados');
insert into permissao (nome, descricao) values ('CONSULTAR_USUARIOS_GRUPOS_PERMISSOES', 'Permite consultar usuários');
insert into permissao (nome, descricao) values ('EDITAR_USUARIOS_GRUPOS_PERMISSOES', 'Permite criar ou editar usuários');
--insert into permissao (nome, descricao) values ('CONSULTAR_RESTAURANTES', 'Permite consultar restaurantes');
insert into permissao (nome, descricao) values ('EDITAR_RESTAURANTES', 'Permite criar, editar ou gerenciar restaurantes');
--insert into permissao (nome, descricao) values ('CONSULTAR_PRODUTOS', 'Permite consultar produtos');
--insert into permissao (nome, descricao) values ('EDITAR_PRODUTOS', 'Permite criar ou editar produtos');
insert into permissao (nome, descricao) values ('CONSULTAR_PEDIDOS', 'Permite consultar pedidos');
insert into permissao (nome, descricao) values ('GERENCIAR_PEDIDOS', 'Permite gerenciar pedidos');
insert into permissao (nome, descricao) values ('GERAR_RELATORIOS', 'Permite gerar relatórios');

insert into restaurante_forma_pagamento(restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3);

insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, false, 1);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6);

insert into usuario (nome, email, senha, data_cadastro) values
('João da Silva', 'joao.ger@algafood.com', '$2a$12$LYwcgZqNVBvPchIwwRZNzO0lxqu8KnhST.wdTQW4IjBx3r7h8r8m2', timezone('utc', now())),
('Maria Joaquina', 'maria.vnd@algafood.com', '$2a$12$LYwcgZqNVBvPchIwwRZNzO0lxqu8KnhST.wdTQW4IjBx3r7h8r8m2', timezone('utc', now())),
('José Souza', 'jose.aux@algafood.com', '$2a$12$LYwcgZqNVBvPchIwwRZNzO0lxqu8KnhST.wdTQW4IjBx3r7h8r8m2', timezone('utc', now())),
('Sebastião Martins', 'sebastiao.cad@algafood.com', '$2a$12$LYwcgZqNVBvPchIwwRZNzO0lxqu8KnhST.wdTQW4IjBx3r7h8r8m2', timezone('utc', now())),
('Manoel Lima', 'manoel.loja@gmail.com', '$2a$12$LYwcgZqNVBvPchIwwRZNzO0lxqu8KnhST.wdTQW4IjBx3r7h8r8m2', timezone('utc', now())),
('Débora Mendonça', 'luiz.fernando360+debora@gmail.com', '$2a$12$LYwcgZqNVBvPchIwwRZNzO0lxqu8KnhST.wdTQW4IjBx3r7h8r8m2', timezone('utc', now())),
('Carlos Lima', 'luiz.fernando360+carlos@gmail.com', '$2a$12$LYwcgZqNVBvPchIwwRZNzO0lxqu8KnhST.wdTQW4IjBx3r7h8r8m2', timezone('utc', now()));

insert into grupo (nome) values ('Gerente'), ('Vendedor'), ('Secretária'), ('Cadastrador');

-- Adiciona todas as permissoes no grupo do gerente
insert into grupo_permissao (grupo_id, permissao_id)
select 1, id from permissao;

-- Adiciona permissoes no grupo do vendedor
insert into grupo_permissao (grupo_id, permissao_id)
select 2, id from permissao where nome like 'CONSULTAR_%';

--insert into grupo_permissao (grupo_id, permissao_id) values (2, 14);

insert into grupo_permissao (grupo_id, permissao_id)
select 2, id from permissao where nome = 'EDITAR_RESTAURANTES';

-- Adiciona permissoes no grupo do auxiliar
insert into grupo_permissao (grupo_id, permissao_id)
select 3, id from permissao where nome like 'CONSULTAR_%';

-- Adiciona permissoes no grupo cadastrador
insert into grupo_permissao (grupo_id, permissao_id)
select 4, id from permissao where nome like '%_RESTAURANTES';

insert into usuario_grupo (usuario_id, grupo_id) values (1, 1), (1, 2), (2, 2), (3, 3), (4, 4);

insert into restaurante_usuario_responsavel (restaurante_id, usuario_id) values (1, 5), (3, 5);

insert into pedido (codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep,
    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
    status, data_criacao, subtotal, taxa_frete, valor_total)
values ('2de56aec-efca-4d93-b75b-129642fb4794',1, 6, 1, 1, '38400-000', 'Rua Floriano Peixoto', '500', 'Apto 801', 'Brasil',
'CRIADO', timezone('utc', now()), 298.90, 10, 308.90);

insert into item_pedido (pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (1, 1, 1, 78.9, 78.9, null);

insert into item_pedido (pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (1, 2, 2, 110, 220, 'Menos picante, por favor');

insert into pedido (codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep,
        endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
        status, data_criacao, subtotal, taxa_frete, valor_total)
values ('f3665920-689f-441e-9d27-8306c0f5bd72', 4, 6, 2, 1, '38400-111', 'Rua Acre', '300', 'Casa 2', 'Centro',
'CRIADO', timezone('utc', now()), 79, 0, 79);

insert into item_pedido (pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (2, 6, 1, 79, 79, 'Ao ponto');

insert into pedido (codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep,
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
values ('b5741512-8fbc-47fa-9ac1-b530354fc0ff', 1, 6, 1, 1, '38400-222', 'Rua Natal', '200', null, 'Brasil',
        'ENTREGUE', '2019-10-30 21:10:00', '2019-10-30 21:10:45', '2019-10-30 21:55:44', 110, 10, 120);

insert into item_pedido (pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (3, 2, 1, 110, 110, null);


insert into pedido (codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep,
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
values ('5c621c9a-ba61-4454-8631-8aabefe58dc2', 1, 7, 1, 1, '38400-800', 'Rua Fortaleza', '900', 'Apto 504', 'Centro',
        'ENTREGUE', '2019-11-02 20:34:04', '2019-11-02 20:35:10', '2019-11-02 21:10:32', 174.4, 5, 179.4);

insert into item_pedido (pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (4, 3, 2, 87.2, 174.4, null);


insert into pedido (codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep,
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
values ('8d774bcf-b238-42f3-aef1-5fb388754d63', 1, 7, 2, 1, '38400-200', 'Rua 10', '930', 'Casa 20', 'Martins',
        'ENTREGUE', '2019-11-03 02:00:30', '2019-11-03 02:01:21', '2019-11-03 02:20:10', 87.2, 10, 97.2);

insert into item_pedido (pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (5, 3, 1, 87.2, 87.2, null);


insert into oauth_client_details(client_id, resource_ids, client_secret, scope, authorized_grant_types,
                                 web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity,
                                  autoapprove)
values ('algafood-web',null,'$2a$12$B5zXQtqpJjJp7HQ013ozHeynnfsKnIh3bxpIQ6PXFx3Zsj9B2727K','READ,WRITE','password',null,null,60*60*6,60*24*60*60,null);

insert into oauth_client_details (
  client_id, resource_ids, client_secret,
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
values (
  'foodanalytics', null, '$2a$12$cNvX6D5NX822DO2PaDJdqeXa2Zj3yjqdf0AwD4tjpwH.qjLw1uiIq',
  'READ,WRITE', 'authorization_code', 'http://localhost:5500', null,
  null, null, null
);

insert into oauth_client_details (
  client_id, resource_ids, client_secret,
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
values (
  'faturamento', null, '$2y$12$fHixriC7yXX/i1/CmpnGH.RFyK/l5YapLCFOEbIktONjE8ZDykSnu',
  'READ,WRITE', 'client_credentials', null, 'CONSULTAR_PEDIDOS,GERAR_RELATORIOS',
  null, null, null
);
--acaba aqui

ALTER TABLE cidade ENABLE TRIGGER ALL;
ALTER TABLE cozinha ENABLE TRIGGER ALL;
ALTER TABLE estado ENABLE TRIGGER ALL;
ALTER TABLE forma_pagamento ENABLE TRIGGER ALL;
ALTER TABLE grupo ENABLE TRIGGER ALL;
ALTER TABLE grupo_permissao ENABLE TRIGGER ALL;
ALTER TABLE permissao ENABLE TRIGGER ALL;
ALTER TABLE produto ENABLE TRIGGER ALL;
ALTER TABLE restaurante ENABLE TRIGGER ALL;
ALTER TABLE restaurante_forma_pagamento ENABLE TRIGGER ALL;
ALTER TABLE usuario ENABLE TRIGGER ALL;
ALTER TABLE usuario_grupo ENABLE TRIGGER ALL;
ALTER TABLE restaurante_usuario_responsavel ENABLE TRIGGER ALL;
ALTER TABLE pedido ENABLE TRIGGER ALL;
ALTER TABLE item_pedido ENABLE TRIGGER ALL;
ALTER TABLE foto_produto ENABLE TRIGGER ALL;

commit work;