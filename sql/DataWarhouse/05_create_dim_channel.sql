DROP TABLE IF EXISTS dbo.Dim_Channel;

CREATE TABLE dbo.Dim_Channel (
    channel_id     INT NOT NULL PRIMARY KEY,
    channel_name   VARCHAR(50),
    payment_method VARCHAR(50)
);

INSERT INTO dbo.Dim_Channel (channel_id, channel_name, payment_method)
SELECT 
    ROW_NUMBER() OVER (ORDER BY channel_name) AS channel_id,
    channel_name,
    payment_method
FROM (
    SELECT DISTINCT 
        sales_channel AS channel_name, 
        payment_method
    FROM dbo.stg_sales
    WHERE sales_channel IS NOT NULL 
    AND TRIM(sales_channel) != ''
) AS unique_channels;