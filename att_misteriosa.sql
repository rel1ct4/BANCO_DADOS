-- ### Exercício 1.1: Criação de Tabelas Básicas

-- Crie a estrutura inicial do banco de dados do sistema de biblioteca. Você deve criar duas tabelas:

-- Uma tabela chamada `livros` que deve conter um identificador único com autoincremento, o título do livro (que não pode ser nulo) e a data de aquisição
-- Uma tabela chamada `emprestimos` que deve registrar um identificador único com autoincremento, qual livro foi emprestado e quando ocorreu o empréstimo (ambos não podem ser nulos)

-- Questão 1.1: Quais são as limitações dessa estrutura inicial para um sistema de biblioteca funcional?
-- A falta de controle sobre quem fez esses empréstimos, visto que não existe uma tabela que registre esses usuários e relacione eles com os empréstimos para manter um registro funcional e seguro dos livros.

CREATE DATABASE attMisteriosa;
USE attMisteriosa;

CREATE TABLE bilioteca(
id INT AUTO_INCREMENT NOT NULL,
titulo VARCHAR(255) NOT NULL,
data_aquisicao DATE NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE emprestimos(
id INT AUTO_INCREMENT NOT NULL,
id_livro INT NOT NULL,
nome_livro VARCHAR(255) NOT NULL,
data_emprestimo DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_livro) REFERENCES bilioteca(id)
);

-- inserindo dados 
INSERT INTO bilioteca (titulo, data_aquisicao) VALUES 
("Cartaz de um diabo a seu aprendiz", '2025-05-30'),
("A vida invisivel de ADDIE LARUE", '2020-06-28'),
("Jantar secreto", '2025-05-15');
SELECT * FROM bilioteca;

INSERT INTO emprestimos (id_livro, nome_livro, data_emprestimo) VALUES 
(3, "Jantar secreto", '2025-06-01'),
(2, "A vida invisivel de ADDIE LARUE", '2025-05-30'),
(1, "Cartaz de um diabo a seu aprendiz", '2025-05-30');
SELECT * FROM emprestimos;

-- Exercício 2.1: Adicionando Colunas de Informações Bibliográficas
-- Utilize o comando ALTER TABLE para adicionar colunas que armazenem:

-- O nome do autor do livro
-- A editora responsável pela publicação
-- O ano de publicação do livro (use o tipo de dado YEAR)

-- Questão 2.1: Por que seria melhor ter uma tabela separada para autores em vez de apenas um campo na tabela de livros?
-- Pois da mesma forma que um autor escreve um livro pode ter escrito mais de um, conseguindo assim ao criar uma tabela para os autores associar os livros escritos por eles em um lugar só.

ALTER TABLE bilioteca ADD COLUMN autor VARCHAR(255) NOT NULL;
ALTER TABLE bilioteca ADD COLUMN editora VARCHAR(255) NOT NULL;
ALTER TABLE bilioteca ADD COLUMN  publicacao_livro VARCHAR(255) NOT NULL;

### Exercício 2.2: Adicionando Colunas de Catalogação
-- Agora adicione informações que auxiliem na catalogação e localização física dos livros na biblioteca. 
-- Utilize o ALTER TABLE para adicionar:

-- O número ISBN do livro
-- A localização física do livro na biblioteca

-- Execute um comando ALTER TABLE para adicionar uma nova coluna chamada `numero_paginas` do tipo INT à tabela `livros`.

ALTER TABLE bilioteca ADD COLUMN isnb VARCHAR(18) UNIQUE;
ALTER TABLE bilioteca ADD COLUMN localizacao VARCHAR(255) NOT NULL;
ALTER TABLE bilioteca ADD COLUMN numero_paginas INT NOT NULL;

### Exercício 3.1: Alterando Propriedades das Colunas
-- Com o uso do sistema, você percebeu que algumas colunas precisam ser ajustadas. 
-- Utilize o comando ALTER TABLE com a cláusula MODIFY para:

-- Aumentar o tamanho do campo título para comportar subtítulos mais longos
-- Alterar o tipo de dado do ISBN para um formato padronizado de tamanho fixo

-- Tarefa 3.1:** Escreva um comando ALTER TABLE para modificar a coluna `localizacao` para ter um valor DEFAULT 'A definir'.
ALTER TABLE bilioteca MODIFY COLUMN titulo VARCHAR(500);
ALTER TABLE bilioteca MODIFY COLUMN isnb VARCHAR(13);
ALTER TABLE bilioteca MODIFY COLUMN localizacao VARCHAR(500) DEFAULT 'A definir';

### Exercício 3.2: Renomeando Colunas
-- Para melhorar a clareza do esquema do banco de dados, renomeie a coluna `localizacao` para um nome mais específico que indique 
-- a posição do livro nas estantes da biblioteca. Utilize o comando ALTER TABLE com a cláusula CHANGE COLUMN.
-- Qual a diferença entre os comandos MODIFY COLUMN e CHANGE COLUMN?
-- o comando MODIFY é utilizado quando precisamos alter algum tipo de dado ou até mesmo utilizar o DEFAULT, já o comando CHANGE utilizamos quando além de fazer essas alterações precisamos alterar o nome da coluna original
-- Em quais situações você utilizaria cada um?
-- Em uma situação que eu preciso aumentar a quantidade de caracteres, adicionar chave ou algum atributo eu utilizaria MODIFY, agora se precisar além de fazer alterações nas caracteristícas da coluna mudar o nome também eu utilizaria o CHANGE.

ALTER TABLE bilioteca CHANGE COLUMN localizacao estante VARCHAR(255);

### Exercício 4.1: Criando Tabela de Categorias

-- Crie uma nova tabela para armazenar as categorias literárias dos livros, como "Ficção", "Técnico", "Autoajuda", etc. 
-- Esta tabela deve conter um identificador único, o nome da categoria e uma descrição opcional.

CREATE TABLE categorias (
id INT AUTO_INCREMENT NOT NULL,
nome_categoria VARCHAR(255) UNIQUE NOT NULL,
descricao VARCHAR(500),
PRIMARY KEY (id)
);

### Exercício 4.2: Estabelecendo Relacionamentos com Chaves Estrangeiras

-- Modifique a tabela de livros para relacioná-la com a tabela de categorias. Você precisará:

-- Adicionar uma coluna na tabela livros para armazenar o identificador da categoria
-- Criar uma restrição de chave estrangeira que garanta a integridade do relacionamento

ALTER TABLE bilioteca ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id);

-- Crie uma nova tabela chamada `autores` com os campos necessários e depois modifique a tabela `livros` para 
-- estabelecer um relacionamento adequado com a tabela `autores`.

CREATE TABLE autores (
id INT AUTO_INCREMENT NOT NULL,
nome_autor VARCHAR(255) UNIQUE NOT NULL,
data_nascimento DATE NOT NULL
);