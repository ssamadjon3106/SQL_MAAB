--===========================
-- Even/Odd Check
--Stores procedure
--===========================
DECLARE @num INT = 10;

IF @num % 2 = 0
BEGIN
    PRINT 'Juft Son'
END
ELSE
BEGIN
    PRINT 'Toq Son'
END

--===========================
-- Print numbers 0 to 9
--===========================
DECLARE @num1 INT = 0;
WHILE @num1 < 10
BEGIN
    SELECT @num1 AS Number;
    SET @num1 = @num1 + 1;
END

--===========================
-- Drop and Create Stored Procedure
--===========================
DROP PROCEDURE IF EXISTS generate_numbers;
GO

CREATE PROC generate_numbers @auto INT
AS 
BEGIN
    DECLARE @n INT = 0;
    DECLARE @numbers TABLE (n INT);

    WHILE @n < @auto
    BEGIN
        INSERT INTO @numbers SELECT @n;
        SET @n = @n + 1;
    END

    SELECT n FROM @numbers;
END;
GO

--===========================
-- Create Employee Table
--===========================
drop table if EXISTS emp
CREATE TABLE emp (
    id INT,
    name VARCHAR(40)
);

INSERT INTO emp
VALUES 
(1, 'name1'),
(2, 'name2'),
(3, 'name3'),
(4, 'name4'),
(5, 'name5');

--===========================
-- Insert SP output into table variable
--===========================
DECLARE @t TABLE (
    id INT
);

INSERT INTO @t
EXEC generate_numbers 100;

--===========================
-- LEFT JOIN to Find Missing IDs
--===========================
SELECT t.id
FROM @t t
LEFT JOIN emp e ON e.id = t.id
WHERE e.id IS NULL;





--Dynamic table -less secure
CREATE TABLE numbers (
    number INT
);

DECLARE @i INT = 1;

WHILE @i <= 23
BEGIN
    INSERT INTO numbers (number) VALUES (@i);
    SET @i = @i + 1;
END;

-- View the result
SELECT * FROM numbers;


CREATE PROCEDURE sp_select_all 
    @table_name VARCHAR(255), 
    @top_k INT 
AS
BEGIN
    DECLARE @sql_cmd VARCHAR(MAX);
    SET @sql_cmd = 'SELECT TOP ' + CAST(@top_k AS VARCHAR) + ' * FROM ' + QUOTENAME(@table_name);
    
    EXEC(@sql_cmd);
END;
GO

-- Execute the procedure
EXECUTE sp_select_all @table_name = 'numbers', @top_k = 3;
