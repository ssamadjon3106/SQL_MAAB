
CREATE TABLE Shipments (
    N INT PRIMARY KEY,
    Num INT
);

INSERT INTO Shipments (N, Num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 6),
(33, 7);


insert into Shipments 
VALUES (34 ,0), (35, 0), (36, 0), (37, 0), (38 ,0), (39, 0), (40,0);




WITH Ordered AS (
  SELECT Num,
         ROW_NUMBER() OVER (ORDER BY Num) AS rn,
         COUNT(*) OVER () AS total_rows
  FROM Shipments
),
MedianRows AS (
  SELECT Num, total_rows, rn
  FROM Ordered
  WHERE rn = total_rows / 2 
     OR rn = total_rows / 2 + 1
)
SELECT AVG(Num * 1.0) AS Median
FROM MedianRows;
