-- Branch Table
CREATE TABLE Branch (
    branchNo VARCHAR(10) PRIMARY KEY,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL
);

INSERT INTO Branch(branchNo, street, city, postcode)
VALUES
    ('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
    ('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
    ('B003', '162 Main St', 'Glasgow', 'G11 9QX'),
    ('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
    ('B002', '56 Clover Dr', 'London', 'NW10 6EU');

-- Staff Table
CREATE TABLE Staff (
    staffNo VARCHAR(10) PRIMARY KEY,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    DOB DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    branchNo VARCHAR(10) NOT NULL,
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

INSERT INTO Staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo)
VALUES
  ('SL21', 'John', 'White', 'Manager', 'M', '1-Oct-45', 30000.00, 'B005'),
  ('SG37', 'Ann', 'Beech', 'Assistant', 'F', '10-Nov-60', 12000.00, 'B003'),
  ('SG14', 'David', 'Ford', 'Supervisor', 'M', '24-Mar-58', 18000.00, 'B003'),
  ('SA9', 'Mary', 'Howe', 'Assistant', 'F', '19-Feb-70', 9000.00, 'B007'),
  ('SG5', 'Susan', 'Brand', 'Manager', 'F', '3-Jun-40', 24000.00, 'B003'),
  ('SL41', 'Julie', 'Lee', 'Assistant', 'F', '13-Jun-65', 9000.00, 'B005');

-- PrivateOwner Table
CREATE TABLE PrivateOwner (
    ownerNo VARCHAR(10) PRIMARY KEY,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    telNo VARCHAR(20) NOT NULL,
);
INSERT INTO PrivateOwner(ownerNo, fName, lName, telNo, address)
VALUES
    ('CO46', 'Joe', 'Keogh', '2 Fergus, Aberdeen AB2 7SX', '01224-861212'),
    ('CO87', 'Carol', 'Farrel', '6 Archary St, Glasgow G32 9DX', '0141-357-7419'),
    ('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728'),
    ('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025');



-- PropertyForRent Table
CREATE TABLE PropertyForRent (
    PropertyNo VARCHAR(10) PRIMARY KEY,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    type VARCHAR(50) NOT NULL,
    rooms INT NOT NULL,
    rent DECIMAL(10, 2) NOT NULL,
    ownerNo VARCHAR(10) NOT NULL,
    staffNo VARCHAR(10) NULL,
    branchNo VARCHAR(10) NOT NULL,
    FOREIGN KEY (ownerNo) REFERENCES PrivateOwner(ownerNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

INSERT INTO PropertyForRent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650.00, 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400.00, 'CO87', 'SL41', 'B005'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350.00, 'CO40', NULL, 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375.00, 'CO93', 'SG37', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600.00, 'CO87', 'SG37', 'B003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450.00, 'CO93', 'SG14', 'B003');

-- Client Table
CREATE TABLE Client (
    clientNo VARCHAR(10) PRIMARY KEY,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    prefType VARCHAR(50) NOT NULL,
    maxRent DECIMAL(10, 2) NOT NULL,
    telNo VARCHAR(50) NOT NULL
);

INSERT INTO Client (clientNo, fName, lName, prefType, maxRent, telNo)
VALUES
('CR76', 'John', 'Kay', 'Flat', 425.00, '0207-774-5632'),
('CR56', 'Aline', 'Stewart', 'Flat', 350.00, '0141-848-1825'),
('CR74', 'Mike', 'Ritchie', 'House', 750.00, '01475-392178'),
('CR62', 'Mary', 'Tregear', 'Flat', 600.00, '01224-196720');

-- Viewing Table
CREATE TABLE Viewing (
    clientNo VARCHAR(10) NOT NULL,
    PropertyNo VARCHAR(10) NOT NULL,
    viewDate DATE NOT NULL,
    comment VARCHAR(200) NULL, 
    PRIMARY KEY (clientNo, PropertyNo),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (PropertyNo) REFERENCES PropertyForRent(PropertyNo)
);
INSERT INTO Viewing (clientNo, propertyNo, viewDate, comment)
VALUES
('CR56', 'PA14', '2004-05-24', 'too small'),
('CR76', 'PG4', '2004-04-20', 'too remote'),
('CR56', 'PG4', '2004-05-26', NULL),
('CR62', 'PA14', '2004-05-14', 'no dining room'),
('CR56', 'PG36', '2004-04-28', NULL);

-- Registration Table
CREATE TABLE Registration (
    clientNo VARCHAR(10) NOT NULL,
    branchNo VARCHAR(10) NOT NULL,
    staffNo VARCHAR(10) NOT NULL,
    dateJoined DATE NOT NULL, 
    PRIMARY KEY (clientNo, branchNo, staffNo), 
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
);

INSERT INTO Registration (clientNo, branchNo, staffNo, dateJoined)
VALUES
('CR76', 'B005', 'SL41', '2004-01-02'),
('CR56', 'B003', 'SG37', '2003-04-11'),
('CR74', 'B003', 'SG37', '2002-11-16'),
('CR62', 'B007', 'SA9', '2003-03-07');

-- Question 1
CREATE VIEW employees_managing_houses AS
SELECT b.branchNo, s.staffNo, COUNT(p.PropertyNo) AS houses_managed
FROM Staff s
JOIN Branch b ON s.branchNo = b.branchNo
LEFT JOIN PropertyForRent p ON s.staffNo = p.staffNo
WHERE p.type = 'House'
GROUP BY b.branchNo, s.staffNo;

-- Question 2
CREATE VIEW View_Months AS
SELECT p.PropertyNo, p.street, p.city, v.viewDate
FROM PropertyForRent p
JOIN Viewing v ON p.PropertyNo = v.PropertyNo
JOIN Registration r ON v.clientNo = r.clientNo
WHERE r.branchNo = 'B003' AND v.viewDate >= '2004-04-01' AND v.viewDate < '2004-06-01';

-- Question 3
CREATE VIEW June_Viewings AS
SELECT DISTINCT p.PropertyNo, p.street, p.city
FROM PropertyForRent p
JOIN Viewing v ON p.PropertyNo = v.PropertyNo
WHERE v.viewDate BETWEEN '2004-05-01' AND '2004-05-31';

-- Question 4
CREATE VIEW Employee_1 AS
SELECT s.staffNo, s.fName, s.lName, COUNT(p.PropertyNo) AS properties_managed
FROM Staff s
LEFT JOIN PropertyForRent p ON s.staffNo = p.staffNo
WHERE s.branchNo = 'B003'
GROUP BY s.staffNo, s.fName, s.lName;

-- Question 5 --with changes that every employee can be viewed
CREATE VIEW PropertiesManagedByMainStreetStaff AS
SELECT pf.PropertyNo, pf.street, pf.city, pf.postcode, pf.type, pf.rooms, pf.rent, pf.ownerNo, pf.staffNo, pf.branchNo
FROM PropertyForRent pf
LEFT JOIN Staff s ON pf.staffNo = s.staffNo
JOIN Branch b ON pf.branchNo = b.branchNo
WHERE b.street = '162 Main St';


-- Question 6
CREATE VIEW Property_or_Branch_office AS
SELECT DISTINCT city
FROM (
  SELECT city FROM Branch
  UNION
  SELECT city FROM PropertyForRent
) combined_cities;
