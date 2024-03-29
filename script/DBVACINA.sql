DROP DATABASE IF EXISTS DBVACINA;
CREATE DATABASE DBVACINA;
USE DBVACINA;

CREATE TABLE TIPO_PESSOA(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, DESCRICAO VARCHAR(100)
);

CREATE TABLE ESTAGIO_PESQUISA(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, DESCRICAO VARCHAR(100)
);

CREATE TABLE AVALIACAO_VACINA(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, DESCRICAO VARCHAR(100)
);

CREATE TABLE PESSOA(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, IDSTATUS_PESSOA INT
, NOME VARCHAR(250) NOT NULL
, CPF VARCHAR(10) NOT NULL UNIQUE
, DTNASCIMENTO DATE NOT NULL
, SEXO CHAR(1) NOT NULL
, FOREIGN KEY(IDSTATUS_PESSOA) REFERENCES TIPO_PESSOA(ID)
);

CREATE TABLE VACINA(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, IDPESQUISADOR INT 
, IDSTATUS_PESQUISA INT 
, PAIS VARCHAR(250) NOT NULL
, INICIO_PESQUISA DATE NOT NULL
, FOREIGN KEY(IDPESQUISADOR) REFERENCES PESSOA(ID)
, FOREIGN KEY(IDSTATUS_PESQUISA) REFERENCES ESTAGIO_PESQUISA(ID)
);

#INSERÇÃO DE DADOS BASE NA TABELA TIPO_PESSOA
INSERT INTO TIPO_PESSOA(DESCRICAO) VALUES ('PESQUISADOR');
INSERT INTO TIPO_PESSOA(DESCRICAO) VALUES ('VOLUNTARIO');
INSERT INTO TIPO_PESSOA(DESCRICAO) VALUES ('GERAL');

#INSERÇÃO DE DADOS BASE NA TABELA ESTAGIO_PESQUISA
INSERT INTO ESTAGIO_PESQUISA(DESCRICAO) VALUES('INICIAL');
INSERT INTO ESTAGIO_PESQUISA(DESCRICAO) VALUES('TESTE');
INSERT INTO ESTAGIO_PESQUISA(DESCRICAO) VALUES('APLICACAO_EM_MASSA');

#INSERÇÃO DE DADOS BASE NA TABELA AVALIACAO_VACINA
INSERT INTO AVALIACAO_VACINA(DESCRICAO) VALUES ('PESSIMO');
INSERT INTO AVALIACAO_VACINA(DESCRICAO) VALUES ('RUIM');
INSERT INTO AVALIACAO_VACINA(DESCRICAO) VALUES ('SATISFATORIO');
INSERT INTO AVALIACAO_VACINA(DESCRICAO) VALUES ('BOM');
INSERT INTO AVALIACAO_VACINA(DESCRICAO) VALUES ('OTIMO');	