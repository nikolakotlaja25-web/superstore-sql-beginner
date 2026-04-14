-- Author: Nikola Kotlaja | GitHub: nikolakotlaja25-web
-- ================================================================
-- 03 — SORTING AND LIMITING RESULTS
-- Topics: ORDER BY ASC/DESC, LIMIT, OFFSET
-- Dataset: Superstore Sales (Kaggle)
-- Table: superstore
-- ================================================================


-- ----------------------------------------------------------------
-- 1. ORDER BY — sort results (default is ASC = smallest first)
--    Show all orders sorted by sales from lowest to highest.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, sales
FROM superstore
ORDER BY sales;


-- ----------------------------------------------------------------
-- 2. ORDER BY DESC — largest first
--    Most expensive orders at the top.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, sales, profit
FROM superstore
ORDER BY sales DESC;


-- ----------------------------------------------------------------
-- 3. ORDER BY multiple columns
--    Sort by region first, then by sales descending within each region.
-- ----------------------------------------------------------------
SELECT region, state, customer_name, sales
FROM superstore
ORDER BY region ASC, sales DESC;


-- ----------------------------------------------------------------
-- 4. LIMIT — return only the first N rows
--    Top 10 most profitable orders.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, product_name, profit
FROM superstore
ORDER BY profit DESC
LIMIT 10;


-- ----------------------------------------------------------------
-- 5. Bottom 10 — worst performing orders (biggest losses)
-- ----------------------------------------------------------------
SELECT order_id, customer_name, product_name, profit
FROM superstore
ORDER BY profit ASC
LIMIT 10;


-- ----------------------------------------------------------------
-- 6. LIMIT with WHERE — top 10 Technology sales
-- ----------------------------------------------------------------
SELECT order_id, customer_name, product_name, sales
FROM superstore
WHERE category = 'Technology'
ORDER BY sales DESC
LIMIT 10;


-- ----------------------------------------------------------------
-- 7. OFFSET — skip the first N rows (used for pagination)
--    Get rows 11–20 of the most expensive sales (page 2).
-- ----------------------------------------------------------------
SELECT order_id, customer_name, sales
FROM superstore
ORDER BY sales DESC
LIMIT 10 OFFSET 10;


-- ----------------------------------------------------------------
-- 8. Most recent orders (sort by date descending)
--    Note: dates are stored as text MM/DD/YYYY in this dataset.
--    For correct date sorting use the format check below.
-- ----------------------------------------------------------------
SELECT order_id, order_date, customer_name, sales
FROM superstore
ORDER BY order_date DESC
LIMIT 20;


-- ----------------------------------------------------------------
-- 9. Alphabetical sort — customers A to Z
-- ----------------------------------------------------------------
SELECT DISTINCT customer_name, segment, state
FROM superstore
ORDER BY customer_name ASC;


-- ----------------------------------------------------------------
-- 10. Sort by a calculated column
--     Most discounted orders (highest discount amount).
-- ----------------------------------------------------------------
SELECT
    order_id,
    customer_name,
    sales,
    discount,
    ROUND(sales * discount, 2) AS discount_amount
FROM superstore
WHERE discount > 0
ORDER BY discount_amount DESC
LIMIT 10;


-- ----------------------------------------------------------------
-- 11. Sort by profit margin — most efficient sales first
-- ----------------------------------------------------------------
SELECT
    order_id,
    customer_name,
    product_name,
    sales,
    profit,
    ROUND((profit / sales) * 100, 2) AS margin_pct
FROM superstore
WHERE sales > 0
ORDER BY margin_pct DESC
LIMIT 10;


-- ----------------------------------------------------------------
-- 12. Unique states sorted by name
-- ----------------------------------------------------------------
SELECT DISTINCT state, region
FROM superstore
ORDER BY region ASC, state ASC;


-- ----------------------------------------------------------------
-- CHALLENGE
-- Find the top 5 orders with the highest discount amount
-- (discount_amount = sales * discount) in the 'South' region.
-- Show: order_id, customer_name, state, sales, discount, discount_amount.
-- Exclude orders where discount = 0.
-- ----------------------------------------------------------------
