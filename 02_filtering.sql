-- Author: Nikola Kotlaja | GitHub: nikolakotlaja25-web
-- ================================================================
-- 02 — FILTERING WITH WHERE
-- Topics: WHERE, AND, OR, NOT, IN, BETWEEN, LIKE, IS NULL
-- Dataset: Superstore Sales (Kaggle)
-- Table: superstore
-- ================================================================


-- ----------------------------------------------------------------
-- 1. Basic WHERE — filter by a single condition
--    Show only orders from the 'West' region.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, region, sales
FROM superstore
WHERE region = 'West';


-- ----------------------------------------------------------------
-- 2. Numeric comparison — find high-value sales
--    Operators:  =   !=   <   >   <=   >=
-- ----------------------------------------------------------------
SELECT order_id, customer_name, sales, profit
FROM superstore
WHERE sales > 1000;


-- ----------------------------------------------------------------
-- 3. AND — both conditions must be true
--    High sales AND positive profit.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, sales, profit
FROM superstore
WHERE sales > 1000
  AND profit > 0;


-- ----------------------------------------------------------------
-- 4. OR — at least one condition must be true
--    Orders shipped by 'First Class' OR 'Same Day'.
-- ----------------------------------------------------------------
SELECT order_id, ship_mode, customer_name, sales
FROM superstore
WHERE ship_mode = 'First Class'
   OR ship_mode = 'Same Day';


-- ----------------------------------------------------------------
-- 5. IN — cleaner way to write multiple OR conditions
--    Same result as the query above.
-- ----------------------------------------------------------------
SELECT order_id, ship_mode, customer_name, sales
FROM superstore
WHERE ship_mode IN ('First Class', 'Same Day');


-- ----------------------------------------------------------------
-- 6. NOT IN — exclude certain values
--    All orders NOT shipped by Standard Class.
-- ----------------------------------------------------------------
SELECT order_id, ship_mode, customer_name
FROM superstore
WHERE ship_mode NOT IN ('Standard Class');


-- ----------------------------------------------------------------
-- 7. BETWEEN — filter a range (inclusive on both ends)
--    Orders where sales are between $500 and $1,000.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, sales
FROM superstore
WHERE sales BETWEEN 500 AND 1000;


-- ----------------------------------------------------------------
-- 8. BETWEEN with dates
--    Orders placed in the year 2017.
--    Dates are stored as text (MM/DD/YYYY) in this dataset.
-- ----------------------------------------------------------------
SELECT order_id, order_date, customer_name, sales
FROM superstore
WHERE order_date BETWEEN '1/1/2017' AND '12/31/2017';


-- ----------------------------------------------------------------
-- 9. LIKE — pattern matching
--    % = any number of characters
--    _ = exactly one character
--
--    Find all customers whose name starts with 'A'.
-- ----------------------------------------------------------------
SELECT DISTINCT customer_name, segment
FROM superstore
WHERE customer_name LIKE 'A%';


-- ----------------------------------------------------------------
-- 10. LIKE — find products containing a keyword
--     Any product whose name contains "Chair".
-- ----------------------------------------------------------------
SELECT DISTINCT product_name, category, sub_category
FROM superstore
WHERE product_name LIKE '%Chair%';


-- ----------------------------------------------------------------
-- 11. LIKE — find orders in cities starting with 'San'
-- ----------------------------------------------------------------
SELECT DISTINCT city, state, region
FROM superstore
WHERE city LIKE 'San%';


-- ----------------------------------------------------------------
-- 12. IS NULL — find missing values
--     Check for rows where postal_code is missing.
-- ----------------------------------------------------------------
SELECT order_id, city, state, postal_code
FROM superstore
WHERE postal_code IS NULL;


-- ----------------------------------------------------------------
-- 13. IS NOT NULL — the opposite
-- ----------------------------------------------------------------
SELECT order_id, city, state, postal_code
FROM superstore
WHERE postal_code IS NOT NULL
LIMIT 10;


-- ----------------------------------------------------------------
-- 14. NOT — negate a condition
--     Customers who are NOT in the 'Consumer' segment.
-- ----------------------------------------------------------------
SELECT DISTINCT customer_name, segment
FROM superstore
WHERE NOT segment = 'Consumer';


-- ----------------------------------------------------------------
-- 15. Combining conditions with parentheses
--     Orders with a loss (negative profit) OR a large discount.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, sales, discount, profit
FROM superstore
WHERE profit < 0
   OR discount >= 0.5;


-- ----------------------------------------------------------------
-- 16. Complex filter — Corporate customers in the East region
--     who bought Technology products with sales over $500.
-- ----------------------------------------------------------------
SELECT order_id, customer_name, product_name, sales, profit
FROM superstore
WHERE segment  = 'Corporate'
  AND region   = 'East'
  AND category = 'Technology'
  AND sales    > 500;


-- ----------------------------------------------------------------
-- CHALLENGE
-- Find all Furniture orders from California (state = 'California')
-- where the discount is greater than 0 and the profit is negative.
-- Show: order_id, customer_name, product_name, sales, discount, profit.
-- ----------------------------------------------------------------
