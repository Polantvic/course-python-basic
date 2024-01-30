CREATE TABLE mokytojai (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vardas VARCHAR(255) NOT NULL,
    pavarde VARCHAR(255) NOT NULL,
    specialybe VARCHAR(255) NOT NULL,
    nuo_kada_dirba INTEGER
);

INSERT INTO mokytojai (id, vardas, pavarde, specialybe, nuo_kada_dirba)
    VALUES (1, "Petras", "Petraitis", "Matematika", 2013);
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, nuo_kada_dirba)
    VALUES (2, "Ona", "Onaite", "Fizika", 2012);
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, nuo_kada_dirba)
    VALUES (3, "Marius", "Marijus", "Biologija", 2015);
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, nuo_kada_dirba)
    VALUES (4, "Rasa", "Rasaite", "Anglu kalba", 2011);
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, nuo_kada_dirba)
    VALUES (5, "Aurimas", "Aurimaitis", "Lietuviu kalba", 2018);
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, nuo_kada_dirba)
    VALUES (6, "Gintare", "Gintarele", "Istorija", 2020);

SELECT * FROM mokytojai WHERE specialibe = "Matematika";
SELECT vardas, pavarde, specialybe FROM mokytojai WHERE (2024 - nuo_kada_dirba) > 9;
UPDATE mokytojai SET pavarde = "Zoliene" WHERE vardas = "Rasa" AND pavarde = "Rasaite";
DELETE FROM mokytojai WHERE id = 4;

DROP TABLE mokytojai;
SELECT * FROM mokytojai
