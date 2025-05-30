create table funcionarios(
  id INT PRIMARY key,
  nome VARCHAR(100),
  cargo VARCHAR(50),
  salario DECIMAL(10,2)
  );
  
  alter table funcionarios add column data_admissao DATE after nome;
  alter table funcionarios MODIFY column salario DECIMAL(12,2);
  alter table funcionarios rename column cargo to funcao;
  alter table funcionarios drop column data_admissao;
  
  -- adicionar coluna com restrição not null
  alter table funcionarios add column email VARCHAR(255) not NULL;
  insert into funcionarios (id, nome, salario, email) values (1, 'teste', 1000.00, "teste@gmail.com");
  select * from funcionarios;
  alter table funcionarios modify column email VARCHAR(55) NULL;
  insert into funcionarios (id, nome, salario, email) values (2, 'teste', 1000.00, null); -- adicionando valores nulos em uma coluna, fazendo referência a ela.
  select * from funcionarios;
  insert into funcionarios (id, nome, salario) values (3, 'teste', 1000.00); -- adicionando valores nulos em uma coluna, não fazendo referência a ela.
  alter table funcionarios add column ativo BOOL DEFAULT TRUE; -- adicionando tabela com valor padrão TRUE
  alter table funcionarios rename to colaboradores;
  alter table colaboradores add index idx_nome (nome); -- adicionando index a uma tabela
  
  
  
  