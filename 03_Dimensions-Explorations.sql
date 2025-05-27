--------------------------------------------------------------------------------------
--									DIMENSIONS EXPLORATION
-------------------------------------------------------------------------------------- 
/*
	Identifying the unique values (or categories) in each dimension. Recognizing how data might be 
	grouped or segmented, which is useful for later analysis.
	SYNTAX: DISTINCT [Dimensions]
	Eg., DISTINCT Country, DISTINCT Category, DISTINCT Product
*/


-- Explore all countries our customers come from
SELECT DISTINCT country FROM gold.dim_customers;

-- Explore all Product Categories "The Major Divisions"
SELECT DISTINCT category FROM gold.dim_products;

-- Explore all Product Categories and Sub-Categories in groups
SELECT DISTINCT category, subcategory FROM gold.dim_products;

-- Explore all Product Categories, Sub-Categories and Product Name in groups
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products;