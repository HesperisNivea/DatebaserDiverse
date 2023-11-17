--CREATE DATABASE GoT;

 USE everyloop;

 SELECT * FROM GameOfThrones
  ---Övning 1 
 SELECT CONCAT(
				'S', FORMAT (Season, '00'), 'E', 
				FORMAT (EpisodeInSeason,'00')) 
				AS Episode,
				Title
				FROM GameOfThrones;

 --Övning 2

SELECT * 
INTO Users2 
FROM Users;

UPDATE Users2
SET UserName = CONCAT(LOWER(SUBSTRING(FirstName,1,2)),LOWER(SUBSTRING(LastName,1,2)));
SELECT * FROM Users2;

-- Övning 3

SELECT * 
INTO Airports2
FROM Airports;

UPDATE Airports2 
SET DST = '-'
Where DST IS NULL 

Update Airports2
SET [Time] = '-'
Where [Time] IS NULL

--Övning 4 

Select * 
INTO Elements2
FROM [Elements]

DELETE FROM Elements2
WHERE[Name] LIke '[dkmou]%'
OR [Name] = 'Erbium' 
OR [Name]= 'Helium' 
OR [Name] = 'Nitrogen' 
OR [Name] = 'Platinum' 
OR [Name] = 'Selenium';

OR WHERE Name IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')


-- Övning 5

Skapa en ny tabell med alla rader från tabellen Elements. 
Den nya tabellen ska innehålla ”Symbol” och ”Name” från orginalet, 
samt en tredje kolumn med värdet ’Yes’ för de rader där ”Name” börjar 
med bokstäverna i ”Symbol”, och ’No’ för de rader där de inte gör det.

Ex: ’He’ -> ’Helium’ -> ’Yes’, ’Mg’ -> ’Magnesium’ -> ’No’.

CREATE TABLE NewElements (
--"Id" int Primary Key NOT NULL, 
"Symbol" nvarchar(max),
"Name" nvarchar(max), 
"YESorNO" nvarchar(3))


INSERT INTO NewElements(Symbol, [Name])
SELECT Symbol, [Name]
FROM Elements


UPDATE NewELements 
SET [YESorNO] = CASE 
				WHEN [Name] LIKE CONCAT(Symbol, '%%' , '%') THEN 'YES'
				ELSE 'NO' 
				END;

Select * FROM NewElements

-- Övning 6
 
 CREATE TABLE Colors2 (
"Name" nvarchar(max),
"Red" int, 
"Green" int,
"Blue" int)

INSERT INTO Colors2([Name],Red,Green,Blue)
SELECT [Name],Red,Green,Blue
FROM Colors

SELECT Red,Green,Blue 
    ,Code = '#'
        + CONVERT(varchar(6),
            CAST(ABS(Red) as varbinary(1))
            + CAST(ABS(Green) as varbinary(1))
            + CAST(ABS(Blue) as varbinary(1))
        , 2)
From Colors2


ALTER TABLE Colors2
ADD Code nvarchar(7)

Update Colors2
SET Code =  '#'
        + CONVERT(varchar(6),
            CAST(Red as varbinary(1))
            + CAST(Green as varbinary(1))
            + CAST(Blue as varbinary(1))
        , 2)
    From Colors2;
   
   Select * FROM Colors2

-- Övning 7

Select [Integer],[String] INTO Types2 From [Types]

select * From [Types]

SELECT [Integer], 
		[Float] = 
		CAST(CAST([Integer] AS float)/100 AS float(2)),
		[String],
		[DateTime] = CAST('2019-01-'[Integer]'09:'[Integer]':00. 0000000 +12:15' AS nvarchar(max)),
	[Bool] = CASE 
	From Types2

	SELECT * FROM Types2
SELECT Types2.[Integer], Types.float, Types2.String, Types.DateTime, Types.Bool
FROM Types2
INNER JOIN Types ON Types2.[Integer] = Types.[integer];