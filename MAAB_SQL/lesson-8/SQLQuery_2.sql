--===================================
-- Subquery
--====================================

SELECT fname, lname
from 
(SELECT [value]  as fname,
    ROW_NUMBER() over(order by (select null)) as rn
from  string_split('John,Macintosh,Borj,Saman', ',')
) as f
join (
SELECT [value] as lname, 
    ROW_NUMBER() over(order by (select null)) as rn
from string_split('Bob,Smith,Adams,Sayfullayev', ',')) as l 
    on l.rn=f.rn;



-- Puzzle2


SELECT ordinal INTO numbers 
FROM string_split(REPLICATE(',', 9), ',', 1)
