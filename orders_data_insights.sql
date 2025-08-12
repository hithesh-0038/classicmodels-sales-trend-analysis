# Monthly Revenue And order volume

select year(o.orderdate) as order_year,
month(o.orderdate) as order_month,
sum(od.quantityordered*od.priceEach) as total_revenue,
count(distinct o. ordernumber) as total_orders
from orders o
join orderdetails od 
on o.orderNumber=od.orderNumber
group by order_year,order_month
order by order_year,order_month;

# Top 5 busiest months by revenue
SELECT 
    YEAR(o.orderDate) AS order_year,
    MONTH(o.orderDate) AS order_month,
    SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM orders o
JOIN orderdetails od 
    ON o.orderNumber = od.orderNumber
GROUP BY order_year, order_month
ORDER BY total_revenue DESC
LIMIT 5;

# Month-over-month revenue growth
WITH monthly_sales AS (
    SELECT 
        YEAR(o.orderDate) AS order_year,
        MONTH(o.orderDate) AS order_month,
        SUM(od.quantityOrdered * od.priceEach) AS total_revenue
    FROM orders o
    JOIN orderdetails od 
        ON o.orderNumber = od.orderNumber
    GROUP BY order_year, order_month
)
SELECT 
    order_year,
    order_month,
    total_revenue,
    prev_month_revenue,
    ROUND(
        (total_revenue - prev_month_revenue) / prev_month_revenue * 100,
        2
    ) AS month_over_month_growth_percent
FROM (
    SELECT 
        order_year,
        order_month,
        total_revenue,
        LAG(total_revenue) OVER (ORDER BY order_year, order_month) AS prev_month_revenue
    FROM monthly_sales
) AS sub;

# Average order value per month
SELECT 
    YEAR(o.orderDate) AS order_year,
    MONTH(o.orderDate) AS order_month,
    ROUND(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber), 2) AS avg_order_value
FROM orders o
JOIN orderdetails od 
    ON o.orderNumber = od.orderNumber
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

# Percentage change in order volume month-over-month
WITH monthly_orders AS (
    SELECT 
        YEAR(o.orderDate) AS order_year,
        MONTH(o.orderDate) AS order_month,
        COUNT(DISTINCT o.orderNumber) AS total_orders
    FROM orders o
    GROUP BY order_year, order_month
)
SELECT 
    order_year,
    order_month,
    total_orders,
    prev_month_orders,
    ROUND(
        (total_orders - prev_month_orders) / prev_month_orders * 100,
        2
    ) AS order_volume_growth_percent
FROM (
    SELECT 
        order_year,
        order_month,
        total_orders,
        LAG(total_orders) OVER (ORDER BY order_year, order_month) AS prev_month_orders
    FROM monthly_orders
) AS sub;

#Top 5 customers by total revenue
SELECT 
    c.customerNumber,
    c.customerName,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS total_revenue
FROM customers c
JOIN orders o 
    ON c.customerNumber = o.customerNumber
JOIN orderdetails od 
    ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, c.customerName
ORDER BY SUM(od.quantityOrdered * od.priceEach) desc
limit 5;