SELECT 
    p.nome AS paciente,
    SUM(m.preco) AS total_gasto
FROM Prescricoes pr
JOIN HistoricoMedico hm ON pr.historico_medico_id = hm.id
JOIN Pacientes p ON hm.paciente_id = p.id
JOIN Medicamentos m ON pr.medicamento_id = m.id
GROUP BY p.nome;

SELECT 
    e.nome AS exame,
    p.nome AS paciente,
    re.data_realizacao
FROM ResultadosExames re
JOIN HistoricoMedico hm ON re.historico_medico_id = hm.id
JOIN Pacientes p ON hm.paciente_id = p.id
JOIN Exames e ON re.exame_id = e.id;

SELECT 
    fabricante,
    AVG(preco) AS preco_medio
FROM Medicamentos
GROUP BY fabricante;

SELECT DISTINCT m.nome
FROM Prescricoes pr
JOIN HistoricoMedico hm ON pr.historico_medico_id = hm.id
JOIN Medicos m ON hm.medico_id = m.id;

SELECT 
    p.nome,
    COUNT(re.id) AS total_exames
FROM ResultadosExames re
JOIN HistoricoMedico hm ON re.historico_medico_id = hm.id
JOIN Pacientes p ON hm.paciente_id = p.id
GROUP BY p.nome
HAVING COUNT(re.id) > 1;

SELECT 
    m.nome,
    COUNT(DISTINCT hm.paciente_id) AS pacientes_unicos
FROM HistoricoMedico hm
JOIN Medicos m ON hm.medico_id = m.id
GROUP BY m.nome;

SELECT 
    med.nome,
    COUNT(pr.id) AS total_prescricoes
FROM Prescricoes pr
JOIN Medicamentos med ON pr.medicamento_id = med.id
GROUP BY med.nome
ORDER BY total_prescricoes DESC
LIMIT 3;


