DROP TABLE IF EXISTS dbo.Dim_Product;

CREATE TABLE dbo.Dim_Product (
    product_id     INT NOT NULL PRIMARY KEY,
    product_name   VARCHAR(100),
    category       VARCHAR(50),
    storage        VARCHAR(50),
    color          VARCHAR(50)
);

INSERT INTO dbo.Dim_Product (product_id, product_name, category, storage, color)
SELECT 
    ROW_NUMBER() OVER (ORDER BY product_name) AS product_id,
    product_name,
    category,
    storage,
    color
FROM (
    SELECT DISTINCT product_name, category, storage, color
    FROM dbo.stg_sales
    WHERE product_name IS NOT NULL 
    AND TRIM(product_name) != ''
) AS unique_products;