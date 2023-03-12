alter table restaurante add ativo boolean;
update restaurante set ativo = true;
alter table restaurante alter column ativo set not null;