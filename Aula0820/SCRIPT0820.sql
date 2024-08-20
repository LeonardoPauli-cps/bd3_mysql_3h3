select * from departamento where nome like "%d%"; -- anotado no caderno
select count(cod_depto) from departamento; -- quantidade de departamentos
										   -- que tem na empresa
									
select emp.nome as Empregado, 
dep.nome as Departamento 
from empregado emp, departamento dep
where dep.cod_depto = emp.cod_depto;

-- comando para calcular os anos que o empregado trabalha
-- e sua idade
select emp.nome,
timestampdiff(year, dt_admissao,
curdate()) as Anos_Admitido,
timestampdiff(year, dt_nascimento,
curdate()) as Idade
from empregado emp;

-- comando professor
select nome as Empregado,
format((datediff(now(), dt_nascimento) / 365), 0) as idade,
format((datediff(now(), dt_admissao) / 365), 0) as tempo_empresa
from empregado;

-- comando para calcular um mes antes do aniversario do 
-- empregado
select nome, dt_nascimento,
date_sub(date(concat(year(curdate()), '-',
date_format(dt_nascimento, '%m-%d'))), interval 1 month) as um_mes_antes
from empregado;

-- comando professor
SELECT
    nome AS Empregado,
    FORMAT((DATEDIFF(NOW(), dt_nascimento) / 365), 0) AS idade,
    FORMAT((DATEDIFF(NOW(), dt_admissao) / 365), 0) AS tempo_empresa,
    DATE_FORMAT(DATE_SUB(dt_admissao, INTERVAL 1 MONTH), CONCAT(YEAR(CURDATE()), "/%m/%d")) AS ferias
FROM
    empregado;
