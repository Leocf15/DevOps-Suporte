-- Criar tabela de usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    departamento VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de tickets (chamadas de suporte)
CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    id_do_usuario INTEGER NOT NULL,
    status VARCHAR(50) DEFAULT 'aberto',
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    aberto_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechado_em TIMESTAMP NULL,
    FOREIGN KEY (id_do_usuario) REFERENCES usuarios(id)
);

-- Inserir usuários de exemplo
INSERT INTO usuarios (nome, email, departamento) VALUES
('João Silva', 'joao.silva@empresa.com', 'TI'),
('Maria Santos', 'maria.santos@empresa.com', 'RH'),
('Pedro Oliveira', 'pedro.oliveira@empresa.com', 'Financeiro'),
('Ana Costa', 'ana.costa@empresa.com', 'Marketing');

-- Inserir tickets de exemplo
INSERT INTO tickets (id_do_usuario, titulo, descricao, status) VALUES
(1, 'Problema com email', 'Não consigo enviar emails', 'aberto'),
(1, 'Lentidão no sistema', 'Sistema muito lento hoje', 'fechado'),
(2, 'Acesso negado', 'Não consigo acessar pasta compartilhada', 'aberto'),
(3, 'Impressora offline', 'Impressora não está funcionando', 'aberto'),
(2, 'Senha expirada', 'Preciso trocar senha do sistema', 'fechado'),
(4, 'Teams não funciona', 'Microsoft Teams travando', 'aberto');

-- Atualizar alguns tickets como fechados
UPDATE tickets SET fechado_em = CURRENT_TIMESTAMP - INTERVAL '1 day' WHERE status = 'fechado';
