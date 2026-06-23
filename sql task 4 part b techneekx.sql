CREATE DATABASE IF NOT EXISTS Internet_Sales;

USE Internet_Sales;


CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Email VARCHAR(50)
);


INSERT INTO Customer VALUES
(1,'Rahul','Lucknow','rahul@gmail.com'),
(2,'Amit','Delhi','amit@gmail.com');




CREATE TABLE Company (
    Company_ID INT PRIMARY KEY,
    Name VARCHAR(50)
);


INSERT INTO Company VALUES
(101,'Amazon'),
(102,'Flipkart');



CREATE TABLE Item (
    Item_ID INT PRIMARY KEY,
    Company_ID INT,
    Name VARCHAR(50),
    Price INT,

    FOREIGN KEY(Company_ID)
    REFERENCES Company(Company_ID)
);


INSERT INTO Item VALUES
(201,101,'Laptop',50000),
(202,102,'Mobile',20000),
(203,101,'Headphones',3000);



CREATE TABLE Orders (
    Order_Number INT PRIMARY KEY,
    Customer_ID INT,

    FOREIGN KEY(Customer_ID)
    REFERENCES Customer(Customer_ID)
);


INSERT INTO Orders VALUES
(1001,1),
(1002,2);


-- Relationship between Order and Item

CREATE TABLE Order_Item (
    Order_Number INT,
    Item_ID INT,

    PRIMARY KEY(Order_Number,Item_ID),

    FOREIGN KEY(Order_Number)
    REFERENCES Orders(Order_Number),

    FOREIGN KEY(Item_ID)
    REFERENCES Item(Item_ID)
);


INSERT INTO Order_Item VALUES
(1001,201),
(1001,203),
(1002,202);




CREATE TABLE Shopping_Cart (
    Cart_ID INT PRIMARY KEY,
    Customer_ID INT,
    Item_ID INT,

    FOREIGN KEY(Customer_ID)
    REFERENCES Customer(Customer_ID),

    FOREIGN KEY(Item_ID)
    REFERENCES Item(Item_ID)
);


INSERT INTO Shopping_Cart VALUES
(301,1,201),
(302,2,202);



CREATE TABLE Credit_Card (
    Card_No BIGINT PRIMARY KEY,
    Customer_ID INT,

    FOREIGN KEY(Customer_ID)
    REFERENCES Customer(Customer_ID)
);


INSERT INTO Credit_Card VALUES
(123456789012,1),
(987654321098,2);



CREATE TABLE Shipping (
    Shipping_ID INT PRIMARY KEY,
    Order_Number INT,
    Shipping_Address VARCHAR(100),

    FOREIGN KEY(Order_Number)
    REFERENCES Orders(Order_Number)
);


INSERT INTO Shipping VALUES
(401,1001,'Lucknow'),
(402,1002,'Delhi');


SELECT * FROM Customer;

SELECT * FROM Company;

SELECT * FROM Item;

SELECT * FROM Orders;

SELECT * FROM Order_Item;

SELECT * FROM Shopping_Cart;

SELECT * FROM Credit_Card;

SELECT * FROM Shipping;