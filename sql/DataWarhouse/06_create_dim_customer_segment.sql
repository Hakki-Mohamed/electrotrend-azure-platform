DROP TABLE IF EXISTS dbo.Dim_CustomerSegment;

CREATE TABLE dbo.Dim_CustomerSegment (
    segment_id        INT NOT NULL PRIMARY KEY,
    customer_segment  VARCHAR(50),
    age_group         VARCHAR(50),
    previous_device   VARCHAR(50)
);

INSERT INTO dbo.Dim_CustomerSegment (segment_id, customer_segment, age_group, previous_device)
SELECT 
    ROW_NUMBER() OVER (ORDER BY customer_segment) AS segment_id,
    customer_segment,
    customer_age_group,
    previous_device_os
FROM (
    SELECT DISTINCT 
        customer_segment, 
        customer_age_group, 
        previous_device_os
    FROM dbo.stg_sales
    WHERE customer_segment IS NOT NULL 
    AND TRIM(customer_segment) != ''
) AS unique_segments;