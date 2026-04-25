--Exercise 5 - Product Count Per Department
--Get the count of products for each department
--Tables : departments, categories, products
--Data should be sorted in ascending order by department_id
--Output should contain all the fields from departments and the product counts as product_count

SELECT * 
FROM departments;

SELECT *
FROM categories;

SELECT *
FROM products;


--Returns products per category with dept data
SELECT COUNT(DISTINCT p.product_id) as products_per_category,
	d.department_id,
	d.department_name,
	c.category_name	
FROM departments as d
	JOIN categories as c
		ON d.department_id = c.category_department_id
	JOIN products as p
		on c.category_id = p.product_category_id
GROUP BY c.category_name, d.department_id
ORDER BY 2

--Returns products per dept
SELECT 	
	d.department_id,
	d.department_name,
	COUNT(DISTINCT p.product_id) as product_count
FROM products as p
	JOIN categories as c
		on c.category_id = p.product_category_id
	JOIN departments as d
		ON d.department_id = c.category_department_id
GROUP BY d.department_id, d.department_name
ORDER BY 1

--lecture solution
--department is parent table 
--look at one to many relationships
SELECT d.department_id,
	d.department_name,
	count(*) AS department_count
FROM departments as d
	JOIN categories as c
		ON d.department_id = c.category_department_id
	JOIN products as p
		on c.category_id = p.product_category_id
GROUP BY 1, 2
ORDER BY 1