-- =====================================================
-- SISTEMA DE CRÉDITO
-- Banco de dados completo - versão atualizada
-- Baseado no banco inicial e nas telas do Figma
-- =====================================================

CREATE DATABASE IF NOT EXISTS sistema_credito;

-- Selecionando o banco
USE sistema_credito;


-- =========================
-- TABELA EMPRESA
-- =========================
-- Armazena empresas e fornecedores cadastrados no sistema.

CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(150),
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),

    -- Novos campos apresentados na tela de fornecedor
    website VARCHAR(150),
    nome_contato VARCHAR(100),
    categoria VARCHAR(100),
    status VARCHAR(30) DEFAULT 'Ativo',

    -- Dados de endereço
    cep VARCHAR(10),
    logradouro VARCHAR(150),
    numero VARCHAR(20),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2)
);


-- =========================
-- TABELA USUARIO
-- =========================
-- Armazena os usuários que terão acesso ao sistema.

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(50),
    status VARCHAR(30) DEFAULT 'Ativo',
    id_empresa INT,

    FOREIGN KEY (id_empresa)
        REFERENCES empresa(id_empresa)
);


-- =========================
-- TABELA SOLICITACAO DE CREDITO
-- =========================
-- Registra as solicitações feitas pelas empresas.

CREATE TABLE solicitacao_credito (
    id_solicitacao INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    valor_solicitado DECIMAL(12,2) NOT NULL,
    data_solicitacao DATE NOT NULL,
    finalidade VARCHAR(255),
    status VARCHAR(30) DEFAULT 'Pendente',

    FOREIGN KEY (id_empresa)
        REFERENCES empresa(id_empresa)
);


-- =========================
-- TABELA ANALISE DE CREDITO
-- =========================
-- Guarda o resultado da análise de cada solicitação.

CREATE TABLE analise_credito (
    id_analise INT AUTO_INCREMENT PRIMARY KEY,
    id_solicitacao INT NOT NULL,
    id_usuario INT,
    data_analise DATE,
    parecer VARCHAR(500),
    limite_aprovado DECIMAL(12,2),
    resultado VARCHAR(30) DEFAULT 'Em análise',

    FOREIGN KEY (id_solicitacao)
        REFERENCES solicitacao_credito(id_solicitacao),

    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
);


-- =====================================================
-- DADOS PARA TESTE
-- =====================================================

-- Empresa / fornecedor
INSERT INTO empresa
(
    razao_social,
    nome_fantasia,
    cnpj,
    email,
    telefone,
    website,
    nome_contato,
    categoria,
    status,
    cep,
    logradouro,
    numero,
    complemento,
    bairro,
    cidade,
    estado
)
VALUES
(
    'Agro Forte Ltda',
    'Agro Forte',
    '12.345.678/0001-00',
    'contato@agroforte.com',
    '11999999999',
    'www.agroforte.com.br',
    'Joao Silva',
    'Materiais Agricolas',
    'Ativo',
    '13000-000',
    'Rua das Fazendas',
    '100',
    NULL,
    'Centro',
    'Campinas',
    'SP'
);


-- Usuário
INSERT INTO usuario
(nome, email, senha, tipo_usuario, status, id_empresa)
VALUES
('Joao Silva', 'joao@agroforte.com', '123456', 'Cliente', 'Ativo', 1);


-- Solicitação de crédito
INSERT INTO solicitacao_credito
(id_empresa, valor_solicitado, data_solicitacao, finalidade, status)
VALUES
(1, 150000.00, '2026-09-07', 'Compra de materiais agrícolas', 'Pendente');


-- Análise de crédito de exemplo
INSERT INTO analise_credito
(id_solicitacao, id_usuario, data_analise, parecer, limite_aprovado, resultado)
VALUES
(1, 1, '2026-09-08', 'Solicitação recebida para análise.', NULL, 'Em análise');


-- =====================================================
-- CONSULTAS PARA TESTE
-- =====================================================

-- Ver todas as empresas
SELECT * FROM empresa;

-- Ver todos os usuários
SELECT * FROM usuario;

-- Ver todas as solicitações
SELECT * FROM solicitacao_credito;

-- Ver todas as análises
SELECT * FROM analise_credito;


-- =====================================================
-- CONSULTAS ÚTEIS PARA AS TELAS
-- =====================================================

-- Tela de Empresas
SELECT
    id_empresa,
    razao_social,
    nome_fantasia,
    cnpj,
    email,
    telefone,
    categoria,
    cidade,
    estado,
    status
FROM empresa;


-- Tela de Usuários
SELECT
    u.id_usuario,
    u.nome,
    u.email,
    u.tipo_usuario,
    u.status,
    e.nome_fantasia AS empresa
FROM usuario u
LEFT JOIN empresa e
    ON u.id_empresa = e.id_empresa;


-- Tela de Solicitações
SELECT
    s.id_solicitacao,
    e.nome_fantasia AS empresa,
    s.valor_solicitado,
    s.data_solicitacao,
    s.finalidade,
    s.status
FROM solicitacao_credito s
INNER JOIN empresa e
    ON s.id_empresa = e.id_empresa;


-- Solicitações pendentes
SELECT *
FROM solicitacao_credito
WHERE status = 'Pendente';


-- Solicitações em análise
SELECT *
FROM solicitacao_credito
WHERE status = 'Em análise';


-- Solicitações aprovadas
SELECT *
FROM solicitacao_credito
WHERE status = 'Aprovado';


-- Solicitações reprovadas
SELECT *
FROM solicitacao_credito
WHERE status = 'Reprovado';


-- =====================================================
-- CONSULTAS PARA O DASHBOARD
-- =====================================================

-- Volume total solicitado
SELECT SUM(valor_solicitado) AS volume_total_solicitado
FROM solicitacao_credito;


-- Total de empresas cadastradas
SELECT COUNT(*) AS empresas_cadastradas
FROM empresa;


-- Total de solicitações aprovadas
SELECT COUNT(*) AS solicitacoes_aprovadas
FROM solicitacao_credito
WHERE status = 'Aprovado';


-- Total de solicitações pendentes
SELECT COUNT(*) AS solicitacoes_pendentes
FROM solicitacao_credito
WHERE status = 'Pendente';


-- Solicitações recentes
SELECT
    s.id_solicitacao,
    e.nome_fantasia AS empresa,
    s.valor_solicitado,
    s.data_solicitacao,
    s.status
FROM solicitacao_credito s
INNER JOIN empresa e
    ON s.id_empresa = e.id_empresa
ORDER BY s.data_solicitacao DESC;
