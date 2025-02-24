# Introdução
### DDL, DML, TCL e DCL
### Todos são sql


SQL -> Linguagem que a gente usa para se comunicar com DB

## DDL são os comandos que interagem com os objetos; EX: CREATE, ALTER, DROP
## DML são comandos para manipular a tabela; EX: SELECT, UPDATE, DELETE
## TCL são comandos para controlar o fluxo de transações; EX: COMMIT, ROLLBACK
## DCL são comandos para manipular permissões de usuarios; EX/. GRANT, REVOKE

### 1 SEM: DDL e DML

# TASK: Estudar MYSQL por terminal em casa

# COMANDOS BÁSICOS

`mysql -u admin -p`
-u = usuário

###
CREATE DATABASE nome_do_banco;
SHOW DATABASES;

USE nome_do_banco;
DROP DATABASE nome_do_banco;

###

###
CREATE TABLE nome_da_tabela (name VARCHAR(100), RA INT PRIMARY KEY, course VARCHAR(100))

INSERT INTO nome_da_tabela (name, RA, course) VALUES ("Allan", 25008211, "Engenharia de software");

INSERT INTO nome_da_tabela (name, RA, course) VALUES ("João", 25008212, "Engenharia de software");

SELECT * FROM nome_da_tabela;

DELETE FROM nome_da_tabela WHERE RA = 25008212
###


