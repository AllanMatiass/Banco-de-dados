USE BD17022541;

CREATE TABLE IF NOT EXISTS tutores  (
id_tutor INT PRIMARY KEY,
nome VARCHAR(100),
telefone VARCHAR(20),
cidade VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS pacientes (
id_paciente INT PRIMARY KEY,
nome VARCHAR(100),
especie VARCHAR(50),
idade INT,
peso DECIMAL(5,2),
tutor_id INT,
FOREIGN KEY (tutor_id) REFERENCES tutores(id_tutor)
);

CREATE TABLE IF NOT EXISTS consultas (
id_consulta INT PRIMARY KEY,
id_paciente INT,
data DATE,
valor DECIMAL(8,2),
procedimento VARCHAR(100),
FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);


INSERT INTO tutores VALUES
(1, 'Ana Silva', '11999999999', 'São Paulo'),
(2, 'Carlos Lima', '11888888888', 'Campinas'),
(3, 'João Souza', '11777777777', 'Sorocaba'),
(4, 'Beatriz Ramos', '11911111111', 'Campinas'),
(5, 'Marcos Tadeu', '11922222222', 'Osasco'),
(6, 'Luciana Costa', '11788888888', 'São Paulo'),
(7, 'Daniel Rocha', '11944444444', 'Jundiaí'),
(8, 'Fernanda Torres', '11666666666', 'Campinas'),
(9, 'Juliano Nogueira', '11955555555', 'Sorocaba'),
(10, 'Marta Fernandes', '11977777777', 'Campinas');


INSERT INTO pacientes VALUES
(1, 'Luna', 'Cachorro', 5, 12.5, 1),
(2, 'Mingau', 'Gato', 3, 4.8, 2),
(3, 'Bob', 'Cachorro', 8, 20.1, 3),
(4, 'Frajola', 'Gato', 2, 3.7, 4),
(5, 'Rex', 'Cachorro', 6, 18.4, 5),
(6, 'Tom', 'Gato', 9, 5.2, 6),
(7, 'Bella', 'Cachorro', 4, 9.5, 7),
(8, 'Nina', 'Gato', 7, 4.3, 8),
(9, 'Pingo', 'Coelho', 1, 2.0, 9),
(10, 'Spike', 'Cachorro', 10, 25.0, 10);


INSERT INTO consultas VALUES
(1, 1, '2024-01-10', 120.00, 'Vacinação'),
(2, 2, '2024-01-15', 180.00, 'Exame de sangue'),
(3, 3, '2024-02-01', 250.00, 'Cirurgia'),
(4, 4, '2024-02-20', 100.00, 'Consulta geral'),
(5, 5, '2024-03-05', 300.00, 'Internação'),
(6, 6, '2024-03-10', 180.00, 'Ultrassom'),
(7, 7, '2024-03-12', 120.00, 'Vacinação'),
(8, 8, '2024-04-01', 150.00, 'Consulta geral'),
(9, 9, '2024-04-10', 90.00, 'Curativo'),
(10, 10, '2024-04-15', 200.00, 'Raio-X');



SELECT nome, idade FROM pacientes WHERE idade > 5;

SELECT nome FROM pacientes ORDER BY peso DESC;

SELECT especie, COUNT(*) AS total FROM pacientes GROUP BY especie;

SELECT nome, 
	CASE
		WHEN especie = "Cachorro" THEN "Canino"
        WHEN especie = "Gato" THEN "Felino"
        ELSE "Outro"
	END AS classificacao
FROM pacientes;
SELECT nome, COUNT(*) AS total FROM pacientes GROUP BY nome;

SELECT p.nome, t.cidade FROM pacientes as p JOIN tutores as t ON p.tutor_id = t.id_tutor;

SELECT t.nome, p.nome, c.valor FROM tutores as t JOIN pacientes as p ON t.id_tutor = p.tutor_id JOIN consultas AS c ON c.id_paciente = p.id_paciente;

SELECT t.nome, p.nome, c.valor FROM tutores as t JOIN pacientes as p ON t.id_tutor = p.tutor_id JOIN consultas AS c ON c.id_paciente = p.id_paciente WHERE c.valor > 150;

SELECT t.nome, p.nome, COUNT(*) AS total FROM tutores as t JOIN pacientes as p ON p.tutor_id = t.id_tutor JOIN consultas AS c ON c.id_paciente = p.id_paciente GROUP BY t.nome, p.nome;
  
