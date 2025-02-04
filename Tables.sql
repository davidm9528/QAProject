CREATE TABLE IF NOT EXISTS Person (
PersonID int NOT NULL AUTO_INCREMENT UNIQUE,
FName varchar(20),
SName varchar(20),
ContactNo varchar(11),
DoB date, 
EmergencyContactName varchar(255),
EmergencyContactNumber varchar(11),
Disabilities BOOLEAN
);


CREATE TABLE IF NOT EXISTS Employee (
EmployeeID int NOT NULL AUTO_INCREMENT UNIQUE,
PersonID int NOT NULL,
Salary int,
FOREIGN KEY (PersonID) References Person (PersonID),
PRIMARY KEY (EmployeeID)
);



CREATE TABLE IF NOT EXISTS Tenant (
TenantID int NOT NULL AUTO_INCREMENT UNIQUE,
PersonID int NOT NULL,
PRIMARY KEY (TenantID),
FOREIGN KEY (PersonID) References Person (PersonID)
);


CREATE TABLE IF NOT EXISTS Bank_Account (
BankAccountID int NOT NULL,
PersonID int NOT NULL,
AccountNumber int varchar(8) NOT NULL, 
SortCode int varchar(6) NOT NULL,
PRIMARY KEY (BankAccountID),
FOREIGN KEY (PersonID) References Person (PersonID)
);


CREATE TABLE IF NOT EXISTS Building (
BuildingID int NOT NULL AUTO_INCREMENT UNIQUE,
BuildingName varchar(3),
Street varchar(255),
PostCode varchar(7),
PRIMARY KEY (BuildingID)
);

CREATE TABLE IF NOT EXISTS Manager (
ManagerID int NOT NULL AUTO_INCREMENT UNIQUE,
EmployeeID int NOT NULL,
PRIMARY KEY (ManagerID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
);


CREATE TABLE IF NOT EXISTS Apartment (
ApartmentID int NOT NULL AUTO_INCREMENT UNIQUE,
ApartmentNo int NOT NULL,
NumBedrooms int,
NumBathrooms int, 
TotalArea int, 
BuildingID int NOT NULL,
ManagerID int NOT NULL,
PRIMARY KEY (ApartmentID),
FOREIGN KEY (BuildingID) References Building (BuildingID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);



CREATE TABLE IF NOT EXISTS Lease (
LeaseID int NOT NULL AUTO_INCREMENT UNIQUE,
TenantID int NOT NULL,
ApartmentID int NOT NULL,
ManagerID int NOT NULL,
Status BOOLEAN NOT NULL,
Cost int NOT NULL,
PRIMARY KEY (LeaseID),
FOREIGN KEY (TenantID) References Tenant(TenantID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);


CREATE TABLE IF NOT EXISTS Office (
OfficeID int NOT NULL AUTO_INCREMENT UNIQUE,
ApartmentID int NOT NULL,
ManagerID int NOT NULL,
PRIMARY KEY (OfficeID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID),
FOREIGN KEY (ManagerID) References Manager (ManagerID)
);


CREATE TABLE IF NOT EXISTS Technicians (
TechnicianID int NOT NULL AUTO_INCREMENT UNIQUE,
EmployeeID int NOT NULL,
PRIMARY KEY (TechnicianID),
FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS ContractedJobs (
ContractedJobsID int NOT NULL AUTO_INCREMENT UNIQUE,
ManagerID int NOT NULL,
TechnicianID int NOT NULL,
ApartmentID int NOT NULL,
WorkRequired TEXT,
WorkCompleted BOOLEAN,
PRIMARY KEY (ContractedJobsID),
FOREIGN KEY (ManagerID) References Manager (ManagerID),
FOREIGN KEY (TechnicianID) References Technicians (TechnicianID),
FOREIGN KEY (ApartmentID) References Apartment (ApartmentID)
);


CREATE TABLE IF NOT EXISTS EmployeeContract (
EmployeeContractID int NOT NULL AUTO_INCREMENT UNIQUE,
EmployeeID int NOT NULL,
EmpRate int NOT NULL,
EmpHRsPWeek TIME,
FOREIGN KEY (EmployeeID) References Employee (EmployeeID),
PRIMARY KEY (EmployeeContractID)
);

--------Maybe remove payments incoming and outcoming to make it more simple-------------

--PaymentsOutgoing
-- CREATE TABLE IF NOT EXISTS PaymentsOutgoing (
-- PaymentsOutgoingREF int NOT NULL AUTO_INCREMENT UNIQUE,
-- PRIMARY KEY (PaymentsOutgoingREF),
-- FOREIGN KEY (BankAccountID) References BankAccount (BankAccountID),
-- FOREIGN KEY (EmployeeID) References Employee (EmployeeID)
-- );



--PaymentsIncoming
-- CREATE TABLE IF NOT EXISTS PaymentsIncoming (
-- PaymentsIncomingREF int NOT NULL AUTO_INCREMENT UNIQUE,
-- PRIMARY KEY (PaymentsIncomingREF),
-- FOREIGN KEY (BankAccountID) References BankAccount (BankAccountID),
-- FOREIGN KEY (TenantID) References Tenant (TenantID)
--);