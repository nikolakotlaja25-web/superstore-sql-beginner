# 🛒 Superstore SQL — Beginner Project

**Author:** Nikola Kotlaja  
**GitHub:** [nikolakotlaja25-web](https://github.com/nikolakotlaja25-web)

A beginner-friendly SQL project using the real **Kaggle Superstore Sales dataset**.  
You will practice SQL by analyzing retail orders, customers, products, and profits across the United States.

---

## 📦 Dataset

- **Source:** [Kaggle — Sample Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Rows:** 9,994 orders
- **Table name:** `superstore`

### Columns available:

| Column | Description |
|--------|-------------|
| `row_id` | Unique row number |
| `order_id` | Order identifier |
| `order_date` | Date the order was placed |
| `ship_date` | Date the order was shipped |
| `ship_mode` | Shipping method |
| `customer_id` | Customer identifier |
| `customer_name` | Customer full name |
| `segment` | Customer type: Consumer, Corporate, Home Office |
| `country` | Country |
| `city` | City |
| `state` | State |
| `postal_code` | Postal code |
| `region` | Region: East, West, Central, South |
| `product_id` | Product identifier |
| `category` | Product category: Furniture, Office Supplies, Technology |
| `sub_category` | Product sub-category |
| `product_name` | Full product name |
| `sales` | Revenue from the sale ($) |
| `quantity` | Number of units sold |
| `discount` | Discount applied (0.0 to 1.0) |
| `profit` | Profit from the sale ($) |

---

## 📁 Project Structure

```
superstore-sql-beginner/
│
├── README.md
├── 01_select_basics.sql        ← SELECT, FROM, DISTINCT, aliases
├── 02_filtering.sql            ← WHERE, AND, OR, IN, BETWEEN, LIKE
├── 03_sorting.sql              ← ORDER BY, LIMIT, OFFSET
├── 04_aggregations.sql         ← COUNT, SUM, AVG, MIN, MAX
├── 05_groupby.sql              ← GROUP BY, HAVING
└── 06_challenges_with_answers.sql ← 10 real-world exercises + answers
```

---

## 🚀 How to Use

1. Open **DBeaver** (or any SQL tool)
2. Connect to your `superstore.db` SQLite file
3. Open each `.sql` file in order
4. Run queries **one at a time** — don't run the whole file at once
5. Try to **predict the result** before running each query

---

## 📚 Learning Path

| File | Topics | Difficulty |
|------|---------|------------|
| `01_select_basics.sql` | SELECT, FROM, DISTINCT, aliases, expressions | 🟢 Easy |
| `02_filtering.sql` | WHERE, AND, OR, NOT, IN, BETWEEN, LIKE, IS NULL | 🟢 Easy |
| `03_sorting.sql` | ORDER BY ASC/DESC, LIMIT, OFFSET | 🟢 Easy |
| `04_aggregations.sql` | COUNT, SUM, AVG, MIN, MAX | 🟡 Medium |
| `05_groupby.sql` | GROUP BY, HAVING | 🟡 Medium |
| `06_challenges_with_answers.sql` | Real-world business questions | 🟡 Medium |

---

## 🧠 Tips

- Every script has comments explaining what each query does
- Each file ends with a **Challenge** — try it before looking at the answer
- Modify queries after running them — change filters, columns, limits
- If you finish everything, move on to the intermediate project (JOI