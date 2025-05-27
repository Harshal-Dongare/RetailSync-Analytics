USE DataWarehouseAnalytics;

-- Check whether a column is Dimensions or Measure 

SELECT DISTINCT
category
FROM gold.dim_products; -- This is Dimension

SELECT DISTINCT
sales_amount
FROM gold.fact_sales; -- This is Measure

SELECT DISTINCT
product_name
FROM gold.dim_products; -- This is Dimension

SELECT DISTINCT
quantity
FROM gold.fact_sales; -- This is Measure

SELECT DISTINCT
birthdate
FROM gold.dim_customers; -- This is Dimension

SELECT DISTINCT
customer_id
FROM gold.dim_customers; -- This is Dimension
