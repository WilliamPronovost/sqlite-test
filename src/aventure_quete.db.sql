DROP TABLE IF EXISTS ennemis;
DROP TABLE IF EXISTS lieux;
DROP TABLE IF EXISTS objets;
DROP TABLE IF EXISTS joueurs;
DROP TABLE IF EXISTS quetes;
DROP TABLE IF EXISTS pnj;
DROP TABLE IF EXISTS inventaire;
DROP TABLE IF EXISTS pnj_quetes;
DROP TABLE IF EXISTS systemeDeCombat;

CREATE TABLE IF NOT EXISTS lieux(
lieuId INT PRIMARY KEY,
LieuNom TEXT,
LieuDescription TEXT
);

 INSERT INTO lieux(LieuNom, LieuDescription)
VALUES
('Foret sombre', 'La foret sombre abrite de nombreuses creatures feroces et hostile qui adorent chasser la nuit'),
('Village sanglant', 'Le village sanglant est rempli de bucherons mort-vivants avides de vengeance autrefois decapiter par creatures sauvages'),
('Mine hanter', 'La mine hanter est habiter par des anciens mineurs autrefois avides de ses ressources naturelles');

SELECT * FROM lieux;

CREATE TABLE IF NOT EXISTS objets(
objetId INT PRIMARY KEY,
ObjetNom TEXT,
ObjetDescription TEXT,
joueurId TEXT,
lieuId INT,
FOREIGN KEY (lieuId) REFERENCES lieux(lieuId)
);

INSERT INTO objets(ObjetNom, ObjetDescription)
VALUES
('Torche', 'La torche a pour but d_eclairer le joueur dans les lieux avec faibles presences de lumière. Peut etre trouver en grand nombre dans les mines'),
('Epee', 'L_epee permet d_infliger des degats efficacement aux ennemis rencontrer. Peut etre obtenue dans les villages'),
('Pioche','La pioche est essentielle pour l_acquisition de ressources presentes dans les mines. Peut etre trouver dans les villages'),
('Hache', 'La hache permet de couper des arbres afin de liberer des chemins ou de reclamer du bois. Peut etre trouver dans les villages');

 SELECT * FROM objets;

CREATE TABLE IF NOT EXISTS joueurs(
joueurId INT PRIMARY KEY ,
joueurNom TEXT,
joueurVie INT,
joueurForce INT,
positionId INT
);

INSERT INTO joueurs(joueurNom, joueurVie, joueurForce)
VALUES 
('WilliamPronovost', 100, 10);

SELECT
joueurNom,
joueurVie,
joueurForce
FROM joueurs;

CREATE TABLE IF NOT EXISTS pnj(
pnjId INT PRIMARY KEY,
pnjNom TEXT,
pnjDescription TEXT,
pnjDialogue TEXT
);

CREATE TABLE IF NOT EXISTS ennemis(
ennemisId INT PRIMARY KEY ,
EnnemiNom TEXT ,
EnnemiVie INT,
EnnemiForce INT,
lieuId INT,
EnnemiProche INT,
SceneCombat INT,
FOREIGN KEY (lieuId) REFERENCES lieux(lieuId)
);

 INSERT INTO ennemis(EnnemiNom, EnnemiVie, EnnemiForce)
 VALUES
 ('Loup-garou', 70, 25),
 ('Troll', 50, 15),
 ('Zombie', 60, 20),
 ('Mineur fantome', 80, 15),
 ('Bucheron_mort-vivant', 65, 30);

 INSERT INTO ennemis(EnnemiProche)
 VALUES

 (1);

CREATE TABLE systemeDeCombat(
    systemeDeCombatId INT PRIMARY KEY,
    TourJoueur INT,
    TourEnnemis INT,
    FOREIGN KEY (ennemisId) REFERENCES ennemis(ennemisId)
);

INSERT INTO systemeDeCombat(TourJoueur, TourEnnemis)

VALUES
(1,1);

SELECT * FROM systemeDeCombat;

CREATE TABLE inventaire(
    inventaireId INT PRIMARY KEY,
    objetId INT,
    joueurId INT,
    FOREIGN KEY (objetId) REFERENCES objets(objetId),
    FOREIGN KEY (joueurId) REFERENCES joueurs(joueurId)
);

 SELECT * FROM inventaire;

CREATE TABLE quetes(
queteId INT PRIMARY KEY,
queteDescription TEXT,
queteEstComplete INT,
joueurId INT,
pnjId INT,
queteSecondaireDescription TEXT,
queteSecondaireAcces INT, 
FOREIGN KEY (joueurId) REFERENCES joueurs(joueurId),
FOREIGN KEY (pnjId) REFERENCES pnj(pnjId)
);

INSERT INTO quetes(queteDescription, queteEstComplete)
 VALUES
 
("La quete principale est de ramasser un artefact dans la mine hanter. Le joueur doit explorer la mine, combattre des zombies et resoudre des
enigmes pour atteindre l'artefact. Pour recuperer l'artefact il doit avoir une pioche dans
son inventaire.", 1);

INSERT INTO quetes(queteSecondaireDescription, queteEstComplete)
 VALUES

("Trouver un remède pour un villageois: Le joueur doit collecter des herbes
medicinales dans la forêt. Débloque l'acces à la hache.", 0),
("Ramasser du bois dans la foret: Le joueur doit collecter un certain nombre de
morceaux de bois. Pour récupérer des morceaux de bois il doit avoir un hache dans
son inventaire. Débloque l'acces à la pioche.", 0);

SELECT * FROM quetes;

CREATE TABLE pnj_quetes(
pnj_quetesId INT PRIMARY KEY,
pnjId INT,
queteId INT,
acceptation INT,
refus INT,
FOREIGN KEY (pnjId) REFERENCES pnj(pnjId),
FOREIGN KEY (queteId) REFERENCES quetes(queteId)
);

INSERT INTO pnj_quetes (pnjId, queteId)
VALUES

(1, 1),
(2, 2);

INSERT INTO pnj_quetes (acceptation, refus)
VALUES

(1,0);

INSERT INTO pnj_quetes (acceptation, queteEstComplete, pnjDialogue)
VALUES 
(1, 1, "Vous pouvez maintenant me chercher de la pierre pour que je puisse solidifier votre equipements"),
(1, 1, "Vous voulez savoir comment mieux faire des potions et approfondir vos connaissances?")

SELECT * FROM pnj_quetes; 

