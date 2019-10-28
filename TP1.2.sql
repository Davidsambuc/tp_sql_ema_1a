DROP TABLE MATIERE;

DROP TABLE ELEVE;
DROP TABLE NOTES;

CREATE TABLE MATIERE(
    idMatiere NUMBER,
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
FOREIGN KEY (idEleve) REFERENCES Eleve(idEleve),
FOREIGN KEY (idMatiere) REFERENCES Matiere(idMatiere)
);

INSERT INTO Matiere (idMatiere, nomProf, prenomProf, nomMatiere, dateExam) VALUES (1,'JOANNIDES','MARC','MATHS',TO_DATE('2019/11/06','yyyy/mm/dd')); 
INSERT INTO Matiere (idMatiere, nomProf, prenomProf, nomMatiere, dateExam) VALUES (2,'COLLETA','REMI','BD',TO_DATE('2019/11/06','yyyy/mm/dd'));
INSERT INTO Matiere (idMatiere, nomProf, prenomProf, nomMatiere, dateExam) VALUES (3,'BELLA','Zora','BD',TO_DATE('2019/11/07','yyyy/mm/dd'));
INSERT INTO Matiere (idMatiere, nomProf, prenomProf, nomMatiere, dateExam) VALUES (4,'DUMAS','RATE','MATHS',TO_DATE('2019/11/08','yyyy/mm/dd'));

INSERT INTO ELEVE (idEleve, nomEleve, prenomEleve, dateNaissance) VALUES (1,'EL','RISITAS',TO_DATE('2000/11/08','yyyy/mm/dd'));
INSERT INTO ELEVE (idEleve, nomEleve, prenomEleve, dateNaissance) VALUES (2,'LA','CHANCLA',TO_DATE('2000/11/03','yyyy/mm/dd'));
INSERT INTO ELEVE (idEleve, nomEleve, prenomEleve, dateNaissance) VALUES (3,'PANDAV','VADNAP',TO_DATE('2000/01/19','yyyy/mm/dd'));

INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (15,1,1);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (16,1,2);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (17,1,3);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (18,2,1);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (19,2,2);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (20,2,3);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (7,3,1);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (6,3,2);
INSERT INTO NOTES (note, idMatiere, idEleve) VALUES (5,3,3);

SELECT AVG(n.note) as MOYENNE_CLASSE
FROM Eleve e
JOIN Notes n ON e.idEleve = n.idEleve

SELECT AVG(n.note) as MOYENNE_ELEVE
FROM Eleve e
JOIN Notes n ON e.idEleve = n.idEleve
WHERE e.prenomEleve = 'VADNAP'
AND e.nomEleve = 'PANDAV'

SELECT AVG(n.note) as MOYENNE_PROF
FROM Matiere m
JOIN Notes n ON m.idMatiere = n.idMatiere
WHERE m.prenomProf = 'MARC'
AND m.nomProf = 'JOANNIDES'

SELECT e.nomEleve, AVG(n.note) as MOYENNE_ELEVES
FROM Eleve e
JOIN Notes n ON e.idEleve = n.idEleve
GROUP BY e.nomEleve

SELECT m.nomProf, AVG(n.note) as MOYENNE_PROF
FROM Matiere m
JOIN Notes n ON m.idMatiere = n.idMatiere
GROUP BY m.nomProf

SELECT AVG(n.note) as MOYENNE_ELEVE
FROM Eleve e
JOIN Notes n ON e.idEleve = n.idEleve
JOIN Matiere m ON m.idMatiere = n.idMatiere
WHERE e.prenomEleve = 'VADNAP'
AND e.nomEleve = 'PANDAV'
AND m.dateExam BETWEEN TO_DATE('2018/11/05','yyyy/mm/dd') AND TO_DATE('2019/11/06','yyyy/mm/dd')
