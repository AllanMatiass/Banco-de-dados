USE DB17022541;

SHOW TABLES;

#1. Crie a tabela "usuarios" com os campos: id_usuario (inteiro, chave primária),
#nome (texto), email (texto).

CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome TEXT,
    email TEXT
    );

#2. Crie a tabela "filmes" com os campos: id_filme (inteiro, chave primária), titulo
# (texto), genero (texto)

DROP TABLE filmes;
CREATE TABLE filmes (id_filme INT PRIMARY KEY AUTO_INCREMENT, titulo TEXT, genero TEXT);

#3. Crie a tabela "assistidos" com os campos: id_assistido (inteiro, chave
#primária), id_usuario (inteiro), id_filme (inteiro), data_assistido (data).

CREATE TABLE assistidos (
	id_assistido INT PRIMARY KEY AUTO_INCREMENT, id_usuario INT, id_filme INT,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
 );
 
# 4. Adicione uma nova coluna chamada "idade" (inteiro) na tabela "usuarios"

ALTER TABLE usuarios ADD COLUMN idade INT;

#5. Adicione uma chave estrangeira em "assistidos", ligando o campo "id_usuario" à
#tabela "usuarios".
# FEITO NA 3
# ALTER TABLE assistidos ADD COLUMN id_usuario INT, ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

#6. Adicione uma chave estrangeira em "assistidos", ligando o campo "id_filme" à
#tabela "filmes"

# ALTER TABLE assistidos ADD COLUMN id_filme INT, ADD FOREIGN KEY (id_filme) REFERENCES filmes(id_filme);

# 7. Remova a coluna "genero" da tabela "filmes".
ALTER TABLE filmes DROP COLUMN genero;

#8. Insira um usuário com id 1, nome João Silva, email joao@email.com e idade 30.
INSERT INTO usuarios (nome, email, idade) VALUES ('João Silva', 'joao@email.com', 30);

# 9. Insira um usuário com id 2, nome Ana Lima, email ana@email.com e idade 25.
INSERT INTO usuarios (nome, email, idade) VALUES ('Ana Lima', 'ana@email.com', 25);

# 10. Insira um filme com id 1, título "Matrix", gênero "Ficção Científica".
ALTER TABLE filmes ADD COLUMN genero TEXT;
INSERT INTO filmes (titulo, genero) VALUES ('Matrix', 'Ficção Científica');

#11. Insira um filme com id 2, título "A Origem", gênero "Ação".
INSERT INTO filmes (titulo, genero) VALUES ('A Origem', 'Ação');

#12. Insira um registro de que o usuário 1 assistiu ao filme 1 em 2025-03-01.
ALTER TABLE assistidos ADD COLUMN data_assistida DATE;
INSERT INTO assistidos (id_usuario, id_filme, data_assistida) VALUES (1, 1, '2025-03-01');
SELECT * FROM assistidos;

#13. Insira um registro de que o usuário 2 assistiu ao filme 2 em 2025-03-02.
INSERT INTO assistidos (id_usuario, id_filme, data_assistida) VALUES (2, 2, '2025-03-02');

# 14. Remova a chave estrangeira entre "assistidos.id_filme" e "filmes.id_filme".

SHOW CREATE TABLE assistidos;
ALTER TABLE assistidos DROP FOREIGN KEY assistidos_ibfk_2;

#15. Após remover a chave estrangeira, exclua a coluna "id_filme" da tabela
#"assistidos".
ALTER TABLE assistidos DROP COLUMN id_filme;
