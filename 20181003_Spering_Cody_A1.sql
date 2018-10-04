DROP TABLE IF EXISTS Taverns;

CREATE TABLE Taverns (
	ID int IDENTITY, 
	LocationId int,
	OwnerId int
);

INSERT INTO Taverns
(LocationId, OwnerId) values 
(1, 1),
(2, 2), 
(3, 3), 
(4, 4),
(5, 5);

DROP TABLE IF EXISTS Locations;

CREATE TABLE Locations (
	ID int IDENTITY,
	LocName varchar(100),
);

INSERT INTO Locations
(LocName) values 
('Creeky Ship'),
('Broken Drum'), 
('Shattered Kettle'), 
('Leaky Cauldron'),
('Wet Seal');

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
	ID int IDENTITY,
	Name varchar(250),
	RoleId int,
);

INSERT INTO Users
(Name, RoleId) values 
('Chris Adams', 1),
('John Smith', 1), 
('John Smith', 2), 
('Adam Andrews', 1),
('Andrew Adams', 2),
('Andy Anderson', 1),
('Sally McFace', 1),
('Amy McAmyFace', 2);

DROP TABLE IF EXISTS Roles;

CREATE TABLE Roles (
	ID int IDENTITY,
	RoleName varchar(50),
	RoleDescription varchar(MAX),
);

INSERT INTO Roles
(RoleName, RoleDescription) values
('Owner', 'Owns the bitch'),
('Cashier', 'Cashes the bitch');

DROP TABLE IF EXISTS BasementRats;

CREATE TABLE BasementRats (
	ID int IDENTITY,
	RatName varchar(100),
	LocationId int,
);

INSERT INTO BasementRats
(RatName, LocationId) values
('Steve', 1),
('Dog', 1),
('Snitch', 3),
('Steve', 2),
('Steve', 1),
('Abraham Lincoln', 5),
('Andy McDonaldsSucks', 4),
('Fat Shit', 3);

DROP TABLE IF EXISTS Supplies;

CREATE TABLE Supplies (
	ID int IDENTITY, 
	SupplyName varchar(250),
	Unit varchar(50),
	Inventory int,
	TavernId int,
	DateUpdated datetime
);

INSERT INTO Supplies
(SupplyName, Unit, Inventory, TavernId, DateUpdated) values
('Forks', 'pieces', 500, 1, '10/2/2018'),
('Spoons', 'pieces', 500, 1, '09/5/2018'),
('Ale', 'Gallons', 50, 1, '10/2/2018'),
('Towels', 'Pieces', 100, 2, '10/2/2018')

DROP TABLE IF EXISTS Receiving;

CREATE TABLE Receiving (
	ID int IDENTITY, 
	SupplyId int,
	TavernId int,
	UnitCost int,
	Amount int,
	DateReceived datetime
);

INSERT INTO Receiving
(SupplyId, TavernId, UnitCost, Amount, DateReceived) values
(1, 1, 3, 500, '10/2/2018'),
(2, 1, 3, 500, '9/5/2018'),
(3, 1, 10, 50, '10/2/2018'),
(4, 2, 1, 100, '10/2/2018'),
(3, 1, 10, 500, '10/3/2018'),
(3, 5, 10, 50, '10/3/2018'),
(2, 3, 3, 50, '10/3/2018');

DROP TABLE IF EXISTS SaleServices;

CREATE TABLE SaleServices (
	ID int IDENTITY, 
	ServName varchar(100),
	StatusId int
);

INSERT INTO SaleServices
(ServName, StatusId) values
('Week Stay', 1),
('Day Stay', 2),
('Holiday Week Stay', 2),
('Night Dinner', 1),
('Holiday Night Dinner', 2),
('Spa Day', 1),
('Mothers Day Spa', 2),
('Drunken Jousting', 3),
('Even Drunker Jousting', 4);

DROP TABLE IF EXISTS ServiceStatus;

CREATE TABLE ServiceStatus (
	ID int IDENTITY, 
	StatusName varchar(100)
);

INSERT INTO ServiceStatus
(StatusName) values
('Active'),
('Inactive'),
('Banned'),
('PermaBanned');

DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
	ID int IDENTITY, 
	ServiceId int,
	GuestId int,
	Price int,
	Date datetime,
	Amount int,
	TavernId int
);

INSERT INTO Sales
(ServiceId, GuestId, Price, Date, Amount, TavernId) values
(1, 1, 1400, '10/2/2018', 1, 2),
(6, 7, 60, '10/2/2018', 1, 1),
(4, 6, 50, '10/2/2018', 2, 5),
(1, 2, 1400, '10/2/2018', 1, 2),
(4, 3, 50, '10/2/2018', 2, 5),
(2, 4, 200, '10/2/2018', 1, 3),
(1, 1, 1400, '10/2/2018', 1, 5),
(1, 1, 1400, '10/2/2018', 1, 4);

DROP TABLE IF EXISTS Guests;

CREATE TABLE Guests (
	ID int IDENTITY, 
	GuestName varchar(100)
);

INSERT INTO Guests
(GuestName) values
('John Smith'),
('Andy Oconnor'),
('Chip Skylark'),
('Thor Dragonslayer'),
('John Smith'),
('Amy Anderson'),
('Petra Veng'),
('Ikora Rey'),
('Cayde-6');