/*Vivia Chen, Qiyan Lu and Mengduo*/
CREATE DATABASE UberDataBase
GO

USE UberDatabase
GO

-- Create tables
CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar (250) NOT NULL,
  LastName varchar(250) NOT NULL,
  Email varchar(250) NOT NULL,
  Rating varchar(250) NOT NULL);

 CREATE TABLE Driver(
  DriverID bigint NOT NULL PRIMARY KEY,
  FirstName varchar (250) NOT NULL,
  LastName varchar(250) NOT NULL,
  VehicleModel varchar(250) NOT NULL,
  PlateNumber varchar(250) NOT NULL);

 CREATE TABLE Trip(
  OrderID bigint NOT NULL PRIMARY KEY,
  OrderDate varchar (250) NOT NULL,
  OrderTime varchar(250) NOT NULL,
  CustomerID bigint NOT NULL,
  DriverID bigint NOT NULL);

 CREATE TABLE Payment(
  PaymentID bigint NOT NULL PRIMARY KEY,
  CardType varchar (250) NOT NULL,
  CardNumber varchar(250) NOT NULL,
  ExpirationDate varchar (250) NOT NULL,
  ZipCode varchar(250) NOT NULL,
  CustomerID bigint NOT NULL,
  OrderID bigint NOT NULL);

-- Create the relationships 
ALTER TABLE Trip ADD CONSTRAINT FK_Trip_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
GO

ALTER TABLE Trip ADD CONSTRAINT FK_Trip_Driver
FOREIGN KEY (DriverID) REFERENCES Driver(DriverID);
GO

ALTER TABLE Payment ADD CONSTRAINT FK_Payment_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
GO

ALTER TABLE Payment ADD CONSTRAINT FK_Payment_Trip
FOREIGN KEY (OrderID) REFERENCES Trip(OrderID);
GO

-- Add a few students
INSERT INTO Customer (CustomerID, LastName, FirstName, Email, Rating) VALUES 
(000, 'Minh', 'Ho', 'mho2@babson.edu', '5'),
(111, 'Gianni', 'Jiang', 'gjiang2@babson.edu', '5'),
(222, 'Jeffery', 'Cui', 'jcui1@babson.edu', '4'),
(333, 'Boxun', 'Li', 'bli1@babson.edu', '1'),
(444, 'Eric', 'Lu', 'qlu2@babson.edu', '5'),
(555, 'Monika', 'Jiang', 'mjiang@hotmail.com', '5'),
(666, 'Vivia', 'Chen', 'ychen7@babson.edu', 'NA'),
(777, 'Eric', 'Yang', 'myang4@babson.edu', '5'),
(888, 'Tracy', 'Chin', 'tchin2@babson.edu', '1'),
(999, 'Huy', 'Nguyen', 'nbhuy@gmail.edu', '2');

INSERT INTO Driver (DriverID, FirstName, LastName, VehicleModel, PlateNumber) VALUES 
(000783, 'Xiao', 'Ming', 'ToyotaCorolla', '666666'),
(000453, 'Gou', 'Dan', 'Toyota Land Cruiser', 'LVUBER'),
(000587, 'Eric', 'Lee', 'ToyotaRACV4', '342RID'),
(000328, 'Michael', 'Adams', 'ToyotaYaris', '59H98Y'),
(000447, 'Gorden', 'Smith', 'ToyotaHighlander', '3H8G9U'),
(000349, 'Alice', 'Chan', 'ToyotaLandX', '059HHH'),
(000949, 'Hans', 'Young', 'Honda Civic', 'GE8W99'),
(000596, 'Lee', 'Laspine', 'HondaCR-V', '394F7H'),
(000324, 'Daniel', 'Cohen', 'HondaODYSEEY', '049Y4O'),
(000697, 'Cyn', 'Smith', 'HondaPilot', '384WUI');

INSERT INTO Trip (OrderID, OrderDate, OrderTime, CustomerID, DriverID) VALUES 
(1, '20170310', '18:09', '444', '000697'),
(2, '20170611', '17:10', '555', '000324'),
(3, '20170109', '08:03', '777', '000596'),
(4, '20171016', '09:45', '222', '000949'),
(5, '20170607', '19:51', '666', '000349'),
(6, '20170228', '18:59', '000', '000447'),
(7, '20170809', '20:08', '666', '000328'),
(8, '20170829', '00:56', '333', '000587'),
(9, '20170517', '08:45', '666', '000453'),
(10, '20170718', '12:31', '111', '000783');

INSERT INTO Payment (PaymentID, CustomerID, OrderID, CardType, CardNumber, ExpirationDate, Zipcode) VALUES
(583250, '000', '1', 'Visa', '7048198624762095', '0619', '63377'),
(984721, '000', '2', 'MasterCard', '3175873409581293', '0818', '02481'),
(184020, '111', '3', 'Visa', '7294018492844910', '0721', '01045'),
(284010, '222', '4', 'Visa', '6578909876567845', '0519', '93510'),
(184582, '333', '5', 'MasterCard', '9875656786545801', '0822', '31460'),
(456798, '444', '6', 'Visa', '4010591039501859', '0222', '92618'),
(098778, '666', '7', 'Visa', '4819491010481802', '0118', '92630'),
(395013, '777', '8', 'Visa',  '9876545678998762', '1219', '95132'),
(712415, '999', '9', 'MasterCard', '2498109843198109', '0718', '95310'),
(619969, '999', '10', 'Visa', '2940492810582910', '0822', '92618');

