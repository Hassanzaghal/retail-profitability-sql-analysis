-- =========================================
-- 1. Overall Business Performance
-- =========================================
SELECT 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM sales;


-- =========================================
-- 2. Category / Product Group Performance
-- =========================================
SELECT 
    category,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM sales
GROUP BY category
ORDER BY revenue DESC;


-- =========================================
-- 3. Loss-Making Products
-- =========================================
SELECT 
    category AS product_name,
    SUM(profit) AS total_profit
FROM sales
GROUP BY 1
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- =========================================
-- 4. Discount Impact Analysis
-- =========================================
SELECT 
    discount,
    COUNT(*) AS order_count,
    AVG(profit) AS avg_profit
FROM sales
GROUP BY discount
ORDER BY discount asc;


-- =========================================
-- 5. Top 5 Revenue-Driving Products
-- =========================================
SELECT 
    category AS product_name,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM sales
GROUP BY 1
ORDER BY revenue DESC
LIMIT 5;


-- =========================================
-- 6. Monthly Revenue & Profit
-- =========================================
SELECT
DATE_TRUNC('month', order_date) AS month,
SUM(sales) AS revenue,
SUM(profit) AS profit
FROM sales
GROUP BY month 
ORDER BY month;
