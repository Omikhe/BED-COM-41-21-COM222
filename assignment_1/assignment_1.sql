CREATE TABLE Staff (
    staffNo VARCHAR(4),
    fName VARCHAR(50),
    lName VARCHAR(50),
    position VARCHAR(50),
    sex CHAR(1),
    DOB DATE
);

INSERT INTO Staff(staffNo, fName, lName, position, sex, DOB) VALUES ('SL21', 'John', 'White', 'Manager', 'M', '1-Oct-45');

INSERT INTO Staff(staffNo, fName, lName, position, sex, DOB) VALUES ('SG37', 'Ann', 'Beech', 'Assistant', 'F', '10-Nov-60');

INSERT INTO Staff(staffNo, fName, lName, position, sex, DOB) VALUES ('SG14', 'David', 'Ford', 'Supervisor', 'M', '24-Mar-58');

INSERT INTO Staff(staffNo, fName, lName, position, sex, DOB) VALUES ('SA9', 'Mary', 'Howe', 'Assistant', 'F', '19-Feb-70');

INSERT INTO Staff(staffNo, fName, lName, position, sex, DOB) VALUES ('SG5', 'Susan', 'Brand', 'Manager', 'F', '3-Jun-40');

INSERT INTO Staff(staffNo, fName, lName, position, sex, DOB) VALUES ('SL41', 'Julie', 'Lee', 'Assistant', 'F', '13-Jun-65');


CREATE TABLE PropertyForRent (
    propertyNo VARCHAR(4),
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(50),
    type VARCHAR(50),
    rooms INT,
    rent DECIMAL(10, 2), 
    ownerNo VARCHAR(4),  
    staffNo VARCHAR(4),  
    branchNo VARCHAR(4)
);


INSERT INTO PropertyForRent(propertyNo, street, city, postcode, rooms, rent, ownerNo, staffNo, branchNo) VALUES('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 6, 650, 'CO46', 'SA9', 'B007');

INSERT INTO PropertyForRent(propertyNo, street, city, postcode, rooms, rent, ownerNo, staffNo, branchNo) VALUES('PL94', '6 Argyll St', 'London', 'NW2', 4, 400, 'CO87', 'SL41', 'B005');

INSERT INTO PropertyForRent(propertyNo, street, city, postcode, rooms, rent, ownerNo, staffNo, branchNo) VALUES('PG4', '6 Lawrence St', 'Glasgow', 'G11 9qx', 3, 350, 'CO40', NULL, 'B003');

INSERT INTO PropertyForRent(propertyNo, street, city, postcode, rooms, rent, ownerNo, staffNo, branchNo) VALUES('PG36', '2 Manor Rd', 'Glasgow', 'G11 9QX', 3, 375, 'CO93', 'SG37', 'B003');

INSERT INTO PropertyForRent(propertyNo, street, city, postcode, rooms, rent, ownerNo, staffNo, branchNo) VALUES('PG21', '18 Dale Rd', 'Glasgow', 'G12', 5, 600, 'CO87', 'SG37', 'B003');

INSERT INTO PropertyForRent(propertyNo, street, city, postcode, rooms, rent, ownerNo, staffNo, branchNo) VALUES('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 4, 450, 'CO93', 'SG14', 'B003');

CREATE TABLE Client(
    clientNo VARCHAR(4),
    fName VARCHAR(50),
    lName VARCHAR(50),
    telNo VARCHAR(20),
    prefType VARCHAR(10),
    maxRent INT
);

INSERT INTO Client(clientNo, fName, lName, telNo, prefType, maxRent) VALUES ('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425);

INSERT INTO Client(clientNo, fName, lName, telNo, prefType, maxRent) VALUES ('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350);

INSERT INTO Client(clientNo, fName, lName, telNo, prefType, maxRent) VALUES ('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750);

INSERT INTO Client(clientNo, fName, lName, telNo, prefType, maxRent) VALUES ('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600);

ALTER TABLE Staff ADD COLUMN Salary DECIMAL (30);
ALTER TABLE Staff ADD COLUMN BranchNo VARCHAR (30);

UPDATE PropertyForRent
SET staffNo = 'SG5' 
WHERE propertyNo = 'PG4';

SELECT street, type, rent, ownerNo FROM PropertyForRent;