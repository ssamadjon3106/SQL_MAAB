create DATABASE class5;
use class5;

drop table if EXISTS sales
create TABLE sales(
    sales_id INT PRIMARY key,
    product_name VARCHAR(10),
    date_sold int
);

INSERT into sales
VALUES
    (1, 'Banana', 2020), 
    (2, 'Banana', 2021),
    (3, 'Apple', 2020);


SELECT product_name from sales
group by product_name
HAVING max(date_sold)=min(date_sold) and max(date_sold)=2020;





---------------------------------------------------------------------------
--Window functions
---------------------------------------------------------------------------



-- Create the table
drop table if EXISTS sales1;
CREATE TABLE sales1 (
    id INT PRIMARY KEY IDENTITY(1,1),
    sales_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

-- Insert sample data
INSERT INTO sales1 (sales_date, amount) VALUES
('2025-06-01', 150.50),
('2025-06-02', 89.99),
('2025-06-03', 230.00),
('2025-06-04', 120.75),
('2025-06-04', 120.75),
('2025-06-05', 310.20);

SELECT *, 
ROW_NUMBER() OVER(order by amount asc) as rn_rank,
dense_rank() OVER(order by amount asc) as dn_rank,
rank() OVER(order by amount asc) as rank

from sales1
ORDER by id;

SELECT *, sum(amount) OVER()
from sales1;





-- Create the table\
drop table if EXISTS employees
CREATE TABLE employees (
    id INT PRIMARY KEY IDENTITY(1,1),
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert 10 sample rows
INSERT INTO employees (department, salary) VALUES
('HR', 45000.00),
('IT', 72000.00),
('Finance', 68000.00),
('Marketing', 52000.00),
('Sales', 60000.00),
('Operations', 58000.00),
('IT', 75000.00),
('HR', 47000.00),
('Finance', 69000.00),
('Marketing', 53000.00);

SELECT *, sum(salary) over(partition by department)
from employees


SELECT * from (
SELECT *, DENSE_RANK() over(partition by department order by salary) as rank 
from employees) t 
order by department, rank;

SELECT * ,
    sum(salary) over(order by department rows between  1 preceding and current row),
     sum(salary) over(order by department rows between  1 preceding and 1 following),
      sum(salary) over(order by department rows between  unbounded preceding and current row),
       sum(salary) over(order by department rows between  1 preceding and unbounded following)

    from employees



CREATE TABLE sales2 (
    id INT PRIMARY KEY,
    sales_date DATE,
    amount DECIMAL(10, 2)
);
INSERT INTO sales2 (id, sales_date, amount) VALUES
(1, '2025-06-01', 100.00),
(2, '2025-06-02', 150.50),
(3, '2025-06-03', 200.00),
(4, '2025-06-04', 250.75),
(5, '2025-06-05', 300.00),
(6, '2025-06-06', 175.25),
(7, '2025-06-07', 225.00),
(8, '2025-06-08', 199.99),
(9, '2025-06-09', 350.00),
(10, '2025-06-10', 400.00);


SELECT*, 
CAST(amount/ sum(amount) over() * 100 as decimal(10, 2)) as percentage

 from sales2;

