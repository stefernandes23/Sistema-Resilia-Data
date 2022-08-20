CREATE TABLE "tb_relatorio" (
  "id_relatorio" integer primary key,
  "id_empresa_parceira" integer,
  "id_tecnologia" integer,
  "id_dados" integer,
  "id_area" integer,
  "id_data" date
);

CREATE TABLE "tb_empresa_parceira" (
  "id_cadastro_empresa" integer primary key,
  cnpj varchar (14), 
  "nome_empresa" varchar(50)
);

CREATE TABLE "tb_tecnologia" (
  "id_tecnologia" integer primary key,
  "tecnologia" varchar(50),
  "nome_area" varchar(40)
);

CREATE TABLE "tb_banco_de_dados" (
  "id_dados" integer primary key,
  "bd" varchar(20)
);

CREATE TABLE "tb_area" (
  "id_area" integer primary key,
  "nome_area" varchar(50)
);

-- ALTERAR AS CARACTERÍSITCAS DE UMA TABELA EXISTENTE E AS COLUNAS, como adicionar FOREIGN KEY --
ALTER TABLE "tb_relatorio" ADD FOREIGN KEY ("id_empresa_parceira") REFERENCES "tb_empresa_parceira" ("id_cadastro_empresa");
ALTER TABLE "tb_relatorio" ADD FOREIGN KEY ("id_dados") REFERENCES "tb_banco_de_dados" ("id_dados");
ALTER TABLE "tb_relatorio" ADD FOREIGN KEY ("id_tecnologia") REFERENCES "tb_tecnologia" ("id_tecnologia");
ALTER TABLE "tb_relatorio" ADD FOREIGN KEY ("id_area") REFERENCES "tb_area" ("id_area");

-- APAGAR OS DADOS SEM APAGAR AS ENTIDADES --
truncate tb_empresa_parceira cascade

-- INSERIR DADOS PARA AS TABELAS --
--1º
insert into tb_banco_de_dados (id_dados, bd) values (1, 'mysql');
insert into tb_banco_de_dados (id_dados, bd) values (2, 'postgres');
--2º
insert into tb_empresa_parceira (id_cadastro_empresa, CNPJ, nome_empresa) values (1, '16992995169225', 'Light Energia');
insert into tb_empresa_parceira (id_cadastro_empresa, CNPJ, nome_empresa) values (2, '74859246358712', 'Energisa');
insert into tb_empresa_parceira (id_cadastro_empresa, CNPJ, nome_empresa) values (3, '55447812369523', 'CEB');
insert into tb_empresa_parceira (id_cadastro_empresa, CNPJ, nome_empresa) values (4, '36985963472589', 'NEOenergia');
--3º
insert into tb_tecnologia (id_tecnologia, tecnologia, nome_area) values (1, 'data', 'backend');
insert into tb_tecnologia (id_tecnologia, tecnologia, nome_area) values (2, 'css', 'frontend');
--4º
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (1, 1, 2,1,1,'2022-01-22');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (2, 1, 2,1,2,'2022-01-22');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (3, 2, 2,1,2,'2022-01-23');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (4, 3, 1,2,1,'2022-01-31');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (5, 1, 1,2,2, '2021-02-03');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (6, 1, 1,2,2, '2021-02-03');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (7, 4, 1,1,1, '2021-02-25');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (8, 2, 2,2,2, '2021-02-14');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (9, 4, 1,1,1, '2022-01-06');
insert into tb_relatorio (id_relatorio, id_empresa_parceira,id_dados,id_area,id_tecnologia, id_data) values (10,4, 2,2,2,'2021-02-23');
--5º
insert into tb_area (id_area, nome_area) values (1, 'data');
insert into tb_area (id_area, nome_area) values (2, 'web developer');

-- SELECIONAR PARA VERIFICAÇÃO -- 
select * from tb_relatorio order by 1;
select * from tb_empresa_parceira;
select * from tb_banco_de_dados;
select * from tb_tecnologia;
select * from tb_area;


