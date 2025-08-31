SELECT *
FROM transactions;

SELECT
COUNT(transaction_id) AS number_of_sales,
COUNT(DISTINCT(store_id)) AS number_of_stores,
COUNT(DISTINCT(product_id)) AS number_of_products,
SUM(IFNULL(transaction_qty,0)) AS total_quantity,
SUM(IFNULL(unit_price * transaction_qty,0)) AS total_revenue,

DATE(transaction_date) AS date_of_transaction,
    DAYNAME(transaction_date) AS day_name,
    MONTHNAME(transaction_date) AS month_name,
    DAYOFMONTH(transaction_date) AS day_of_month,

store_location,
product_category, 
product_type, 
product_detail,

CASE 
WHEN transaction_time BETWEEN '06:00:00' AND '12:00:00' THEN 'Morning'
WHEN transaction_time BETWEEN '12:01:00' AND '17:00:00' THEN 'Afternoon'
WHEN transaction_time BETWEEN '17:01:00' AND '21:00:00' THEN 'Evening'
END AS time_of_day

FROM transactions
GROUP BY ALL;

