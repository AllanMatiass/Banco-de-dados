USE DB17022541;

SHOW TABLES;
DROP TABLE funcionarios;
CREATE TABLE IF NOT EXISTS funcionarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL, 
    salario DECIMAL (10, 2) NOT NULL
);

SHOW COLUMNS FROM funcionarios;

ALTER TABLE funcionarios ADD COLUMN data_admissao DATE NOT NULL;

ALTER TABLE funcionarios DROP COLUMN cargo;

ALTER TABLE funcionarios MODIFY COLUMN salario DECIMAL (12, 2);

#6) Crie uma tabela chamada departamentos com os campos: id (inteiro, chave
#primária, auto incremento); nome (VARCHAR(100), não nulo). Em seguida,
#adicione uma coluna chamada departamento_id na tabela funcionarios e
#estabeleça uma chave estrangeira referenciando departamentos(id)

CREATE TABLE IF NOT EXISTS departamentos (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100) NOT NULL
);

ALTER TABLE funcionarios ADD COLUMN departamento_id INT;
ALTER TABLE funcionarios ADD FOREIGN KEY (departamento_id) REFERENCES departamentos(id);


#7) Adicione uma coluna chamada orcamento do tipo DECIMAL(12,2) na tabela
#departamentos para armazenar o orçamento anual de cada departamento.

ALTER TABLE departamentos ADD COLUMN orcamentos DECIMAL(12,2);
ALTER TABLE departamentos DROP COLUMN orcamentos;
ALTER TABLE departamentos MODIFY COLUMN nome VARCHAR(150);
ALTER TABLE departamentos RENAME TO setores;

#Need to drop the funcionarios table to drop setores table;
DROP TABLE setores;

ALTER TABLE funcionarios ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT "ativo";