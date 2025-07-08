-- Create the table
CREATE TABLE employee_data (
    dep_id INT,
    emp_id INT,
    department VARCHAR(50),
    employee VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert 100 sample records
INSERT INTO employee_data (dep_id, emp_id, department, employee, salary) VALUES
(1, 101, 'Sales', 'John Smith', 55000.00),
(1, 102, 'Sales', 'Emily Johnson', 58000.00),
(1, 103, 'Sales', 'Michael Williams', 52000.00),
(1, 104, 'Sales', 'Sarah Brown', 61000.00),
(1, 105, 'Sales', 'David Jones', 54000.00),
(2, 201, 'Marketing', 'Jennifer Garcia', 65000.00),
(2, 202, 'Marketing', 'Robert Miller', 72000.00),
(2, 203, 'Marketing', 'Lisa Davis', 68000.00),
(2, 204, 'Marketing', 'Thomas Rodriguez', 71000.00),
(2, 205, 'Marketing', 'Patricia Wilson', 69000.00),
(3, 301, 'IT', 'James Martinez', 85000.00),
(3, 302, 'IT', 'Linda Anderson', 92000.00),
(3, 303, 'IT', 'Christopher Taylor', 88000.00),
(3, 304, 'IT', 'Barbara Thomas', 95000.00),
(3, 305, 'IT', 'Daniel Hernandez', 87000.00),
(4, 401, 'Finance', 'Paul Moore', 75000.00),
(4, 402, 'Finance', 'Karen Martin', 82000.00),
(4, 403, 'Finance', 'Mark Jackson', 78000.00),
(4, 404, 'Finance', 'Nancy Lee', 81000.00),
(4, 405, 'Finance', 'Kevin Perez', 76000.00),
(5, 501, 'HR', 'Jessica Thompson', 60000.00),
(5, 502, 'HR', 'Richard White', 65000.00),
(5, 503, 'HR', 'Susan Harris', 62000.00),
(5, 504, 'HR', 'Joseph Clark', 63000.00),
(5, 505, 'HR', 'Margaret Lewis', 61000.00),
(6, 601, 'Operations', 'Charles Robinson', 70000.00),
(6, 602, 'Operations', 'Dorothy Walker', 72000.00),
(6, 603, 'Operations', 'Matthew Young', 68000.00),
(6, 604, 'Operations', 'Deborah Allen', 71000.00),
(6, 605, 'Operations', 'Donald King', 69000.00),
(7, 701, 'R&D', 'George Wright', 90000.00),
(7, 702, 'R&D', 'Donna Scott', 95000.00),
(7, 703, 'R&D', 'Edward Green', 92000.00),
(7, 704, 'R&D', 'Ruth Adams', 98000.00),
(7, 705, 'R&D', 'Steven Baker', 91000.00),
(8, 801, 'Customer Service', 'Sharon Gonzalez', 48000.00),
(8, 802, 'Customer Service', 'Brian Nelson', 52000.00),
(8, 803, 'Customer Service', 'Michelle Carter', 50000.00),
(8, 804, 'Customer Service', 'Ronald Mitchell', 51000.00),
(8, 805, 'Customer Service', 'Laura Perez', 49000.00),
(9, 901, 'Legal', 'Timothy Roberts', 110000.00),
(9, 902, 'Legal', 'Amy Turner', 115000.00),
(9, 903, 'Legal', 'Jason Phillips', 112000.00),
(9, 904, 'Legal', 'Cynthia Campbell', 118000.00),
(9, 905, 'Legal', 'Jeffrey Parker', 113000.00),
(10, 1001, 'Administration', 'Angela Evans', 55000.00),
(10, 1002, 'Administration', 'Ryan Edwards', 58000.00),
(10, 1003, 'Administration', 'Brenda Collins', 53000.00),
(10, 1004, 'Administration', 'Gary Stewart', 56000.00),
(10, 1005, 'Administration', 'Pamela Sanchez', 54000.00),
(1, 106, 'Sales', 'Joshua Morris', 57000.00),
(1, 107, 'Sales', 'Heather Rogers', 59000.00),
(1, 108, 'Sales', 'Andrew Reed', 56000.00),
(1, 109, 'Sales', 'Melissa Cook', 62000.00),
(1, 110, 'Sales', 'Eric Morgan', 58000.00),
(2, 206, 'Marketing', 'Rachel Bell', 70000.00),
(2, 207, 'Marketing', 'Nicholas Murphy', 73000.00),
(2, 208, 'Marketing', 'Amanda Rivera', 69000.00);



SELECT DISTINCT top 1 salary from 
(select distinct top 2  salary
from  employee_data
where dep_id=2
ORDER by salary desc) as t1
order by salary


SELECT 
    e.dep_id,
    e.department,
    MAX(e.salary) AS second_highest_salary
FROM 
    employee_data e
WHERE 
    e.salary NOT IN (
        SELECT MAX(salary)
        FROM employee_data e2
        WHERE e2.dep_id = e.dep_id
    )
GROUP BY 
    e.dep_id, e.department
ORDER BY 
    e.dep_id;


declare @n int =3    


DECLARE @word VARCHAR(50)='aaaaaaabbbbbbcccccc';

WITH cte(n, chars) as (
    SELECT 1, SUBSTRING(@word ,1,1 )
    UNION all
    select n+1, SUBSTRING(@word , n+1, 1)
    from cte 
    where n< len(@word)
)

select chars, COUNT(*) from cte
Group by chars;

