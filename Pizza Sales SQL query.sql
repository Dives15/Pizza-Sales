USE Pizza_DB;

SELECT * FROM pizza_sales

SELECT SUM(total_price) AS total_revenue FROM pizza_sales;

SELECT SUM(total_price)/ count(DISTINCT order_id) AS average_order FROM pizza_sales;

SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

SELECT count(DISTINCT order_id) AS total_orders FROM pizza_sales;

SELECT FORMAT(CAST (SUM(quantity) AS DECIMAL) / COUNT(DISTINCT order_id), 'N2') FROM pizza_sales;

SELECT DATENAME(DW, order_date) as order_day, COUNT (DISTINCT(order_id)) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

SELECT DATENAME(MONTH, order_date) as order_day, COUNT (DISTINCT(order_id)) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date);

SELECT
	pizza_category, SUM(total_price)*100 / (SELECT SUM(total_price)from pizza_sales) AS percentage_pizzasales
	FROM pizza_sales
	GROUP BY pizza_category;

SELECT
	pizza_size, SUM(total_price) as total_sales, CAST(SUM(total_price)*100/ (SELECT SUM(total_price)from pizza_sales)  AS DECIMAL (10,2)) AS percentage_pizzasales
	FROM pizza_sales
	GROUP BY pizza_size
	ORDER BY percentage_pizzasales DESC;

SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC

SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC

SELECT * FROM pizza_sales
WHERE order_date IS NULL