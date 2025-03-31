USE BD17022541;

CREATE TABLE medico (
	crm INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(100) NOT NULL
);
CREATE TABLE paciente ( cpf INT PRIMARY KEY, nome VARCHAR(100) NOT NULL, data_nasc DATE,
telefone VARCHAR(15));
CREATE TABLE consulta ( numero INT PRIMARY KEY, data_consulta DATE, descricao TEXT,
prescricao TEXT, crm INT, cpf INT, FOREIGN KEY (crm) REFERENCES medico(crm),
FOREIGN KEY (cpf) REFERENCES paciente(cpf));

ALTER TABLE medico ADD COLUMN email VARCHAR(100) NOT NULL;
ALTER TABLE medico MODIFY COLUMN especialidade VARCHAR(120) NOT NULL;

INSERT INTO medico (crm, nome, especialidade, telefone, email) VALUES (
	101, 'carlos silva', 'cardiologista', '11999999999', 'carlos@email.com');
    

INSERT INTO medico (crm, nome, especialidade, telefone, email) VALUES (
	102, 'Ana Banana', 'Dermatologista', '119922222232', 'ana@email.com');

ALTER TABLE paciente ADD COLUMN endereco VARCHAR(100);
INSERT INTO paciente (cpf, nome, data_nasc, telefone, endereco) VALUES (
	1001, 'joao pereira', '1985-05-20', 12343, 'riua a 123');
    
INSERT INTO paciente (cpf, nome, data_nasc, telefone, endereco) VALUES (
	1004324, 'maria oliveira', '1990-07-15', 12343, 'riua b 123');

SELECT * FROM consulta;
ALTER TABLE consulta DROP FOREIGN KEY consulta_ibfk_1;
ALTER TABLE consulta DROP FOREIGN KEY consulta_ibfk_2;
ALTER TABLE consulta DROP PRIMARY KEY;
ALTER TABLE consulta MODIFY COLUMN numero INT PRIMARY KEY AUTO_INCREMENT;



INSERT INTO consulta (data_consulta, descricao, prescricao, crm, cpf) VALUES (
	'2024-03-02', 'Chcek geral', 'Tomar vitaminas', 101, 1001
);

INSERT INTO consulta (data_consulta, descricao, prescricao, crm, cpf) VALUES (
	'2024-05-01', 'Dor no joelho', 'Fisioterapia', 101, 1002
);
INSERT INTO consulta (data_consulta, descricao, prescricao, crm, cpf) VALUES (
	'2024-06-14', 'Lesao no ombro', 'Dipirona', 102, 1001
);

INSERT INTO consulta (data_consulta, descricao, prescricao, crm, cpf) VALUES (
	'2024-09-17', 'Acompanhamento', 'Reduzir sal', 102, 1002
);

UPDATE medico SET telefone='99292929292' WHERE crm=101;
SELECT  * FROM medico;

CREATE TABLE convenio (id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(100) NOT NULL, cidade VARCHAR(50), estado VARCHAR(20));

ALTER TABLE paciente ADD COLUMN convenio_id INT, ADD FOREIGN KEY (convenio_id) REFERENCES convenio(id);

CREATE TABLE hospital (id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(100) NOT NULL, cidade VARCHAR(50), estado VARCHAR(2));
ALTER TABLE consulta ADD COLUMN hospital_id INT, ADD FOREIGN KEY (hospital_id) REFERENCES hospital(id);

CREATE TABLE especialidades (id INT PRIMARY KEY AUTO_INCREMENT, descricao VARCHAR(50) NOT NULL);
ALTER TABLE medico ADD COLUMN especialidade_id INT, ADD FOREIGN KEY (especialidade_id) REFERENCES especialidades(id);
ALTER TABLE especialidades MODIFY COLUMN descricao VARCHAR(100);
ALTER TABLE hospital DROP COLUMN estado;
RENAME TABLE hospital TO unidade_saude;
ALTER TABLE convenio ADD COLUMN status VARCHAR(20) DEFAULT 'Ativo';
SELECT * FROM convenio;