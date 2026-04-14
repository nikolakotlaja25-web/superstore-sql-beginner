-- ================================================================
-- 01 — SELECT BASICS
-- Topics: SELECT, FROM, *, column aliases, DISTINCT, expressions
-- Dataset: Superstore Sales (Kaggle)
-- Table: superstore
-- ================================================================


-- ----------------------------------------------------------------
-- 1. Retrieve ALL columns and ALL rows
--    The asterisk (*) means "give me every column".
--    Be careful — this returns all 9,994 rows!
-- ----------------------------------------------------------------
SELECT *
FROM superstore;


-- ----------------------------------------------------------------
-- 2. Retrieve only specific columns
--    Pick just the columns you need — much faster and cleaner.
-- ----------------------------------------------------------------
SELECT segment, city, state
FROM superstore;


-- ----------------------------------------------------------------
-- 3. Column aliases with AS
--    Rename a column in your result without changing the table.
-- ----------------------------------------------------------------
SELECT
    "customer name"  AS customer,
    segment        AS market_segment,
    sales          AS revenue,
    profit         AS net_profit
FROM superstore;


-- ----------------------------------------------------------------
-- 4. DISTINCT — return only unique values (no duplicates)
--    What customer segments exist in the data?
-- ----------------------------------------------------------------
SELECT DISTINCT segment
FROM superstore;


-- ----------------------------------------------------------------
-- 5. DISTINCT on multiple columns
--    What unique combinations of category and sub_category exist?
-- ----------------------------------------------------------------
SELECT DISTINCT category, sub_category
FROM superstore;


-- ----------------------------------------------------------------
-- 6. DISTINCT — how many unique states are in the dataset?
-- ----------------------------------------------------------------
SELECT DISTINCT state
FROM superstore
ORDER BY state;


-- ----------------------------------------------------------------
-- 7. Simple math expressions — calculate a new column on the fly
--    Profit margin = (profit / sales) * 100
--    ROUND() limits decimal places.
-- ----------------------------------------------------------------
SELECT
    order_id,
    customer_name,
    sales,
    profit,
    ROUND((profit / sales) * 100, 2) AS profit_margin_pct
FROM superstore;


-- ----------------------------------------------------------------
-- 8. Calculate revenue per unit
--    How much does each unit cost on average in each row?
-- ----------------------------------------------------------------
SELECT
    "product name",
    quantity,
    sales,
    ROUND(sales / quantity, 2) AS price_per_unit
FROM superstore;


-- ----------------------------------------------------------------
-- 9. String concatenation — combine city and state into one label
--    SQLite syntax: column || ' text ' || column
-- ----------------------------------------------------------------
SELECT
    customer_name,
    city || ', ' || state AS location
FROM superstore;


-- ----------------------------------------------------------------
-- 10. Mix real columns with calculated columns
-- ----------------------------------------------------------------
SELECT
    order_id,
    customer_name,
    region,
    sales,
    discount,
    ROUND(sales * discount, 2)       AS discount_amount,
    ROUND(sales - sales * discount, 2) AS discounted_price,
    profit
FROM superstore;


-- ----------------------------------------------------------------
-- CHALLENGE
-- Write a query that returns:
--   - customer_name  (label it "Customer")
--   - state          (label it "State")
--   - sales          (label it "Revenue")
--   - profit         (label it "Profit")
--   - profit margin as a percentage (label it "Margin %")
-- Only show DISTINCT combinations of customer and state.
-- ----------------------------------------------------------------
