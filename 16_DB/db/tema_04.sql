CREATE TABLE IF NOT EXISTS product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50),
    price DECIMAL(10,2)
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
VALUES (DATETIME("2024-01-30 23:57"), 3, 1), (DATETIME("2024-01-30 14:24"), 2, 1),
        (DATETIME("2024-01-30 13:45"), 1, 3), (DATETIME("2024-01-30 09:12"), 2, 2),
        (DATETIME("2024-01-30 05:34"), 3, 4), (DATETIME("2024-01-30 21:57"), 1, 5),
        (DATETIME("2024-01-30 15:14"), 3, 6), (DATETIME("2024-01-30 13:07"), 2, 1),
        (DATETIME("2024-01-30 03:12"), 1, 6), (DATETIME("2024-01-30 17:44"), 3, 4);

INSERT INTO bill_line (quantity, bill_id, product_id)
VALUES (2, 1, 5), (2, 2, 4), (3, 3, 3), (8, 4, 2), (5, 5, 1),
        (4, 6, 5), (5, 7, 4), (6, 8, 3), (1, 9, 2), (9, 10, 1);

-- * daugiausiai parduodami produktai
SELECT name, SUM(quantity) AS total FROM product
    JOIN bill_line ON product.id = bill_line.product_id
    GROUP BY name
    ORDER BY total DESC; --LIMIT 1;

-- * didžiausia produkto apyvarta
SELECT name, SUM(quantity)*price AS turnover FROM product
    JOIN bill_line ON product.id = bill_line.product_id
    GROUP BY name
    ORDER BY turnover DESC;

SELECT name, SUM(quantity) AS total, price, SUM(quantity)*price AS turnover
    FROM product JOIN bill_line ON product.id = bill_line.product_id
    GROUP BY name
    ORDER BY total DESC;

-- * geriausias klientas(Daugiausiai nupirkę klientai)
SELECT first_name || " " || last_name AS full_name,
    SUM(quantity*price) as total
    FROM customer JOIN bill ON customer.id = bill.customer_id
    JOIN bill_line ON bill.id = bill_line.bill_id
    JOIN product ON bill_line.product_id = product.id
    GROUP BY customer.id
    ORDER BY total DESC;

-- * didžiausia saskaita
SELECT first_name || " " || last_name AS full_name, purchase_datetime,
    quantity * price AS big_purchase
    FROM customer JOIN bill ON customer.id = bill.customer_id
    JOIN bill_line ON bill.id = bill_line.bill_id
    JOIN product ON bill_line.product_id = product.id
    ORDER BY big_purchase DESC;


SELECT * FROM customer;
SELECT * FROM bill ORDER BY customer_id;
SELECT * FROM bill_line;
SELECT * FROM product;

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