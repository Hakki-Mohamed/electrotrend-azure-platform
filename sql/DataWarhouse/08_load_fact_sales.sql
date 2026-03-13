DELETE FROM dbo.Fact_Sales;

INSERT INTO dbo.Fact_Sales (
    sale_id, date_id, product_id, geography_id,
    channel_id, segment_id, unit_price_usd, discount_pct,
    units_sold, discounted_price_usd, revenue_usd,
    fx_rate_to_usd, revenue_local_currency,
    customer_rating, return_status, currency
)
SELECT
    s.sale_id,
    CAST(REPLACE(CAST(TRY_CONVERT(DATE, s.sale_date) 
        AS VARCHAR), '-', '') AS INT) AS date_id,
    p.product_id,
    g.geography_id,
    c.channel_id,
    seg.segment_id,
    TRY_CAST(s.unit_price_usd AS DECIMAL(10,2)),
    TRY_CAST(s.discount_pct AS DECIMAL(5,2)),
    TRY_CAST(s.units_sold AS INT),
    TRY_CAST(s.discounted_price_usd AS DECIMAL(10,2)),
    TRY_CAST(s.revenue_usd AS DECIMAL(12,2)),
    TRY_CAST(s.fx_rate_to_usd AS DECIMAL(10,4)),
    TRY_CAST(s.revenue_local_currency AS DECIMAL(12,2)),
    TRY_CAST(s.customer_rating AS DECIMAL(3,1)),
    s.return_status,
    s.currency
FROM dbo.stg_sales s
LEFT JOIN dbo.Dim_Product p 
    ON TRIM(s.product_name) = TRIM(p.product_name)
    AND ISNULL(TRIM(s.storage),'') = ISNULL(TRIM(p.storage),'')
    AND ISNULL(TRIM(s.color),'') = ISNULL(TRIM(p.color),'')
LEFT JOIN dbo.Dim_Geography g 
    ON TRIM(s.city) = TRIM(g.city)
    AND TRIM(s.country) = TRIM(g.country)
LEFT JOIN dbo.Dim_Channel c 
    ON TRIM(s.sales_channel) = TRIM(c.channel_name)
    AND TRIM(s.payment_method) = TRIM(c.payment_method)
LEFT JOIN dbo.Dim_CustomerSegment seg 
    ON TRIM(s.customer_segment) = TRIM(seg.customer_segment)
    AND TRIM(s.customer_age_group) = TRIM(seg.age_group)
WHERE s.sale_id IS NOT NULL;