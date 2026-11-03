CREATE DATABASE IF NOT EXISTS emerald_db;
USE emerald_db;

-- Tabela de Perfis
CREATE TABLE IF NOT EXISTS perfil (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_perfil VARCHAR(50) NOT NULL
);

-- Tabela de Usuários (ID como UUID)
CREATE TABLE IF NOT EXISTS usuario (
    id VARCHAR(36) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de Categorias
CREATE TABLE IF NOT EXISTS categoria (
    id VARCHAR(36) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    usuario_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Tabela de Contas Bancárias
CREATE TABLE IF NOT EXISTS conta_bancaria (
    id VARCHAR(36) PRIMARY KEY,
    nome_conta VARCHAR(50) NOT NULL,
    saldo DECIMAL(15,2) NOT NULL,
    tipo_conta VARCHAR(30) NOT NULL,
    usuario_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Tabela de Métodos de Pagamento
CREATE TABLE IF NOT EXISTS metodo_pagamento (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_metodo VARCHAR(100) NOT NULL
);

-- Tabela de Metas Financeiras
CREATE TABLE IF NOT EXISTS meta_financeira (
    id VARCHAR(36) PRIMARY KEY,
    valor_limite DECIMAL(15,2) NOT NULL,
    mes_ano VARCHAR(10) NOT NULL,
    usuario_id VARCHAR(36) NOT NULL,
    categoria_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Tabela de Transações
CREATE TABLE IF NOT EXISTS transacao (
    id VARCHAR(36) PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(15,2) NOT NULL,
    data DATETIME NOT NULL,
    conta_bancaria_id VARCHAR(36) NOT NULL,
    categoria_id VARCHAR(36) NOT NULL,
    metodo_pagamento_id BIGINT NOT NULL,
    FOREIGN KEY (conta_bancaria_id) REFERENCES conta_bancaria(id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    FOREIGN KEY (metodo_pagamento_id) REFERENCES metodo_pagamento(id)
);

-- Inserção inicial obrigatória para evitar o Erro 409 (Conflict) no cadastro
INSERT INTO perfil (nome_perfil) VALUES ('USER');