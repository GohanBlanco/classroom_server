-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 02 Mars 2018 à 12:42
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `sili_classroom`
--

-- --------------------------------------------------------

--
-- Structure de la table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_right` int(11) DEFAULT NULL,
  `id_question` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_answer_question` (`id_question`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `answer`
--

INSERT INTO `answer` (`id`, `text`, `is_right`, `id_question`) VALUES
(1, 'Gsm', 0, 1),
(2, 'Infrarouge', 0, 1),
(3, 'Bluetooth', 0, 1),
(4, 'Wifi', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `attending_info`
--
drop table attending_info;

CREATE TABLE IF NOT EXISTS `attending_info` (
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `attending_info`
--

INSERT INTO `attending_info` (`key`) VALUES
('1235');

-- --------------------------------------------------------

--
-- Structure de la table `friend`
--

CREATE TABLE IF NOT EXISTS `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_present` int(11) NOT NULL DEFAULT '0',
  `photo_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Contenu de la table `friend`
--

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
(28, 'Kevin', 'Vincent', 0, NULL, NULL, NULL),
(29,'Livio','Chan',1,NULL,NULL,100),
(30,'Yann','Dias',0,NULL,NULL,NULL);
INSERT INTO `friend` (`id`, `first_name`, `last_name`, `is_present`, `photo_path`, `key`, `last_score`) VALUES
(29,'Livio','Chan',100,NULL,NULL,NULL);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `duration` int(11) DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`id`, `text`, `duration`) VALUES
(1, 'Quelle technologie permet de se connecter à un réseau sans fil ?', 10);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_answer_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
