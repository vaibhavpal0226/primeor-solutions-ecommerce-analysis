# DATABASE & TABLE CREATION

CREATE DATABASE IF NOT EXISTS primeor_ecommerce;
USE primeor_ecommerce;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    state VARCHAR(100),
    country VARCHAR(100),
    market VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(12, 2),
    quantity INT,
    discount DECIMAL(5, 4),
    profit DECIMAL(12, 4),
    shipping_cost DECIMAL(10, 2),
    order_priority VARCHAR(20),
    year INT
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_dataset.csv'
INTO TABLE orders
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    order_id, order_date, ship_date, ship_mode, customer_name,
    segment, state, country, market, region,
    product_id, category, sub_category, product_name,
    sales, quantity, discount, profit, shipping_cost,
    order_priority, year
);

# QUERIES

-- Top 10 profitable products
SELECT 
    product_id, 
    product_name,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY product_id, product_name, category
ORDER BY total_profit DESC
LIMIT 10;

-- Top 10 customers by sales
SELECT 
    customer_name,
    segment,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY customer_name, segment
ORDER BY total_sales DESC
LIMIT 10;

-- Region-wise total sales
SELECT
	region,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    CONCAT(ROUND(SUM(sales) * 100 / SUM(SUM(sales)) OVER(), 2), '%') AS sales_share_pct
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- Category-wise average profit
SELECT
	category,
    COUNT(order_id) AS total_items_sold,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY category
ORDER BY avg_profit DESC;

-- Highest discount category
SELECT
	category,
	CONCAT(ROUND(AVG(discount) * 100, 2), '%') AS avg_discount_pct,
    CONCAT(ROUND(MAX(discount) * 100, 2), '%') AS max_discount_pct,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY category
ORDER BY avg_discount_pct;

-- Orders with negative profit
SELECT 
	order_id,
    customer_name,
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    CONCAT(ROUND(AVG(discount) * 100, 2), '%') AS avg_discount_pct,
    ROUND(SUM(profit), 2) AS net_loss
FROM orders
GROUP BY order_id, customer_name, region
HAVING SUM(profit) < 0
ORDER BY net_loss ASC;

-- Monthly sales trend
SELECT
	DATE_FORMAT(order_date, '%y-%m') AS order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%y-%m')
ORDER BY order_month ASC;

-- Market-wise revenue analysis
SELECT
	market,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    CONCAT(ROUND((SUM(profit) * 100) /  SUM(sales), 2), '%') AS profit_margin_pct
FROM orders
GROUP BY market
ORDER BY total_revenue DESC;

-- Top-performing sub-categories
SELECT
	category,
    sub_category,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    CONCAT(ROUND((SUM(profit) * 100) /  SUM(sales), 2), '%') AS profit_margin_pct
FROM orders
GROUP BY category, sub_category
ORDER BY total_sales DESC;

-- Ship mode usage analysis
SELECT
	ship_mode,
    COUNT(DISTINCT order_id) AS total_usage,
    CONCAT(ROUND(COUNT(DISTINCT order_id) * 100 / SUM(COUNT(DISTINCT order_id)) OVER(), 2), '%') AS usage_share_pct,
    ROUND(AVG(shipping_cost), 2) AS avg_shipping_cost,
	ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY ship_mode
ORDER BY total_usage DESC;


-- INSIGHTS

# Which market generates highest revenue?
-- APAC generates the highest revenue of more than 35 lakhs (across 5400+ orders) with 4 lakh+ in profit (which is  12.20% profit margin). 
-- Meanwhile Canada has lowest revenue of nearly 67 thousand but has highest profit margin (26.56%) amongs all market 
-- and EMEA has the lowest profit margin (5.44%).

# Which categories are least profitable?
-- Amongs main categories Furniture brings the lowest profit of nearly 2.90 lakhs which is less than half of Technology category 
-- and carries the highest average discount (16.80%, reaching upto 85%). At the sub-category level, Table is only loss-maker, 
-- lossing 64 thousand (-8.48% margin) on 7.50 lakhs+ sales.

# Which shipping mode is most commonly used?
-- Standard class shipping is most commonly used shipping mode, accounting for 59.57% usage, 75 lakhs+ in sales and nearly 8.90 lakhs
-- in profit. It also has the lowest average shipping cost (~ 20), whereas Same Day is the least used (5.30% usage) with the 
-- highest average shipping cost (~ 43).

# Which products and customers stand out?
-- Canon imageCLASS 2200 Advanced Copier leads all product with total sales of 61 thousand+ and 25k in profit.
-- Among top 10 revenue customers, Tom Ashbrook leads sales (40k+), while Sean Miller ranks 5th in sales but has net loss -842.63

# What drives negative-profit orders
-- Our business faced several losses even though sales are good. For example customer, Cindy Stewart has more than 6k net loss
-- at 53.33% average discount and orders with 80%–85% discounts also suffered heavy losses. High discount is the biggest reason 
-- for the net loss. 