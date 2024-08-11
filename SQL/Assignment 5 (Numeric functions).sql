-- create database 
CREATE database Company_x;

-- use database 
USE company_x;

-- create table & insert values 
CREATE TABLE sales ( 
Product_name VARCHAR(100), 
category VARCHAR (100), 
region VARCHAR (100), 
sale_date DATE, 
Amount INT 
);
INSERT INTO sales (product_name, category, region, sale_date, amount) VALUES
('Laptop', 'Electronics', 'North', '2023-01-01', 1200.00),
('Smartphone', 'Electronics', 'South', '2023-01-02', 800.00),
('Tablet', 'Electronics', 'East', '2023-01-03', 600.00),
('Desktop', 'Electronics', 'West', '2023-01-04', 1500.00),
('Monitor', 'Electronics', 'North', '2023-01-05', 300.00),
('Keyboard', 'Electronics', 'South', '2023-01-06', 100.00),
('Mouse', 'Electronics', 'East', '2023-01-07', 50.00),
('Printer', 'Electronics', 'West', '2023-01-08', 200.00),
('Headphones', 'Electronics', 'North', '2023-01-09', 150.00),
('Speakers', 'Electronics', 'South', '2023-01-10', 250.00),
('Laptop', 'Electronics', 'North', '2023-01-11', 1200.00),
('Smartphone', 'Electronics', 'South', '2023-01-12', 800.00),
('Tablet', 'Electronics', 'East', '2023-01-13', 600.00),
('Desktop', 'Electronics', 'West', '2023-01-14', 1500.00),
('Monitor', 'Electronics', 'North', '2023-01-15', 300.00),
('Keyboard', 'Electronics', 'South', '2023-01-16', 100.00),
('Mouse', 'Electronics', 'East', '2023-01-17', 50.00),
('Printer', 'Electronics', 'West', '2023-01-18', 200.00),
('Headphones', 'Electronics', 'North', '2023-01-19', 150.00),
('Cooker', 'Kitche', 'North', '2023-01-19', 150.00),
('car', 'street', 'North', '2023-01-19', 150.00),
('phone', 'house', 'North', '2023-01-19', 150.00),
('Speakers', 'Electronics', 'South', '2023-01-20', 250.00);

-- Total sales amount by category 
SELECT category, SUM(amount) AS total_sales FROM sales GROUP BY category; 

-- AVG amount by region 
SELECT region, AVG(amount) AS AVG_sales FROM sales GROUP BY region;

-- count sales by product 
SELECT product_name, count(amount) AS count_roduct FROM sales GROUP BY product_name;

-- Minumm sales by category 
SELECT category, MIN(amount) AS min_sales FROM sales GROUP BY category; 

-- Max sales by region 
SELECT region, MAX(amount) AS max_sales FROM sales GROUP BY region; 

SELECT category, SUM(amount) AS total_sales 
FROM sales 
WHERE sale_date >= '2023-01-01' AND sale_date < '2024-01-01'
GROUP BY category 
HAVING SUM(amount) > 5000;
