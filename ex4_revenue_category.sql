--Exercise 4 - Revenue Per Category
--Get the revenue generated for each category for the month of 2014 Jan
--Tables : orders, order_items, products, and categories
--Data should be sorted in ascending order by category_id
--Output should contain all fields from categories  along with revenue as category_revenue
--Consider only COMPLETE and CLOSED

SELECT * 
FROM orders;

SELECT * 
FROM order_items;

SELECT *
FROM products;

SELECT * 
FROM categories;

SELECT 
	c.category_id,
	c.category_department_id,
	c.category_name,
	round(sum(oi.order_item_subtotal)::numeric, 2) as category_revenue
FROM categories as c 
	JOIN products AS p
		ON p.product_category_id = c.category_id
	JOIN order_items as oi
		ON p.product_id = oi.order_item_product_id 
	JOIN orders as o
		ON o.order_id = oi.order_item_order_id
		AND to_char(order_date, 'yyyy-MM') = '2014-01'
		AND order_status IN ('CLOSED', 'COMPLETE')	
GROUP BY 1, 2, 3
ORDER BY 1 ASC


--lecture solution 
SELECT c.category_id,
	c.category_department_id,
	c.category_name,
	round(sum(oi.order_item_subtotal)::numeric, 2) as category_revenue
FROM categories as c
	JOIN products as p
		ON c.category_id = p.product_category_id
	JOIN order_items as oi
		ON p.product_id = oi.order_item_product_id
	JOIN orders as o
		ON o.order_id = oi.order_item_order_id
		AND order_status IN ('CLOSED', 'COMPLETE')
		AND to_char(order_date, 'yyyy-MM') = '2014-01'
GROUP BY 1, 2, 3
ORDER BY 1
	