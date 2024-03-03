create view address
as
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://data2lake.dfs.core.windows.net/gold/SalesLT/Address/',
        FORMAT = 'DELTA'
    ) AS [result]
