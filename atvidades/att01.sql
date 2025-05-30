-- sistema de biblioteca
CREATE DATABASE biblioteca;
USE biblioteca;
CREATE TABLE livros(
id INT AUTO_INCREMENT NOT NULL,
titulo VARCHAR(255) NOT NULL,
autor VARCHAR(100) NOT NULL,
editora VARCHAR(100) NOT NULL,
ano_publicacao YEAR NOT NULL,
ISBN VARCHAR(18) NOT NULL UNIQUE,
PRIMARY KEY (id)
);

-- testando se está tudo certo com a tabela 
 insert into livros ( titulo, autor, editora, ano_publicacao, ISBN) 
   values ( "Cartaz de um diabo a seu aprendiz", "C. S. Lewis","Thomas Nelson Brasil", 2017, 9788578601 );
 insert into livros ( titulo, autor, editora, ano_publicacao, ISBN) 
   values ( "A maldição do tigre", "Colleen Houck", "Editora Arqueiro", 2011, 8580410266 );
 insert into livros (titulo, autor, editora, ano_publicacao, ISBN) 
   values ( "Asas reluzentes", "Allison Saft","Universo dos livros", 2025, 6556097454 );
SELECT * FROM livros;

create table usuarios (
  id INT AUTO_INCREMENT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  telefone VARCHAR(16) UNIQUE NOT NUll,
  PRIMARY KEY (id)
  );
  
-- testando  se ela funciona
 insert into usuarios ( nome, email, telefone) values ( "Millena", "millena.pita.teles@gmail.com", "+55 82 981618330");
 insert into usuarios (nome, email, telefone) values ("Carlos", "carlos.pita@gmail.com", "+55 82 981618440");
 insert into usuarios (nome, email, telefone) values ("Michelle", "mi.teles@gmail.com", "+55 82 988480125");
 select * from usuarios;
  
 CREATE TABLE emprestimos (
   id INT AUTO_INCREMENT NOT NULL,
   id_usuario INT NOT NULL,
   id_livro INT NOT NULL,
   nome VARCHAR(255) NOT NULL,
   titulo VARCHAR(255) NOT NULL,
   data_emprestimo DATE NOT NULL,
   data_devolucao DATE NOT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
   FOREIGN KEY (id_livro) REFERENCES livros(id)
   );
   
   -- testando a tabela
   insert into emprestimos (id_usuario, id_livro, nome, titulo, data_emprestimo, data_devolucao) 
   values (1, 1, "Millena", "Cartaz de um diabo a seu aprendiz", '2025-05-28', '2025-05-30' );
   insert into emprestimos (id_usuario, id_livro, nome, titulo, data_emprestimo, data_devolucao) 
   values (1, 2 , "Millena", "A maldição do tigre", '2025-05-28', '2025-05-30' );
   insert into emprestimos (id_usuario, id_livro, nome, titulo, data_emprestimo, data_devolucao) 
   values (3, 3 , "Michelle", "Asas reluzentes", '2025-05-28', '2025-06-15' );
   select * from emprestimos;
