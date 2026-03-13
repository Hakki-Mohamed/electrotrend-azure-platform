DROP TABLE IF EXISTS dbo.Dim_Geography;

CREATE TABLE dbo.Dim_Geography (
    geography_id   INT NOT NULL PRIMARY KEY,
    city           VARCHAR(100),
    country        VARCHAR(50),
    region         VARCHAR(50)
);

INSERT INTO dbo.Dim_Geography (geography_id, city, country, region)
SELECT 
    ROW_NUMBER() OVER (ORDER BY country, city) AS geography_id,
    city,
    country,
    region
FROM (
    SELECT DISTINCT city, country, region
    FROM dbo.stg_sales
    WHERE country IS NOT NULL 
    AND TRIM(country) != ''
) AS unique_geo;
