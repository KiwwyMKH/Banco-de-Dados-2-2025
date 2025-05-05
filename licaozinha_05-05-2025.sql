USE clinica_medica;
-- CONTAR TODOS OS PACIENTES:

select COUNT(id) AS "N° Pacientes" from pacientes;

DESC medicos;
-- CADASTRANDO UM NOVO MÉDICO:

INSERT INTO medicos(nome, especialidade, crm, email) VALUES
("Carlos Villagran", "Cardiologia", "CRM 99142", "todonosachamoscarlosvillagran@gmail.com");

-- SELECIONANDO TODAS AS INFORMAÇÕES DA TABELA "MÉDICOS"
select * from medicos;

-- ATUALIZANDO O EMAIL PORQUE EU ERREI:
update medicos set email = "todosnosachamoscarlosvillagran@email.com" where 
id = 6;



--  EXIBIR A QUANTIDADE DE MÉDICOS PEDIATRAS:

SELECT especialidade,count(id) from medicos
WHERE especialidade = "pediatria";

-- EXIBIR A QUANTIDADE DE MÉDICOS POR ESPECIALIDADE

SELECT especialidade,count(id) AS "Quantidade" from medicos
group by especialidade;

-- Qual a média de idade dos pacientes?

SELECT avg(YEAR(CURDATE()) - YEAR(data_nascimento)) AS idade_media FROM pacientes;

-- Quantas consultas (agendamentos) foram realizadas por médico?

-- Quantidade de consultas por médico:

SELECT medicos.nome, count(agendamentos.id) FROM
medicos JOIN agendamentos ON medicos.id = agendamentos.medico_id
GROUP BY medicos.nome;

-- CADASTRANDO NOVA CONSULTA (AGENDAMENTO) PARA UM MÉDICO:

INSERT INTO agendamentos(paciente_id, medico_id, data_hora, tipo_consulta, status) VALUES 
(1,1, "2025-05-5 10:00","consulta de rotina","realizada");

-- EXIBIR O MÉDICO COM MAIS CONSULTAS:


SELECT medicos.nome, COUNT(agendamentos.id) tot_consultas FROM
medicos JOIN agendamentos ON medicos.id = agendamentos.medico_id
AND tot_consultas = MAX(tot_consultas)
group by medicos.nome;






