# DataWarehouseAnalytics

## Project Overview

This Data Analyst Project performs exploratory data analysis (EDA) and reporting on a retail or e-commerce dataset within the `DataWarehouseAnalytics` database. Using SQL, the project analyzes key business metrics, dimensions, and trends to provide actionable insights into customer behavior, product performance, and sales trends. The project consists of 13 SQL scripts, each focusing on specific analyses such as dimension exploration, measure aggregation, ranking, segmentation, and reporting.

### Objectives
1. **Understand Data Structure**: Explore dimensions, measures, and date ranges to establish a foundation for analysis.
2. **Calculate Key Metrics**: Aggregate business-critical metrics like total sales, orders, and customer counts.
3. **Analyze Trends and Performance**: Perform time-series, ranking, segmentation, and comparative analyses to identify patterns and opportunities.
4. **Generate Reports**: Create consolidated views (`gold.report_customers` and `gold.report_products`) for detailed insights.

The project assumes a star schema in the `gold` schema, with fact and dimension tables. SQL Server syntax is used, leveraging standard and advanced SQL functions like window functions.

## Database Schema

The project operates on the `DataWarehouseAnalytics` database with the following tables in the `gold` schema:

- **`gold.fact_sales`**:
  - `order_number`: Unique order identifier.
  - `order_date`: Transaction date.
  - `sales_amount`: Revenue from the sale.
  - `quantity`: Items sold.
  - `customer_key`: Links to `dim_customers`.
  - `product_key`: Links to `dim_products`.

- **`gold.dim_customers`**:
  - `customer_key`: Unique customer identifier.
  - `customer_number`: Alternate customer ID.
  - `first_name`, `last_name`: Customer name.
  - `birthdate`: Customer's date of birth.
  - `gender`: Customer's gender.
  - `country`: Customer's country.

- **`gold.dim_products`**:
  - `product_key`: Unique product identifier.
  - `product_name`: Product name.
  - `category`, `subcategory`: Product categorization.
  - `cost`: Product cost.

## Project Structure

The project includes 13 SQL files, each addressing a specific analysis or reporting task:

### 1. `01_Measures-and-Dimensions.sql`
- **Purpose**: Identifies dimensions (categorical) and measures (numerical metrics).
- **Analyses**: Classifies columns like `category`, `product_name`, `birthdate`, `customer_id` as dimensions, and `sales_amount`, `quantity` as measures.
- **Techniques**: `SELECT DISTINCT`.

### 2. `02_Data-Exploration.sql`
- **Purpose**: Explores database structure.
- **Analyses**: Lists all tables (`INFORMATION_SCHEMA.TABLES`) and columns in `dim_customers` (`INFORMATION_SCHEMA.COLUMNS`).
- **Techniques**: Metadata queries.

### 3. `03_Dimensions-Explorations.sql`
- **Purpose**: Identifies unique values for data segmentation.
- **Analyses**: Lists unique countries, product categories, subcategories, and combinations.
- **Techniques**: `SELECT DISTINCT`.

### 4. `04_Date-Explorations.sql`
- **Purpose**: Analyzes date boundaries and timespans.
- **Analyses**:
  - Order date range: Dec 29, 2010, to Jan 28, 2014 (4 years, 37 months).
  - Customer age range: 39 to 109 years.
- **Techniques**: `MIN`, `MAX`, `DATEDIFF`.

### 5. `05_Measures-Explorations.sql`
- **Purpose**: Calculates key business metrics.
- **Analyses**: Total sales, quantity, average sales price, orders, products, customers, and customers with orders.
- **Techniques**: `SUM`, `AVG`, `COUNT`, `COUNT(DISTINCT)`, `UNION ALL`.

### 6. `06_Magnitude-Analysis.sql`
- **Purpose**: Compares measures across dimensions.
- **Analyses**: Customers by country/gender, products by category, average cost by category, revenue by category/customer, items sold by country.
- **Techniques**: `GROUP BY`, `SUM`, `AVG`, `COUNT`.

### 7. `07_Ranking-Analysis.sql`
- **Purpose**: Ranks entities by performance.
- **Analyses**: Top 5 products by revenue, bottom 5 products, top 10 customers by revenue, bottom 3 customers by orders.
- **Techniques**: `TOP`, `RANK`, `GROUP BY`.

### 8. `08_change_over_time_analysis.sql`
- **Purpose**: Tracks trends over time.
- **Analyses**: Sales, customers, and quantity by year/month using different date formats.
- **Techniques**: `DATEPART`, `DATETRUNC`, `FORMAT`, `GROUP BY`.

### 9. `08_cumulative_analysis.sql`
- **Purpose**: Calculates running totals and moving averages.
- **Analyses**: Yearly sales with running totals and moving average price.
- **Techniques**: `SUM() OVER`, `AVG() OVER`, `DATETRUNC`.

### 10. `09_performance_analysis.sql`
- **Purpose**: Measures year-over-year product performance.
- **Analyses**: Compares yearly product sales to average and previous year, classifying as above/below average or increase/decrease.
- **Techniques**: `LAG`, `AVG() OVER`, `CASE`.

### 11. `10_data_segmentation.sql`
- **Purpose**: Groups data for targeted insights.
- **Analyses**:
  - Products by cost ranges (<100, 100-500, 500-1000, >1000).
  - Customers by spending/lifespan (VIP, Regular, New).
- **Techniques**: `CASE`, `GROUP BY`.

### 12. `11_part_to_whole_analysis.sql`
- **Purpose**: Compares category contributions to totals.
- **Analyses**: Product category sales and percentage of total sales.
- **Techniques**: `SUM`, `SUM() OVER`, `CAST`, `ROUND`.

### 13. `12_report_customers.sql`
- **Purpose**: Creates a customer report view (`gold.report_customers`).
- **Analyses**: Aggregates orders, sales, quantity, products, lifespan; segments by age and spending; calculates recency, average order value, and monthly spend.
- **Techniques**: `CREATE VIEW`, `CASE`, `DATEDIFF`, `CONCAT`.

### 14. `13_report_products.sql`
- **Purpose**: Creates a product report view (`gold.report_products`).
- **Analyses**: Aggregates orders, sales, quantity, customers, lifespan; segments by revenue (High, Mid, Low); calculates recency, average order revenue, monthly revenue, and selling price.
- **Techniques**: `CREATE VIEW`, `CASE`, `DATEDIFF`, `ROUND`.

## Key Insights

- **Data Timespan**: Sales data spans Dec 29, 2010, to Jan 28, 2014 (37 months).
- **Customer Demographics**: Ages range from 39 to 109, segmented by age group and spending (VIP, Regular, New).
- **Product Performance**: Products segmented by revenue and cost; some categories dominate sales.
- **Sales Trends**: Time-series analyses reveal seasonality and growth patterns.
- **Top Performers**: Rankings highlight top and bottom products/customers.
- **Segmentation**: Enables targeted marketing and inventory strategies.

## How to Use

### Setup
- Use a SQL Server instance with the `DataWarehouseAnalytics` database.
- Ensure `gold.fact_sales`, `gold.dim_customers`, and `gold.dim_products` are populated.
- Load SQL files into a SQL environment (e.g., SQL Server Management Studio).

### Execution
Run scripts in this order:
1. `01_Measures-and-Dimensions.sql`, `02_Data-Exploration.sql`: Understand schema.
2. `03_Dimensions-Explorations.sql`, `04_Date-Explorations.sql`: Explore dimensions and dates.
3. `05_Measures-Explorations.sql`, `06_Magnitude-Analysis.sql`: Calculate metrics.
4. `07_Ranking-Analysis.sql`, `08_change_over_time_analysis.sql`, `08_cumulative_analysis.sql`, `09_performance_analysis.sql`, `10_data_segmentation.sql`, `11_part_to_whole_analysis.sql`: Perform advanced analyses.
5. `12_report_customers.sql`, `13_report_products.sql`: Create reporting views.

Ensure permissions to create views for the last two scripts.

### Output
- Export query results to CSV or visualize in Power BI/Tableau.
- Use `gold.report_customers` and `gold.report_products` for reporting.

## Dependencies

- **Database**: SQL Server with `DataWarehouseAnalytics`.
- **Tables**: `gold.fact_sales`, `gold.dim_customers`, `gold.dim_products`.
- **SQL Features**: `SUM`, `AVG`, `COUNT`, `RANK`, `LAG`, `SUM() OVER`, `DATEDIFF`, `DATETRUNC`, `FORMAT`, `CREATE VIEW`.

## Future Enhancements

- **Visualization**: Create dashboards with Power BI or Tableau.
- **Advanced Analytics**: Add predictive models for sales or churn.
- **Segmentation**: Include geographic or seasonal analyses.
- **Automation**: Schedule scripts for periodic updates.

## Conclusion

This project provides a robust framework for retail data analysis, with modular, well-documented SQL scripts. The customer and product report views enable efficient, actionable insights for business intelligence tasks.

---
*Generated on May 27, 2025*
