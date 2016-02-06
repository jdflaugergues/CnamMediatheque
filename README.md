# CnamMediatheque
Projet de l'UE NSY135 du CNAM : Le site d’une médiathèque municipale

##Sujet 

###Les besoins

Une médiathèque municipale prête des documents à différents abonnés (deux catégories : enfants et adultes), qui peuvent les emprunter pour des durées variables (selon la catégorie d’abonné et le type de documents). Les documents peuvent être de différentes nature (DVD, Livre, Périodique).

Les adultes ont le droit d’emprunter 10 documents simultanément, dont 3 DVD (maximum) et 2 périodiques. Les DVD ne peuvent être empruntés plus d’une semaine, livres et périodiques peuvent être conservés 3 semaines. Les enfants ne peuvent emprunter que 6 documents simultanément, dont 2 DVD et 1 périodique. Ils ne peuvent garder les documents que 2 semaines maximum.

Le site est une version simplifiée, avec des fonctionnalités réduites par rapport à ce que l’on attendrait d’un vrai site. Votre site Web doit permettre aux utilisateurs de réserver des documents. Faites simple, pas de gestion de “panier” comme sur des sites marchands ici : un utilisateur doit pouvoir afficher la liste des documents présents dans la base, puis cliquer sur “réserver” sur un bouton à côté du document pour l’emprunter (sauf, bien sûr, s’il dépasse alors le quota qui lui est autorisé). Pour éviter de gérer des “sessions utilisateurs”, vous vous en tiendrez à un nombre restreint d’utilisateurs (par exemple 4, 2 adultes et 2 enfants), et afficher des liens sous la forme “réserver en tant que Adulte1”, “réserver en tant qu’Enfant2”.

Le site doit aussi permettre aux documentalistes de voir si des utilisateurs ont des documents en retard. Là encore, version simplifiée : toutes les pages sont accessibles à tous les utilisateurs. Il faut donc une page dans laquelle est listé si un document est actuellement emprunté, par qui, et est-ce que le document devrait être de retour (à calculer avec les informations fournies ci-dessus).

###La conception (diagramme UML)

Proposez une modélisation des différentes entités et associations requise par l’application
Indiquez comment calculer le retard des documents
L’implantation (JPA/Hibernate)

Donnez le schéma de la base résultant du modèle UML. Implantez ce schéma avec MySQL.
Réalisez le modèle JPA de l’application.
Réalisez une mini-application MVC affichant les données de la base, comme décrit ci-dessus.

###En option

triez l’affichage des pages de documents par leurs catégories, n’affichez pas les documents déjà empruntés, permettez l’ajout de documents dans la base.