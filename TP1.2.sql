DROP TABLE MATIERE;

DROP TABLE ELEVE;
DROP TABLE NOTES;

CREATE TABLE MATIERE(
    idMatiere NUMBER
    nomProf VARCHAR (32),
    prenomProf VARCHAR2 (32),
    nomMatiere VARCHAR2 (32),
    dateExam DATE,
    PRIMARY KEY (idMatiere)
);
CREATE TABLE ELEVE(
	idEleve NUMBER,
	nomEleve VARCHAR (32),
	prenomEleve VARCHAR (32),
	dateNaissance DATE,
PRIMARY KEY (idEleve)
);


CREATE TABLE NOTES(
	note NUMBER,
	idMatiere NUMBER,
	idEleve NUMBER,
PRIMARY KEY (idEleve, idMatiere),
FOREIGN KEY idEleve REFERENCES Eleve(idEleve),
FOREIGN KEY idMatiere REFERENCES Matiere(idMatiere)
);
