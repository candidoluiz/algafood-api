CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
alter table pedido add codigo varchar(36);
update pedido set   codigo = uuid_generate_v4();
alter table pedido alter column codigo set not null;
create unique index uk_pedido_codigo on pedido (codigo);