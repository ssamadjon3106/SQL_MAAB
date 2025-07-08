CREATE TABLE [dbo].[TestMultipleZero]
(
    [A] [int] NULL,
    [B] [int] NULL,
    [C] [int] NULL,
    [D] [int] NULL
);
GO

INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

SELECT* from [dbo].[TestMultipleZero]
WHERE NOT ([A]=0 and [B]=0 and [C]=0 and [D]=0);


-------2---
drop table if EXISTS TestMax;
CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);
GO
 INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);
SELECT 
    Year1,
    (SELECT MAX(val)
     FROM (VALUES (Max1), (Max2), (Max3)) AS value_list(val)) AS MaxValue
FROM TestMax;


---------3----------

CREATE TABLE empBirth
(
    EmpId INT  IDENTITY(1,1) 
    ,EmpName VARCHAR(50) 
    ,BirthDate DATETIME 
);
 
INSERT INTO EmpBirth(EmpName,BirthDate)
SELECT 'Pawan' , '12/04/1983'
UNION ALL
SELECT 'Zuzu' , '11/28/1986'
UNION ALL
SELECT 'Parveen', '05/07/1977'
UNION ALL
SELECT 'Mahesh', '01/13/1983'
UNION ALL
SELECT'Ramesh', '05/09/1983';

SELECT * from EmpBirth WHERE MONTH(BirthDate)=5 and DAY(BirthDate) BETWEEN 7 and 15;


--------4-----------
DROP TABLE IF EXISTS letters;
CREATE TABLE letters (letter CHAR(1));

INSERT INTO letters
VALUES ('a'), ('a'), ('a'), 
       ('b'), ('c'), ('d'), ('e'), ('f');

WITH OrderedLetters AS (
    SELECT letter, 1 AS sortOrder FROM (VALUES ('b')) AS FirstLetter(letter)
    UNION ALL
    SELECT DISTINCT letter, 2 FROM letters WHERE letter <> 'b'
    UNION ALL
    SELECT letter, 3 FROM (VALUES ('b')) AS LastLetter(letter)
)
SELECT letter
FROM OrderedLetters
ORDER BY sortOrder, letter;


