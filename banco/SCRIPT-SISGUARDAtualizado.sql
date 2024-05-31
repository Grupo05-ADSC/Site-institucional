DROP DATABASE IF EXISTS sisguard;

CREATE DATABASE IF NOT EXISTS sisguard;

USE sisguard;

CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(40) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(18) NOT NULL,
    plano INT CHECK (plano IN (1, 2)),
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO empresa(nomeEmpresa,cnpj,email,senha) VALUES("frizza", "123", "frizza", "123");

CREATE TABLE funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeFuncionario VARCHAR(40),
    sobrenome VARCHAR(40),
    emailFuncionario VARCHAR(100),
    senha VARCHAR(45),
    cargo VARCHAR(45) NOT NULL,
    fkEmpresa INT NOT NULL,  
    FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE darkstore (
    idDarkstore INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    canaSlack VARCHAR(100),
    fkEmpresa INT NOT NULL,
    FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

INSERT INTO darkstore(nome,fkEmpresa) values ("Setor 1", 1);

CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    fkDarkstore INT NOT NULL,
    FOREIGN KEY (fkDarkstore) REFERENCES darkstore (idDarkstore)
);

CREATE TABLE metrica_ideal (
    idMetricaIdeal INT PRIMARY KEY AUTO_INCREMENT,
    alertaPadrao DOUBLE,
    criticaPadrao DOUBLE,
    alertaCPU DOUBLE,
    criticoCPU DOUBLE,
    alertaRAM DOUBLE,
    criticoRAM DOUBLE,
    alertaDisco DOUBLE,
    criticoDisco DOUBLE,
    fkDarkStore INT NOT NULL,
    FOREIGN KEY (fkDarkstore) REFERENCES darkstore (idDarkstore)
);
insert into metrica_ideal(fkDarkStore) values (1);

CREATE TABLE maquina (
    idMaquina INT AUTO_INCREMENT,
    numSerie VARCHAR(30),
    nomeMaquina VARCHAR(50),
    fkDarkStore INT NOT NULL,
    Metrica_MetricaIdeal INT,
    PRIMARY KEY (idMaquina, Metrica_MetricaIdeal),
    FOREIGN KEY (fkDarkStore) REFERENCES darkstore(idDarkStore)
);

CREATE TABLE componente (
    idComponente INT AUTO_INCREMENT,
    Maquina_idMaquina INT,
    Maquina_fkDarkStore INT,
    Maquina_MetricaIdeal INT,
    Metrica_MetricaIdeal INT,
    nome VARCHAR(40),
    PRIMARY KEY (idComponente, Maquina_idMaquina, Maquina_fkDarkStore, Maquina_MetricaIdeal, Metrica_MetricaIdeal),
    FOREIGN KEY (Maquina_idMaquina, Maquina_MetricaIdeal) REFERENCES maquina(idMaquina, Metrica_MetricaIdeal),
    FOREIGN KEY (Maquina_fkDarkStore) REFERENCES maquina(fkDarkStore)
);

CREATE TABLE processos (
    idProcessos INT PRIMARY KEY AUTO_INCREMENT,
    dado VARCHAR(650),
    
    Maquina_idMaquina INT,
    Maquina_fkDarkStore INT,
    Maquina_MetricaIdeal INT,
    desativar BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (Maquina_idMaquina, Maquina_MetricaIdeal) REFERENCES maquina(idMaquina, Metrica_MetricaIdeal),
    FOREIGN KEY (Maquina_fkDarkStore) REFERENCES maquina(fkDarkStore)
);

CREATE TABLE registro (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    dado VARCHAR(200) NOT NULL,
    dataRegistro DATETIME,
    fkComponente INT NOT NULL,
    componente_fkMaquina INT NOT NULL,
    componente_maquina_fkDarkstore INT NOT NULL,
    componente_maquina_fkMetrica_ideal INT NOT NULL,
    FOREIGN KEY (fkComponente, componente_fkMaquina, componente_maquina_fkDarkstore, componente_maquina_fkMetrica_ideal) 
    REFERENCES componente (idComponente, Maquina_idMaquina, maquina_fkDarkstore, Maquina_MetricaIdeal)
);

CREATE TABLE alerta (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(250),
    fkMaquina INT,
    maquinaMetricaIdeal INT,
    maquinafkDarkstore INT,
    fkRegistro INT,
    registrofkComponente INT,
    registroComponentefkMaquina INT,
    registroComponenteMaquinafkDarkstore INT,
    registroComponenteMaquinafkMetricaIdeal INT,
    FOREIGN KEY (fkMaquina, maquinaMetricaIdeal) 
    REFERENCES maquina (idMaquina, Metrica_MetricaIdeal),
    FOREIGN KEY (maquinafkDarkstore) 
    REFERENCES maquina (fkDarkStore),
    FOREIGN KEY (fkRegistro) 
    REFERENCES registro (idRegistro),
    FOREIGN KEY (registrofkComponente, registroComponentefkMaquina, registroComponenteMaquinafkDarkstore, registroComponenteMaquinafkMetricaIdeal) 
    REFERENCES registro (fkComponente, componente_fkMaquina, componente_maquina_fkDarkstore, componente_maquina_fkMetrica_ideal)
);

select * from maquina;