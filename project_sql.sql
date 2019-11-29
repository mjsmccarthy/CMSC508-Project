--
-- Table structure for table employee
--
CREATE TABLE employee (
  employeeID int(6) unsigned zerofill NOT NULL,
  firstName varchar(20) NOT NULL,
  lastName varchar(25) NOT NULL,
  address varchar(100) NOT NULL,
  phone varchar(15) NOT NULL,
  DOB date NOT NULL,
  specialty varchar(50) NOT NULL,
  salary decimal(10,0) NOT NULL,
  PRIMARY KEY (employeeID)
);

--
-- Table structure for table patient
--
CREATE TABLE patient (
  patientID int(6) unsigned zerofill NOT NULL,
  firstName varchar(20) NOT NULL,
  lastName varchar(25) NOT NULL,
  address varchar(100) NOT NULL,
  phone varchar(15) NOT NULL,
  DOB date NOT NULL,
  PRIMARY KEY (patientID)
);

--
-- Table structure for table treatment
--
CREATE TABLE treatment (
  treatmentID char(6) NOT NULL,
  treatmentName varchar(40) NOT NULL,
  cost decimal(10,2) NOT NULL,
  PRIMARY KEY (treatmentID)
);

--
-- Table structure for table room
--
CREATE TABLE room (
  roomID decimal(3,0) NOT NULL,
  roomNum decimal(2,0) NOT NULL,
  PRIMARY KEY (roomID)
);

--
-- Table structure for table department
--
CREATE TABLE department (
  deptID varchar(20) NOT NULL,
  floorNum decimal(3,0) NOT NULL,
  PRIMARY KEY (deptID)
);

--
-- Table structure for table PCP
--
CREATE TABLE PCP (
  patientID int(6) unsigned zerofill NOT NULL,
  employeeID int(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (patientID),
  FOREIGN KEY (patientID) REFERENCES patient (patientID),
  FOREIGN KEY (employeeID) REFERENCES employee (employeeID)
);

--
-- Table structure for table administer
--
CREATE TABLE administer (
  employeeID int(6) unsigned zerofill NOT NULL,
  treatmentID char(6) NOT NULL,
  adminDate datetime NOT NULL,
  PRIMARY KEY (employeeID,treatmentID),
  FOREIGN KEY (employeeID) REFERENCES employee (employeeID),
  FOREIGN KEY (treatmentID) REFERENCES treatment (treatmentID)
);

--
-- Table structure for table assigned
--
CREATE TABLE assigned (
  patientID int(6) unsigned zerofill NOT NULL,
  roomID decimal(3,0) NOT NULL,
  assignDate datetime NOT NULL,
  PRIMARY KEY (patientID),
  FOREIGN KEY (patientID) REFERENCES patient (patientID),
  FOREIGN KEY (roomID) REFERENCES room (roomID)
);

--
-- Table structure for table billed
--
CREATE TABLE billed (
  patientID int(6) unsigned zerofill NOT NULL,
  treatmentID char(6) NOT NULL,
  billDate datetime NOT NULL,
  PRIMARY KEY (patientID,treatmentID),
  FOREIGN KEY (patientID) REFERENCES patient (patientID),
  FOREIGN KEY (treatmentID) REFERENCES treatment (treatmentID)
);

--
-- Table structure for table doctor
--
CREATE TABLE doctor (
  employeeID int(6) unsigned zerofill NOT NULL,
  medSchool varchar(100) NOT NULL,
  residency varchar(100) NOT NULL,
  PRIMARY KEY (employeeID),
  FOREIGN KEY (employeeID) REFERENCES employee (employeeID)
);

--
-- Table structure for table located
--
CREATE TABLE located (
  roomID decimal(3,0) NOT NULL,
  deptID varchar(20) NOT NULL,
  PRIMARY KEY (roomID),
  FOREIGN KEY (roomID) REFERENCES room (roomID),
  FOREIGN KEY (deptID) REFERENCES department (deptID)
);

--
-- Table structure for table monitor
--
CREATE TABLE monitor (
  roomID decimal(3,0) NOT NULL,
  employeeID int(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (roomID,employeeID),
  FOREIGN KEY (roomID) REFERENCES room (roomID),
  FOREIGN KEY (employeeID) REFERENCES employee (employeeID)
);

--
-- Table structure for table nurse
--
CREATE TABLE nurse (
  employeeID int(6) unsigned zerofill NOT NULL,
  nurseSchool varchar(40) NOT NULL,
  PRIMARY KEY (employeeID),
  FOREIGN KEY (employeeID) REFERENCES employee (employeeID)
);

--
-- Table structure for table medicine
--
CREATE TABLE medicine (
  treatmentID char(6) NOT NULL,
  medName varchar(40) NOT NULL,
  dosage varchar(15) NOT NULL,
  quantity decimal(3,0) NOT NULL,
  PRIMARY KEY (treatmentID),
  FOREIGN KEY (treatmentID) REFERENCES treatment (treatmentID)
);

--
-- Table structure for table worksIn
--
CREATE TABLE worksIn (
  employeeID int(6) unsigned zerofill NOT NULL,
  deptID varchar(20) NOT NULL,
  PRIMARY KEY (employeeID),
  FOREIGN KEY (employeeID) REFERENCES employee (employeeID),
  FOREIGN KEY (deptID) REFERENCES department (deptID)
);

--
-- Inserting values into tables
--
INSERT INTO employee VALUES 
  (6007, 'Janis', 'Under', '496 Biddie Lane Cumberland VA 23040', '8044929070', '1980-7-21', 'Nurse', 75000),
  (34508, 'Dom', 'Thorn', '2300 Ashford Drive Alexandria VA 22306', '6890459871', '1975-12-9', 'Anesthesiologist', 200000),
  (235678, 'Matt', 'McKinnly', '3234 Daffodil Lane Arlington VA 22202', '5690123894', '1972-2-23', 'Radiologist', 233912),
  (134, 'Daniel', 'Yound', '1593 White Pine Lane Harrisonburg VA 22802', '3339997777', '1985-4-1', 'Nurse', 84000),
  (23890, 'Shannon', 'Arty', '2596 Meadowview Drive Stewartsville VA 24179', '9871234567', '1986-5-5', 'Surgeon', 300000),
  (200123, 'Terra', 'Summers', '3158 Ashford Drive Mclean VA 22101', '4561212343', '1992-12-12', 'Nurse', 129000),
  (123456, 'Kelsey', 'Anderson', '111 Cobblestone Lane Fredericksburg VA 22401', '2128765432', '1982-2-20', 'Neurosurgeon', 432000),
  (234567, 'John', 'Smith', '12110 Monument Dr Fairfax VA 22033', '4103633757', '1973-2-16', 'Pediatrician', 212000),
  (123678, 'Kristy', 'Mccoy', '13450 Sunrise Valley Dr Herndon VA 20171', '1114215678', '1980-1-1', 'Psychiatrist', 273000),
  (777, 'Justin', 'Perry', '123 E. Main St Richmond VA 23220', '3216549876', '1984-12-4', 'Oncologist', 363000);

INSERT INTO treatment VALUES
  ('B78R7T', 'Heart Bypass', 123000),
  ('T67RUI', 'Anesthesia', 110000),
  ('QN6R78', 'Cornea', 17500),
  ('QI923M', 'MRI', 5000),
  ('VC44M0', 'Blood Test', 400),
  ('VC44M1', 'Blood Test', 400),
  ('ADC123', 'Depression', 200),
  ('XZ2345', 'Brain Aneurysm', 24123),
  ('123REQ', 'Radiation Therapy', 8600);

INSERT INTO administer VALUES
  (6007, 'VC44M0', '2019-6-14 13:00'),
  (134, 'VC44M1', '2019-9-6 9:00'),
  (235678, 'QI923M', '2019-2-22 10:00'),
  (34508, 'T67RUI', '2019-1-1 5:00'),
  (23890, 'B78R7T', '2019-1-1 5:00'),
  (123678, 'ADC123', '2019-3-31 10:11'),
  (123456, 'XZ2345', '2019-4-18 7:13'),
  (235678, '123REQ', '2019-5-5 9:43'),
  (23890, 'QN6R78', '2019-6-13 10:55');

INSERT INTO patient VALUES
  (1, 'John', 'Smith', '5320 Joshua Tree Cir Fredericksburg VA 22407', '5555550001', '1976-1-22'),
  (2, 'Jane', 'Adams', '5320 Pennington Gap Pennington Gap VA 24277', '5555550002', '1992-4-13'),
  (3, 'Wesley', 'Davis', '5321 Lankford Hwy New Church VA 23415', '5555550003', '1985-12-4'),
  (4, 'Patricia', 'Donnelly', '49 Serenity Ln Stafford VA 22554', '5555550004', '1952-7-10'),
  (5, 'Cary', 'Stephens', '1151 Settlers Lane Dulles VA 20101', '5555550005', '1993-2-16'),
  (6, 'Elaine', 'Wade', '2671 Lawman Avenue Herndon VA 22070', '5555550006', '1989-3-31'),
  (7, 'Albert', 'Beck', '2656 Hillside Drive Dulles VA 20101', '5555550007', '1985-6-24'),
  (8, 'Jacob', 'Cruz', '3405 Pinchelone Street Virginia Beach 23452', '5555550008', '1990-4-19');

INSERT INTO PCP VALUES
  (1, 23890),
  (2, 34508),
  (3, 235678),
  (4, 23890);

INSERT INTO room VALUES
  (101, 1),
  (102, 2),
  (103, 3),
  (104, 4),
  (105, 5),
  (201, 1),
  (202, 2),
  (203, 2),
  (204, 4),
  (205, 5),
  (213, 13),
  (223, 23),
  (301, 1),
  (302, 2),
  (303, 3),
  (304, 4),
  (305, 5),
  (323, 23),
  (499, 99);
  
INSERT INTO department VALUES
  ('Oncology', 3),
  ('ER', 1),
  ('ICU', 2),
  ('Labor/Delivery', 4),
  ('Cardiology', 4),
  ('Neurology', 2),
  ('Radiology', 1),
  ('Pediatrics', 3),
  ('Behavioral Health', 5);

INSERT INTO located VALUES
  (323, 'Oncology'),
  (101, 'Radiology'),
  (102, 'Radiology'),
  (103, 'Radiology'),
  (104, 'ER'),
  (105, 'ER'),
  (499, 'Labor/Delivery'),
  (223, 'ICU'),
  (201, 'Neurology'),
  (202, 'Neurology'),
  (203, 'Neurology'),
  (204, 'Neurology'),
  (205, 'Neurology'),
  (301, 'Oncology'),
  (302, 'Oncology'),
  (303, 'Oncology'),
  (304, 'Oncology'),
  (305, 'Oncology'),
  (213, 'ICU');

INSERT INTO monitor VALUES
  (323, 6007),
  (323, 134),
  (301, 6007),
  (302, 6007),
  (303, 6007),
  (304, 6007),
  (305, 6007),
  (223, 134),
  (213, 134),
  (213, 200123);

INSERT INTO assigned VALUES
  (1, 323, '2019-9-6 8:40'),
  (2, 301, '2019-6-14 12:30'),
  (3, 323, '2019-2-22 9:45'),
  (4, 213, '2019-1-1 4:13'),
  (5, 201, '2019-4-18 7:13'),
  (6, 103, '2019-5-5 9:38'),
  (7, 499, '2019-3-31 7:55'),
  (8, 223, '2019-6-13 10:50');

INSERT INTO doctor VALUES
  (34508, 'Harvard Medical School', 'University of Virginia Medical Center Program'),
  (235678, 'University of Michigan Medical School', 'Eastern Virginia Medical School Program'),
  (23890, 'Mayo Clinic College of Medicine', 'Eastern Virginia Medical School Program'),
  (123456, 'Stanford University School of Medicine', 'University of Virginia Medical Center Program'),
  (123678, 'University of Pittsburgh School of Medicine', 'Eastern Virginia Medical School Program'),
  (234567, 'Emory University School of Medicine', 'Virginia Commonwealth University Health System Program'),
  (000777, 'Georgetown University School of Medicine', 'University of Virginia Medical Center Program');

INSERT INTO billed VALUES
  (1, 'VC44M1', '2019-9-15 9:00'),
  (2, 'VC44M0', '2019-6-20 9:00'),
  (3, 'QI923M', '2019-2-24 10:00'),
  (4, 'T67RUI', '2019-2-1 5:00'),
  (4, 'B78R7T', '2019-2-1 5:00'),
  (5, 'XZ2345', '2019-6-1 6:00'),
  (6, '123REQ', '2019-6-1 6:00'),
  (7, 'ADC123', '2019-4-30 9:13'),
  (8, 'QN6R78', '2019-7-13 10:00');

INSERT INTO medicine VALUES
  ('ADC123', 'Sertraline', '10 mg', 90);

INSERT INTO nurse VALUES
  (6007, 'Virginia Western Community College'),
  (134, 'Germanna Community College'),
  (200123, 'Hampton University');

INSERT INTO worksIn VALUES
  (6007, 'ICU'),
  (34508, 'Cardiology'),
  (235678, 'Radiology'),
  (134, 'ER'),
  (23890, 'ER'),
  (200123, 'Oncology'),
  (123456, 'Neurology'),
  (123678, 'Behavioral Health'),
  (234567, 'Pediatrics'),
  (000777, 'Oncology');

--
-- Update inserted data
--
UPDATE employee 
SET firstName = upper(firstName),
    lastName = upper(lastName),
    address = upper(address),
    specialty = upper(specialty);

UPDATE treatment
SET treatmentName = upper (treatmentName);

UPDATE patient
SET firstName = upper(firstName),
    lastName = upper(lastName),
    address = upper(address);

SET FOREIGN_KEY_CHECKS=0;
UPDATE department
SET deptID = upper(deptID);
SET FOREIGN_KEY_CHECKS=1;

UPDATE located
SET deptID = upper(deptID);

UPDATE worksIn
SET deptID = upper(deptID);

UPDATE doctor
SET medSchool = upper(medSchool),
    residency = upper(residency);

UPDATE nurse
SET nurseSchool = upper(nurseSchool);

UPDATE medicine
SET medName = upper(medName);

--
-- View to display employee data without personal info
--
CREATE VIEW employee_data AS 
SELECT e.employeeID, e.lastName, e.specialty, w.deptID
FROM employee e, worksIn w
WHERE e.employeeID = w.employeeID;

CREATE VIEW patient_bill AS
SELECT p.patientID, b.treatmentID,  t.treatmentName, t.cost, b.billDate
FROM patient p, billed b, treatment t
WHERE p.patientID = b.patientID AND b.treatmentID = t.treatmentID;

CREATE VIEW patient_data AS
SELECT patientID, firstName, lastName
FROM patient;

CREATE VIEW employee_patient_treatment AS
SELECT e.employeeID, p.patientID, a.treatmentID, t.treatmentName, a.adminDate
FROM employee e, administer a, treatment t, patient p, billed b
WHERE e.employeeID = a.employeeID 
AND a.treatmentID = t.treatmentID 
AND t.treatmentID = b.treatmentID 
AND b.patientID = p.patientID;

--
-- Trigger to format inserts
--
DELIMITER //
CREATE TRIGGER employee_insert 
BEFORE INSERT ON employee 
FOR EACH ROW
BEGIN 
  SET NEW.firstName = upper(NEW.firstName), 
  NEW.lastName = upper(NEW.lastName), 
  NEW.address = upper(NEW.address), 
  NEW.specialty = upper(NEW.specialty);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER treatment_insert 
BEFORE INSERT ON treatment 
FOR EACH ROW
BEGIN 
  SET NEW.treatmentID = upper(NEW.treatmentID), 
  NEW.treatmentName = upper(NEW.treatmentName);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER administer_insert 
BEFORE INSERT ON administer 
FOR EACH ROW
BEGIN 
  SET NEW.treatmentID = upper(NEW.treatmentID);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER department_insert 
BEFORE INSERT ON department 
FOR EACH ROW
BEGIN 
  SET NEW.deptID = upper(NEW.deptID);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER patient_insert 
BEFORE INSERT ON patient 
FOR EACH ROW
BEGIN 
  SET NEW.firstName = upper(NEW.firstName), 
  NEW.lastName = upper(NEW.lastName), 
  NEW.address = upper(NEW.address); 
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER located_insert 
BEFORE INSERT ON located 
FOR EACH ROW
BEGIN 
  SET NEW.deptID = upper(NEW.deptID);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER doctor_insert 
BEFORE INSERT ON doctor 
FOR EACH ROW
BEGIN 
  SET NEW.medSchool = upper(NEW.medSchool),
  NEW.residency = upper(NEW.residency);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER billed_insert 
BEFORE INSERT ON billed 
FOR EACH ROW
BEGIN 
  SET NEW.treatmentID = upper(NEW.treatmentID);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER medicine_insert 
BEFORE INSERT ON medicine 
FOR EACH ROW
BEGIN 
  SET NEW.treatmentID = upper(NEW.treatmentID),
  NEW.medName = upper(NEW.medName);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER nurse_insert 
BEFORE INSERT ON nurse 
FOR EACH ROW
BEGIN 
  SET NEW.nurseSchool = upper(NEW.nurseSchool);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER worksin_insert 
BEFORE INSERT ON worksIn 
FOR EACH ROW
BEGIN 
  SET NEW.deptID = upper(NEW.deptID);
END//
DELIMITER ;


--
-- Tables/Triggers for record logs
--
CREATE TABLE salary_log (
  employeeID int(6) UNSIGNED ZEROFILL,
  oldSalary decimal(10, 0),
  newSalary decimal(10, 0), 
  changeDate datetime,
  FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

DELIMITER //
CREATE TRIGGER log_salary
AFTER UPDATE on employee
FOR EACH ROW
BEGIN
  IF OLD.salary != NEW.salary THEN
    INSERT INTO salary_log 
    VALUES (OLD.employeeID, OLD.salary, NEW.salary, sysdate());
  END IF;
END//
DELIMITER ;

CREATE TABLE employee_log (
  employeeID int(6) UNSIGNED ZEROFILL,
  oldDept varchar(20) NOT NULL,
  newDept varchar(20) NOT NULL,
  changeDate datetime NOT NULL,
  FOREIGN KEY (employeeID) REFERENCES employee(employeeID)
);

DELIMITER //
CREATE TRIGGER log_employee
AFTER UPDATE on worksIn
FOR EACH ROW
BEGIN
  IF OLD.deptID != NEW.deptID THEN
    INSERT INTO employee_log
    VALUES (OLD.employeeID, OLD.deptID, NEW.deptID, sysdate());
  END IF;
END//
DELIMITER ;

CREATE TABLE pcp_log (
  patientID int(6) UNSIGNED ZEROFILL,
  oldPCP int(6) UNSIGNED ZEROFILL,
  newPCP int (6) UNSIGNED ZEROFILL,
  changeDate datetime NOT NULL,
  FOREIGN KEY (patientID) REFERENCES patient(patientID),
  FOREIGN KEY (oldPCP) REFERENCES employee(employeeID),
  FOREIGN KEY (newPCP) REFERENCES employee(employeeID)
);

DELIMITER //
CREATE TRIGGER log_pcp
AFTER UPDATE on PCP
FOR EACH ROW
BEGIN
  IF OLD.employeeID != NEW.employeeID THEN
    INSERT INTO pcp_log
    VALUES (OLD.patientID, OLD.employeeID, NEW.employeeID, sysdate());
  END IF;
END//
DELIMITER ;

--
-- Updates to populate log tables
--
UPDATE employee SET salary = salary*1.05 WHERE employeeID = 134;
UPDATE worksIn SET deptID = "ICU" WHERE employeeID = 134;
UPDATE PCP SET employeeID = 23890 WHERE patientID = 2;