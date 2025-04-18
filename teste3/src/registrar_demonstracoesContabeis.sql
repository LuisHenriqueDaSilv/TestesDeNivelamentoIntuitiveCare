create database if not exists datas
default character set utf8
default collate utf8_general_ci;
use datas;

create table if not exists demonstracoesContabeis (
  DATA VARCHAR(10),
  REG_ANS INT,
  CD_CONTA_CONTABIL INT,
  DESCRICAO VARCHAR(255),
  VL_SALDO_INICIAL DECIMAL(15,2),
  VL_SALDO_FINAL DECIMAL(15,2),
  TRIMESTRE VARCHAR(6)
) default charset = utf8;

LOAD DATA INFILE '/var/lib/mysql-files/1T2023.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "1T2023";

LOAD DATA INFILE '/var/lib/mysql-files/2t2023.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "2T2023";
  
LOAD DATA INFILE '/var/lib/mysql-files/3T2023.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "3T2023";

LOAD DATA INFILE '/var/lib/mysql-files/4T2023.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "4T2023";

LOAD DATA INFILE '/var/lib/mysql-files/1T2024.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "1T2024";

LOAD DATA INFILE '/var/lib/mysql-files/2T2024.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "2T2024";

LOAD DATA INFILE '/var/lib/mysql-files/3T2024.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "3T2024";

LOAD DATA INFILE '/var/lib/mysql-files/4T2024.csv'
INTO TABLE demonstracoesContabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = @DATA,
  REG_ANS = @REG_ANS,
  CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
  DESCRICAO = @DESCRICAO,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.'),
  TRIMESTRE = "4T2024";
