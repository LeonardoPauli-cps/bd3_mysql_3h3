-- COMEÇAR SEMPRE
use empregados_doubleL;

-- SELECT SIMPLES
select * from empregado;

-- FILTRO DE ESTADO CIVIL
select cod_emp from empregado where civil like 'v';

-- FILTRO POR ATRIBUTO DA TABELA ESTRANGEIRA COM USO DE SUBQUERY
-- SUBQUERY: QUERY SUBORDINADA
select * from dependente where cod_emp in(
select cod_emp from empregado where civil like 'v'
);
/*Desafio quero os dependentes dos funcionarios com mais de 5 anos de empresa*/

select * from dependente where cod_emp in(
select cod_emp from empregado where format((datediff(now(), dt_admissao) / 365),0) >=5
);

/*Desafio quero os dependentes dos funcionarios com mais de 40 anos de idade*/

select * from dependente where cod_emp in(
select cod_emp from empregado where format((datediff(now(), dt_nascimento) / 365),0) >=40
);