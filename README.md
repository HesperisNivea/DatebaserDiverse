# DatebaserDiverse

--CREATE DATABASE DjurDB
--USE DjurDB;

--CREATE TABLE DjurTbl (
--"Id" int PRIMARY KEY,
--"Name" nvarchar(max) NOT NULL);


--INSERT INTO DjurTbl (Id,Name)
--VALUES (2, 'Hund'),(3, 'Katt'),(4,'Kanin');

--SELECT * FROM DjurTbl WHERE Name LIKE '%A%';

--CREATE DATABASE KlassenDB;
Use KlassenDB;
--CREATE TABLE KlassenTbl (
--"Id" int Primary Key,
--"First Name" nvarchar(max) not null,
--"Last Name" nvarchar(max) not null,
--"Age" int,
--"Resedence" nvarchar(max) not null);


INSERT INTO KlassenTbl (Id,[First Name],[Last Name],Age,Resedence)
VALUES (1,'Felix','Åmark',31,'Lund'),(2,'Vivian','Nguyen',28,'Halmstad'),
(3,'Izabela','Radomska',31,'Krakow'),
(4,'Eric','Figueredo',23,'Skövde'),
(5,'Samer','Zaid',23,'Mölnlycke');

SELECT * FROM KlassenTbl
