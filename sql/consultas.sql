-- CONSULTA PRINCIPAL: Total de chamadas de suporte abertas por usuário
-- Esta é a consulta solicitada no teste

SELECT 
    u.id as id_usuario,
    u.nome,
    u.email,
    u.departamento,
    COUNT(t.id) as total_chamadas_abertas,
    COUNT(CASE WHEN t.status = 'aberto' THEN 1 END) as chamadas_ativas,
    COUNT(CASE WHEN t.status = 'fechado' THEN 1 END) as chamadas_fechadas,
    MIN(t.aberto_em) as primeira_chamada,
    MAX(t.aberto_em) as ultima_chamada
FROM usuarios u
LEFT JOIN tickets t ON u.id = t.id_do_usuario
GROUP BY u.id, u.nome, u.email, u.departamento
HAVING COUNT(t.id) > 0  -- Apenas usuários com chamadas
ORDER BY total_chamadas_abertas DESC, u.nome;

-- CONSULTAS ADICIONAIS PARA ANÁLISE

-- 1. Resumo por status
SELECT 
    status,
    COUNT(*) as quantidade,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentual
FROM tickets
GROUP BY status
ORDER BY quantidade DESC;

-- 2. Chamadas por departamento
SELECT 
    u.departamento,
    COUNT(t.id) as total_chamadas,
    COUNT(CASE WHEN t.status = 'aberto' THEN 1 END) as abertas,
    COUNT(CASE WHEN t.status = 'fechado' THEN 1 END) as fechadas
FROM usuarios u
LEFT JOIN tickets t ON u.id = t.id_do_usuario
GROUP BY u.departamento
ORDER BY total_chamadas DESC;

-- 3. Chamadas mais recentes
SELECT 
    t.id,
    u.nome as usuario,
    t.titulo,
    t.status,
    t.aberto_em,
    CASE 
        WHEN t.aberto_em > CURRENT_TIMESTAMP - INTERVAL '1 day' THEN 'Hoje'
        WHEN t.aberto_em > CURRENT_TIMESTAMP - INTERVAL '7 days' THEN 'Esta semana'
        ELSE 'Mais antiga'
    END as periodo
FROM tickets t
INNER JOIN usuarios u ON t.id_do_usuario = u.id
ORDER BY t.aberto_em DESC
LIMIT 10;
