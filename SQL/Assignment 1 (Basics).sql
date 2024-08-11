-- Create database 
CREATE DATABASE IF NOT EXISTS First_db;
USE First_db;

-- create table employee
CREATE TABLE employee (
Name VARCHAR(30),
department CHAR(30),
Salary INT,
Age INT
); 

-- Insert data into employee 
INSERT INTO employee (Name, department, salary, Age) VALUES ('Hagar', 'data analyst', 15000, 30);
INSERT INTO employee (Name, department, salary, Age) VALUES ('salma', 'HR', 15000, 30);
INSERT INTO employee (Name, department, salary, Age) VALUES ('salma', 'HR', 15000, 30);

-- Show the data 
SELECT * FROM Employee; 
SELECT DISTINCT * FROM Employee;

-- DROP TABLE IF EXISTS Employee
DROP TABLE IF EXISTS Employee;

-- Delete Data only from Table 
TRUNCATE TABLE Employee;
SELECT * FROM Employee; 

-- Create table and Use constraints 
CREATE TABLE IF NOT EXISTS co_employee (
ID INT PRIMARY KEY auto_increment,
Name VARCHAR(255) NOT NULL, 
Gender CHAR(1) NOT NULL, 
Contact_number varchar(255), 
age INT NOT NULL, 
Date_created TIMESTAMP NOT NULL DEFAULT NOW(),
Nationality VARCHAR(30) DEFAULT 'Egypt'
);

-- Insert data into the table 
INSERT INTO co_employee (Name, Gender, Contact_number, age) VALUE ('hagar' , 'F', 01121008119, 21);
INSERT INTO co_employee (Name, Gender, Contact_number, age) VALUE ('salma' , 'F', 01121008155, 21);

SELECT * FROM co_employee




