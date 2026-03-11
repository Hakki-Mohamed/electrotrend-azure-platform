-- =============================================
-- Script : Création table Staging stg_sales
-- Projet : ElectroTrend Azure Platform
-- Dataset : Apple Global Sales 2022-2024
-- =============================================

DROP TABLE IF EXISTS dbo.stg_sales;

CREATE TABLE dbo.stg_sales (
    sale_id                  VARCHAR(50),
    sale_date                VARCHAR(50),
    year                     VARCHAR(20),
    quarter                  VARCHAR(20),
    month                    VARCHAR(50),
    country                  VARCHAR(50),
    region                   VARCHAR(50),
    city                     VARCHAR(100),
    product_name             VARCHAR(100),
    category                 VARCHAR(50),
    storage                  VARCHAR(50),
    color                    VARCHAR(50),
    unit_price_usd           VARCHAR(20),
    discount_pct             VARCHAR(20),
    units_sold               VARCHAR(20),
    discounted_price_usd     VARCHAR(50),
    revenue_usd              VARCHAR(20),
    currency                 VARCHAR(20),
    fx_rate_to_usd           VARCHAR(20),
    revenue_local_currency   VARCHAR(20),
    sales_channel            VARCHAR(50),
    payment_method           VARCHAR(50),
    customer_segment         VARCHAR(50),
    customer_age_group       VARCHAR(50),
    previous_device_os       VARCHAR(50),
    customer_rating          VARCHAR(20),
    return_status            VARCHAR(20)
);