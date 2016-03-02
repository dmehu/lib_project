-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.11-log - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour books
CREATE DATABASE IF NOT EXISTS `books` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `books`;


-- Export de la structure de table books. book
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(32) NOT NULL,
  `author_name` varchar(32) NOT NULL,
  `genre` varchar(32) NOT NULL,
  `pages` varchar(32) NOT NULL,
  `year` varchar(32) NOT NULL,
  `rating` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Export de données de la table books.book : ~0 rows (environ)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`id`, `book_name`, `author_name`, `genre`, `pages`, `year`, `rating`) VALUES
	(1, 'Le seigneur des Anneaux', 'JRR Tolkien', 'Science-Fiction', '800', '1960', '4'),
	(2, 'Le Hobbit', 'JRR Tolkien', 'Science-Fiction', '250', '1955', '3'),
	(3, 'Don Quichotte', 'Miguel de Cervantes', 'Aventure', '500', '1610', '5'),
	(4, 'Terre des pigeons', 'Eric Gauthier', 'Drame', '200', '1985', '3'),
	(5, 'Une fêlure au flanc du monde', 'Eric Gauthier', 'Drame', '443', '2010', '4');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
