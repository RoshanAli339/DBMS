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
