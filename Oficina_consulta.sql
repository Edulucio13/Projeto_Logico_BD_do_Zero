-- 1. Quantos veículos cada cliente possui?
SELECT c.idCliente, c.primeiroNome, COUNT(v.idVeiculo) AS total_veiculos
FROM clientes c
LEFT JOIN veiculos v ON c.idCliente = v.clienteId
GROUP BY c.idCliente, c.primeiroNome;

-- 2. Quantas ordens de serviço cada cliente possui?
SELECT c.idCliente, c.primeiroNome, COUNT(o.idOrdemServico) AS total_ordens_servico
FROM clientes c
LEFT JOIN ordens_servico o ON c.idCliente = o.veiculoId
GROUP BY c.idCliente, c.primeiroNome;

-- 3. Relação de serviços realizados em cada ordem de serviço
SELECT o.idOrdemServico, c.primeiroNome, v.modelo, s.descricao, ios.quantidade, ios.preco
FROM ordens_servico o
JOIN veiculos v ON o.veiculoId = v.idVeiculo
JOIN clientes c ON v.clienteId = c.idCliente
JOIN itens_ordem_servico ios ON o.idOrdemServico = ios.ordemServicoId
JOIN servicos s ON ios.servicoId = s.idServico;

-- 4. Filtros com WHERE Statement
SELECT * FROM veiculos WHERE ano > 2019;

-- 5. Crie expressões para gerar atributos derivados
SELECT idCliente, primeiroNome, sobrenome, 
       COUNT(idOrdemServico) AS total_ordens_servico, 
       SUM(valorTotal) AS total_gasto
FROM clientes c
LEFT JOIN veiculos v ON c.idCliente = v.clienteId
LEFT JOIN ordens_servico o ON v.idVeiculo = o.veiculoId
GROUP BY idCliente, primeiroNome, sobrenome;

-- 6. Defina ordenações dos dados com ORDER BY
SELECT modelo, ano
FROM veiculos
ORDER BY ano DESC;

-- 7. Condições de filtros aos grupos - HAVING Statement
SELECT idCliente, primeiroNome, COUNT(idOrdemServico) AS total_ordens_servico
FROM clientes c
LEFT JOIN veiculos v ON c.idCliente = v.clienteId
LEFT JOIN ordens_servico o ON v.idVeiculo = o.veiculoId
GROUP BY idCliente, primeiroNome
HAVING COUNT(idOrdemServico) > 1;

-- 8. Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT o.idOrdemServico, c.primeiroNome, v.modelo, s.descricao, ios.quantidade, ios.preco, o.data, o.status
FROM ordens_servico o
JOIN veiculos v ON o.veiculoId = v.idVeiculo
JOIN clientes c ON v.clienteId = c.idCliente
JOIN itens_ordem_servico ios ON o.idOrdemServico = ios.ordemServicoId
JOIN servicos s ON ios.servicoId = s.idServico;
