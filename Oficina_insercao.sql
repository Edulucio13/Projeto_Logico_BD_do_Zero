-- Inserir dados em clientes
INSERT INTO clientes (primeiroNome, sobrenome, CPF, CNPJ, endereco, tipoCliente) VALUES 
('Carlos', 'Silva', '12345678901', NULL, 'Rua A, 100', 'PF'),
('Ana', 'Oliveira', '23456789012', NULL, 'Rua B, 200', 'PF'),
('João', 'Pereira', '34567890123', NULL, 'Rua C, 300', 'PF'),
('Paulo', 'Souza', '45678901234', NULL, 'Rua D, 400', 'PF'),
('Luciana', 'Mendes', '56789012345', NULL, 'Rua E, 500', 'PF'),
('Empresa XY', NULL, NULL, '12345678000199', 'Avenida F, 600', 'PJ'),
('José', 'Lima', '67890123456', NULL, 'Rua G, 700', 'PF'),
('Maria', 'Ferreira', '78901234567', NULL, 'Rua H, 800', 'PF'),
('Roberto', 'Costa', '89012345678', NULL, 'Rua I, 900', 'PF'),
('Empresa AB', NULL, NULL, '98765432000102', 'Avenida J, 1000', 'PJ');

-- Inserir dados em veículos
INSERT INTO veiculos (modelo, fabricante, ano, clienteId) VALUES 
('Civic', 'Honda', 2020, 1),
('Corolla', 'Toyota', 2019, 2),
('Gol', 'Volkswagen', 2018, 3),
('Onix', 'Chevrolet', 2021, 4),
('HB20', 'Hyundai', 2020, 5),
('Uno', 'Fiat', 2017, 6),
('Ka', 'Ford', 2019, 7),
('Fox', 'Volkswagen', 2018, 8),
('Fiesta', 'Ford', 2020, 9),
('Renegade', 'Jeep', 2021, 10);

-- Inserir dados em serviços
INSERT INTO servicos (descricao, preco, duracaoEstimada) VALUES 
('Troca de óleo', 100.00, 30),
('Alinhamento e balanceamento', 150.00, 60),
('Revisão completa', 300.00, 180),
('Troca de freios', 200.00, 90),
('Troca de pneus', 400.00, 120),
('Troca de bateria', 250.00, 45),
('Reparação elétrica', 350.00, 120),
('Troca de embreagem', 500.00, 180),
('Reparação de ar-condicionado', 450.00, 150),
('Instalação de som', 200.00, 60);

-- Inserir dados em pagamentos
INSERT INTO pagamentos (clienteId, tipoPagamento, valor) VALUES 
(1, 'Cartão', 150.00),
(2, 'Boleto', 200.00),
(3, 'Dinheiro', 300.00),
(4, 'Pix', 250.00),
(5, 'Cartão', 400.00),
(6, 'Boleto', 350.00),
(7, 'Dinheiro', 500.00),
(8, 'Pix', 450.00),
(9, 'Cartão', 600.00),
(10, 'Boleto', 550.00);

-- Inserir dados em ordens de serviço
INSERT INTO ordens_servico (veiculoId, data, status, valorTotal) VALUES 
(1, '2023-01-10', 'Concluído', 150.00),
(2, '2023-02-20', 'Concluído', 200.00),
(3, '2023-03-15', 'Concluído', 300.00),
(4, '2023-04-25', 'Em Andamento', 250.00),
(5, '2023-05-05', 'Aguardando', 400.00),
(6, '2023-06-10', 'Concluído', 350.00),
(7, '2023-07-20', 'Concluído', 500.00),
(8, '2023-08-30', 'Em Andamento', 450.00),
(9, '2023-09-10', 'Cancelado', 600.00),
(10, '2023-10-20', 'Concluído', 550.00);

-- Inserir dados em itens da ordem de serviço
INSERT INTO itens_ordem_servico (ordemServicoId, servicoId, quantidade, preco) VALUES 
(1, 1, 1, 100.00),
(2, 2, 1, 150.00),
(3, 3, 1, 300.00),
(4, 4, 1, 200.00),
(5, 5, 1, 400.00),
(6, 6, 1, 250.00),
(7, 7, 1, 350.00),
(8, 8, 1, 500.00),
(9, 9, 1, 450.00),
(10, 10, 1, 200.00);
