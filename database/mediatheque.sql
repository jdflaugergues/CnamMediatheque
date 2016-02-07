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

INSERT INTO `Abonne` (`abo_nom`,`abo_prenom`,`abo_cat_categorieId`) VALUES
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

--
-- Structure de la table `Enfant`
--
CREATE TABLE Enfant (abo_abonneId INT,
         PRIMARY KEY (abo_abonneId),
         FOREIGN KEY (abo_abonneId) REFERENCES Abonne(abo_abonneId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
         doc_auteur VARCHAR(50) COLLATE utf8_bin NOT NULL,
         doc_dateParution VARCHAR(50) NOT NULL,
         doc_typ_typeId int(11) NOT NULL,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_typ_typeId) REFERENCES Type(typ_typeId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `DVD`
--
CREATE TABLE DVD (doc_documentId INT,
         dvd_genre VARCHAR(40) COLLATE utf8_bin NOT NULL,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_documentId) REFERENCES Document(doc_documentId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `Periodique`
--
CREATE TABLE Periodique (doc_documentId INT,
         per_numero INT NOT NULL,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_documentId) REFERENCES Document(doc_documentId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `Livre`
--
CREATE TABLE Livre (doc_documentId INT,
         liv_nbPages int NOT NULL,
         liv_editeur VARCHAR(40) COLLATE utf8_bin NOT NULL,
         liv_isbn VARCHAR(13) NOT NULL,
         liv_collection VARCHAR(40) COLLATE utf8_bin NOT NULL,
         PRIMARY KEY (doc_documentId),
         FOREIGN KEY (doc_documentId) REFERENCES Document(doc_documentId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `Reservation`
--
CREATE TABLE `Reservation` (
  `res_doc_documentId` int(11) NOT NULL,
  `res_abo_abonneId` int(11) NOT NULL,
  `res_date` varchar(30) COLLATE utf8_bin NOT NULL,
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
