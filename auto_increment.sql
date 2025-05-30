# exercicio 
-- crie uma tabela contas 
-- insira as colunas id, nome, sobrenome, saldo, data_nascimento;
-- A coluna id deve ser uma chave primária auto incremente e not null 
-- Encontre os melhores tipos para cada coluna 
--  Adicione 3 registros 

create table contas (
  id INT PRIMARY key AUTO_INCREMENT not NULL,
  nome VARCHAR(100),
  sobrenome VARCHAR(100),
  saldo DECIMAL(10, 2) DEFAULT 00.00,
  data_nascimento DATE
  );
  
  select * from contas;
  insert into contas (id, nome, sobrenome, saldo, data_nascimento) values (1, "Anna", "Pita", 500.00, '2006-04-22');
  insert into contas (id, nome, sobrenome, data_nascimento) values (2, "MIllena", "Melo", '2007-12-05');
  insert into contas (id, nome, sobrenome, saldo, data_nascimento) values (3, "José", "Carlos", 1000.00, '1882-09-12');
  insert into contas (nome, sobrenome, saldo, data_nascimento) values ("José", "Carlos", 1000.00, '1882-09-12');