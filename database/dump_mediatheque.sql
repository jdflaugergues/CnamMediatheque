-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 16 Février 2016 à 23:08
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `mediatheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

CREATE TABLE IF NOT EXISTS `abonne` (
  `abo_abonneId` int(11) NOT NULL AUTO_INCREMENT,
  `abo_nom` varchar(30) COLLATE utf8_bin NOT NULL,
  `abo_prenom` varchar(30) COLLATE utf8_bin NOT NULL,
  `abo_cat_categorieId` int(11) NOT NULL,
  PRIMARY KEY (`abo_abonneId`),
  KEY `abo_cat_categorieId` (`abo_cat_categorieId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `abonne`
--

INSERT INTO `abonne` (`abo_abonneId`, `abo_nom`, `abo_prenom`, `abo_cat_categorieId`) VALUES
(1, 'Doe', 'John', 1),
(2, 'Montana', 'Dave', 1),
(3, 'Debard', 'Pascal', 2),
(4, 'Sitbon', 'Nicolas', 2);

-- --------------------------------------------------------

--
-- Structure de la table `adulte`
--

CREATE TABLE IF NOT EXISTS `adulte` (
  `abo_abonneId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`abo_abonneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `adulte`
--

INSERT INTO `adulte` (`abo_abonneId`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `cat_categorieId` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cat_categorieId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`cat_categorieId`, `cat_nom`) VALUES
(1, 'Adulte'),
(2, 'Enfant');

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `doc_documentId` int(11) NOT NULL AUTO_INCREMENT,
  `doc_titre` varchar(100) COLLATE utf8_bin NOT NULL,
  `doc_dateParution` varchar(50) COLLATE utf8_bin NOT NULL,
  `doc_typ_typeId` int(11) NOT NULL,
  PRIMARY KEY (`doc_documentId`),
  KEY `doc_typ_typeId` (`doc_typ_typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=39 ;

--
-- Contenu de la table `document`
--

INSERT INTO `document` (`doc_documentId`, `doc_titre`, `doc_dateParution`, `doc_typ_typeId`) VALUES
(1, 'Seul sur Mars', '24 février 2016', 1),
(2, 'Scarface', '1er Avril 2009', 1),
(3, 'Jurassic Park', '6 septembre 2005', 1),
(4, 'Aliens', '17 mai 2000', 1),
(5, 'The Ring', '7 octobre 2003', 1),
(6, 'Terminator 2', '20 juin 2000', 1),
(7, 'L''Arme fatale', '15 novembre 2006', 1),
(8, 'Science & Vie', 'Janvier 2015', 2),
(9, 'Science & Vie', 'Février 2015', 2),
(10, 'Science & Vie', 'Mars 2015', 2),
(11, 'Science & Vie', 'Avril 2015', 2),
(12, 'Science & Vie', 'Mai 2015', 2),
(13, 'Science & Vie', 'Juin 2015', 2),
(14, 'Science & Vie', 'Juillet 2015', 2),
(15, 'Science & Vie', 'Aout 2015', 2),
(16, 'Science & Vie', 'Septembre 2015', 2),
(17, 'Science & Vie', 'Octobre 2015', 2),
(18, 'Science & Vie', 'Novembre 2015', 2),
(19, 'Science & Vie', 'Décembre 2015', 2),
(20, 'Android Magazine', 'Janvier 2015', 2),
(21, 'Android Magazine', 'Février 2015', 2),
(22, 'Android Magazine', 'Mars 2015', 2),
(23, 'Android Magazine', 'Avril 2015', 2),
(24, 'Android Magazine', 'Mai 2015', 2),
(25, 'Android Magazine', 'Juin 2015', 2),
(26, 'Android Magazine', 'Juillet 2015', 2),
(27, 'Android Magazine', 'Aout 2015', 2),
(28, 'Android Magazine', 'Septembre 2015', 2),
(29, 'Android Magazine', 'Octobre 2015', 2),
(30, 'Android Magazine', 'Novembre 2015', 2),
(31, 'Android Magazine', 'Décembre 2015', 2),
(32, 'Le management entre modèles et pratiques', 'Octobre 2003', 3),
(33, 'Minimum Competence In Scientific English', 'Aout 2006', 3),
(34, 'Mind Map', 'Juin 2008', 3),
(35, 'Bien développer pour le Web 2.0', 'Novembre 2006', 3),
(36, 'Le Guide MICHELIN France 2016', '5 Février 2016', 3),
(37, 'La ligne verte', '23 avril 2008', 3),
(38, 'Shinning', '31 octobre 2007', 3);

-- --------------------------------------------------------

--
-- Structure de la table `dvd`
--

CREATE TABLE IF NOT EXISTS `dvd` (
  `doc_documentId` int(11) NOT NULL DEFAULT '0',
  `dvd_genre` varchar(40) COLLATE utf8_bin NOT NULL,
  `dvd_duree` int(4) NOT NULL,
  `dvd_realisateur` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`doc_documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `dvd`
--

INSERT INTO `dvd` (`doc_documentId`, `dvd_genre`, `dvd_duree`, `dvd_realisateur`) VALUES
(1, 'Aventure', 136, 'Ridley Scott'),
(2, 'Policier & Thriller', 163, 'Brian De Palma'),
(3, 'Science-fiction', 122, 'Steven Spielberg'),
(4, 'Science-fiction', 148, 'James Cameron'),
(5, 'Horreur et epouvante', 115, 'Naomi Watts'),
(6, 'Catastrophe', 132, 'James Cameron'),
(7, 'Action', 110, 'Richard Donner');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE IF NOT EXISTS `emprunt` (
  `emp_cat_categorieId` int(11) NOT NULL,
  `emp_typ_typeId` int(11) NOT NULL,
  `emp_qttMax` int(11) NOT NULL,
  `emp_duree` int(11) NOT NULL,
  PRIMARY KEY (`emp_cat_categorieId`,`emp_typ_typeId`),
  KEY `emp_typ_typeId` (`emp_typ_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `emprunt`
--

INSERT INTO `emprunt` (`emp_cat_categorieId`, `emp_typ_typeId`, `emp_qttMax`, `emp_duree`) VALUES
(1, 1, 3, 7),
(1, 2, 2, 21),
(1, 3, 10, 21),
(1, 4, 10, 21),
(2, 1, 2, 14),
(2, 2, 1, 14),
(2, 3, 6, 14),
(2, 4, 6, 14);

-- --------------------------------------------------------

--
-- Structure de la table `enfant`
--

CREATE TABLE IF NOT EXISTS `enfant` (
  `abo_abonneId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`abo_abonneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `enfant`
--

INSERT INTO `enfant` (`abo_abonneId`) VALUES
(3),
(4);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `doc_documentId` int(11) NOT NULL DEFAULT '0',
  `liv_nbPages` int(11) NOT NULL,
  `liv_editeur` varchar(40) COLLATE utf8_bin NOT NULL,
  `liv_isbn` varchar(13) COLLATE utf8_bin NOT NULL,
  `liv_auteur` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`doc_documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`doc_documentId`, `liv_nbPages`, `liv_editeur`, `liv_isbn`, `liv_auteur`) VALUES
(32, 318, 'Edtions d''organisation', '2708126512', 'Raymond LEBAN'),
(33, 267, 'EDP Sciences', '2868835880', 'Sue BLATTES'),
(34, 322, 'Eyrolles', '9782708129214', 'Tony & Barry BUZZAN'),
(35, 561, 'Eyrolles', '9782212120288', 'Christophe PORTENEUVE'),
(36, 435, 'Broché', '9782067206335', 'Collectif Michelin'),
(37, 506, 'Poche', '2729852687', 'Stephen King'),
(38, 576, 'Poche', '2253151629', 'Stephen King');

-- --------------------------------------------------------

--
-- Structure de la table `periodique`
--

CREATE TABLE IF NOT EXISTS `periodique` (
  `doc_documentId` int(11) NOT NULL DEFAULT '0',
  `per_numero` int(11) NOT NULL,
  PRIMARY KEY (`doc_documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `periodique`
--

INSERT INTO `periodique` (`doc_documentId`, `per_numero`) VALUES
(8, 1167),
(9, 1168),
(10, 1169),
(11, 1170),
(12, 1171),
(13, 1172),
(14, 1173),
(15, 1174),
(16, 1175),
(17, 1176),
(18, 1177),
(19, 1178),
(20, 28),
(21, 29),
(22, 30),
(23, 31),
(24, 32),
(25, 33),
(26, 34),
(27, 35),
(28, 36),
(29, 37),
(30, 38),
(31, 39);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `res_doc_documentId` int(11) NOT NULL,
  `res_abo_abonneId` int(11) NOT NULL,
  `res_date` datetime NOT NULL,
  `res_retour` datetime DEFAULT NULL,
  PRIMARY KEY (`res_doc_documentId`,`res_abo_abonneId`,`res_date`),
  KEY `res_abo_abonneId` (`res_abo_abonneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`res_doc_documentId`, `res_abo_abonneId`, `res_date`, `res_retour`) VALUES
(1, 1, '2016-02-11 23:18:44', '2016-02-11 00:00:00'),
(1, 1, '2016-02-11 23:42:25', '2016-02-12 00:00:00'),
(1, 3, '2016-01-10 00:01:39', NULL),
(2, 1, '2016-02-11 23:37:26', '2016-02-11 00:00:00'),
(2, 1, '2016-02-11 23:37:32', '2016-02-11 00:00:00'),
(2, 1, '2016-02-11 23:57:18', '2016-02-11 00:00:00'),
(2, 1, '2016-02-12 00:00:11', '2016-02-12 00:00:00'),
(2, 1, '2016-02-12 23:41:28', '2016-02-16 00:00:00'),
(2, 1, '2016-02-16 23:03:58', NULL),
(2, 2, '2016-02-11 23:29:58', '2016-02-11 00:00:00'),
(3, 3, '2016-02-11 23:30:05', '2016-02-12 00:00:00'),
(3, 4, '2016-02-09 22:33:58', NULL),
(4, 2, '2016-02-11 23:06:53', '2016-02-11 00:00:00'),
(4, 2, '2016-02-11 23:30:11', '2016-02-12 00:00:00'),
(5, 1, '2016-02-11 23:38:03', '2016-02-16 00:00:00'),
(6, 1, '2016-02-09 00:01:34', NULL),
(7, 4, '2016-02-12 00:01:53', NULL),
(8, 1, '2016-02-12 23:41:42', NULL),
(9, 2, '2016-02-12 00:02:42', NULL),
(12, 4, '2016-02-16 22:34:35', NULL),
(13, 3, '2016-02-16 22:34:40', NULL),
(19, 2, '2016-02-16 22:34:54', NULL),
(29, 1, '2016-02-16 22:35:05', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `typ_typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typ_nom` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`typ_typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`typ_typeId`, `typ_nom`) VALUES
(1, 'DVD'),
(2, 'Périodique'),
(3, 'Livre'),
(4, 'Document');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD CONSTRAINT `abonne_ibfk_1` FOREIGN KEY (`abo_cat_categorieId`) REFERENCES `categorie` (`cat_categorieId`);

--
-- Contraintes pour la table `adulte`
--
ALTER TABLE `adulte`
  ADD CONSTRAINT `adulte_ibfk_1` FOREIGN KEY (`abo_abonneId`) REFERENCES `abonne` (`abo_abonneId`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`doc_typ_typeId`) REFERENCES `type` (`typ_typeId`);

--
-- Contraintes pour la table `dvd`
--
ALTER TABLE `dvd`
  ADD CONSTRAINT `dvd_ibfk_1` FOREIGN KEY (`doc_documentId`) REFERENCES `document` (`doc_documentId`);

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`emp_cat_categorieId`) REFERENCES `categorie` (`cat_categorieId`),
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`emp_typ_typeId`) REFERENCES `type` (`typ_typeId`);

--
-- Contraintes pour la table `enfant`
--
ALTER TABLE `enfant`
  ADD CONSTRAINT `enfant_ibfk_1` FOREIGN KEY (`abo_abonneId`) REFERENCES `abonne` (`abo_abonneId`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`doc_documentId`) REFERENCES `document` (`doc_documentId`);

--
-- Contraintes pour la table `periodique`
--
ALTER TABLE `periodique`
  ADD CONSTRAINT `periodique_ibfk_1` FOREIGN KEY (`doc_documentId`) REFERENCES `document` (`doc_documentId`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`res_doc_documentId`) REFERENCES `document` (`doc_documentId`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`res_abo_abonneId`) REFERENCES `abonne` (`abo_abonneId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
