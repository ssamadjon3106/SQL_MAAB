CREATE DATABASE class7;
use class7;


create TABLE people(
    ID int ,
    gender VARCHAR(10) 
);

insert into people
VALUES (1, 'M'),
(2, 'M'),
(3, 'M'),
(4, 'F'),
(5, 'M'),
(6, 'F'),
(7, 'F');

select *
from people
 order by ROW_NUMBER() over(PARTITION BY gender ORDER BY ID) , gender ASC




CREATE table department(
    id int PRIMARY KEY,
    name VARCHAR(10)
);

create table employee(
    id int PRIMARY key, 
    name VARCHAR(10),
    salary INT,
    department INT,
    manager_id int
);

insert into department
VALUES (1, 'IT'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'HR');

insert into employee
VALUES (1, 'Mardon', 5000,1,  NULL),
(2, 'Adam', 3000, 2, 1),
(3, 'Bob', 5000, 1, 2),
(4, 'Mardon', 5000, 3, 2);

select * from employee


SELECT m.name, e.name
 from employee as e
join employee as m 
   ON e.manager_id=m.id


SELECT e.name emp_name,
        e.department,
        m.name mng_name,
        m.department
        
from employee as e
join employee as m 
   ON e.manager_id=m.id and e.department <> m.department;

SELECT e.name emp_name,
        d.name dept_name,
        m.name mng_name,
        d2.name
from employee as e
join employee as m 
   ON e.manager_id=m.id and e.department <> m.department
JOIN department as d 
    on d.id = e.department
JOIN department d2 
    on d2.id=m.department;     


DROP table if EXISTS numbers

SELECT 
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS value
INTO numbers
FROM string_split(REPLICATE(',', 19), ',');

select * from numbers


SELECT 
    n1.[value] ,n2.[value],
    case 
        when n1.[value] % n2.[value] = 0 then 1
        else 0 end
from numbers n1
join numbers n2
    on n1.value>=n2.[value]



DROP table if EXISTS num

SELECT 
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS value
INTO num
FROM string_split(REPLICATE(',', 10), ',');

select * from num

SELECT 
    n1.[value] ,n2.[value],
    case 
        when n1.[value] % n2.[value] = 0 then 1
        else 0 end
from num n1
join num n2
    on n1.value>=n2.[value]