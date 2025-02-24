USE BD17022541;
CREATE TABLE IF NOT EXISTS alunos (nome VARCHAR(100), RA INT PRIMARY KEY, curso VARCHAR(100));

# INSERT INTO alunos (nome, RA, curso) VALUES ("Allan", 25008211, "Eng. de Software");
# INSERT INTO alunos (nome, RA, curso) VALUES ("Luiz", 25008212, "Eng. de Software");
# INSERT INTO alunos(nome, RA, curso) VALUES ("João", 25092355, "Economia");

DELETE FROM alunos WHERE RA = 25008211;
SELECT * FROM alunos WHERE curso="Economia";