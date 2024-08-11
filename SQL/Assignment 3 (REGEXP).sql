-- Create database 
CREATE DATABASE company;

-- Use database 
USE Company;

-- USE REGEXP for email, website & phone number 
CREATE Table if not exists Company(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
position VARCHAR(50) NOT NULL, 
Salary DECIMAL(10,1) NOT NULL CHECK (salary>= 20000 AND salary<= 100000), 
hire_date DATE NOT NULL, 
email VARCHAR(100) UNIQUE NOT NULL CHECK(Email regexp '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),
website VARCHAR(255) CHECK (website REGEXP '^(http://|https://|www\\.)[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),
phone_number INT CHECK (phone_number REGEXP '^([0-9]{8}$ | ^[0-9]{7-8}$')
);