-- Author: Nikola Kotlaja | GitHub: nikolakotlaja25-web
-- ================================================================
-- 04 — AGGREGATE FUNCTIONS
-- Topics: COUNT, SUM, AVG, MIN, MAX, ROUND
-- Dataset: Superstore Sales (Kaggle)
-- Table: superstore
-- ================================================================
--
-- Aggregate functions collapse many rows into a single result.
-- They ignore NULL values automatically (except COUNT(*)).
--
-- ================================================================


-- ----------------------------------------------------------------
-- 1. COUNT(*) — how many rows are in the table?
-- ----------------------------------------------------------------
SELECT COUNT(*) AS total_rows
FROM superstore;


-- ----------------------------------------------------------------
-- 2. COUNT(column) — count non-NULL values in a column
-- ----------------------------------------------------------------
SELECT COUNT(customer_id) AS total_orders
FROM superstore;


-- ----------------------------------------------------------------
-- 3. COUNT(DISTINCT column) — count unique values
--    How many unique customers placed orders?
-- ----------------------------------------------------------------
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM superstore;


-- ----------------------------------------------------------------
-- 4. COUNT DISTINCT for multiple things
-- ----------------------------------------------------------------
SELECT
    COUNT(*)                    AS total_rows,
    COUNT(DISTINCT order_id)    AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT product_id)  AS unique_products,
    COUNT(DISTINCT state)       AS unique_states
FROM superstore;


-- ----------------------------------------------------------------
-- 5. SUM — total revenue and total profit
-- ----------------------------------------------------------------
SELECT
    ROUND(SUM(sales),  2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore;


-- ----------------------------------------------------------------
-- 6. AVG — average sale and average profit per row
-- ----------------------------------------------------------------
SELECT
    ROUND(AVG(sales),    2) AS avg_sale,
    ROUND(AVG(profit),   2) AS avg_profit,
    ROUND(AVG(discount), 4) AS avg_discount,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM superstore;


-- ----------------------------------------------------------------
-- 7. MIN and MAX — smallest and largest values
-- ----------------------------------------------------------------
SELECT
    MIN(sales)   AS min_sale,
    MAX(sales)   AS max_sale,
    MIN(profit)  AS worst_profit,
    MAX(profit)  AS best_profit
FROM superstore;


-- ----------------------------------------------------------------
-- 8. Combine everything into one summary query
-- ----------------------------------------------------------------
SELECT
    COUNT(*)                    AS total_rows,
    COUNT(DISTINCT order_id)    AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales),  2)       AS total_revenue,
    ROUND(SUM(profit), 2)       AS total_profit,
    ROUND(AVG(sales),  2)       AS avg_order_value,
    MIN(sales)                  AS min_sale,
    MAX(sales)                  AS max_sale
FROM superstore;


-- ----------------------------------------------------------------
-- 9. Aggregates with WHERE — stats for Technology only
-- ----------------------------------------------------------------
SELECT
    COUNT(*)               AS total_rows,
    ROUND(SUM(sales),  2)  AS total_revenue,
    ROUND(SUM(profit), 2)  AS total_profit,
    ROUND(AVG(sales),  2)  AS avg_sale
FROM superstore
WHERE category = 'Technology';


-- ----------------------------------------------------------------
-- 10. Aggregates per region — using WHERE to filter one at a time
--     (In the next lesson you'll learn GROUP BY to do all at once.)
-- ----------------------------------------------------------------
SELECT
    'West' AS region,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
WHERE region = 'West';

-- repeat for East:
SELECT
    'East' AS region,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
WHERE region = 'East';


-- ----------------------------------------------------------------
-- 11. Overall profit margin
-- ----------------------------------------------------------------
SELECT
    ROUND(SUM(sales),  2)                          AS total_revenue,
    ROUND(SUM(profit), 2)                          AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2)    AS overall_margin_pct
FROM superstore;


-- ----------------------------------------------------------------
-- 12. How many orders had a negative profit (loss)?
-- ----------------------------------------------------------------
SELECT COUNT(*) AS loss_making_orders
FROM superstore
WHERE profit < 0;


-- ----------------------------------------------------------------
-- 13. What percentage of orders lost money?
-- ----------------------------------------------------------------
SELECT
    COUNT(*)                                             AS total_orders,
    SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END)         AS loss_orders,
    ROUND(
        SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    )                                                    AS loss_pct
FROM superstore;


-- ----------------------------------------------------------------
-- CHALLENGE
-- Calculate the following for the 'Home Office' segment only:
--   - Total number of orders
--   - Total revenue (SUM of sales)
--   - Total profit
--   - Average discount (as a percentage, multiply by 100)
--   - Overall profit margin %
-- ----------------------------------------------------------------
