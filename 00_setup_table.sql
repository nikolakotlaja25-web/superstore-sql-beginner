-- Author: Nikola Kotlaja | GitHub: nikolakotlaja25-web
-- ================================================================
-- 00 — SETUP: RENAME COLUMNS TO SNAKE_CASE
-- Run this ONCE before using any other SQL file.
-- Dataset: Superstore sales (Kaggle)
-- ================================================================
-- This renames columns in the 'superstore' table so all queries
-- can use clean snake_case names without quotes.
-- ================================================================

ALTER TABLE superstore RENAME COLUMN "Row ID"        TO row_id;
ALTER TABLE superstore RENAME COLUMN "Order ID"      TO order_id;
ALTER TABLE superstore RENAME COLUMN "Order Date"    TO order_date;
ALTER TABLE superstore RENAME COLUMN "Ship Date"     TO ship_date;
ALTER TABLE superstore RENAME COLUMN "Ship Mode"     TO ship_mode;
ALTER TABLE superstore RENAME COLUMN "Customer ID"   TO customer_id;
ALTER TABLE superstore RENAME COLUMN "Customer Name" TO customer_name;
ALTER TABLE superstore RENAME COLUMN "Postal Code"   TO postal_code;
ALTER TABLE superstore RENAME COLUMN "Product ID"    TO product_id;
ALTER TABLE superstore RENAME COLUMN "Sub-Category"  TO sub_category;
ALTER TABLE superstore RENAME COLUMN "Product Name"  TO product_name;
