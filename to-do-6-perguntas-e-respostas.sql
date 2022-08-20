1. Qual empresa utiliza o maior número de tecnologias na última pesquisa (1/2022)?

select nome_empresa 
from tb_empresa_parceira 
	where id_cadastro_empresa in (select id_empresa_parceira 
								  from tb_relatorio 
								  group by id_empresa_parceira  
								  having count(id_tecnologia) in (select count(id_tecnologia) 
																  from tb_relatorio 
																  where cast(id_data as varchar(10)) like '2022%' 
																  group by id_empresa_parceira
																  order by  1 desc limit 1));

2. Qual empresa utilizava o menor número de tecnologias na pesquisa anterior (2/2021)?
select nome_empresa 
from tb_empresa_parceira 
	where id_cadastro_empresa in (select id_empresa_parceira 
								  from tb_relatorio 
								  group by id_empresa_parceira  
								  having count(id_tecnologia) in (select count(id_tecnologia) 
																  from tb_relatorio 
																  where cast(id_data as varchar(10)) like '2021%' 
																  group by id_empresa_parceira
																  having count(id_tecnologia) = (select count(id_tecnologia) 
																								 from tb_relatorio 
																								 group by id_empresa_parceira 
																								 order by 1 
																								 asc limit 1) 
																  order by  1 desc));

3. Quantas empresas utilizam tecnologias da área de “Dados” atualmente?

-- 1ª solução:
select tb_area.nome_area, count(id_empresa_parceira) from tb_relatorio inner join tb_area on tb_relatorio.id_area = tb_area.id_area group by tb_area.nome_area having  tb_area.nome_area = 'data';
-- 2ª solução:
solução: select tb_area.nome_area, count(id_empresa_parceira) from tb_relatorio inner join tb_area using (id_area) where id_area = 1 group by tb_area.nome_area ;



4. Quantas empresas utilizam tecnologias que não são da área de “Dados” atualmente?

-- 1ª solução:
select tb_area.nome_area, count(id_empresa_parceira) from tb_relatorio inner join tb_area using (id_area) where id_area <> 1 group by tb_area.nome_area ;
-- 2ª solução:
select tb_area.nome_area, count(id_empresa_parceira) from tb_relatorio inner join tb_area on tb_relatorio.id_area = tb_area.id_area group by tb_area.nome_area having  tb_area.nome_area <> 'data';


