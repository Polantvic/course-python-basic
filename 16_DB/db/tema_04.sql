CREATE TABLE IF NOT EXISTS product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50),
    price DECIMAL
);

CREATE TABLE IF NOT EXISTS customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS bill (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    purchase_datetime DATETIME,
    cashier_id INTEGER,
    customer_id INTEGER REFERENCES customer(id)
);

CREATE TABLE IF NOT EXISTS bill_line (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    quantity INTEGER,
    bill_id INTEGER REFERENCES bill(id),
    product_id INTEGER REFERENCES product(id)
);

INSERT INTO customer (first_name, last_name)
VALUES ('Petras', 'Petraitis'), ('Ona', 'Onaite'), ('Marius', 'Marijus'),
       ('Rasa', 'Rasaite'), ('Aurimas', 'Aurimaitis'), ('Gintare', 'Gintarele');

INSERT INTO product (name, price)
VALUES ("Duona", 3.12), ("Alus", 4.67), ("Suris", 6.34),
        ("Pienas", 2.37), ("Kava", 8.67);

INSERT INTO bill (purchase_datetime, cashier_id, customer_id)
VALUES (23.57, 3, 1), (14.24, 2, 1), (13.45, 1, 3), (9.12, 2, 2), (5.34, 3, 4),
        (21.57, 1, 5), (15.14, 3, 6), (13.07, 2, 1), (3.12, 1, 6), (17.44, 3, 4)

INSERT INTO bill_line (quantity, bill_id, product_id)
VALUES (2, 1, 5), (2, 2, 4), (3, 3, 3), (8, 4, 2), (5, 5, 1),
        (4, 6, 5), (5, 7, 4), (6, 7, 3), (1, 9, 2), (9, 10, 1);



SELECT * FROM product;
SELECT * FROM bill;

DROP TABLE product;
DROP TABLE customer;
DROP TABLE bill;
DROP TABLE bill_line;

-- DB modelis: parduotuvė:
-- * product (id, name, price)
-- * customer (id, first_name, last_name)
-- * bill (id, purchase_datetime, cashier_id, customer_id)
-- * bill_line (id, bill_id, product_id, quantity)
-- Užklausos:
-- * daugiausiai parduodami produktai
-- * didžiausia produkto apyvarta
-- * geriausias klientas
-- * didžiausia saskaita