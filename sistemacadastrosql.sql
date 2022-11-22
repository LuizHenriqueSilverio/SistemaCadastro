-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.35-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para psf_luizedaiana
DROP DATABASE IF EXISTS `psf_luizedaiana`;
CREATE DATABASE IF NOT EXISTS `psf_luizedaiana` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `psf_luizedaiana`;

-- Copiando estrutura para tabela psf_luizedaiana.consultas
DROP TABLE IF EXISTS `consultas`;
CREATE TABLE IF NOT EXISTS `consultas` (
  `codCONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `MEDICOS_codMEDICOS` int(11) NOT NULL,
  `PACIENTES_codPACIENTES` int(11) NOT NULL,
  PRIMARY KEY (`codCONSULTA`,`MEDICOS_codMEDICOS`,`PACIENTES_codPACIENTES`),
  KEY `fk_CONSULTAS_MEDICOS_idx` (`MEDICOS_codMEDICOS`),
  KEY `fk_CONSULTAS_PACIENTES1_idx` (`PACIENTES_codPACIENTES`),
  CONSTRAINT `fk_CONSULTAS_MEDICOS` FOREIGN KEY (`MEDICOS_codMEDICOS`) REFERENCES `medicos` (`codMEDICOS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTAS_PACIENTES1` FOREIGN KEY (`PACIENTES_codPACIENTES`) REFERENCES `pacientes` (`codPACIENTES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.consultas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;

-- Copiando estrutura para tabela psf_luizedaiana.medicos
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `codMEDICOS` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `crm` varchar(45) NOT NULL,
  `especialidade` varchar(200) NOT NULL,
  PRIMARY KEY (`codMEDICOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.medicos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;

-- Copiando estrutura para tabela psf_luizedaiana.pacientes
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `codPACIENTES` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(100) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  PRIMARY KEY (`codPACIENTES`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.pacientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Copiando estrutura para procedure psf_luizedaiana.proc_alteraConsulta
DROP PROCEDURE IF EXISTS `proc_alteraConsulta`;
DELIMITER //
CREATE PROCEDURE `proc_alteraConsulta`(IN dataHora DATETIME, IN motivo VARCHAR(200), IN Medicos_codMedicos INT, IN Pacientes_codPacientes INT, IN codCons INT)
BEGIN
	UPDATE `psf_luizedaiana`.`consultas`
	SET
	`dataHora` = dataHora,
	`motivo` = motivo,
	`MEDICOS_codMEDICOS` = Medicos_codMedicos,
	`PACIENTES_codPACIENTES` = Pacientes_codPacientes
	WHERE `codCONSULTA` = codCons;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_alteraMedico
DROP PROCEDURE IF EXISTS `proc_alteraMedico`;
DELIMITER //
CREATE PROCEDURE `proc_alteraMedico`(IN nome VARCHAR(100), IN crm VARCHAR(45), IN cod INT)
BEGIN
	UPDATE `psf_luizedaiana`.`medicos`
	SET
		`nome` = nome,
		`crm` = crm
	WHERE `codMEDICOS` = cod;

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_alteraPaciente
DROP PROCEDURE IF EXISTS `proc_alteraPaciente`;
DELIMITER //
CREATE PROCEDURE `proc_alteraPaciente`(IN cpf VARCHAR(100), IN nome VARCHAR(200), IN telefone VARCHAR(45), IN endereco VARCHAR(200))
BEGIN
	UPDATE `psf_luizedaiana`.`pacientes`
	SET
		`cpf` = cpf,
		`nome` = nome,
		`telefone` = telefone,
		`endereco` = endereco
	WHERE `codPACIENTES` = cod;

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_deletaMedico
DROP PROCEDURE IF EXISTS `proc_deletaMedico`;
DELIMITER //
CREATE PROCEDURE `proc_deletaMedico`(IN codMed INT)
BEGIN
	DELETE FROM `psf_luizedaiana`.`medicos`
	WHERE codMedicos = codMed;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_deletaPaciente
DROP PROCEDURE IF EXISTS `proc_deletaPaciente`;
DELIMITER //
CREATE PROCEDURE `proc_deletaPaciente`(IN codPac INT)
BEGIN
	DELETE FROM `psf_luizedaiana`.`pacientes`
	WHERE codPacientes = codPac;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_insereConsulta
DROP PROCEDURE IF EXISTS `proc_insereConsulta`;
DELIMITER //
CREATE PROCEDURE `proc_insereConsulta`(IN dataHora DATETIME, IN motivo VARCHAR(200), IN Medicos_codMedicos INT, IN Paciente_codPacientes INT)
BEGIN
	INSERT INTO `psf_luizedaiana`.`consultas`
	(
		`dataHora`,
		`motivo`,
		`MEDICOS_codMEDICOS`,
		`PACIENTES_codPACIENTES`
    )
	VALUES
	(
		dataHora,
		motivo,
		Medicos_codMedicos,
		Pacientes_codPacientes
    );

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_insereMedico
DROP PROCEDURE IF EXISTS `proc_insereMedico`;
DELIMITER //
CREATE PROCEDURE `proc_insereMedico`(IN nomeMedico VARCHAR(100), IN crmMedico VARCHAR(45))
BEGIN
	INSERT INTO MEDICOS VALUES(
		NULL,
        nomeMedico,
        crmMedico
	);
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_inserePaciente
DROP PROCEDURE IF EXISTS `proc_inserePaciente`;
DELIMITER //
CREATE PROCEDURE `proc_inserePaciente`(IN cpfPaciente VARCHAR(100), 
										IN nomePaciente VARCHAR(100), 
                                        IN telefone VARCHAR(45), 
                                        IN endereco VARCHAR(100))
BEGIN
	INSERT INTO PACIENTES VALUES(
		NULL,
		cpfPaciente,
		nomePaciente,
        telefone,
        endereco
    );
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
