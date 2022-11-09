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


-- Copiando estrutura do banco de dados para banco_cadastro
CREATE DATABASE IF NOT EXISTS `banco_cadastro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `banco_cadastro`;

-- Copiando estrutura para tabela banco_cadastro.bandas
CREATE TABLE IF NOT EXISTS `bandas` (
  `idbandas` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `integrantes` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `genero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbandas`),
  KEY `genero_idx` (`genero`),
  CONSTRAINT `genero` FOREIGN KEY (`genero`) REFERENCES `generos` (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela banco_cadastro.bandas: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `bandas` DISABLE KEYS */;
INSERT INTO `bandas` (`idbandas`, `nome`, `integrantes`, `ranking`, `genero`) VALUES
	(8, 'Metallica', 4, 1, 2),
	(9, 'Megadeth', 4, 2, 2),
	(10, 'Exaltasamba', 1, 3, 3),
	(11, 'Judas Priest', 4, 4, 2);
/*!40000 ALTER TABLE `bandas` ENABLE KEYS */;

-- Copiando estrutura para tabela banco_cadastro.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `idgenero` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela banco_cadastro.generos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` (`idgenero`, `genero`) VALUES
	(1, 'Rock'),
	(2, 'Metal'),
	(3, 'Pagode'),
	(4, 'Gospel');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;

-- Copiando estrutura para procedure banco_cadastro.insere_banda
DELIMITER //
CREATE PROCEDURE `insere_banda`(nome VARCHAR(45), integrantes INT(11), ranking INT(11), genero INT(11))
BEGIN
	INSERT INTO `banco_cadastro`.`bandas`
		(
			`nome`,
			`integrantes`,
			`ranking`,
			`genero`
		)
		VALUES
		(
			nome,
			integrantes,
			ranking,
			genero
		);

END//
DELIMITER ;

-- Copiando estrutura para procedure banco_cadastro.insere_genero
DELIMITER //
CREATE PROCEDURE `insere_genero`(genero VARCHAR(50))
BEGIN
	INSERT INTO `banco_cadastro`.`generos`
	(`genero`)
	VALUES
	(genero);
END//
DELIMITER ;

-- Copiando estrutura para procedure banco_cadastro.lista_bandas
DELIMITER //
CREATE PROCEDURE `lista_bandas`()
BEGIN
	SELECT 	idbandas,
			nome,
            integrantes,
            ranking,
            generos.genero 
	FROM bandas INNER JOIN generos ON bandas.genero = generos.idgenero;

END//
DELIMITER ;

-- Copiando estrutura para procedure banco_cadastro.lista_generos
DELIMITER //
CREATE PROCEDURE `lista_generos`()
BEGIN
	SELECT * FROM GENEROS;
END//
DELIMITER ;

-- Copiando estrutura para procedure banco_cadastro.remove_banda
DELIMITER //
CREATE PROCEDURE `remove_banda`(IN idbanda INT)
BEGIN
	DELETE FROM `banco_cadastro`.`generos`
	WHERE `idbandas` = idbanda;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
