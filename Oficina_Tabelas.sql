-- Criação do Banco de Dados
CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

-- Tabela cliente com PJ e PF
CREATE TABLE clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    primeiroNome VARCHAR(50),
    sobrenome VARCHAR(50),
    CPF CHAR(11),
    CNPJ CHAR(14),
    endereco VARCHAR(100),
    tipoCliente ENUM('PF', 'PJ') NOT NULL,
    CONSTRAINT chk_tipo CHECK (
        (tipoCliente = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR
        (tipoCliente = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
    )
);

-- Tabela veículos
CREATE TABLE veiculos (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    clienteId INT,
    CONSTRAINT fk_veiculos_clientes FOREIGN KEY (clienteId) REFERENCES clientes(idCliente)
);

-- Tabela serviços
CREATE TABLE servicos (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    duracaoEstimada INT NOT NULL -- em minutos
);

-- Tabela pagamentos
CREATE TABLE pagamentos (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    clienteId INT,
    tipoPagamento ENUM('Boleto', 'Cartão', 'Dinheiro', 'Pix'),
    valor DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_pagamentos_clientes FOREIGN KEY (clienteId) REFERENCES clientes(idCliente)
);

-- Tabela ordens de serviço
CREATE TABLE ordens_servico (
    idOrdemServico INT AUTO_INCREMENT PRIMARY KEY,
    veiculoId INT,
    data DATE NOT NULL,
    status ENUM('Aguardando', 'Em Andamento', 'Concluído', 'Cancelado') DEFAULT 'Aguardando',
    valorTotal DECIMAL(10, 2),
    CONSTRAINT fk_ordens_servico_veiculos FOREIGN KEY (veiculoId) REFERENCES veiculos(idVeiculo)
);

-- Tabela itens da ordem de serviço (serviços realizados em cada ordem)
CREATE TABLE itens_ordem_servico (
    idItemOrdemServico INT AUTO_INCREMENT PRIMARY KEY,
    ordemServicoId INT,
    servicoId INT,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_itens_ordem_servico_ordens_servico FOREIGN KEY (ordemServicoId) REFERENCES ordens_servico(idOrdemServico),
    CONSTRAINT fk_itens_ordem_servico_servicos FOREIGN KEY (servicoId) REFERENCES servicos(idServico)
);
