-- Create database 
CREATE DATABASE assi;
USE assi; 

-- Create table employees & insert data 
CREATE TABLE IF NOT EXISTS employees (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
nam VARCHAR(50),
department VARCHAR(50),
salary INT, 
Hired_on DATE 
); 
-- DROP TABLE employees;
INSERT INTO employees (nam, department, salary, hired_on) 
VALUES ('ALICE', 'HR', 55000, '2020-01-01'),
('Bob', 'marketing', 65000, '2020-02-01'), 
('charlie', 'IT', 75000, '2020-03-01'),
('dave', 'sales', 80000, '2020-04-01'), 
('eve', 'HR', 60000, '2020-05-01');

-- create table sales & insert into it 
CREATE TABLE IF NOT EXISTS sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    product VARCHAR(50), 
    sales_date DATE, 
    sales_amount INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
-- DROP TABLE sales;
INSERT INTO sales (employee_id, product, sales_date, sales_amount) 
VALUES (5, 'widget', '2020-06-01', 1000),
(1, 'gadget', '2020-07-01', 2000),
(1, 'widget', '2020-08-01', 3000), 
(2, 'gadget', '2020-09-01', 4000), 
(2, 'thing', '2020-10-01', 5000),
(2, 'thing', '2020-11-01', 6000),
(3, 'widget', '2020-12-01', 7000), 
(4, 'gadget', '2021-01-01', 8000), 
(4, 'thing', '2020-02-01', 9000),
(4, 'widget', '2020-03-01', 10000);

-- Retrieve * from employees salary > 65000
SELECT * FROM employees WHERE salary > '65000';

-- Retrieve name and department sorted salary in des order 
SELECT nam, department, salary FROM employees WHERE salary ORDER BY salary DESC;

-- Retrieve product & total sales for each product in sales table sorted by total sales dec
SELECT product, SUM(sales_amount) AS total_sales 
FROM sales 
GROUP BY product
ORDER BY total_sales DESC;

-- Retrieve name & total sales for all employees in marketing department from employees and sales tables 
SELECT employees.nam, SUM(sales.sales_amount) AS total_sales 
FROM employees 
INNER JOIN sales ON employees.employee_id = sales.employee_id
WHERE employees.department = 'marketing'
GROUP BY employees.nam;

-- Retrieve name, product & sales date for all sales in sales table where sales amount > 2500
SELECT employees.nam, sales.product, sales.sales_date, sales.sales_amount
FROM sales 
INNER JOIN employees ON employees.employee_id = sales.employee_id
WHERE sales.sales_amount > 2500;

--  Retrieve name, product & sales amount for all sales in sales table occured between june and december 2020
SELECT employees.nam, sales.product, sales.sales_amount, sales.sales_date
FROM sales 
INNER JOIN employees ON employees.employee_id = sales.employee_id
WHERE sales.sales_date BETWEEN '2020-06-01' AND '2020-12-01';

-- Retrieve name, product & sales amount for all sales with the highest sale in sales table along with employee name from employee table 
SELECT employees.nam, sales.product, sales.sales_amount
FROM sales
INNER JOIN employees ON employees.employee_id = sales.employee_id
WHERE sales.sales_amount = (SELECT MAX(sales_amount) FROM sales);

-- retrieve name & manager of all employees in employees table showing the name of the manager from the employees table as well 
ALTER TABLE employees
ADD COLUMN manager_id INT,
ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

UPDATE employees SET manager_id = 1 WHERE employee_id = 2;
UPDATE employees SET manager_id = 1 WHERE employee_id = 3;
UPDATE employees SET manager_id = 2 WHERE employee_id = 4;

SELECT e1.nam AS employee_name, e2.nam AS manager_name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- Retrieve the name and the number of employees for all managers in the employees table who have at least one employee 
SELECT managers.nam AS manager_name, COUNT(employees.employee_id) AS num_employees
FROM employees employees
JOIN employees managers ON employees.manager_id = managers.employee_id
GROUP BY managers.employee_id
HAVING COUNT(employees.employee_id) > 0;

-- Retrieve the name of all employees in the employees table who don't have a manager 
SELECT nam AS employee_name
FROM employees
WHERE manager_id IS NULL;

-- Retrieve the name & total sales for all employees in the employees table who have made more than 5000 in sales in past year (From current date)
SELECT employees.nam, SUM(sales.sales_amount) AS total_sales
FROM employees
INNER JOIN sales ON employees.employee_id = sales.employee_id
WHERE sales.sales_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY employees.nam
HAVING total_sales > 5000;
