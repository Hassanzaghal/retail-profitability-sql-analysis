select 
sum(sales) as total_revenue,
sum(profit) as total_profit,
round(sum(profit)/sum(sales) * 100, 2) as profit_margin
from sales;
