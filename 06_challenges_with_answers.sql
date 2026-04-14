-- Author: Nikola Kotlaja | GitHub: nikolakotlaja25-web
-- ================================================================
-- 06 — REAL-WORLD CHALLENGES WITH ANSWERS
-- 10 business questions answered with SQL
-- Dataset: Superstore Sales (Kaggle)
-- Table: superstore
-- ================================================================
--
-- Try to write each query YOURSELF before reading the answer!
-- Cover the answer section and give it a go.
--
-- ================================================================


-- ================================================================
-- CHALLENGE 1
-- What is the total revenue, total profit, and overall profit
-- margin for the entire store?
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    ROUND(SUM(sales),  2)                       AS total_revenue,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2)   AS profit_margin_pct
FROM superstore;


-- ================================================================
-- CHALLENGE 2
-- Which are the top 5 states by total sales?
-- Show: state, region, total_sales, total_profit.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    state,
    region,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state, region
ORDER BY total_sales DESC
LIMIT 5;


-- ================================================================
-- CHALLENGE 3
-- Which product sub-categories are LOSING money?
-- Show only sub-categories with a negative total profit.
-- Sort by worst loss first.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    category,
    sub_category,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- ================================================================
-- CHALLENGE 4
-- How many unique customers does each region have?
-- Show: region, unique_customers, total_orders, total_sales.
-- Sort by unique_customers descending.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    region,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT order_id)    AS total_orders,
    ROUND(SUM(sales), 2)        AS total_sales
FROM superstore
GROUP BY region
ORDER BY unique_customers DESC;


-- ================================================================
-- CHALLENGE 5
-- What percentage of total sales comes from each category?
-- Show: category, total_sales, sales_percentage.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(sales) * 100.0 / (SELECT SUM(sales) FROM superstore),
        2
    ) AS sales_pct
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- ================================================================
-- CHALLENGE 6
-- Find all orders where the discount caused a loss.
-- (profit < 0 AND discount > 0)
-- Show: order_id, customer_name, product_name, sales, discount, profit.
-- Sort by profit ascending (biggest loss first).
-- Limit to top 15.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    order_id,
    customer_name,
    product_name,
    sales,
    discount,
    profit
FROM superstore
WHERE profit   < 0
  AND discount > 0
ORDER BY profit ASC
LIMIT 15;


-- ================================================================
-- CHALLENGE 7
-- Which ship mode is fastest on average?
-- Calculate the average number of days between order_date and ship_date.
-- Show: ship_mode, avg_days_to_ship, total_orders.
--
-- Hint (SQLite): use JULIANDAY(ship_date) - JULIANDAY(order_date)
-- But since dates here are MM/DD/YYYY text, we use a workaround:
-- JULIANDAY(SUBSTR(order_date,7,4)||'-'||SUBSTR(order_date,1,2)||'-'||SUBSTR(order_date,4,2))
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(
        JULIANDAY(
            SUBSTR(ship_date,7,4)||'-'||SUBSTR(ship_date,1,2)||'-'||SUBSTR(ship_date,4,2)
        ) -
        JULIANDAY(
            SUBSTR(order_date,7,4)||'-'||SUBSTR(order_date,1,2)||'-'||SUBSTR(order_date,4,2)
        )
    ), 1) AS avg_days_to_ship
FROM superstore
GROUP BY ship_mode
ORDER BY avg_days_to_ship ASC;


-- ================================================================
-- CHALLENGE 8
-- Who are the top 10 customers by total profit generated?
-- Show: customer_name, segment, state, total_orders, total_sales, total_profit.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    customer_name,
    segment,
    state,
    COUNT(DISTINCT order_id)    AS total_orders,
    ROUND(SUM(sales),  2)       AS total_sales,
    ROUND(SUM(profit), 2)       AS total_profit
FROM superstore
GROUP BY customer_name, segment, state
ORDER BY total_profit DESC
LIMIT 10;


-- ================================================================
-- CHALLENGE 9
-- Which cities have both high sales (> $50,000) AND
-- a positive profit margin?
-- Show: city, state, total_sales, total_profit, margin_pct.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    city,
    state,
    ROUND(SUM(sales),  2)                       AS total_sales,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2)   AS margin_pct
FROM superstore
GROUP BY city, state
HAVING SUM(sales) > 50000
   AND SUM(profit) > 0
ORDER BY total_sales DESC;


-- ================================================================
-- CHALLENGE 10
-- Create a performance summary by segment and category.
-- Show: segment, category, total_orders, total_sales, total_profit, margin_pct.
-- Sort by segment, then by total_sales descending.
-- ================================================================

-- YOUR ATTEMPT:


-- ANSWER:
SELECT
    segment,
    category,
    COUNT(DISTINCT order_id)                    AS total_orders,
    ROUND(SUM(sales),  2)                       AS total_sales,
    ROUND(SUM(profit), 2)                       AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2)   AS margin_pct
FROM superstore
GROUP BY segment, category
ORDER BY segment ASC, total_sales DESC;


-- ================================================================
-- WELL DONE! 🎉
-- You've completed the beginner project.
--
-- Next steps:
--   → Learn JOINs to combine multiple tables
--   → Learn subqueries for nested logic
--   → Learn window functions for ranking and running totals
-- ================================================================
