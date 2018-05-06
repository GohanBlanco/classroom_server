-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.1.21-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la table classroom_db. answer
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) NOT NULL,
  `is_right` int(11) DEFAULT NULL,
  `id_question` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_answer_question` (`id_question`),
  CONSTRAINT `FK_answer_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Export de données de la table classroom_db.answer : ~4 rows (environ)
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` (`id`, `text`, `is_right`, `id_question`) VALUES
	(1, 'Gsm', 0, 1),
	(2, 'Infrarouge', 0, 1),
	(3, 'Bluetooth', 0, 1),
	(4, 'Wifi', 1, 1);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;

-- Export de la structure de la table classroom_db. attending_info
CREATE TABLE IF NOT EXISTS `attending_info` (
  `key` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table classroom_db.attending_info : ~0 rows (environ)
/*!40000 ALTER TABLE `attending_info` DISABLE KEYS */;
INSERT INTO `attending_info` (`key`) VALUES
	('paci.iut.1235');
/*!40000 ALTER TABLE `attending_info` ENABLE KEYS */;

-- Export de la structure de la table classroom_db. friend
CREATE TABLE IF NOT EXISTS `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `is_present` int(11) NOT NULL DEFAULT '0',
  `photo_path` varchar(100) DEFAULT NULL,
  `key` varchar(100) DEFAULT NULL,
  `last_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Export de données de la table classroom_db.friend : ~26 rows (environ)
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` (`id`, `first_name`, `last_name`, `is_present`, `photo_path`, `key`, `last_score`) VALUES
	(1, 'Ahmed', 'Chaouche', 1, 'http://localhost/classroom_server/photos/photo-chaouche.jpg', 'paci.iut.1235', 12),
	(2, 'Jean-Michel', 'Ilié', 1, NULL, 'paci.iut.1235', NULL),
	(3, 'Illmin', 'Abdouradjack', 0, NULL, NULL, NULL),
	(4, 'Inaam', 'Amzil', 0, NULL, NULL, NULL),
	(5, 'Asic', 'Ali', 0, NULL, NULL, NULL),
	(6, 'Driss', 'Belaroussi', 0, NULL, NULL, NULL),
	(7, 'Jeremy', 'Bourgis', 0, NULL, NULL, NULL),
	(8, 'Anas', 'Demmad', 0, NULL, NULL, NULL),
	(9, 'Ndoumbe', 'Dia', 0, NULL, NULL, NULL),
	(10, 'Quentin', 'Desableau', 0, NULL, NULL, NULL),
	(11, 'Kévin', 'Dupeyrat', 0, NULL, NULL, NULL),
	(12, 'Atimad', 'Eddaoudi Laacher', 0, NULL, NULL, NULL),
	(13, 'Hugo', 'Ferreira', 0, NULL, NULL, NULL),
	(14, 'Amine', 'Goual', 0, NULL, NULL, NULL),
	(15, 'Jonathan', 'Hamoudi', 0, NULL, NULL, NULL),
	(16, 'Mike', 'Helderal', 0, NULL, NULL, NULL),
	(17, 'Gamaliny', 'Kathirgamanathan', 0, NULL, NULL, NULL),
	(18, 'Ramdane', 'Kial', 0, NULL, NULL, NULL),
	(19, 'Vijay', 'Kulanathan', 0, NULL, NULL, NULL),
	(20, 'Francis-Junior', 'Laplace', 0, NULL, NULL, NULL),
	(21, 'Patrick', 'Lim', 0, NULL, NULL, NULL),
	(22, 'Charlotte', 'Picois', 0, NULL, NULL, NULL),
	(23, 'Boris', 'Rozaz', 0, NULL, NULL, NULL),
	(24, 'Mehdi', 'Salemi', 0, NULL, NULL, NULL),
	(25, 'Alex', 'Seymour', 0, NULL, NULL, NULL),
	(26, 'Abderrahman', 'Tahri', 0, NULL, NULL, NULL),
	(27, 'Clement', 'Touresse', 0, NULL, NULL, NULL),
	(28, 'Kevin', 'Vincent', 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;

-- Export de la structure de la table classroom_db. question
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL,
  `duration` int(11) DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Export de données de la table classroom_db.question : ~0 rows (environ)
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`id`, `text`, `duration`) VALUES
	(1, 'Quelle technologie permet de se connecter à un réseau sans fil ?', 10);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
