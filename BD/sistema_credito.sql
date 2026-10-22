
CREATE DATABASE sistema_credito;

-- Selecionando o banco
USE sistema_credito;


-- =========================
-- TABELA EMPRESA
-- =========================

CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(150),
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    estado VARCHAR(2)
);


-- =========================
-- TABELA USUARIO
-- =========================

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(50),
    id_empresa INT,

    FOREIGN KEY (id_empresa)
        REFERENCES empresa(id_empresa)
);


-- =========================
-- TABELA SOLICITACAO DE CREDITO
-- =========================

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

INSERT INTO empresa
(razao_social, nome_fantasia, cnpj, email, telefone, cidade, estado)
VALUES
('Agro Forte Ltda', 'Agro Forte', '12.345.678/0001-00',
'contato@agroforte.com', '11999999999', 'Campinas', 'SP');

SELECT * FROM empresa;

INSERT INTO usuario
(nome, email, senha, tipo_usuario, id_empresa)
VALUES
('Joao Silva', 'joao@agroforte.com', '123456', 'Cliente', 1);

SELECT * FROM usuario;

INSERT INTO solicitacao_credito
(id_empresa, valor_solicitado, data_solicitacao, finalidade)
VALUES
(1, 150000.00, '2026-09-07', 'Compra de materiais agrícolas');

SELECT * FROM solicitacao_credito;