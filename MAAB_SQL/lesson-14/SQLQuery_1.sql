--PIVOT is used to transform ROWS TO COLUMNS
-- Sample data in a temporary table
CREATE TABLE Sales (
    Salesperson VARCHAR(50),
    Month VARCHAR(10),
    Amount INT
);

INSERT INTO Sales (Salesperson, Month, Amount)
VALUES
('Alice', 'Jan', 1000),
('Alice', 'Feb', 1200),
('Bob', 'Jan', 900),
('Bob', 'Feb', 1100),
('Charlie', 'Jan', 1150),
('Charlie', 'Feb', 1300);

-- Pivot Query
SELECT *
FROM (
    SELECT Salesperson, Month, Amount
    FROM Sales
) AS SourceTable
PIVOT (
    SUM(Amount)
    FOR Month IN ([Jan], [Feb])
) AS PivotTable;


--UNPIVOT
-- Step 1: Create and populate sample table
CREATE TABLE MonthlySales (
    Salesperson VARCHAR(50),
    Jan INT,
    Feb INT,
    Mar INT
);

INSERT INTO MonthlySales (Salesperson, Jan, Feb, Mar)
VALUES
('Alice', 1000, 1200, 1500),
('Bob', 900, 1100, 1300);

-- Step 2: UNPIVOT the monthly columns into rows
SELECT Salesperson, Month, Amount
FROM
    (SELECT Salesperson, Jan, Feb, Mar FROM MonthlySales) AS SourceTable
UNPIVOT
    (Amount FOR Month IN (Jan, Feb, Mar)) AS UnpivotedResult;









