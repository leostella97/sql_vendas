-- Criar a tabela "produto"
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    valor_produto DECIMAL(10, 2) NOT NULL
);

-- Criar a tabela "vendedor"
CREATE TABLE vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(255) NOT NULL,
    email_vendedor VARCHAR(255) NOT NULL
);

-- Criar a tabela "vendido" com chaves estrangeiras
CREATE TABLE vendido (
    id_vendido INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_vendedor INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

-- Inserir dados de exemplo
INSERT INTO produto (nome_produto, valor_produto) VALUES
    ('Produto um', 19.99),
    ('Produto dois', 29.99),
    ('Produto três', 39.99);

INSERT INTO vendedor (nome_vendedor, email_vendedor) VALUES
    ('Mario Daniel', 'mdaniel@lojasshop.com'),
    ('Maria Daniela', 'mdaniela@lojasshop.com');

-- Exemplo de uma venda (decrementar estoque)
-- Suponha que o Produto A foi vendido pelo Vendedor 1
-- Primeiro, insira os dados de venda na tabela "vendido"
INSERT INTO vendido (id_produto, id_vendedor) VALUES (1, 1);

-- Em seguida, você pode decrementar a quantidade disponível do Produto A na tabela "produto" (neste exemplo, subtrair 1 da quantidade disponível)
UPDATE produto SET quantidade_disponivel = quantidade_disponivel - 1 WHERE id_produto = 1;
