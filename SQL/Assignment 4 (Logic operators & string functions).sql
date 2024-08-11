-- CREATE DATABASE 
create database if not exists session;

-- USE DATABASE 
USE session;

-- CREATE TABLE 
CREATE TABLE IF NOT EXISTS employee (
	id int primary key auto_increment,
    nam VARCHAR(100) NOT NULL CHECK (nam <> " "),
    position VARCHAR(100) NOT NULL CHECK (position <> " "),
    salary DECIMAL(10, 2)  CHECK (salary >= 1000 AND salary <= 20000),
    hire_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL unique check (email regexp '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$')
    );

-- INSERT DATA INTO TABLE 
INSERT INTO employee (nam, position, salary, hire_date, email) VALUES
('  Ahmed Ali', 'Manager', 15000.00, '2020-01-15', 'ahmed.ali@example.com'),
('Fatima Hassan ', 'Assistant', 12000.00, '2021-03-20', 'fatima.hassan@example.com'),
('Mohammed Ahmed ', 'Analyst', 14000.00, '2019-07-10', 'mohammed.ahmed@example.com'),
('Layla Ibrahim', 'Developer', 14000.00, '2022-05-05', 'layla.ibrahim@example.com'),
('Omar Khalid', 'Designer', 11000.00, '2020-11-30', 'omar.khalid@example.com'),
('Amina Salim', 'Technician', 10500.00, '2021-09-12', 'amina.salim@example.com'),
('Youssef Tarek', 'Supervisor', null ,'2018-04-25', 'youssef.tarek@example.com'),
('Nour Mahmoud', 'Coordinator', 12500.00, '2022-02-14', 'nour.mahmoud@example.com'),
('Hassan Ziad', 'Engineer', 13500.00, '2019-12-01', 'hassan.ziade@xample.com'),
('Sara Faisal', 'Consultant', 14500.00, '2020-06-18', 'sara.faisal@example.com');

-- select all where analysts & salary above 130000.00
SELECT * 
FROM employee 
WHERE position = 'analyst' AND salary > 13000.00;

-- select all where position is not IT
SELECT * 
FROM employee 
WHERE NOT position = 'IT'

-- select all where employee is engineer and salary > 12000 or designer and salary is not equal 70000
SELECT * 
FROM employee 
WHERE ( position = 'engineer' AND salary > 12000)
OR (position = 'designer' AND NOT salary =70000);

-- select all where salary is between 12000 and 14000 
SELECT * 
FROM employee 
WHERE salary BETWEEN 12000 AND 14000;

-- Select all where employee's hire date between jan and dec
SELECT * 
FROM employee 
WHERE hire_date BETWEEN '2020-01-01' AND '2021-12-31';

-- select all where employee's hire date is between jan and dec and salary > 30000
SELECT * 
FROM employee 
WHERE (hire_date BETWEEN '2020-01-01' AND '2021-12-31') AND salary > 13000;

-- select all where email starts with a and position is manager 
SELECT * 
FROM employee 
WHERE email REGEXP '^a' AND position = 'manager';

-- String functions 
SELECT UPPER(nam) FROM employee;
SELECT LOWER(nam) FROM employee;
SELECT LENGTH(nam) AS length_name FROM employee; 
SELECT SUBSTRING(email, 1, 5) AS email_prefix FROM employee; 
SELECT REPLACE (email, 'example.com', 'company.com') AS updated_email FROM employee; 
SELECT NOW() AS current_date_time FROM employee;
SELECT TRIM(nam) AS trimmed_first_name FROM employee; 


