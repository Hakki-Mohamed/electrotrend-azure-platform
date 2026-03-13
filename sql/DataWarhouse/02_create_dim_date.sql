DROP TABLE IF EXISTS dbo.Dim_Date;

CREATE TABLE dbo.Dim_Date (
    date_id        INT NOT NULL PRIMARY KEY,
    full_date      DATE,
    day            INT,
    month          INT,
    month_name     VARCHAR(20),
    quarter        VARCHAR(10),
    year           INT,
    semester       VARCHAR(10)
);

INSERT INTO dbo.Dim_Date
SELECT DISTINCT
    CAST(REPLACE(CAST(TRY_CONVERT(DATE, sale_date) 
        AS VARCHAR), '-', '') AS INT) AS date_id,
    TRY_CONVERT(DATE, sale_date) AS full_date,
    DAY(TRY_CONVERT(DATE, sale_date)) AS day,
    MONTH(TRY_CONVERT(DATE, sale_date)) AS month,
    month AS month_name,
    quarter AS quarter,
    TRY_CAST(year AS INT) AS year,
    CASE 
        WHEN MONTH(TRY_CONVERT(DATE, sale_date)) <= 6 
        THEN 'S1' ELSE 'S2'
    END AS semester
FROM dbo.stg_sales
WHERE sale_date IS NOT NULL
AND TRY_CONVERT(DATE, sale_date) IS NOT NULL;