DROP DATABASE IF EXISTS sisguard;

CREATE DATABASE IF NOT EXISTS sisguard;

USE sisguard;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(40) NOT NULL,
cnpj CHAR(14) UNIQUE NOT NULL,
email VARCHAR(100) NOT NULL,
senha VARCHAR(18) NOT NULL
);

CREATE TABLE funcionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nomeFuncionario VARCHAR(49),
sobrenome VARCHAR(40),
emailFuncionario VARCHAR(100),
fkEmpresa INT NOT NULL, 
FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE darkstore (
idDarkstore INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) UNIQUE,
fkEmpresa INT NOT NULL,
FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE maquina (
idMaquina INT AUTO_INCREMENT,
ip VARCHAR(100),
fkDarkstore INT NOT NULL,
CONSTRAINT fkDarkstore FOREIGN KEY (fkDarkstore) 
REFERENCES darkstore (idDarkstore),
PRIMARY KEY (idMaquina, fkDarkstore)
);

CREATE TABLE endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
cep CHAR(8) NOT NULL,
estado VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
bairro VARCHAR(50)NOT NULL,
rua VARCHAR(50) NOT NULL,
numero INT NOT NULL,
fkDarkstore INT NOT NULL,
FOREIGN KEY (fkDarkstore) REFERENCES darkstore (idDarkstore)
);

CREATE TABLE registro (
idRegistro INT AUTO_INCREMENT,
cpuPorcentagem FLOAT,
ramPorcentagem FLOAT,
discoPorcentagem FLOAT,
pid INT,
momento DATETIME,
fkMaquina INT NOT NULL,
CONSTRAINT fkMaquina FOREIGN KEY (fkMaquina)
REFERENCES maquina (idMaquina),
fkMaquinaDarksore INT NOT NULL,
CONSTRAINT fkMaquinaDarksore FOREIGN KEY (fkMaquinaDarksore)
REFERENCES maquina (fkDarkstore),
PRIMARY KEY (idRegistro, fkMaquina, fkMaquinaDarksore)
);

SHOW TABLES;
