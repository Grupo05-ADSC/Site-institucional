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

insert into empresa values
(null, "empresa", "12345678912345", "michelly@gmail.com", "123");

CREATE TABLE funcionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nomeFuncionario VARCHAR(49),
sobrenome VARCHAR(40),
emailFuncionario VARCHAR(100),
cargo VARCHAR(45) NOT NULL,
fkEmpresa INT NOT NULL,  
FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE darkstore (
idDarkstore INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) UNIQUE,
fkEmpresa INT NOT NULL,
FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE metrica_ideal (
idMetrica_ideal INT PRIMARY KEY AUTO_INCREMENT,
metrica_padrao VARCHAR(45)
);

CREATE TABLE maquina (
idMaquina INT AUTO_INCREMENT,
fkMetrica_ideal INT,

FOREIGN KEY (fkMetrica_ideal) REFERENCES metrica_ideal (idMetrica_ideal),
fkDarkstore INT NOT NULL,
CONSTRAINT fkDarkstore FOREIGN KEY (fkDarkstore) 
REFERENCES darkstore (idDarkstore),
PRIMARY KEY (idMaquina, fkDarkstore)
);

CREATE TABLE componentes (
idComponentes INT AUTO_INCREMENT,
fkMaquina INT NOT NULL,
FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina),
maquina_fkDarkstore INT NOT NULL,
FOREIGN KEY (maquina_fkDarkstore) REFERENCES maquina (fkDarkstore),
fkMetrica_ideal INT,
FOREIGN KEY (fkMetrica_ideal) REFERENCES metrica_ideal (idMetrica_ideal),
PRIMARY KEY(idComponentes, fkMaquina),
RAM VARCHAR(45),
CPU_COMPONENTE VARCHAR(45),
DISCO VARCHAR(45),
REDE VARCHAR(45),
DISPOSITIVOS_USB VARCHAR(45)
);

CREATE TABLE processos (
idProcessos INT AUTO_INCREMENT,
fkMaquina INT NOT NULL,
FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina),
maquina_fkDarkstore INT NOT NULL,
FOREIGN KEY (maquina_fkDarkstore) REFERENCES maquina (fkDarkstore),
maquina_fkMetrica_ideal INT,
FOREIGN KEY (maquina_fkMetrica_ideal) REFERENCES maquina (fkMetrica_ideal),
PRIMARY KEY(idProcessos, fkMaquina),
PID varchar(45) NOT NULL,
usoCPU varchar(45) NOT NULL,
usoRAM varchar(45) NOT NULL,
usoDISCO varchar(45) NOT NULL
);

CREATE TABLE registro (
idRegistro INT AUTO_INCREMENT,
dado VARCHAR(100) NOT NULL,
data_registro VARCHAR(100) NOT NULL,
fkComponentes INT NOT NULL,
FOREIGN KEY (fkComponentes) REFERENCES componentes (idComponentes),
componente_fkMaquina INT NOT NULL,
FOREIGN KEY (componente_fkMaquina) REFERENCES componentes (fkMaquina),
componente_maquina_fkDarkstore INT NOT NULL,
FOREIGN KEY (componente_maquina_fkDarkstore) REFERENCES componentes (maquina_fkDarkstore),
componente_maquina_fkMetrica_ideal INT NOT NULL,
FOREIGN KEY (componente_maquina_fkMetrica_ideal) REFERENCES componentes (fkMetrica_ideal),
PRIMARY KEY(idRegistro, fkComponentes, componente_fkMaquina, componente_maquina_fkDarkstore, componente_maquina_fkMetrica_ideal)
);

CREATE TABLE alerta (
idAlerta INT AUTO_INCREMENT,
fkMaquina INT NOT NULL,
FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina),
maquina_fkDarkstore INT NOT NULL,
FOREIGN KEY (maquina_fkDarkstore) REFERENCES maquina (fkDarkstore),
maquina_fkMetrica_ideal INT,
FOREIGN KEY (maquina_fkMetrica_ideal) REFERENCES maquina (fkMetrica_ideal),
PRIMARY KEY(idAlerta, fkMaquina),
descricao varchar(200)
);

CREATE TABLE historico (
fkRegistro INT NOT NULL,
FOREIGN KEY (fkRegistro) REFERENCES registro (idRegistro),
registro_fkComponentes INT NOT NULL,
FOREIGN KEY (registro_fkComponentes) REFERENCES registro (fkComponentes),
registro_fkMaquina INT NOT NULL,
FOREIGN KEY (registro_fkMaquina) REFERENCES registro (componente_fkMaquina),
registro_fkDarkstore INT NOT NULL,
FOREIGN KEY (registro_fkDarkstore) REFERENCES registro (componente_maquina_fkDarkstore),
registro_fkMetrica_ideal INT,
FOREIGN KEY (registro_fkMetrica_ideal) REFERENCES registro (componente_maquina_fkMetrica_ideal),

fkAlerta INT,
FOREIGN KEY (fkAlerta) REFERENCES alerta (idAlerta),
alerta_fkMaquina INT NOT NULL,
FOREIGN KEY (alerta_fkMaquina) REFERENCES alerta (fkMaquina),
alerta_fkDarkstore INT NOT NULL,
FOREIGN KEY (alerta_fkDarkstore) REFERENCES alerta (maquina_fkDarkstore),
alerta_fkMetrica_ideal INT NOT NULL,
FOREIGN KEY (alerta_fkMetrica_ideal) REFERENCES alerta (maquina_fkMetrica_ideal),
PRIMARY KEY(fkRegistro, registro_fkComponentes, registro_fkMaquina, registro_fkDarkstore, registro_fkMetrica_ideal, fkAlerta, alerta_fkMaquina, alerta_fkDarkstore, alerta_fkMetrica_ideal)
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

SHOW TABLES;
