import sqlite3

connector = sqlite3.connect("parduotuve.db")
cursor = connector.cursor()

tables = (  """CREATE TABLE IF NOT EXISTS product (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name VARCHAR(50),
                price DECIMAL(10,2)
            )""",
            """CREATE TABLE IF NOT EXISTS customer (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                first_name VARCHAR(50),
                last_name VARCHAR(50)
            )""",
            """CREATE TABLE IF NOT EXISTS bill (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                purchase_datetime DATETIME,
                cashier_id INTEGER,
                customer_id INTEGER REFERENCES customer(id)
            )""",
            """CREATE TABLE IF NOT EXISTS bill_line (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                quantity INTEGER,
                bill_id INTEGER REFERENCES bill(id),
                product_id INTEGER REFERENCES product(id)
            )"""
)

def create_table(tables, connector, cursor):
    for table in tables:
        cursor.execute(table)
        connector.commit()

if __name__ == "__main__":
    # cursor.execute("DROP TABLE customer")
    # connector.commit()
    create_table(tables, connector, cursor)

    values = [('Petras', 'Petraitis'), ('Ona', 'Onaite'), ('Marius', 'Marijus'),
       ('Rasa', 'Rasaite'), ('Aurimas', 'Aurimaitis'), ('Gintare', 'Gintarele')]
    with connector:
        cursor.executemany("INSERT INTO customer (first_name, last_name) VALUES(?, ?)", values)
        connector.commit()
    
    # cursor.execute("DROP TABLE product")
    # connector.commit()
    # cursor.execute("DROP TABLE customer")
    # connector.commit()
    # cursor.execute("DROP TABLE bill")
    # connector.commit()
    # cursor.execute("DROP TABLE bill_line")
    # connector.commit()
                   
    connector.close()


"""
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
        (4, 6, 5), (5, 7, 4), (6, 8, 3), (1, 9, 2), (9, 10, 1);"""