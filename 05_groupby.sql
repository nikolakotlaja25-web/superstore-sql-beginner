-- Author: Nikola Kotlaja | GitHub: nikolakotlaja25-web
-- ================================================================
-- 05 — GROUP BY AND HAVING
-- Topics: GROUP BY, HAVING, combining with ORDER BY and WHERE
-- Dataset: Superstore Sales (Kaggle)
-- Table: superstore
-- ================================================================
--
-- GROUP BY splits rows into groups and applies aggregate
-- functions to each group separately.
--
-- Rule: every column in SELECT must either be:
--   1. Inside an aggregate function (SUM, COUNT, AVG...)
--   2. Listed in the GROUP BY clause
--
-- ORDER of clauses:
--   SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT
--
-- ================================================================


-- ----------------------------------------------------------------
-- 1. GROUP BY — total sales per region
-- ----------------------------------------------------------------
SELECT
    region,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


-- ----------------------------------------------------------------
-- 2. GROUP BY — number of orders per customer segment
-- ----------------------------------------------------------------
SELECT
    segment,
    COUNT(*)                    AS total_rows,
    COUNT(DISTINCT order_id)    AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM superstore
GROUP BY segment
ORDER BY unique_orders DESC;


-- ----------------------------------------------------------------
-- 3. GROUP BY — revenue and profit by product category
-- ----------------------------------------------------------------
SELECT
    category,
    ROUND(SUM(sales),  2)  AS total_sales,
    ROUND(SUM(profit), 2)  AS total_profit,
    ROUND(AVG(sales),  2)  AS avg_sale,
    COUNT(DISTINCT order_id) AS orders
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- ----------------------------------------------------------------
-- 4. GROUP BY — breakdown by sub-category
-- ----------------------------------------------------------------
SELECT
    category,
    sub_category,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*)              AS rows
FROM superstore
GROUP BY category, sub_category
ORDER BY category, total_sales DESC;


-- ----------------------------------------------------------------
-- 5. GROUP BY — revenue by ship mode
-- ----------------------------------------------------------------
SELECT
    ship_mode,
    COUNT(DISTINCT order_id)   AS total_orders,
    ROUND(SUM(sales),  2)      AS total_sales,
    ROUND(AVG(sales),  2)      AS avg_sale
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;


-- ----------------------------------------------------------------
-- 6. GROUP BY — top 10 states by total sales
-- ----------------------------------------------------------------
SELECT
    state,
    region,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state, region
ORDER BY total_sales DESC
LIMIT 10;


-- ----------------------------------------------------------------
-- 7. GROUP BY — average discount per category
-- ----------------------------------------------------------------
SELECT
    category,
    ROUND(AVG(discount) * 100, 1) AS avg_discount_pct
FROM superstore
GROUP BY category
ORDER BY avg_discount_pct DESC;


-- ----------------------------------------------------------------
-- 8. WHERE + GROUP BY — filter BEFORE grouping
--    Total sales per sub-category, but only for Technology.
--    WHERE runs first, then GROUP BY aggregates the filtered rows.
-- ----------------------------------------------------------------
SELECT
    sub_category,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
WHERE category = 'Technology'
GROUP BY sub_category
ORDER BY total_sales DESC;


-- ----------------------------------------------------------------
-- 9. HAVING — filter AFTER grouping
--    (You cannot use WHERE on aggregated values.)
--
--    Show only states where total profit > $10,000.
-- ----------------------------------------------------------------
SELECT
    state,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state
HAVING SUM(profit) > 10000
ORDER BY total_profit DESC;


-- ----------------------------------------------------------------
-- 10. HAVING — show only loss-making states (profit < 0)
-- ----------------------------------------------------------------
SELECT
    state,
    region,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state, region
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- ----------------------------------------------------------------
-- 11. HAVING — sub-categories with more than 500 orders
-- ----------------------------------------------------------------
SELECT
    sub_category,
    COUNT(*) AS order_rows,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sub_category
HAVING COUNT(*) > 500
ORDER BY order_rows DESC;


-- ----------------------------------------------------------------
-- 12. Full pipeline — WHERE + GROUP BY + HAVING + ORDER BY + LIMIT
--     Top 5 most profitable sub-categories in the 'West' region,
--     only where total sales exceed $20,000.
-- ----------------------------------------------------------------
SELECT
    sub_category,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*)              AS rows
FROM superstore
WHERE region = 'West'
GROUP BY sub_category
HAVING SUM(sales) > 20000
ORDER BY total_profit DESC
LIMIT 5;


-- ----------------------------------------------------------------
-- CHALLENGE
-- Which customers have placed the most orders?
-- Show the top 10 customers by number of unique orders.
-- Display: customer_name, segment, total_orders, total_sales, total_profit.
-- Only include customers with more than 5 unique orders.
-- Sort by total_orders descending.
-- Hint: use COUNT(DISTINCT order_id) for unique orders.
-- ----------------------------------------------------------------
