alter table restaurante add aberto boolean;
update restaurante set aberto = true;
alter table restaurante alter column aberto set not null;