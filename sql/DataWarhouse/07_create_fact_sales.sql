DROP TABLE IF EXISTS dbo.Fact_Sales;

CREATE TABLE dbo.Fact_Sales (
    sale_id                 VARCHAR(50) PRIMARY KEY,
    date_id                 INT,
    product_id              INT,
    geography_id            INT,
    channel_id              INT,
    segment_id              INT,
    unit_price_usd          DECIMAL(10,2),
    discount_pct            DECIMAL(5,2),
    units_sold              INT,
    discounted_price_usd    DECIMAL(10,2),
    revenue_usd             DECIMAL(12,2),
    fx_rate_to_usd          DECIMAL(10,4),
    revenue_local_currency  DECIMAL(12,2),
    customer_rating         DECIMAL(3,1),
    return_status           VARCHAR(20),
    currency                VARCHAR(20)
);