-- SQLite
CREATE TABLE studentai(
    studento_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vardas VARCHAR(50),
    pavarde VARCHAR(50),
    studiju_programa VARCHAR(100),
    el_pastas VARCHAR(50)
);

ALTER TABLE studentai ADD gimimo_data VARCHAR(50);
DROP TABLE studentai

CREATE TABLE destytojai(
    destytojo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vardas VARCHAR(50),
    pavarde VARCHAR(50), 
    skyrius VARCHAR(100),
    el_pastas VARCHAR(50)
);

ALTER TABLE destytojai ADD kabineto_nr INTEGER;
DROP TABLE destytojai
