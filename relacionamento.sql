create table pessoas (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  idade INT
);

create table endereco (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
rua VARCHAR(255) not NULL,
numero VARCHAR(10),
pessoa_id INT NOT NULL
);