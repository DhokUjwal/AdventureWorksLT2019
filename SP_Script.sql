USE gold_db
GO

CREATE OR ALTER PROC CrealeSQLServerlessView_gold @ViewName nvarchar(100)
AS
BEGIN

DECLARE @statement VARCHAR(MAX)
SET @statement = N'CREATE OR ALTER VIEW ' + @viewName + ' AS
SELECT *
FROM
    OPENROWSET(
    BULK ''https://data2lake.dfs.core.windows.net/gold/SalesLT/' + @viewName + '/'',
    FORMAT=''DELTA''
    ) as [result]
'
EXEC (@statement)

END 
GO
    