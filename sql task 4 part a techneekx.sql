CREATE DATABASE Dental_Clinic;

USE Dental_Clinic;


CREATE TABLE Patient_Details (
    P_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE,
    Mobile_No VARCHAR(15),
    Blood VARCHAR(10),
    Sex VARCHAR(10),
    Nationality VARCHAR(30),
    Email VARCHAR(50),
    Place VARCHAR(50),
    Address VARCHAR(100)
);


INSERT INTO Patient_Details VALUES
(1,'Rahul','2003-05-10','9876543210','A+','Male','Indian','rahul@gmail.com','Lucknow','Aliganj'),
(2,'Amit','2002-08-15','9876501234','B+','Male','Indian','amit@gmail.com','Delhi','Noida');


CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    P_ID INT,
    P_Name VARCHAR(50),
    Appointment_Date DATE,
    Appointment_Time TIME,

    FOREIGN KEY(P_ID) REFERENCES Patient_Details(P_ID)
);


INSERT INTO Appointment VALUES
(101,1,'Rahul','2026-06-25','10:30:00'),
(102,2,'Amit','2026-06-26','12:00:00');


CREATE TABLE Treatment (
    T_No INT PRIMARY KEY,
    P_ID INT,
    T_Date DATE,
    Treatment_Name VARCHAR(50),
    Note VARCHAR(100),
    Fees INT,
    Material_List VARCHAR(100),
    T1 VARCHAR(50),
    T2 VARCHAR(50),
    T3 VARCHAR(50),

    FOREIGN KEY(P_ID) REFERENCES Patient_Details(P_ID)
);


INSERT INTO Treatment VALUES
(1,1,'2026-06-25','Root Canal','Tooth pain treatment',5000,'Cement','Cleaning','Filling','Capping'),
(2,2,'2026-06-26','Cleaning','Regular cleaning',1000,'Brush','Scaling','Polishing','');

CREATE TABLE Treat_Master (
    T_No INT PRIMARY KEY,
    Treatment_Name VARCHAR(50),

    FOREIGN KEY(T_No) REFERENCES Treatment(T_No)
);


INSERT INTO Treat_Master VALUES
(1,'Root Canal'),
(2,'Cleaning');


CREATE TABLE Prescription (
    Prescription_ID INT PRIMARY KEY,
    T_No INT,
    P_ID INT,
    T_Date DATE,
    Medicine_Name VARCHAR(50),
    Dosage VARCHAR(30),
    Category VARCHAR(30),
    Days INT,

    FOREIGN KEY(T_No) REFERENCES Treatment(T_No),
    FOREIGN KEY(P_ID) REFERENCES Patient_Details(P_ID)
);


INSERT INTO Prescription VALUES
(501,1,1,'2026-06-25','Amoxicillin','500mg','Antibiotic',5),
(502,2,2,'2026-06-26','Pain Killer','250mg','Tablet',3);


CREATE TABLE Medicine_Type (
    M_ID INT PRIMARY KEY,
    Medicine VARCHAR(50),
    M_Type VARCHAR(50)
);


INSERT INTO Medicine_Type VALUES
(1,'Amoxicillin','Antibiotic'),
(2,'Pain Killer','Tablet');


CREATE TABLE Material (
    Material_ID INT PRIMARY KEY,
    Material_Name VARCHAR(50),
    Prescription_ID INT,

    FOREIGN KEY(Prescription_ID) REFERENCES Prescription(Prescription_ID)
);


INSERT INTO Material VALUES
(1,'Cement',501),
(2,'Brush',502);


SELECT * FROM Patient_Details;

SELECT * FROM Appointment;

SELECT * FROM Treatment;

SELECT * FROM Prescription;

SELECT * FROM Medicine_Type;

SELECT * FROM Material;

SELECT * FROM Treat_Master;