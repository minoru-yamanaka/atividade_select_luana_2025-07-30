CREATE DATABASE Livraria;
USE Livraria;

-- Tabela de Autores
CREATE TABLE Autores (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(100)
);

-- Tabela de Categorias
CREATE TABLE Categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela de Livros
CREATE TABLE Livros (
    id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor_id INT,
    categoria_id INT,
    ano_publicacao YEAR,
    isbn VARCHAR(20),
    FOREIGN KEY (autor_id) REFERENCES Autores(id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- Tabela de Membros
CREATE TABLE Membros (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    celular VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela de Empréstimos
CREATE TABLE Emprestimos (
    id INT PRIMARY KEY,
    livro_id INT,
    membro_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(id),
    FOREIGN KEY (membro_id) REFERENCES Membros(id)
);

-- Atividade

-- Selecionar todos os livros da tabela Livros ordenados pelo título em ordem ascendente: (digite a query)
SELECT * FROM Livros ORDER BY titulo ASC;

-- Selecionar os 5 primeiros autores da tabela
SELECT * FROM Autores LIMIT 5;

-- Selecionar todos os membros da tabela Membros, pulando os primeiros 10 registros
SELECT * FROM Membros ORDER BY id OFFSET 10 ROWS; 

-- Selecionar todos os livros publicados após o ano 2000
SELECT * FROM Livros WHERE ano_publicacao > 2000;

-- Selecionar todos os livros que não foram publicados no ano 2020
SELECT * FROM Livrosano_publicacao != 2000;

-- Inserir um novo livro na tabela Livros
INSERT INTO Livros (id, titulo, autor_id, categoria_id, ano_publicacao, isbn)
VALUES (1, 'Dom Casmurro', 1, 1, 1899, '978-85-359-0277-7');

-- Deletar um membro da tabela Membros com o ID 3
DELETE FROM Membros WHERE id = 3;

-- Criar a tabela Reservas com colunas para ID, livro_id, membro_id e data_reserva:
CREATE TABLE Reservas (
    id INT PRIMARY KEY,
    livro_id INT,
    membro_id INT,
    data_reserva DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(id),
    FOREIGN KEY (membro_id) REFERENCES Membros(id)
);

-- Selecionar todos os empréstimos onde a data de devolução é anterior a 2025-01-01
SELECT * FROM Emprestimos WHERE data_devolucao < '2025-01-01';

-- Deletar todos os livros da tabela Livros que foram publicados antes do ano 2000
DELETE FROM Livros WHERE ano_publicacao < 2000;

-- Deletar todos os empréstimos da tabela Empréstimos onde a data de devolução é anterior a 2024-01-01
DELETE FROM Emprestimos WHERE data_devolucao < '2024-01-01';

-- Criar a tabela Editoras com colunas para ID, nome e país
CREATE TABLE Editoras (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    pais VARCHAR(100)
);

