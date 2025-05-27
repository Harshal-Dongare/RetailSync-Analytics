--------------------------------------------------------------------------------------
--									DATE EXPLORATION
--------------------------------------------------------------------------------------

/* 
	1. DIdentifying the earliesta and latest dates (Boundaries). 
	2. Understanding the scope of data and the timespan.
	SYNTAX: MIN/MAX [Date Dimension]
	Eg., MIN Order_Date, MAX Create_Date, MIN Birthdate
*/

-- Find the date of the first order and the last order
SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date
FROM gold.fact_sales;

-- How many years of sales are available
SELECT
	DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold.fact_sales;

-- How many month of sales are available
SELECT
	DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;

/*
	Conclusion from above analysis :-
		First Order : 29 December 2010
		Last Order : 28 January 2014
		Years of Sales Data : 4 Years
		Months of Sales Data : 37 Months
*/

-- Find the youngest and the oldest customer
SELECT 
	MIN(birthdate) AS youngest_cust,
	DATEDIFF(YEAR, MIN(birthdate), GETDATE()) youngest_age,
	MAX(birthdate) AS oldest_cust,
	DATEDIFF(YEAR, MAX(birthdate), GETDATE()) oldest_age
FROM gold.dim_customers;


/*
	Conclusion from above analysis :-
		Youngest customer age : 39 Years Old
		Oldest Customer age : 109 Years Old
*/