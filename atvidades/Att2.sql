# Médio: Sistema de Academia
-- Descrição:
	-- Um sistema para controlar treinos e alunos de uma academia. Cada aluno pode ter vários treinos, e cada treino tem vários exercícios.
-- Requisitos:

-- Cadastro de alunos (nome, email, idade, sexo, peso, altura)
-- Cadastro de exercícios (nome, grupo muscular, descrição)
-- Cadastro de treinos (nome do treino, data de início, personal trainer responsável)
-- Relacionamento de treino com exercícios (repetições, séries, ordem)
-- Cada aluno pode ter vários treinos ativos ou históricos

create table alunos (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  idade INT NOT NULL,
  sexo ENUM ('feminino', 'masculino', 'prefiro não dizer') DEFAULT 'prefiro não dizer',
  peso DECIMAL(10,2),
  altura DECIMAL(10,2)
);

create table exercicios (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  grupo_muscular enum ('cabeça e face', 'pescoço', 'tórax e abdomem', 'costas', 'superiores', 'inferiores', 'perineo', 'geral') default 'geral',
  descricao VARCHAR(255) NOT NULL 
);

create table treino (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome_treino VARCHAR(100) NOT NULL,
  data_inicio DATE NOT NULL,
  personal_trainer VARCHAR(100) NOT NULL,
  ordem INT NOT NULL
);

insert into alunos (email, idade, sexo, peso, altura) values ('millena.melo@gmail.com', 17, 'feminino', 80, 1.68);
insert into alunos (email, idade, sexo, peso, altura) values ('anna.luiza@gmail.com', 18, 'feminino', 60, 1.66);
insert into alunos (email, idade, peso, altura) values ('carlos@gmail.com',20, 100, 2.00);
select * from alunos;

insert into exercicios (nome, grupo_muscular, descricao) values ('triceps costa', 'superiores', '');
insert into exercicios (nome, grupo_muscular, descricao) values (); 
insert into exercicios (nome, grupo_muscular, descricao) values ();
select * from exercicios;

insert into treino (nome_treino, data_inicio, personal_trainer, ordem) values ();
select * from treino;