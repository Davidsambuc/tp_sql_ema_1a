DROP TABLE Recettes;
DROP TABLE Plats;
DROP TABLE Ingredient;
DROP TABLE Chefs;
DROP TABLE Categorie;


CREATE TABLE Categorie(
    idCategorie NUMBER,
    libellé VARCHAR2 (32),
    PRIMARY KEY (idCategorie)
);
CREATE TABLE Plats(
    idPlats NUMBER,
    description VARCHAR2 (64),
    type VARCHAR2 (16),
    nbPersonne NUMBER,
    PRIMARY KEY (idPlats)
);
CREATE TABLE Ingredient(
    idIngredient NUMBER,
    idCategorie NUMBER,
    nom VARCHAR2 (32),
    qualificatif VARCHAR2 (32),
    PRIMARY KEY (idIngredient),
    FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
);
CREATE TABLE Chefs(
    nom VARCHAR2 (32),
    prénom VARCHAR2 (32),
    nomRestaurant VARCHAR2 (32),
    adresseRestaurant VARCHAR2 (64),
    PRIMARY KEY (nom, prénom)
);
CREATE TABLE Recettes(
    idPlats NUMBER,
    nomChefs VARCHAR2 (32),
    prénomChefs VARCHAR2 (32),
    idIngredient NUMBER,
    quantité NUMBER,
    PRIMARY KEY (idPlats, nomChefs, prénomChefs, idIngredient),
    FOREIGN KEY (idPlats) REFERENCES Plats(idPlats),
    FOREIGN KEY (nomChefs, prénomChefs) REFERENCES Chefs(nom, prénom),
    FOREIGN KEY (idIngredient) REFERENCES Ingredient(idIngredient)
);

INSERT INTO Categorie (IDCategorie, LIBELLÉ) VALUES (1,'viande'); 
INSERT INTO Categorie (idCategorie, libellé) VALUES (2,'poisson');
INSERT INTO Categorie (idCategorie, libellé) VALUES (3,'légumes');
INSERT INTO Categorie (idCategorie, libellé) VALUES (4,'crudité');
INSERT INTO Categorie (idCategorie, libellé) VALUES (5,'farine');
INSERT INTO Categorie (idCategorie, libellé) VALUES (6,'laitage');

INSERT INTO Plats (idPlats, DESCRIPTION, NBPERSONNE, TYPE) VALUES (1,'blanquette de veau',5,'entrée');
INSERT INTO Plats (idPlats, DESCRIPTION, NBPERSONNE, TYPE) VALUES (2,'Andouillette',4,'Plats');
INSERT INTO Plats (idPlats, DESCRIPTION, NBPERSONNE, TYPE) VALUES (3,'Aligot',6,'Plats');
INSERT INTO Plats (idPlats, DESCRIPTION, NBPERSONNE, TYPE) VALUES (4,'Tiramisu',2,'dessert');

INSERT INTO Chefs (nom, prénom, nomRestaurant, adresseRestaurant) VALUES ('DUMAS','Michel','AAA','BBB');
INSERT INTO Chefs (nom, prénom, nomRestaurant, adresseRestaurant) VALUES ('BONNISSEUR DE LA BATTE','Hubert','LA SCEP','Le Caire');
INSERT INTO Chefs (nom, prénom, nomRestaurant, adresseRestaurant) VALUES ('Flantier','Noël','Le Reich de l''amour','Rio');

INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (1,6,'fromage','bleu');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (9,1,'veau','spécial blanquette');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (2,1,'boeuf','bavette');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (3,2,'saumon','filet');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (4,3,'pommes de terre','purée');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (5,4,'salade','roquette');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (6,5,'pain','campagne');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (7,5,'pain','complet');
INSERT INTO Ingredient (IDIngredient,IDCategorie,NOM,QUALIFICATIF) VALUES (8,3,'pommes de terre','frites');


INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (3,'DUMAS','Michel',1,200);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (3,'DUMAS','Michel',2,400);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (3,'DUMAS','Michel',4,500);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (1,'BONNISSEUR DE LA BATTE','Hubert',9,10000);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (1,'BONNISSEUR DE LA BATTE','Hubert',8,666);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (1,'Flantier','Noël',9,15000);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (1,'Flantier','Noël',8,1);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (2,'Flantier','Noël',5,100);
INSERT INTO Recettes (idPlats,nomChefs, prénomChefs, "IDIngredient", "QUANTITÉ") VALUES (2,'Flantier','Noël',6,1000);

SELECT i.idCategorie, i.nom, i.qualificatif, r.quantité
  FROM ingredient i
  JOIN recettes r ON i.idIngredient = r.idIngredient
  JOIN plats p ON p.idPlats = r.idPlats
 WHERE r.prénomChefs = 'Hubert'
   AND r.nomChefs = 'BONNISSEUR DE LA BATTE'
   AND p.description = 'blanquette de veau';


   SELECT i.nom, 15*r.quantité
  FROM recettes r 
  JOIN ingredient i ON i.idIngredient = r.idIngredient
  JOIN plats p ON p.idPlats = r.idPlats
 WHERE r.prénomChefs = 'Hubert'
   AND r.nomChefs = 'BONNISSEUR DE LA BATTE'
   AND p.description = 'blanquette de veau';


   SELECT i.nom, 15*r.quantité
  FROM recettes r 
  JOIN ingredient i ON i.idIngredient = r.idIngredient
  JOIN plats p ON p.idPlats = r.idPlats
 WHERE p.description = 'blanquette de veau';
 