# AULA 2 CONSTAINTS/restrições

create table pessoas(
  nome VARCHAR(255) NOT NULL,
  idade INT
  );
  
  SELECT * from pessoas;
  
  insert into pessoas (nome,idade) values ("Carlos", 33);
  insert into pessoas (nome, idade) values ("", 33); -- o banco de dados não reconhece "" como um valor nulo
  insert into pessoas (nome,idade) values (null, 33); -- Erro
  insert into pessoas (nome) values ("Millena"); -- Aceita campos vazios se nao tiverem not null
  
  alter table pessoas add column email VARCHAR(100) UNIQUE;
  insert into pessoas (nome, idade, email) values ("Teles", 17, "millena@gmail.com");
  insert into pessoas (nome, idade, email) values ("Teles", 17, "millena@gmail.com"); -- Vai dar error pois UNIQUE não deixa a repetição desse valor
  
  create table produtos(
    id INT NOT NULL,
    nome VARCHAR(255),
    sku VARCHAR(10)
    -- restrições
    PRIMARY key (id)
    );
    
    select * from produtos;
    insert into produtos (id, nome, sku) values (1, 'TV', "teste");
    
    create table usuarios (
      id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      statuss ENUM ('ativo', 'inativo') DEFAULT 'ativo'
      );
      select * from usuarios;
      alter table usaurios add column nome VARCHAR(255) after id;
      insert into usuarios (nome) values ("pessoa1");
      insert into usuarios (nome, statuss) values ("pessoa2", 'ativo'); 
      insert into usuarios (nome, statuss) values ("pessoa1", 'inativo');
      insert into usuarios (nome, statuss) values ("pessoa1", 'pendente');
      