CREATE TABLE Inventory(
    Product_ID      numeric(5,0),
    Product_name    varchar(20),
    Quantity         number(3,0),
    PRIMARY KEY(Product_ID)
);

CREATE TABLE Purchase_Record(
    Product_ID      numeric(5,0),
    Status          varchar(20),
    TransacDate            date,
    FOREIGN KEY (Product_ID) REFERENCES Inventory
);

INSERT INTO Inventory VALUES(4568, 'Soap', 5);
INSERT INTO Inventory VALUES(9865, 'Keyboard', 3);
INSERT INTO Inventory VALUES(2368, 'Monitor', 2);

SELECT * FROM INVENTORY;
