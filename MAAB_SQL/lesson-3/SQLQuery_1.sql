CREATE DATABASE class3;
USE class3

CREATE TABLE info (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50)
);

INSERT INTO info (id, name, age, department) VALUES
(1, 'Alice', 25, 'HR'),
(2, 'Bob', 30, 'IT'),
(3, 'Charlie', 28, 'Finance'),
(4, 'David', 35, 'Marketing'),
(5, 'Eva', 22, 'Sales'),
(6, 'Frank', 40, 'HR'),
(7, 'Grace', 27, 'IT'),
(8, 'Henry', 32, 'Finance'),
(9, 'Ivy', 29, 'Marketing'),
(10, 'Jack', 31, 'Sales'),
(11, 'Kathy', 26, 'HR'),
(12, 'Liam', 33, 'IT'),
(13, 'Mona', 24, 'Finance'),
(14, 'Nick', 38, 'Marketing'),
(15, 'Olivia', 23, 'Sales'),
(16, 'Peter', 37, 'HR'),
(17, 'Quinn', 30, 'IT'),
(18, 'Rachel', 28, 'Finance'),
(19, 'Steve', 34, 'Marketing'),
(20, 'Tina', 29, 'Sales'),
(21, 'Uma', 25, 'HR'),
(22, 'Victor', 31, 'IT'),
(23, 'Wendy', 27, 'Finance'),
(24, 'Xander', 36, 'Marketing'),
(25, 'Yara', 22, 'Sales'),
(26, 'Zack', 30, 'HR'),
(27, 'Amy', 28, 'IT'),
(28, 'Brian', 33, 'Finance'),
(29, 'Cathy', 24, 'Marketing'),
(30, 'Derek', 37, 'Sales'),
(31, 'Elena', 26, 'HR'),
(32, 'Fred', 32, 'IT'),
(33, 'Gina', 29, 'Finance'),
(34, 'Hank', 35, 'Marketing'),
(35, 'Isabel', 23, 'Sales'),
(36, 'Jason', 31, 'HR'),
(37, 'Kara', 27, 'IT'),
(38, 'Leo', 34, 'Finance'),
(39, 'Maya', 25, 'Marketing'),
(40, 'Nate', 30, 'Sales'),
(41, 'Olga', 28, 'HR'),
(42, 'Paul', 33, 'IT'),
(43, 'Queen', 24, 'Finance'),
(44, 'Rob', 36, 'Marketing'),
(45, 'Sara', 22, 'Sales'),
(46, 'Tom', 30, 'HR'),
(47, 'Ursula', 29, 'IT'),
(48, 'Vince', 31, 'Finance'),
(49, 'Will', 27, 'Marketing'),
(50, 'Zoe', 34, 'Sales');



SELECT * from info
WHERE age >30 AND department = 'IT';


SELECT * from info
WHERE age >30 AND department != 'IT';


SELECT distinct department
from info;

SELECT * from info
WHERE department='IT' or department='Finance' or department='HR';

SELECT * from info
WHERE department<>'IT' AND department<>'Finance' AND  department<>'HR';


select * from info
WHERE id BETWEEN 23 AND 45;

drop table if EXISTS num;
CREATE TABLE num(
    id int);

insert into num
VALUES (1), (2), (3), (4), (5), (6);


SELECT*, NULL as col1
from num
WHERE not(id%2=0 or id%3=0)
UNION All
SELECT* , 'hi' as col1
from num
WHERE id%2=0 and not id%3=0
UNION All
SELECT* , 'bye' as col1
from num
WHERE id%3=0 and not id%2=0
UNION All
SELECT* , 'hi bye' as col1
from num
WHERE id%6=0
ORDER By id



-- GROUP BY

SELECT age, COUNT(*) as cnt
from info
GROUP By age
HAVING COUNT(*)>4;


SELECT *, 2*age as double_age
from info
WHERE age >25 and 2*age >50
ORDER BY age desc;


SELECT top 10 *, age *2  as 'big' from info;


---OFFSET AND FETCH----

/* 
ORDER BY <COLUMNS> [ASC, DESC]
OFFSET <n_rows ot skip> {ROW/ROWS}
FETCH {FIRST/NEXT} <n_rows to select> ONLY
*/

SELECT *, 2*age as double_age
from info
ORDER BY age
OFFSET 3 ROWS FETCH NEXT 14 ROWS ONLY;

select * from num;

SELECT id, 
    CASE
        WHEN id %6=0 THEN 'hi bye'
        WHEN id %2=0 THEN 'hi'
        WHEN id %3=0 THEN 'bye'
    END as col1
from num;    

---IIF()

SELECT id, 
        IIF(id%2=0, 'juft', 'toq')
    AS col1
FROM num;    