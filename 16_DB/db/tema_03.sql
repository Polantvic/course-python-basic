-- SQLite
-- 1 Uzduotys
CREATE TABLE studentai(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vardas VARCHAR(50),
    pavarde VARCHAR(50)
);

CREATE TABLE kursai(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pavadinimas VARCHAR(50),
    valandos INTEGER
);

CREATE TABLE studentu_kursai(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    studentu_id INTEGER REFERENCES studentai(id),
    kursu_id INTEGER REFERENCES kursai(id)
);

--SELECT vardas
--SELECT orders.id, product.name, quantity, product.price, product.price * quantity AS line_total
--    FROM order_line
--    JOIN orders ON order_id = orders.id
--    JOIN product ON product_id = product.id;

INSERT INTO studentai ("vardas" , "pavarde")
    VALUES ("Petras", "Petraites");

DROP TABLE studentai;
DROP TABLE kursai;
DROP TABLE studentu_kursai;