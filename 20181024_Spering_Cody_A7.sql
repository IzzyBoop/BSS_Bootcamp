CREATE TABLE Taverns (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(250),
	OwnerId int
);

INSERT INTO Taverns
(Name, OwnerId) values 
('Creeky Ship', 1),
('Broken Drum', 2), 
('Shattered Kettle', 3), 
('Leaky Cauldron', 4),
('Wet Seal', 5),
('Forever 21', 6);

CREATE TABLE Rooms (
	ID int PRIMARY KEY IDENTITY,
	TavernId int FOREIGN KEY REFERENCES Taverns(ID),
	Number int,
	RoomStatusId int,
	Notes varchar(MAX),
	Rate int
);

INSERT INTO Rooms
(TavernId, Number, RoomStatusId, Rate, Notes) VALUES
(1, 100, 1, 300, ''),
(1, 101, 1, 300, ''),
(1, 102, 2, 350, 'Do Not Feed This Man'),
(1, 103, 3, 250, ''),
(1, 104, 1, 60, ''),
(1, 200, 2, 30, ''),
(1, 201, 4, 0, 'Currently Inactive indefinitely due to murder'),
(1, 202, 1, 100, ''),
(1, 203, 2, 200, ''),
(1, 204, 2, 500, 'Noisy'),
(2, 100, 2, 1000, 'boujie'),
(2, 101, 1, 30, 'SELL THIS ROOM FIRST'),
(2, 102, 1, 400, ''),
(2, 103, 3, 10, 'Cleaning'),
(2, 200, 2, 100, 'Need to be out by 11'),
(2, 201, 1, 40, ''),
(2, 1408, 4, 5, 'Haunted af');

CREATE TABLE RoomStatus (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(100)
);

INSERT INTO RoomStatus
(Name) VALUES
('Available'),
('Unavailable'),
('Inactive'),
('Other');

CREATE TABLE RoomSales (
	ID int PRIMARY KEY IDENTITY,
	ServiceSalesId int,
	RoomId int,
	Date date,
	Rate int
);

INSERT INTO RoomSales
(ServiceSalesId, RoomId, Date, Rate) VALUES
(2, 3, '2018-10-02', 300),
(4, 10, '2018-10-05', 300),
(6, 7, '2018-09-01', 600),
(4, 11, '2018-10-10', 250);


CREATE TABLE Users (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(250),
	RoleId int
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

CREATE TABLE Roles (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(50),
	Description varchar(MAX),
);

INSERT INTO Roles
(Name, Description) values
('Admin', 'Owns the bitch'),
('Cashier', 'Cashes the bitch');


CREATE TABLE BasementRats (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(100),
	TavernId int,
	ClassId int 
);

INSERT INTO BasementRats
(Name, TavernId, ClassId) values
('Steve', 1, 1),
('Dog', 1, 3),
('Snitch', 3, 2),
('Steve', 2, 5),
('Steve', 1, 5),
('Abraham Lincoln', 5, 4),
('Andy McDonaldsSucks', 4, 1),
('Fat Shit', 3, 2);

CREATE TABLE Supplies (
	ID int PRIMARY KEY IDENTITY, 
	Name varchar(250),
	Unit varchar(50),
	Amount int,
	TavernId int
);

INSERT INTO Supplies
(Name, Unit, Amount, TavernId) values
('Forks', 'Pieces', 50, 1),
('Spoons', 'Pieces', 100, 2),
('Ale', 'Gallons', 200, 3),
('Towels', 'Pieces', 100, 1),
('tomatoes', 'Pieces', 50, 4),
('Potatoes', 'Pieces', 50, 1),
('Steak', 'Pieces', 100, 1);

CREATE TABLE SalesSupplies (
	ID int PRIMARY KEY IDENTITY,
	SupplyId int,
	Price int,
	Date date,
	Amount int,
	TavernId int
);

INSERT INTO SalesSupplies
(SupplyId, Price, Date, Amount, TavernId) values
(7, 15, '2018-10-10', 1, 1),
(6, 15, '2018-10-10', 2, 1);


CREATE TABLE Sales (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(100),
	Price int,
	Date date,
	TavernId int,
	GuestId int
);

INSERT INTO Sales
(Name, Price, Date, TavernId, GuestId) values
('Steak Dinner', 30, '2018-10-10', 1, 3);

/* 
Constraint Example, 

INSERT INTO Sales
(Name, Price, Date, TavernId) values
('Steak Dinner', 30, '2018-10-10', 'Leaky Cauldron', 3)

Inserting a string 'Leaky Cauldron' into the TavernId foreign key which references Taverns(ID) which is an int.
*/

CREATE TABLE Receiving (
	ID int PRIMARY KEY IDENTITY, 
	SupplyId int,
	TavernId int,
	Cost int,
	Amount int,
	DateReceived datetime
);

INSERT INTO Receiving
(SupplyId, TavernId, Cost, Amount, DateReceived) values
(2, 3, 3, 50, '2018-09-03'),
(1, 1, 3, 500, '2018-10-02'),
(1, 1, 3, 500, '2018-08-02'),
(2, 1, 3, 500, '2018-08-02'),
(2, 1, 3, 500, '2018-09-05'),
(3, 1, 10, 50, '2018-10-02'),
(4, 2, 1, 100, '2018-10-02'),
(3, 1, 10, 500, '2018-10-03'),
(3, 5, 10, 50, '2018-10-03'),
(2, 3, 3, 50, '2018-10-03');

CREATE TABLE Services (
	ID int PRIMARY KEY IDENTITY, 
	Name varchar(100),
	StatusId int,
	TavernId int
);

INSERT INTO Services
(Name, StatusId, TavernId) values
('Week Stay', 1, 1),
('Week Stay', 1, 2),
('Week Stay', 1, 3),
('Week Stay', 1, 4),
('Week Stay', 1, 5),
('Day Stay', 2, 1),
('Day Stay', 2, 2),
('Day Stay', 2, 3),
('Day Stay', 2, 4),
('Holiday Week Stay', 2, 1),
('Night Dinner', 1, 4),
('Holiday Night Dinner', 2, 3),
('Spa Day', 1, 5),
('Mothers Day Spa', 2, 3),
('Drunken Jousting', 3, 2),
('Even Drunker Jousting', 4, 5);

CREATE TABLE ServiceStatus (
	ID int PRIMARY KEY IDENTITY, 
	StatusName varchar(50)
);

INSERT INTO ServiceStatus
(StatusName) values
('Active'),
('Inactive'),
('Banned'),
('PermaBanned');

CREATE TABLE ServiceSales (
	ID int PRIMARY KEY IDENTITY, 
	ServiceId int,
	GuestId int,
	Price int,
	Date datetime,
	Amount int,
	TavernId int
);

/*Hi Crystal*/

INSERT INTO ServiceSales
(ServiceId, GuestId, Price, Date, Amount, TavernId) values
(1, 1, 1400, '2017-10-02', 1, 2),
(6, 7, 300, '2016-10-02', 1, 1),
(4, 6, 50, '2017-10-02', 2, 5),
(1, 2, 1400, '2017-09-02', 1, 2),
(4, 3, 50, '2018-10-02', 2, 5),
(2, 4, 200, '2018-10-02', 1, 3),
(1, 1, 1400, '2018-10-02', 1, 5),
(1, 1, 1400, '2018-10-02', 1, 4);

CREATE TABLE Guests (
	ID int PRIMARY KEY IDENTITY, 
	Name varchar(100),
	Birthdate date,
	CakeDay date,
	Notes varchar(max),
	StatusId int,
);

INSERT INTO Guests
(Name, Birthdate, Cakeday, Notes, StatusId) values
('John Smith', '1991-10-18', '1991-10-18', 'fuck this guy', 3),
('Andy Oconnor', '1986-07-23', '1986-07-23',  'N/A', 2),
('Chip Skylark', '1976-02-22', '1976-02-22', 'Lit-ass music yo', 5),
('Thor Dragonslayer', '0001-01-01', '0001-01-01', 'literally god', 5),
('John Smith', '1993-10-31', '1993-10-31', 'Fuck this guy too', 3),
('Amy Anderson', '1944-01-21', '1944-01-21', 'How are you alive?', 1),
('Petra Veng', '1989-07-08', '1989-07-08', 'Youve got a blast radius PV', 5),
('Ikora Rey', '1963-10-21', '1963-10-21', 'N/A', 1),
('Cayde-6', '1985-02-01', '1985-02-01', 'RIP', 2);


CREATE TABLE GuestStatus (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(100),
);

INSERT INTO GuestStatus
(Name) values
('Active'),
('Inactive'),
('Banned'),
('Void'),
('Permanently part of the void'),
('Mentally Stagnant');

CREATE TABLE Classes (
	ID int PRIMARY KEY IDENTITY,
	Name varchar(100),
);

INSERT INTO Classes
(Name) values
('Rogue'),
('Warrior'),
('Cleric'),
('Healer'),
('Thief'),
('Fighter'),
('Asshat'),
('Bard'),
('Super Bard'),
('Hyper Bard'),
('Cow'),
('Warlock'),
('Titan'),
('Hunter');

CREATE TABLE GuestClasses (
	ID int PRIMARY KEY IDENTITY,
	GuestId int,
	ClassId int
);

INSERT INTO GuestClasses /*Shows relationships between guests and classes and assigns an ID to each relationship) */
(GuestId, ClassId) VALUES
(1, 1),
(1, 2),
(2, 5),
(3, 8),
(3, 9),
(3, 10),
(4, 11),
(5, 1),
(6, 12),
(7, 3),
(8, 12),
(9, 14)

CREATE TABLE GuestClassLevels (
	GuestClassId int,
	Level int
);

INSERT INTO GuestClassLevels
(GuestClassId, Level) VALUES
(1, 30),
(2, 35),
(3, 10),
(4, 100),
(5, 80),
(6, 50),
(7, 5),
(8, 110),
(9, 67),
(11, 25),
(12, 17);

ALTER TABLE GuestClassLevels ADD FOREIGN KEY (GuestClassId) REFERENCES GuestClasses(ID);
ALTER TABLE GuestClasses ADD FOREIGN KEY (ClassId) REFERENCES Classes(ID);
ALTER TABLE GuestClasses ADD FOREIGN KEY (GuestId) REFERENCES Guests(ID);
ALTER TABLE Supplies ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE Users ADD FOREIGN KEY (RoleId) REFERENCES Roles(ID);
ALTER TABLE RoomSales ADD FOREIGN KEY (ServiceSalesId) REFERENCES ServiceSales(ID);
ALTER TABLE RoomSales ADD FOREIGN KEY (RoomId) REFERENCES Rooms(ID);
ALTER TABLE Rooms ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE Rooms ADD FOREIGN KEY (RoomStatusId) REFERENCES RoomStatus(ID);
ALTER TABLE Taverns ADD FOREIGN KEY (OwnerId) REFERENCES Users(ID);
ALTER TABLE BasementRats ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE BasementRats ADD FOREIGN KEY (ClassId) REFERENCES Classes(ID);
ALTER TABLE Receiving ADD FOREIGN KEY (SupplyId) REFERENCES Supplies(ID);
ALTER TABLE Receiving ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE Services ADD FOREIGN KEY (StatusId) REFERENCES ServiceStatus(ID);
ALTER TABLE Services ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE ServiceSales ADD FOREIGN KEY (ServiceId) REFERENCES Services(ID);
ALTER TABLE ServiceSales ADD FOREIGN KEY (GuestId) REFERENCES Guests(ID);
ALTER TABLE ServiceSales ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE Guests ADD FOREIGN KEY (StatusId) REFERENCES GuestStatus(ID);
ALTER TABLE SalesSupplies ADD FOREIGN KEY (SupplyId) REFERENCES Supplies(ID);
ALTER TABLE SalesSupplies ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE Sales ADD FOREIGN KEY (TavernId) REFERENCES Taverns(ID);
ALTER TABLE Sales ADD FOREIGN KEY (GuestId) REFERENCES Guests(ID);

--1
CREATE PROCEDURE GuestsWithClass
@Class varchar(30)
AS
Select g.ID, g.Name, c.Name from Guests g left join 
GuestClasses gc ON g.ID=gc.GuestId left join 
Classes c ON c.ID=gc.ClassId WHERE c.Name = @Class
GO

EXEC GuestsWithClass Class = 'Warrior';

--2
CREATE PROCEDURE TotalSalesOfGuest
@GuestId varchar(30)
AS
SELECT SUM(PRICE) AS Total_Sales FROM ServiceSales WHERE GuestId = @GuestId
GO

EXEC TotalSalesOfGuest GuestId = '1';

--3
CREATE PROCEDURE GuestsLevelGreaterOrLower
@Level varchar(30),
@GorL varchar(10)
AS
IF (@GorL = 'Greater')
	Select g.ID, g.Name, c.Name, gcl.Level from Guests g left join 
	GuestClasses gc ON g.ID=gc.GuestId left join 
	Classes c ON c.ID=gc.ClassId left join GuestClassLevels gcl ON gc.ID=gcl.GuestClassId
	WHERE Level > @Level;
ELSE
	Select g.ID, g.Name, c.Name, gcl.Level from Guests g left join 
	GuestClasses gc ON g.ID=gc.GuestId left join 
	Classes c ON c.ID=gc.ClassId left join GuestClassLevels gcl ON gc.ID=gcl.GuestClassId
	WHERE Level < @Level;
GO

EXEC GuestsLevelGreaterOrLower GorL = 'Greater';

--4
CREATE PROCEDURE DelTav
@Tavern int
AS
DELETE FROM Taverns WHERE ID = @Tavern
GO

EXEC DelTav Tavern = 1

--5
#NahSon

--6
--Function
GO
CREATE FUNCTION dbo.GetPriceRange(@MinPrice int, @MaxPrice int)
RETURNS TABLE
AS
RETURN
(
	SELECT r.TavernId AS Tavern_ID, r.Number AS Room_Number, s.Name AS Status, r.Rate AS Price FROM [dbo].[Rooms] r left join [dbo].[RoomStatus] s ON r.RoomStatusId = s.ID
	WHERE s.ID = 1 AND r.Rate BETWEEN
)
--Procedure
CREATE PROCEDURE AutoBookCheapest
@GuestId int
AS
Insert into servicesales
(ServiceId, GuestId, Price, Date, Amount, TavernId) VALUES
(1, 
@guestId, 
SELECT TOP 1 Price FROM GetPriceRange ORDER BY Price Asc,
GETDATE(),
1,
SELECT TOP 1 TavernId FROM GetPriceRange ORDER BY Price Asc);
GO

EXEC AutoBookCheapest GuestId = 1




