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

CREATE TABLE darkstore (
    idDarkstore INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    canaSlack VARCHAR(100),
    fkEmpresa INT NOT NULL,
    FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

INSERT INTO darkstore(nome,fkEmpresa) VALUES ("Setor 1", 1);

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
    FOREIGN KEY (fkDarkStore) REFERENCES darkstore (idDarkstore)
);

INSERT INTO metrica_ideal(fkDarkStore) VALUES (1);

CREATE TABLE maquina (
    idMaquina INT AUTO_INCREMENT PRIMARY KEY,
    numSerie VARCHAR(30),
    nomeMaquina VARCHAR(50),
    fkDarkStore INT NOT NULL,
    Metrica_MetricaIdeal INT,
    UNIQUE (idMaquina, fkDarkStore),  -- Chave única composta
    FOREIGN KEY (fkDarkStore) REFERENCES darkstore(idDarkStore),
    FOREIGN KEY (Metrica_MetricaIdeal) REFERENCES metrica_ideal(idMetricaIdeal)
);
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

CREATE TABLE componente (
    idComponente INT AUTO_INCREMENT PRIMARY KEY,
    Maquina_idMaquina INT,
    Maquina_fkDarkStore INT,
    Metrica_MetricaIdeal INT,  -- Removendo Maquina_MetricaIdeal
    nome VARCHAR(100),
    INDEX idx_Maquina_idMaquina (Maquina_idMaquina),
    INDEX idx_Metrica_MetricaIdeal (Metrica_MetricaIdeal),
    FOREIGN KEY (Maquina_idMaquina, Maquina_fkDarkStore) REFERENCES maquina(idMaquina, fkDarkStore),  -- Referenciando a chave composta de maquina
    FOREIGN KEY (Metrica_MetricaIdeal) REFERENCES metrica_ideal(idMetricaIdeal)
);



CREATE TABLE processos (
    idProcessos INT PRIMARY KEY AUTO_INCREMENT,
    dado VARCHAR(650),
    pid VARCHAR(20),
    fkMaquina INT,
    Maquina_MetricaIdeal INT,
    Maquina_fkDarkStore INT,
    desativar BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (fkMaquina) REFERENCES maquina(idMaquina),
    FOREIGN KEY (Maquina_MetricaIdeal) REFERENCES maquina(Metrica_MetricaIdeal),
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
    FOREIGN KEY (fkComponente) REFERENCES componente(idComponente),
    FOREIGN KEY (componente_fkMaquina) REFERENCES maquina(idMaquina),
    FOREIGN KEY (componente_maquina_fkDarkstore) REFERENCES maquina(fkDarkStore),
    FOREIGN KEY (componente_maquina_fkMetrica_ideal) REFERENCES metrica_ideal(idMetricaIdeal)
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
    FOREIGN KEY (registrofkComponente) 
        REFERENCES registro (fkComponente),
    FOREIGN KEY (registroComponentefkMaquina) 
        REFERENCES registro (componente_fkMaquina),  
    FOREIGN KEY (registroComponenteMaquinafkDarkstore) 
        REFERENCES registro (componente_maquina_fkDarkstore),
    FOREIGN KEY (registroComponenteMaquinafkMetricaIdeal) 
        REFERENCES registro (componente_maquina_fkMetrica_ideal)
);