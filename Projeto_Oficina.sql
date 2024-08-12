CREATE DATABASE oficina;

USE oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    veiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    ano YEAR,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela Serviço
CREATE TABLE Servico (
    servico_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Tabela Ordem de Serviço
CREATE TABLE OrdemServico (
    ordem_id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    veiculo_id INT,
    cliente_id INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela Itens de Ordem de Serviço
CREATE TABLE ItensOrdemServico (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    ordem_id INT,
    servico_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (ordem_id) REFERENCES OrdemServico(ordem_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);


-- Inserir clientes
INSERT INTO Cliente (nome, telefone, email) VALUES
('João Silva', '123456789', 'joao.silva@example.com'),
('Maria Oliveira', '987654321', 'maria.oliveira@example.com');

-- Inserir veículos
INSERT INTO Veiculo (placa, modelo, ano, cliente_id) VALUES
('ABC1234', 'Fusca', 1978, 1),
('XYZ5678', 'Civic', 2020, 2);

-- Inserir serviços
INSERT INTO Servico (nome, preco) VALUES
('Troca de óleo', 100.00),
('Alinhamento', 150.00);

-- Inserir ordens de serviço
INSERT INTO OrdemServico (data, veiculo_id, cliente_id, total) VALUES
('2024-08-10', 1, 1, 250.00),
('2024-08-11', 2, 2, 300.00);

-- Inserir itens de ordem de serviço
INSERT INTO ItensOrdemServico (ordem_id, servico_id, quantidade) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 2);


SELECT * FROM Cliente;
SELECT nome, preco FROM Servico;


SELECT nome, preco, preco * 1.1 AS preco_com_imposto FROM Servico;


SELECT * FROM OrdemServico ORDER BY data DESC;
SELECT nome, preco FROM Servico ORDER BY preco ASC;


SELECT cliente_id, COUNT(*) AS num_ordens
FROM OrdemServico
GROUP BY cliente_id
HAVING num_ordens > 1;


-- Junção entre Cliente e Veículo
SELECT Cliente.nome, Veiculo.modelo
FROM Cliente
JOIN Veiculo ON Cliente.cliente_id = Veiculo.cliente_id;

-- Junção entre Ordem de Serviço e Itens de Ordem de Serviço com Serviço
SELECT OrdemServico.data, Servico.nome, ItensOrdemServico.quantidade
FROM OrdemServico
JOIN ItensOrdemServico ON OrdemServico.ordem_id = ItensOrdemServico.ordem_id
JOIN Servico ON ItensOrdemServico.servico_id = Servico.servico_id
WHERE OrdemServico.total > 200;


SELECT * FROM Veiculo WHERE ano > 2015;

SELECT nome, preco, preco * 1.1 AS preco_com_imposto FROM Servico;

SELECT * FROM OrdemServico ORDER BY data DESC;

SELECT cliente_id, COUNT(*) AS num_ordens
FROM OrdemServico
GROUP BY cliente_id
HAVING num_ordens > 1;

SELECT Cliente.nome, Veiculo.modelo
FROM Cliente
JOIN Veiculo ON Cliente.cliente_id = Veiculo.cliente_id;

SELECT OrdemServico.data, Servico.nome, ItensOrdemServico.quantidade
FROM OrdemServico
JOIN ItensOrdemServico ON OrdemServico.ordem_id = ItensOrdemServico.ordem_id
JOIN Servico ON ItensOrdemServico.servico_id = Servico.servico_id
WHERE OrdemServico.total > 200;


