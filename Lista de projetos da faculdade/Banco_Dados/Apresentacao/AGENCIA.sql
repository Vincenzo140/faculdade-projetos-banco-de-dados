CREATE TABLE AGENCIA(
	ID_AGENCIA INT PRIMARY KEY NOT NULL,
	CIDADE VARCHAR(100),
	ESTADO CHAR(2)
)

CREATE TABLE FUNCIONARIO(
	ID_FUNCIONARIO INT PRIMARY KEY NOT NULL,
	ID_AGENCIA INT NOT NULL, -- FK
	CPF VARCHAR(14) UNIQUE NOT NULL,
	NOME VARCHAR(100),
	ESTADO CHAR(2),
	CIDADE VARCHAR(100),
	BAIRRO VARCHAR(50),
	RUA VARCHAR(50),
	NUMERO INT, --TALVEZ VARCHAR
	CEP VARCHAR(9),
	SALARIO MONEY
)

CREATE TABLE CLIENTE(
	ID_CLIENTE INT PRIMARY KEY NOT NULL,
	ID_AGENCIA INT NOT NULL, --FK
	CPF VARCHAR(14) UNIQUE NOT NULL,
	NOME VARCHAR(100),
	ESTADO CHAR(2),
	CIDADE VARCHAR(100),
	BAIRRO VARCHAR(50),
	RUA VARCHAR(50),
	NUMERO INT, --TALVEZ VARCHAR
	CEP VARCHAR(9)
)

CREATE TABLE CLIENTE_CONTA(
	ID_CONTA INT NOT NULL, 
	ID_CLIENTE INT NOT NULL,
	PRIMARY KEY (ID_CONTA, ID_CLIENTE),
	FOREIGN KEY (ID_CONTA) REFERENCES CONTA(ID_CONTA),
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)	
)

CREATE TABLE CONTA(
	ID_CONTA INT PRIMARY KEY NOT NULL,
	SALDO MONEY
)

CREATE TABLE CONTA_TRANSACAO(
	ID_CONTA INT NOT NULL, 
	NUMERO_TRANSACAO INT NOT NULL,
	PRIMARY KEY (ID_CONTA, NUMERO_TRANSACAO),
	FOREIGN KEY (ID_CONTA) REFERENCES CONTA(ID_CONTA),
	FOREIGN KEY (NUMERO_TRANSACAO) REFERENCES TRANSACAO(NUMERO_TRANSACAO)	
)

CREATE TABLE TRANSACAO(
	NUMERO_TRANSACAO INT PRIMARY KEY NOT NULL,
	DATA_TRANSACAO DATE,
	VALOR MONEY
)

-- CHAVE ESTRANGEIRA DE AGENCIA NA TABELA FUNCIONARIO --DDL 1
ALTER TABLE FUNCIONARIO ADD CONSTRAINT CHAVE_AGENCIA FOREIGN KEY (ID_AGENCIA) REFERENCES AGENCIA (ID_AGENCIA)

-- CHAVE ESTRANGEIRA DE AGENCIA NA TABELA CLIENTE --DDL 2
ALTER TABLE CLIENTE ADD CONSTRAINT CHAVE_AGENCIA FOREIGN KEY (ID_AGENCIA) REFERENCES AGENCIA (ID_AGENCIA)


SELECT * FROM AGENCIA
INSERT INTO AGENCIA VALUES (0001,'SOROCABA','SP')
INSERT INTO AGENCIA VALUES (0002,'VOTORANTIM','SP')
INSERT INTO AGENCIA VALUES (0003,'PIEDADE','SP')
INSERT INTO AGENCIA VALUES (0004,'TATUI','SP')
INSERT INTO AGENCIA VALUES (0005,'ITU','SP')

SELECT * FROM FUNCIONARIO
INSERT INTO FUNCIONARIO VALUES (0001,0005,'319.408.673-12','Elisa Rosa Jesus','SP','ITU','Parque Nossa Senhora da Candelária','Praça Ângelo Antônio Armênio',33,'13310-189','R$1.500.00')
INSERT INTO FUNCIONARIO VALUES (0002,0004,'621.139.576-04','Kevin Roberto da Conceição','SP','TATUI','Europark','Rua Aparecida Cândia Camargo',123,'18279-668','R$1.000.00')
INSERT INTO FUNCIONARIO VALUES (0003,0003,'348.886.203-85','Sueli Isis Moraes','SP','PIEDADE','Centro','Avenida General Waldomiro de Lima',116,'18170-970','R$2.500.00')
INSERT INTO FUNCIONARIO VALUES (0004,0002,'352.356.018-74','Ian Antonio Augusto Melo','SP','VOTORANTIM','Jardim Antônio Rodrigues e Rodrigues','Rua Mariana de Andrade Tavuencas',2,'18111-400','R$2.000.00')
INSERT INTO FUNCIONARIO VALUES (0005,0001,'112.455.823-30','Kamilly Renata Amanda das Neves','SP','SOROCABA','Jardim Zulmira','Rua Zilda Cristina de Lima',152,'18061-125','R$4.500.00')

SELECT * FROM CLIENTE
INSERT INTO CLIENTE VALUES (0001,0001,'263.783.574-55','Stefany Agatha Ester Ramos','SP','SOROCABA','Vila Santa Rita','Rua Domingos Angelotti',300,'18080-085')
INSERT INTO CLIENTE VALUES (0002,0004,'543.548.800-16','Camila Alessandra Silveira','SP','TATUI','Jardim Europa','Rua Oswaldo Oliveira',130,'18279-200')
INSERT INTO CLIENTE VALUES (0003,0005,'708.029.888-14','Hadassa Eloá da Costa','SP','ITU','Jardim Theodora','Alameda Santa Cláúdia',111,'13301-863')
INSERT INTO CLIENTE VALUES (0004,0002,'822.612.249-07','Manuela Betina Emilly Castro','SP','VOTORANTIM','Jardim União','Rua José Meira',111,'18115-740')
INSERT INTO CLIENTE VALUES (0005,0003,'365.534.061-38','Augusto Nicolas da Mata','SP','PIEDADE','Centro','Avenida General Waldomiro de Lima',117,'18170-970')

SELECT * FROM CLIENTE_CONTA
INSERT INTO CLIENTE_CONTA VALUES (0005,0005)
INSERT INTO CLIENTE_CONTA VALUES (0004,0004)
INSERT INTO CLIENTE_CONTA VALUES (0003,0003)
INSERT INTO CLIENTE_CONTA VALUES (0002,0002)
INSERT INTO CLIENTE_CONTA VALUES (0001,0001)

SELECT * FROM CONTA
INSERT INTO CONTA VALUES (0001,'R$3000')
INSERT INTO CONTA VALUES (0002,'R$1500')
INSERT INTO CONTA VALUES (0003,'R$2000')
INSERT INTO CONTA VALUES (0004,'R$1300')
INSERT INTO CONTA VALUES (0005,'R$1500')
INSERT INTO CONTA VALUES (0006,'R$1000')

SELECT * FROM CONTA_TRANSACAO
INSERT INTO CONTA_TRANSACAO VALUES (0001,0005)
INSERT INTO CONTA_TRANSACAO VALUES (0002,0004)
INSERT INTO CONTA_TRANSACAO VALUES (0003,0003)
INSERT INTO CONTA_TRANSACAO VALUES (0004,0002)
INSERT INTO CONTA_TRANSACAO VALUES (0005,0001)

SELECT * FROM TRANSACAO
INSERT INTO TRANSACAO VALUES (0001,'30-06-2020','R$300')
INSERT INTO TRANSACAO VALUES (0002,'10-10-2021','R$2500')
INSERT INTO TRANSACAO VALUES (0003,'15-01-2023','R$3500')
INSERT INTO TRANSACAO VALUES (0004,'15-01-2023','R$500')
INSERT INTO TRANSACAO VALUES (0005,'31-01-2020','R$450')

-- 1 DQL
SELECT ID_FUNCIONARIO, NOME, SALARIO
FROM FUNCIONARIO
WHERE SALARIO = (SELECT MAX (SALARIO) FROM FUNCIONARIO)

-- 2 DQL
SELECT ID_CLIENTE, NOME, CIDADE 
FROM CLIENTE 
WHERE CIDADE = 'SOROCABA';

-- 3 DQL
SELECT DISTINCT NUMERO_TRANSACAO, VALOR, NOME
FROM TRANSACAO, CLIENTE
WHERE VALOR >='1000'
GROUP BY VALOR, NUMERO_TRANSACAO, NOME; 


SELECT DISTINCT ID_CONTA, NUMERO_TRANSACAO, VALOR, DATA_TRANSACAO
FROM CONTA,  TRANSACAO


SELECT TRANSACAO.NUMERO_TRANSACAO, TRANSACAO.DATA_TRANSACAO, TRANSACAO.VALOR, CLIENTE.NOME
FROM TRANSACAO
INNER JOIN CONTA_TRANSACAO ON TRANSACAO.NUMERO_TRANSACAO = CONTA_TRANSACAO.NUMERO_TRANSACAO
INNER JOIN CONTA ON CONTA_TRANSACAO.ID_CONTA = CONTA.ID_CONTA
INNER JOIN CLIENTE_CONTA ON CONTA.ID_CONTA = CLIENTE_CONTA.ID_CONTA
INNER JOIN CLIENTE ON CLIENTE_CONTA.ID_CLIENTE = CLIENTE.ID_CLIENTE

SELECT COUNT(*)
FROM TRANSACAO
