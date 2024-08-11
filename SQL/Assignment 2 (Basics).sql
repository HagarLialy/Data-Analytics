
-- Create database 
CREATE DATABASE if not exists Company;
USE Company;

-- CREATE table for employees 
CREATE TABLE if not exists employees (
 Employe_ID INT AUTO_INCREMENT PRIMARY KEY, 
 First_name VARCHAR(50) NOT NULL,
 Last_name VARCHAR(50) NOT NULL,
 Email VARCHAR(100) UNIQUE NOT NULL CHECK(Email regexp '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),
 Phone_number VARCHAR(15), 
 Hire_date DATE NOT NULL,
 Job_title VARCHAR(50) NOT NULL,
 Salary DECIMAL(10,2) NOT NULL 
 );
 
 -- Insert data into database 
 INSERT INTO employees (First_name, Last_name, Email, phone_number, Hire_date, Job_title, salary)
 VALUES ('Ahmed', 'mohammed', 'hagar.lialy2016@gmail.com', '01121008119', '2015-09-13', 'Data analyst', '30000.02'),
  ('salma', 'ali', 'ha.lialy2016@gmail.com', '01121008111', '2015-09-14', 'Data', '30054.02');
 
 -- Update table to increase data analyst salary * 1.5
  UPDATE employees 
  SET Salary = Salary * 1.50
  Where Job_title = 'Data analyst';
  SET SQL_SAFE_UPDATES =0;
  
  -- Update table to increase data analyst salary * 1.5 and change name to engineer
  UPDATE employees
  SET Job_title = 'engineer', Salary = salary * 1.5
  WHERE Job_title = 'Data';
  
   -- alter table to add dep Id column 
  ALTER TABLE employees 
  ADD column dapartment_ID VARCHAR(20);
  
  -- alter table to rename column 
  ALTER TABLE employees 
  RENAME column phone_number to phone_numberr;
  
  -- alter table to add constraints 
ALTER TABLE employees
ADD CONSTRAINT pk_employee_id PRIMARY KEY (employee_id);

