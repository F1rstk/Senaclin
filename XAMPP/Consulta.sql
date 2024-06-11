 DATABASE BD_senaclin
 /*Mostrar BD*/
 SHOW DATABASES
 /*Selecionar BD*/
 USE BD_senaclin
 /*Apagar BD*/
 SHOW TABLES
 /*Criar BD*/
 CREATE DATABASE BD_senaclin
 /*Apagar BD*/
 DROP DATABASE test
 /*Criação de tabelas BD*/
 CREATE TABLE medico(
 idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nomeMedico VARCHAR(50) NOT NULL,
 loginMedico VARCHAR(50) NOT NULL,
 senha CHAR(8) NOT NULL,
 CRM CHAR(8) NOT NULL
 );
 SHOW TABLES /*mostra as tabelas do banco de dados selecionado*/
 /*DROP TABLE medico - apaga a tabela do banco de dados*/
 
 CREATE TABLE recepcionista(
 idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nomeRecepcionista VARCHAR(50) NOT NULL,
 loginREcepcionsita VARCHAR(50) NOT NULL,
 senha CHAR(8) NOT NULL,
 celular CHAR(11) NOT NULL,
 nomelougradouro VARCHAR(50) NOT NULL,
 numero VARCHAR(7) NOT NULL,
 complemento VARCHAR(10) NOT NULL,
 cep CHAR(8) NOT NULL,
 cidade VARCHAR(30) NOT NULL,
 estado CHAR(2) NOT NULL
 );

CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL DEFAULT 'Não informado',
tiposanguineo VARCHAR(3) NOT NULL,
doencasPreexistentes VARCHAR(255)NULL,
CONSTRAINT chk_tipoSanguineo CHECK (tipoSanguineo= 'A-' OR tipoSanguineo= 'AB+' OR tipoSanguineo= 'AB-' OR tipoSanguineo= 'B+' OR tipoSanguineo= 'B-' OR tipoSanguineo= 'O+' OR tipoSanguineo= 'O-')
);

CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
TipoConsulta SMALLINT DEFAULT 0,
/*0 primeira vez 1-Retorno*/
observacoes VARCHAR(255),
valor DECIMAL(7,2),
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);

/*Inserindo massa de dados*/
INSERT INTO medico(nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Olavo','olavodoctor@gamil.com','12345678','222333SP');

/*Buscando Dados*/
SELECT*FROM medico
SELECT nomeMedico,crm FROM medico

/*Alterar  ou atualizar dados8*/
UPDATE medico
SET senha='8765321',
loginMedico='olavodoctor@hotmail.com'
WHERE idMedico=1


 
