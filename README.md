
# 📚 Atividade de Banco de Dados - Livraria

Esta atividade consiste na modelagem e criação de um banco de dados relacional chamado **Livraria**, que gerencia informações sobre livros, autores, categorias, membros, empréstimos, reservas e editoras. A atividade utiliza **MySQL** e pode ser utilizado como base para sistemas de gerenciamento de bibliotecas ou livrarias.

---

## 🛠️ Estrutura do Banco de Dados

### Banco:
- `Livraria`

### Tabelas Criadas:
- `Autores`: Armazena os autores dos livros
- `Categorias`: Classificações dos livros (ex: Romance, Ficção, etc.)
- `Livros`: Informações dos livros disponíveis
- `Membros`: Usuários/membros cadastrados na livraria
- `Emprestimos`: Registro de empréstimos de livros
- `Reservas`: Registro de reservas de livros
- `Editoras`: Informações sobre editoras dos livros

---

## 🔧 Scripts SQL

### 1. Criação do Banco e Tabelas
```sql
CREATE DATABASE Livraria;
USE Livraria;

-- Autores
CREATE TABLE Autores (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(100)
);

-- Categorias
CREATE TABLE Categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Livros
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

-- Membros
CREATE TABLE Membros (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    celular VARCHAR(20),
    email VARCHAR(100)
);

-- Empréstimos
CREATE TABLE Emprestimos (
    id INT PRIMARY KEY,
    livro_id INT,
    membro_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(id),
    FOREIGN KEY (membro_id) REFERENCES Membros(id)
);

-- Reservas
CREATE TABLE Reservas (
    id INT PRIMARY KEY,
    livro_id INT,
    membro_id INT,
    data_reserva DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(id),
    FOREIGN KEY (membro_id) REFERENCES Membros(id)
);

-- Editoras
CREATE TABLE Editoras (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    pais VARCHAR(100)
);
```

---

## 📄 Comandos SQL Executados

### Inserção de dados
```sql
INSERT INTO Livros (id, titulo, autor_id, categoria_id, ano_publicacao, isbn)
VALUES (1, 'Dom Casmurro', 1, 1, 1899, '978-85-359-0277-7');
```

### Seleções e consultas
```sql
-- Livros em ordem alfabética
SELECT * FROM Livros ORDER BY titulo ASC;

-- 5 primeiros autores
SELECT * FROM Autores LIMIT 5;

-- Membros a partir do 11º registro
SELECT * FROM Membros ORDER BY id OFFSET 10 ROWS;

-- Livros após 2000
SELECT * FROM Livros WHERE ano_publicacao > 2000;

-- Livros que não foram publicados em 2020
SELECT * FROM Livros WHERE ano_publicacao != 2020;

-- Empréstimos com data de devolução anterior a 2025-01-01
SELECT * FROM Emprestimos WHERE data_devolucao < '2025-01-01';
```

### Exclusões
```sql
-- Excluir membro com ID 3
DELETE FROM Membros WHERE id = 3;

-- Excluir livros publicados antes de 2000
DELETE FROM Livros WHERE ano_publicacao < 2000;

-- Excluir empréstimos com devolução antes de 2024
DELETE FROM Emprestimos WHERE data_devolucao < '2024-01-01';
```

---

## 🧠 Observações

- Certifique-se de que os dados referenciados por chaves estrangeiras existam antes de realizar inserções ou exclusões.
- A estrutura pode ser estendida com novas funcionalidades, como histórico de empréstimos, multas e renovação de reservas.

---

## 📌 Requisitos

- MySQL Server 5.7 ou superior
- Cliente de SQL (como MySQL Workbench, DBeaver ou phpMyAdmin)

---

## 🚀 Como usar

1. Copie o conteúdo do script SQL em um cliente MySQL.
2. Execute o script completo para criar as tabelas e começar os testes.
3. Adicione dados conforme necessário para realizar consultas e simulações.

---

## 👨‍💻 Autor

Minoru Yamanaka  
[GitHub: @minoru-yamanaka](https://minoru-yamanaka.github.io/cv/)

---
