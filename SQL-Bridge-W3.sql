-- SQL Bridge Week 3 Assignment
-- Building a Relational Database Management System
-- Donald Butler
-- 08/05/2021

USE key_access;
-- Create Rooms table
DROP TABLE IF EXISTS Rooms;
CREATE TABLE Rooms (
	RoomId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RoomName varchar(100)
);
INSERT INTO Rooms (RoomName) VALUES ('101'),('102'),('Auditorium A'),('Auditorium B');

-- Create Departments table
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
	DepartmentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DepartmentName varchar(100)
);
INSERT INTO Departments (DepartmentName) VALUES ('I.T.'),('Sales'),('Administration'),('Operations');

-- Create Room_Assignments table
DROP TABLE IF EXISTS Room_Assignments;
CREATE TABLE Room_Assignments (
	RoomId INT NOT NULL,
    DepartmentId INT NOT NULL
);
INSERT INTO Room_Assignments (RoomId,DepartmentId) VALUES
	((SELECT RoomId FROM Rooms WHERE RoomName = '101'),(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'I.T.')),
	((SELECT RoomId FROM Rooms WHERE RoomName = '102'),(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'I.T.')),
	((SELECT RoomId FROM Rooms WHERE RoomName = '102'),(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Sales')),
	((SELECT RoomId FROM Rooms WHERE RoomName = 'Auditorium A'),(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Sales'));

-- Create Users table
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
	UserId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserName varchar(100) NOT NULL,
    DepartmentId INT
);
INSERT INTO Users (UserName, DepartmentId) VALUES
	('Modesto',(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'I.T.')),
	('Ayine',(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'I.T.')),
	('Christopher',(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Sales')),
	('Cheong woo',(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Sales')),
	('Saulat',(SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Administration')),
	('Heidy',NULL);

-- Report all Departments and their assigned Users
SELECT d.DepartmentName, u.UserName
FROM Departments d
LEFT JOIN Users u ON u.DepartmentId = d.DepartmentId
ORDER BY d.DepartmentName, u.UserName;

-- Report all Rooms and their assigned Departments
SELECT r.RoomName, d.DepartmentName
FROM Rooms r
LEFT JOIN Room_Assignments r_a ON r_a.RoomId = r.RoomId
LEFT JOIN Departments d ON d.DepartmentId = r_a.DepartmentId
ORDER BY r.RoomName, d.DepartmentName;

-- Report all Users, the Departments they are assigned to, and Rooms to which they are assigned
SELECT u.UserName, d.DepartmentName, r.RoomName
FROM Users u
LEFT JOIN Departments d ON d.DepartmentId = u.DepartmentId
LEFT JOIN Room_Assignments r_a ON r_a.DepartmentId = d.DepartmentId
LEFT JOIN Rooms r ON r.RoomId = r_a.RoomId
ORDER BY u.UserName, d.DepartmentName, r.RoomName
