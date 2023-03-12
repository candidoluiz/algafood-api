create table pedido
(
	id bigserial not null
	constraint pedido_pk primary key,

	subtotal decimal(10,2) not null,
	taxa_frete decimal(10,2) not null,
	valor_total decimal(10,2) not null,
	data_criacao timestamp(0) not null,
	data_confirmacao timestamp(0),
	data_cancelamento timestamp(0),
	data_entrega timestamp(0),

	restaurante_id bigint not null,
    usuario_cliente_id bigint not null,
	forma_pagamento_id bigint not null,
	endereco_cidade_id bigint not null,

	endereco_bairro varchar(60) not null,
	endereco_cep varchar(9) not null,
	endereco_complemento varchar(60),
	endereco_logradouro varchar(100) not null,
	endereco_numero varchar(20) not null,


	status varchar(10) not null,

    constraint fk_pedido_endereco_cidade foreign key (endereco_cidade_id) references cidade (id),
    constraint fk_pedido_restaurante foreign key (restaurante_id) references restaurante (id),
    constraint fk_pedido_usuario_cliente foreign key (usuario_cliente_id) references usuario (id),
    constraint fk_pedido_forma_pagamento foreign key (forma_pagamento_id) references forma_pagamento (id)
);

CREATE TABLE item_pedido
  (
     id             BIGSERIAL NOT NULL CONSTRAINT item_pedido_pk PRIMARY KEY,
     quantidade     INT NOT NULL,
     preco_unitario NUMERIC(10, 2) NOT NULL,
     preco_total    NUMERIC(10, 2) NOT NULL,
     observacao     VARCHAR NULL,
     pedido_id      BIGINT NOT NULL CONSTRAINT fk_item_pedido_pedido REFERENCES pedido,
     produto_id     BIGINT NOT NULL CONSTRAINT fk_item_pedido_produto REFERENCES produto
  );

