declare @dbName VARCHAR(255);
declare @sql NVARCHAR(MAX)='';
DECLARE @crfl char(2)=char(13)+char(10);

--Cursor to loop through all user databases

declare db_cursor CURSOR FOR
SELECT name 
from sys.databases
where name not in ('master', 'model', 'tempdb', 'msdb')
    and state_desc='ONLINE'

Open db_cursor;
FETCH next from db_cursor into @dbname;

while @@FETCH_STATUS=0
begin 
    set @sql+='
    BEGIN TRY
    SELECT 
    
        '''+@dbName+''' as DatabaseName,
        s.name as schema_name,
        t.name as table_name,
        c.name as column_name,
        ty.name as DataType
    FROM ['+@dbName+  '].sys.schemas s
    JOIN ['+@dbName+  '].sys.tables t on t.schema_id=s.schema_id
    JOIN ['+@dbName+  '].sys.columns c on c.object_id=t.object_id
    JOIN ['+@dbName+  '].sys.types ty on ty.user_type_id=c.user_type_id;
    END TRY
    BEGIN CATCH
        PRINT ''Error in database: ' + @dbName + ''';
        PRINT ERROR_MESSAGE();
    END CATCH';


    FETCH next from db_cursor into @dbname;
END
CLOSE db_cursor
set @sql=LEFT(@sql, LEN(@sql)-10);


EXEC sp_executesql @sql;



----============================
--2
--==============================


CREATE OR ALTER PROCEDURE sp_ListProceduresAndFunctions
    @DatabaseName SYSNAME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @dbName SYSNAME;
    DECLARE @sql NVARCHAR(MAX) = '';
    DECLARE @crlf CHAR(2) = CHAR(13) + CHAR(10);

    -- Case 1: Specific database provided
    IF @DatabaseName IS NOT NULL
    BEGIN
        SET @sql = '
        SELECT 
            ''' + @DatabaseName + ''' AS DatabaseName,
            SCHEMA_NAME(o.schema_id) AS SchemaName,
            o.name AS RoutineName,
            o.type_desc AS ObjectType,
            p.name AS ParameterName,
            t.name AS DataType,
            p.max_length AS MaxLength
        FROM [' + @DatabaseName + '].sys.objects o
        LEFT JOIN [' + @DatabaseName + '].sys.parameters p ON o.object_id = p.object_id
        LEFT JOIN [' + @DatabaseName + '].sys.types t ON p.user_type_id = t.user_type_id
        WHERE o.type IN (''P'', ''FN'', ''TF'', ''IF'');';

        EXEC sp_executesql @sql;
        RETURN;
    END

    -- Case 2: Loop through all user databases
    DECLARE db_cursor CURSOR FOR
    SELECT name
    FROM sys.databases
    WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb')
    AND state_desc = 'ONLINE';

    OPEN db_cursor;
    FETCH NEXT FROM db_cursor INTO @dbName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql += '
        BEGIN TRY
        SELECT 
            ''' + @dbName + ''' AS DatabaseName,
            SCHEMA_NAME(o.schema_id) AS SchemaName,
            o.name AS RoutineName,
            o.type_desc AS ObjectType,
            p.name AS ParameterName,
            t.name AS DataType,
            p.max_length AS MaxLength
        FROM [' + @dbName + '].sys.objects o
        LEFT JOIN [' + @dbName + '].sys.parameters p ON o.object_id = p.object_id
        LEFT JOIN [' + @dbName + '].sys.types t ON p.user_type_id = t.user_type_id
        WHERE o.type IN (''P'', ''FN'', ''TF'', ''IF'')' + @crlf + 'UNION ALL;
        END TRY
        BEGIN CATCH
            PRINT ''Error in database: ' + @dbName + ''';
            PRINT ERROR_MESSAGE();
        END CATCH';

        FETCH NEXT FROM db_cursor INTO @dbName;
    END

    CLOSE db_cursor;
    DEALLOCATE db_cursor;

    -- Remove final UNION ALL
    SET @sql = LEFT(@sql, LEN(@sql) - 10);

    -- Execute the complete SQL
    EXEC sp_executesql @sql;
END;
