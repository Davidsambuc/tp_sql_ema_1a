DROP TABLE Recette;
DROP TABLE Catégorie;
DROP TABLE Plat;
DROP TABLE Ingrédient;
DROP TABLE Chef;


CREATE TABLE Catégorie(
    idCatégorie NUMBER,
    libellé VARCHAR2 (32),
    PRIMARY KEY (idCatégorie)
);
CREATE TABLE Plat(
    idPlat NUMBER,
    description VARCHAR2 (64),
    type VARCHAR2 (16),
    nbPersonne NUMBER,
    PRIMARY KEY (idPlat)
);
CREATE TABLE Ingrédient(
    idIngrédient NUMBER,
    idCatégorie NUMBER,
    nom VARCHAR2 (32),
    qualificatif VARCHAR2 (32),
    PRIMARY KEY (idIngrédient),
    FOREIGN KEY (idCatégorie) REFERENCES Catégorie(idCatégorie)
);
CREATE TABLE Chef(
    nom VARCHAR2 (32),
    prénom VARCHAR2 (32),
    nomRestaurant VARCHAR2 (32),
    adresseRestaurant VARCHAR2 (64),
    PRIMARY KEY (nom, prénom)
);
CREATE TABLE Recette(
    idPlat NUMBER,
    nomChef VARCHAR2 (32),
    prénomChef VARCHAR2 (32),
    idIngrédient NUMBER,
    quantité NUMBER,
    PRIMARY KEY (idPlat, nomChef, prénomChef, idIngrédient),
    FOREIGN KEY (idPlat) REFERENCES Plat(idPlat),
    FOREIGN KEY (nomChef, prénomChef) REFERENCES Chef(nom, prénom),
    FOREIGN KEY (idIngrédient) REFERENCES Ingrédient(idIngrédient)
);

INSERT INTO Catégorie(idCatégorie, libellé) VALUES (1,"viande"); 
INSERT INTO Catégorie(idCatégorie, libellé) VALUES (2,"poisson");
INSERT INTO Catégorie(idCatégorie, libellé) VALUES (3,"légumes");
INSERT INTO Catégorie(idCatégorie, libellé) VALUES (4,"crudité");
INSERT INTO Catégorie(idCatégorie, libellé) VALUES (5,"farine");
INSERT INTO Catégorie(idCatégorie, libellé) VALUES (6,"laitage");

INSERT INTO Plat(idPlat, DESCRIPTION, NBPERSONNE, TYPE) VALUES (1,"");
