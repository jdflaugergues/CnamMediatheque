--
-- Structure de la table `Categorie`
--
CREATE TABLE `Categorie` (
  `cat_categorieId` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cat_categorieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Categorie` (`cat_nom`) VALUES
('Adulte'),
('Enfant');

--
-- Structure de la table `Abonne`
--
CREATE TABLE `Abonne` (
  `abo_abonneId` int(11) NOT NULL AUTO_INCREMENT,
  `abo_nom` varchar(30) COLLATE utf8_bin NOT NULL,
  `abo_prenom` varchar(30) COLLATE utf8_bin NOT NULL,
  `abo_cat_categorieId` int(11) NOT NULL,
  PRIMARY KEY (`abo_abonneId`),
  FOREIGN KEY (abo_cat_categorieId) REFERENCES Categorie(cat_categorieId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Abonne` (`abo_prenom`,`abo_nom`,`abo_cat_categorieId`) VALUES
('John','Doe',1),
('Dave','Montana',1),
('Pascal','Debard',2),
('Nicolas','Sitbon',2);

--
-- Structure de la table `Adulte`
--
CREATE TABLE Adulte (abo_abonneId INT,
         PRIMARY KEY (abo_abonneId),
         FOREIGN KEY (abo_abonneId) REFERENCES Abonne(abo_abonneId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Adulte` (`abo_abonneId`) VALUES
(1),
(2);

--
-- Structure de la table `Enfant`
--
CREATE TABLE Enfant (abo_abonneId INT,
         PRIMARY KEY (abo_abonneId),
         FOREIGN KEY (abo_abonneId) REFERENCES Abonne(abo_abonneId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Enfant` (`abo_abonneId`) VALUES
(3),
(4);

--
-- Structure de la table `Type`
--
CREATE TABLE `Type` (
  `typ_typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typ_nom` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`typ_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Type` (`typ_nom`) VALUES
('dvd'),
('periodique'),
('livre');


--
-- Structure de la table `Document`
--
CREATE TABLE Document (doc_documentId INT AUTO_INCREMENT,
         doc_titre VARCHAR(100) COLLATE utf8_bin NOT NULL,
         doc_dateParution VARCHAR(50) NOT NULL,
         doc_typ_typeId int(11) NOT NULL,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_typ_typeId) REFERENCES Type(typ_typeId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Document` (doc_titre,doc_dateParution,doc_typ_typeId) VALUES
('Seul sur Mars'   ,'24 février 2016'   ,1),
('Scarface'        ,'1er Avril 2009'    ,1),
('Jurassic Park'   ,'6 septembre 2005'  ,1),
('Aliens'          ,'17 mai 2000'       ,1),
('The Ring'        ,'7 octobre 2003'    ,1),
('Terminator 2'    ,'20 juin 2000'      ,1),
('L''Arme fatale'  ,'15 novembre 2006'  ,1),

('Science & Vie','Janvier 2015',2),
('Science & Vie','Février 2015',2),
('Science & Vie','Mars 2015',2),
('Science & Vie','Avril 2015',2),
('Science & Vie','Mai 2015',2),
('Science & Vie','Juin 2015',2),
('Science & Vie','Juillet 2015',2),
('Science & Vie','Aout 2015',2),
('Science & Vie','Septembre 2015',2),
('Science & Vie','Octobre 2015',2),
('Science & Vie','Novembre 2015',2),
('Science & Vie','Décembre 2015',2),

('Android Magazine','Janvier 2015',2),
('Android Magazine','Février 2015',2),
('Android Magazine','Mars 2015',2),
('Android Magazine','Avril 2015',2),
('Android Magazine','Mai 2015',2),
('Android Magazine','Juin 2015',2),
('Android Magazine','Juillet 2015',2),
('Android Magazine','Aout 2015',2),
('Android Magazine','Septembre 2015',2),
('Android Magazine','Octobre 2015',2),
('Android Magazine','Novembre 2015',2),
('Android Magazine','Décembre 2015',2),

('Le management entre modèles et pratiques','Octobre 2003',3),
('Minimum Competence In Scientific English','Aout 2006',3),
('Mind Map','Juin 2008',3),
('Bien développer pour le Web 2.0','Novembre 2006',3),
('Le Guide MICHELIN France 2016','5 Février 2016',3),
('La ligne verte','23 avril 2008',3),
('Shinning','31 octobre 2007',3);

--
-- Structure de la table `DVD`
--
CREATE TABLE DVD (doc_documentId INT,
         dvd_genre VARCHAR(40) COLLATE utf8_bin NOT NULL,
         dvd_realisateur VARCHAR(50) COLLATE utf8_bin NOT NULL,
         dvd_duree int(4) ,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_documentId) REFERENCES Document(doc_documentId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `DVD` (doc_documentId,dvd_genre,dvd_realisateur,dvd_duree) VALUES
(1,'Aventure','Ridley Scott'    ,136),
(2,'Policier & Thriller','Brian De Palma'  ,163),
(3,'Science-fiction','Steven Spielberg',122),
(4,'Science-fiction','James Cameron'   ,148),
(5,'Horreur et epouvante','Naomi Watts'     ,115),
(6,'Catastrophe','James Cameron'   ,132),
(7,'Action','Richard Donner'  ,110);

--
-- Structure de la table `Periodique`
--
CREATE TABLE Periodique (doc_documentId INT,
         per_numero INT NOT NULL,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_documentId) REFERENCES Document(doc_documentId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Periodique` (doc_documentId,per_numero) VALUES
(8,1167),
(9,1168),
(10,1169),
(11,1170),
(12,1171),
(13,1172),
(14,1173),
(15,1174),
(16,1175),
(17,1176),
(18,1177),
(19,1178),
(20,28),
(21,29),
(22,30),
(23,31),
(24,32),
(25,33),
(26,34),
(27,35),
(28,36),
(29,37),
(30,38),
(31,39);

--
-- Structure de la table `Livre`
--
CREATE TABLE Livre (doc_documentId INT,
         liv_nbPages int NOT NULL,
         liv_editeur VARCHAR(40) COLLATE utf8_bin NOT NULL,
         liv_isbn VARCHAR(13) NOT NULL,
         liv_auteur VARCHAR(40) COLLATE utf8_bin NOT NULL,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_documentId) REFERENCES Document(doc_documentId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Livre` (doc_documentId,liv_nbPages,liv_editeur,liv_isbn,liv_auteur) VALUES
(32,318,'Edtions d''organisation','2708126512','Raymond LEBAN'),
(33,267,'EDP Sciences','2868835880','Sue BLATTES'),
(34,322,'Eyrolles','9782708129214','Tony & Barry BUZZAN'),
(35,561,'Eyrolles','9782212120288','Christophe PORTENEUVE'),
(36,435,'Broché','9782067206335','Collectif Michelin'),
(37,506,'Poche','2729852687','Stephen King'),
(38,576,'Poche','2253151629','Stephen King');

--
-- Structure de la table `Reservation`
--
CREATE TABLE `Reservation` (
  `res_doc_documentId` int(11) NOT NULL,
  `res_abo_abonneId` int(11) NOT NULL,
  `res_date` date NOT NULL,
  `res_retour` date DEFAULT NULL,
  PRIMARY KEY (`res_doc_documentId`,`res_abo_abonneId`),
  FOREIGN KEY (res_doc_documentId) REFERENCES Document(doc_documentId),
  FOREIGN KEY (res_abo_abonneId) REFERENCES Abonne(abo_abonneId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Structure de la table `Emprunt`
--
CREATE TABLE `Emprunt` (
  `emp_cat_categorieId` int(11) NOT NULL,
  `emp_typ_typeId` int(11) NOT NULL,
  `emp_qttMax` int(11) NOT NULL,
  `emp_duree` int(11) NOT NULL,
  PRIMARY KEY (`emp_cat_categorieId`,`emp_typ_typeId`),
  FOREIGN KEY (emp_cat_categorieId) REFERENCES Categorie(cat_categorieId),
  FOREIGN KEY (emp_typ_typeId) REFERENCES Type(typ_typeId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `Emprunt`(`emp_cat_categorieId`,`emp_typ_typeId`,`emp_qttMax`,`emp_duree`) VALUES
(1,1,3,7),
(1,2,2,21),
(1,3,10,21),
(2,1,2,14),
(2,2,1,14),
(2,3,6,14);
