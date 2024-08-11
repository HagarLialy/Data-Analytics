-- Create database companyy
Create database Companyy;

-- Use database 
USE Companyy;

-- create table employee
CREATE TABLE IF NOT EXISTS employee (
	id int primary key auto_increment,
    nam VARCHAR(100) NOT NULL CHECK (nam <> " "),
    position VARCHAR(100) NOT NULL CHECK (position <> " "),
    salary DECIMAL(10, 2)  CHECK (salary >= 1000 AND salary <= 20000),
    hire_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL unique check (email regexp '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$')
    );

-- Insert data into the table 
INSERT INTO employee (nam, position, salary, hire_date, email) VALUES
('Ahmed Ali', 'Manager', 1000.00, '2020-01-15', 'ahmed.ali@example.com'),
('Fatima Hassan', 'Assistant', 12000.00, '2021-03-20', 'fatima.hassan@example.com'),
('Mohammed Ahmed', 'Analyst', null, '2019-07-10', 'mohammed.ahmed@example.com'),
('Sara Faisal', 'Developer', 14000.00, '2022-05-05', 'layla.ibrahim@example.com'),
('Omar Khalid', 'Designer', 11000.00, '2020-11-30', 'omar.khalid@example.com'),
('Amina Salim', 'Technician', 10500.00, '2021-09-12', 'amina.salim@example.com'),
('Youssef Tarek', 'Supervisor', null ,'2018-04-25', 'youssef.tarek@example.com'),
('Nour Mahmoud', 'Coordinator', 12500.00, '2022-02-14', 'nour.mahmoud@example.com'),
('Hassan Ziad', 'Engineer', 13500.00, '2019-12-01', 'hassan.ziade@xample.com'),
('Sara Faisal', 'Consultant', 20000.00, '2020-06-18', 'sara.faisal@example.com');

-- To identify & delete null values 
SELECT * FROM employee WHERE salary IS NULL ;
DELETE FROM employee WHERE salary IS NULL ;
SET sql_safe_updates=0;

-- To identify if there are duplicates in name column 
SELECT nam, COUNT(*)
FROM employee
GROUP BY nam
HAVING COUNT(*) > 1;

SELECT *
FROM employee
WHERE nam IN (
    SELECT nam
    FROM employee
    GROUP BY nam
    HAVING COUNT(*) > 1
);

-- To Detect outliers using IQR 
-- Calculate Q1
Set @Q1 = (SELECT MAX(salary) AS "Median"
FROM (
 SELECT salary,
 NTILE(4) OVER(ORDER BY salary) AS Quartile 
 FROM employee
) x
WHERE Quartile = 1);

-- Calculate Q3
Set @Q3 = (SELECT MAX(salary) AS "Median"
FROM (
 SELECT salary,
 NTILE(4) OVER(ORDER BY salary) AS Quartile 
 FROM employee
) x
WHERE Quartile = 3);

-- Calculate IqR
 Set @IoR = (@Q3 - @Q1);

-- Calculate outliers 
select  @Q1, @Q3, @IoR, @Q1 - 1.5* @IoR, @Q3 + 1.5* @IoR
from employee;

-- Show outliers 
SELECT *
FROM employee
WHERE salary <= (@Q1 - 1.5 * @IoR)
   OR salary >= (@Q3 + 1.5 * @IoR);
   
-- To detect outliers using imperical rule    
select *  from employee where salary > (select avg(salary) +3 * stddev(salary))
or salary < (select avg(salary) - 3 * stddev(salary)) ;