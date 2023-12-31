CREATE TABLE ALUNOS(
	ID_ALUNO INT PRIMARY KEY, 
	ID_CURSO INT,
	NOME_ALUNO VARCHAR(100),
	CPF VARCHAR(14) UNIQUE,
	CURSO VARCHAR(100)
);

ALTER TABLE ALUNOS ADD CONSTRAINT CHAVE_CURSO FOREIGN KEY (ID_CURSO) REFERENCES CURSOS (ID_CURSO)

CREATE TABLE CURSOS(
	ID_CURSO INT PRIMARY KEY,
	ID_ALUNO INT,
	ID_DISCIPLINA INT,
	NOME_CURSO VARCHAR(100),
	NOME_ALUNO VARCHAR(100),
	NOME_DISCIPLINA VARCHAR(100),
	DISCIPLINAS_OBRIGATORIA BOOLEAN
);

ALTER TABLE CURSOS ADD CONSTRAINT CHAVE_ALUNO FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS (ID_ALUNO)

ALTER TABLE CURSOS ADD CONSTRAINT CHAVE_CURSO FOREIGN KEY (ID_CURSO) REFERENCES CURSOS (ID_CURSO)

ALTER TABLE CURSOS ADD CONSTRAINT CHAVE_DISCIPLINA FOREIGN KEY (ID_DISCIPLINA) REFERENCES DISCIPLINA (ID_DISCIPLINA)

CREATE TABLE DISCIPLINA(
	ID_DISCIPLINA INT PRIMARY KEY,
	ID_CURSO INT,
	NOME_CURSO VARCHAR(100),
	NOME_DISCIPLINA VARCHAR(100),
	PRE_REQUISITO VARCHAR(100)	
);

ALTER TABLE DISCIPLINA 
ADD ID_ALUNO INT, NOME_ALUNO VARCHAR(100);

ALTER TABLE DISCIPLINA 
ADD NOME_ALUNO VARCHAR(100);

ALTER TABLE DISCIPLINA ADD CONSTRAINT CHAVE_CURSO3 FOREIGN KEY (ID_CURSO) REFERENCES CURSOS (ID_CURSO)

ALTER TABLE DISCIPLINA ADD CONSTRAINT CHAVE_ALUNO FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS (ID_ALUNO)

SELECT * FROM ALUNOS

INSERT INTO ALUNOS VALUES (1,1,'Renata Esther da Mota','564.269.691-25','DESENVOLVIMENTO DE SISTEMAS');
INSERT INTO ALUNOS VALUES (2,1,'Antonio Gabriel Rodrigues','075.028.902-38','DESENVOLVIMENTO DE SISTEMAS');
INSERT INTO ALUNOS VALUES (3,1,'Rebeca Agatha Porto','225.797.000-48','DESENVOLVIMENTO DE SISTEMAS');
INSERT INTO ALUNOS VALUES (4,1,'Raul Samuel Cláudio Almada','498.018.806-00','DESENVOLVIMENTO DE SISTEMAS');
INSERT INTO ALUNOS VALUES (5,1,'Tereza Bruna Stella Aragão','743.855.227-66','DESENVOLVIMENTO DE SISTEMAS');
INSERT INTO ALUNOS VALUES (6,2,'Julia Liz Luiza Assis','263.869.441-00','MECATRONICA');
INSERT INTO ALUNOS VALUES (7,2,'Miguel Renan Thomas Pereira','131.756.025-68','MECATRONICA');
INSERT INTO ALUNOS VALUES (8,2,'Raul Samuel Cláudio Almada','498.018.806-00','MECATRONICA');