-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.31 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour inscription_bdd
CREATE DATABASE IF NOT EXISTS `inscription_bdd` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inscription_bdd`;

-- Listage de la structure de la table inscription_bdd. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `pseudoUtilisateur` varchar(50) NOT NULL DEFAULT '',
  `emailUtilisateur` varchar(200) NOT NULL DEFAULT '',
  `nomUtilisateur` varchar(200) NOT NULL DEFAULT '',
  `prenomUtilisateur` varchar(200) NOT NULL DEFAULT '',
  `telUtilisateur` varchar(10) NOT NULL DEFAULT '',
  `adresseUtilisateur` varchar(200) NOT NULL DEFAULT '',
  `codePostalUtilisateur` varchar(5) NOT NULL DEFAULT '',
  `villeUtilisateur` varchar(100) NOT NULL DEFAULT '',
  `mdpUtilisateur` varchar(50) DEFAULT NULL,
  `tokenUtilisateur` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table inscription_bdd.utilisateur : 1 rows
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`idUtilisateur`, `pseudoUtilisateur`, `emailUtilisateur`, `nomUtilisateur`, `prenomUtilisateur`, `telUtilisateur`, `adresseUtilisateur`, `codePostalUtilisateur`, `villeUtilisateur`, `mdpUtilisateur`, `tokenUtilisateur`) VALUES
	(3, 'Hugo Robin', 'compote2pommepro@gmail.com', 'Robin', 'Hugo', '0617522577', '28 Rue de Père Pierre', '34500', 'Béziers', 'ba11d3229ef16c94d3061cb372ecb85f31f16ff0', 'HkQ3qTzzDuFmS8bT6HJW9HqgkASwVQdk5OnIU5VwieawiUm3lZ3OOLm8ocBzet');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
