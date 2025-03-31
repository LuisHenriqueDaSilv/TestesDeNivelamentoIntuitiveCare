create database if not exists datas
default character set utf8
default collate utf8_general_ci;

use datas;

create table if not exists operadorasDePlanoDeSaudeAtivas (
    Registro_ANS VARCHAR(6),
    CNPJ VARCHAR(14),
    Razao_Social VARCHAR(255),
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(255),
    Logradouro VARCHAR(255),
    Numero VARCHAR(15),
    Complemento VARCHAR(100),
    Bairro VARCHAR(255),
    Cidade VARCHAR(255),
    UF CHAR(2),
    CEP VARCHAR(10),
    DDD CHAR(2),
    Telefone VARCHAR(20),
    Fax VARCHAR(15),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(255),
    Cargo_Representante VARCHAR(255),
    Regiao_de_Comercializacao INT,
    Data_Registro_ANS VARCHAR(10)
) default charset = utf8;


LOAD DATA INFILE '/var/lib/mysql-files/Relatorio_cadop.csv'
INTO TABLE operadorasDePlanoDeSaudeAtivas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@Registro_ANS, @CNPJ, @Razao_Social, @Nome_Fantasia, @Modalidade, @Logradouro, @Numero, @Complemento, @Bairro, @Cidade, @UF, @CEP, @DDD, @Telefone, @Fax, @Endereco_eletronico, @Representante, @Cargo_Representante, @Regiao_de_Comercializacao, @Data_Registro_ANS)
SET 
    Registro_ANS = @Registro_ANS,
    CNPJ = @CNPJ,
    Razao_Social = @Razao_Social,
    Nome_Fantasia = @Nome_Fantasia,
    Modalidade = @Modalidade,
    Logradouro = @Logradouro,
    Numero = @Numero,
    Complemento = @Complemento,
    Bairro = @Bairro,
    Cidade = @Cidade,
    UF = @UF,
    CEP = @CEP,
    DDD = @DDD,
    Telefone = @Telefone,
    Fax = @Fax,
    Endereco_eletronico = @Endereco_eletronico,
    Representante = @Representante,
    Cargo_Representante = @Cargo_Representante,
    Regiao_de_Comercializacao = NULLIF(@Regiao_de_Comercializacao, ''),
    Data_Registro_ANS = @Data_Registro_ANS;
