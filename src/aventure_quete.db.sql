CREATE TABLE lieux(
lieuId INT PRIMARY KEY,
LieuNom TEXT,
LieuDescription TEXT,
ExplorationLieu1 REAL CHECK (LieuxNom == 'Foret sombre'),
ExplorationLieu2 REAL CHECK (LieuxNom == 'Village sanglant'),
ExplorationLieu3 REAL CHECK (LieuxNom == 'Mine hanter')
);

SELECT * FROM lieux
WHERE LieuNom > 'Foret sombre'
SELECT * FROM lieux
WHERE LieuNom > 'Village sanglant';
SELECT * FROM lieux
WHERE LieuNom > 'Mine hanter';


 INSERT INTO lieux(LieuxNom, LieuxDescription)
    VALUES
    ('Foret sombre', 'La foret sombre abrite de nombreuses creatures feroces et hostile qui adorent chasser la nuit'),
    ('Village sanglant', 'Le village sanglant est rempli de bucherons mort-vivants avides de vengeance autrefois decapiter par creatures sauvages'),
    ('Mine hanter', 'La mine hanter est habiter par des anciens mineurs autrefois avides de ses ressources naturelles');

CREATE TABLE objets(
objetId INT PRIMARY KEY,
ObjetNom TEXT,
ObjetDescription TEXT,
joueurId TEXT,
lieuId INT,
FOREIGN KEY (lieuId) REFERENCES lieux(lieuId)
InteractionObjet1 REAL CHECK (ObjetNom == 'Torche'),
InteractionObjet2 REAL CHECK (ObjetNom == 'Epee'),
InteractionObjet3 REAL CHECK (ObjetNom == 'Pioche'),
InteractionObjet4 REAL CHECK (ObjetNom == 'Hache')
);

INSERT INTO objets(ObjetNom, ObjetDescription)
VALUES
('Torche', 'La torche a pour but d_eclairer le joueur dans les lieux avec faibles presences de lumière. Peut etre trouver en grand nombre dans les mines'),
('Epee', 'L_epee permet d_infliger des degats efficacement aux ennemis rencontrer. Peut etre obtenue dans les villages'),
('Pioche','La pioche est essentielle pour l_acquisition de ressources presentes dans les mines. Peut etre trouver dans les villages'),
('Hache', 'La hache permet de couper des arbres afin de liberer des chemins ou de reclamer du bois. Peut etre trouver dans les villages');

CREATE TABLE IF NOT EXISTS joueurs(
joueurId INT PRIMARY KEY ,
joueurNom TEXT,
joueurVie INT,
joueurForce INT,
positionId INT
);

INSERT INTO joueurs(joueurNom, joueurVie, joueurForce),
    Values 
    ('Nom du joueur', 'points de vie joueur', 'degats du joueur');
    SELECT
    joueurNom,
    joueurVie,
    joueurForce,
    FROM joueurs;

   

CREATE TABLE pnj(
pnjId INT PRIMARY KEY,
pnjNom TEXT,
pnjDescription TEXT,
pnjDialogue TEXT
);

CREATE TABLE ennemis(
ennemisId INT PRIMARY KEY ,
EnnemiNom TEXT ,
 EnnemiVie INT,
lieuId INT,
FOREIGN KEY (lieuId) REFERENCES lieux(lieuId)
);

 INSERT INTO ennemis(EnnemiNom, EnnemiVie, EnnemiForce)
 VALUES

 ('Loup-garou', 70, 25),
 ('Troll', 50, 15),
 ('Zombie', 60, 20),
 ('Mineur fantome', 80, 15),
 ('Bucheron_mort-vivant,' 65, 30);

CREATE TABLE inventaire(
inventaireId INT PRIMARY KEY,
objetId INT,
joueurId INT,
FOREIGN KEY (objetId) REFERENCES objets(objetId),
FOREIGN KEY (joueurId) REFERENCES joueurs(joueurId)
);

CREATE TABLE quetes(
queteId INT PRIMARY KEY,
queteDescription TEXT,
queteEstComplete INT,
joueurId INT,
pnjId INT,
FOREIGN KEY (joueurId) REFERENCES joueurs(joueurId),
FOREIGN KEY (pnjId) REFERENCES pnj(pnjId)
);

CREATE TABLE pnj_quetes(
pnj_quetesId INT PRIMARY KEY,
pnjId INT,
queteId INT,
FOREIGN KEY (pnjId) REFERENCES pnj(pnjId),
FOREIGN KEY (queteId) REFERENCES quetes(queteId)
);









