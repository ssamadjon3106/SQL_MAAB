drop table if EXISTS pq
create TABLE pq(
    id int, 
    name VARCHAR(10),
    typed VARCHAR (10)
);

insert into pq
VALUES (2, 'S', NULL ),
        (2, NULL, 'Q');

SELECT * from pq;

SELECT id, 
    STRING_AGG(typed, ','),
    STRING_AGG(name, ',')
FROM pq
GROUP by id;   


SELECT id, 
    max(typed),
    max(name)
FROM pq
GROUP by id;  


SELECT * from generate_series(1, 100)



drop table if EXISTS t;
create TABLE t(
    id int, 
    salesyear int,
    currentquota int
);

insert into t
VALUES (1, 2000, 5000),
(1, 2005, 4000),
(1, 2001, 6000),
(1, 2002, 5000),
(1, 2004, 9000),
(1, 2003, 1000)

SELECT *,
LAG(currentquota) over(order by salesyear) as previous,
LEAD(currentquota) over(order by salesyear) as next
from t

drop table if EXISTS Employees;
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');


    SELECT * ,
        LAG(Salary) over(PARTITION by Department order by HireDate) as previous
    from Employees

--=================
-- FIRST_VALUE , LAST_VALUE
--======================
 SELECT * ,
    FIRST_VALUE(Name) over(PARTITION by Department order by HireDate desc) as first,
    LAST_VALUE(Name) over(PARTITION by Department order by HireDate rows between unbounded preceding and unbounded following) as last

from Employees



--===============
-- JOINS
--===============

-- INNER JOIN
--OUTER JOIN
-----RIGHT JOIN
-----LEFT JOIN
-----

DROP TABLE IF EXISTS DEPARTMENT
CREATE TABLE DEPARTMENT(
    ID INT PRIMARY KEY IDENTITY,
    NAME VARCHAR(10)
)
DROP TABLE IF EXISTS EMPLOYEE
CREATE TABLE EMPLOYEE(
    ID INT PRIMARY KEY IDENTITY,
    NAME VARCHAR(10),
    SALARY INT,
    DEPT_ID INT 
);

INSERT INTO DEPARTMENT(NAME)
VALUES('IT'), ('HR'), ('FINANCE'), ('MARKETING');

INSERT INTO EMPLOYEE
VALUES('JOHN', '3500', 1),
('BOB', '3500', 3),
('HEY', '3500', 4),
('SMITH', '3500', 2),
('ADAM', '3500', 3);

SELECT * FROM DEPARTMENT;
SELECT *FROM EMPLOYEE;



SELECT e.ID AS EMPID, 
    d.ID AS DEPID,
    e.DEPT_ID,
    d.NAME,
    e.ID

FROM EMPLOYEE as e --LEFT
JOIN DEPARTMENT as d--RIGHT
    ON e.DEPT_ID=d.ID;

   
   
   
    SELECT *

FROM EMPLOYEE as e --LEFT
JOIN DEPARTMENT as d--RIGHT
    ON e.DEPT_ID<>d.ID
order by e.id, e.NAME, e.SALARY, e.DEPT_ID;




    SELECT *
FROM EMPLOYEE as e --LEFT
right  JOIN DEPARTMENT as d--RIGHT
    ON e.DEPT_ID=d.ID;



