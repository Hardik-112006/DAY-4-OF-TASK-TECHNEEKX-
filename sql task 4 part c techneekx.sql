CREATE DATABASE bank_system;

USE  bank_system;


CREATE TABLE Customer (
    C_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    DOB DATE,
    AC_Type VARCHAR(30)
);


INSERT INTO Customer VALUES
(1,'Rahul','rahul@gmail.com','2003-05-10','Savings'),
(2,'Amit','amit@gmail.com','2002-08-15','Current');



CREATE TABLE Loan (
    L_ID INT PRIMARY KEY,
    C_ID INT,
    Amount INT,
    Type VARCHAR(30),

    FOREIGN KEY(C_ID)
    REFERENCES Customer(C_ID)
);


INSERT INTO Loan VALUES
(101,1,500000,'Home Loan'),
(102,2,200000,'Car Loan');




CREATE TABLE Account (
    A_ID INT PRIMARY KEY,
    C_ID INT,
    Type VARCHAR(30),
    Status VARCHAR(20),
    Opening_Date DATE,
    Balance INT,

    FOREIGN KEY(C_ID)
    REFERENCES Customer(C_ID)
);


INSERT INTO Account VALUES
(201,1,'Savings','Active','2025-01-10',50000),
(202,2,'Current','Active','2025-02-15',70000);



CREATE TABLE Payment (
    P_ID INT PRIMARY KEY,
    L_ID INT,
    Date DATE,
    Amount INT,
    Status VARCHAR(20),
    Type VARCHAR(20),

    FOREIGN KEY(L_ID)
    REFERENCES Loan(L_ID)
);


INSERT INTO Payment VALUES
(301,101,'2026-01-01',20000,'Paid','Online'),
(302,102,'2026-02-01',15000,'Paid','Cash');




CREATE TABLE Investment (
    I_ID INT PRIMARY KEY,
    C_ID INT,
    Type VARCHAR(30),
    Purchase_Price INT,
    Current_Market_Value INT,

    FOREIGN KEY(C_ID)
    REFERENCES Customer(C_ID)
);


INSERT INTO Investment VALUES
(401,1,'Mutual Fund',50000,60000),
(402,2,'Shares',30000,35000);



CREATE TABLE Security (
    S_ID INT PRIMARY KEY,
    C_ID INT,
    Status VARCHAR(20),
    Type VARCHAR(30),

    FOREIGN KEY(C_ID)
    REFERENCES Customer(C_ID)
);


INSERT INTO Security VALUES
(501,1,'Active','Insurance'),
(502,2,'Active','FD');


CREATE TABLE Transaction_Table (
    T_ID INT PRIMARY KEY,
    A_ID INT,
    Type VARCHAR(30),
    Date DATE,
    Amount INT,
    Status VARCHAR(20),

    FOREIGN KEY(A_ID)
    REFERENCES Account(A_ID)
);


INSERT INTO Transaction_Table VALUES
(601,201,'Deposit','2026-03-01',10000,'Success'),
(602,202,'Withdraw','2026-03-02',5000,'Success');



SELECT * FROM Customer;

SELECT * FROM Loan;

SELECT * FROM Account;

SELECT * FROM Payment;

SELECT * FROM Investment;

SELECT * FROM Security;

SELECT * FROM Transaction_Table;