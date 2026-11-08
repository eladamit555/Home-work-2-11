SELECT * FROM products
JOIN nutritions
on products.product_id = nutritions.product_id;

SELECT * FROM orders
JOIN products_orders
on orders.order_id = products_orders.order_id 
JOIN products
on products.product_id = products_orders.product_id;

INSERT INTO products_orders VALUES(1, 3, 1),
(2, 15, 1), (3, 12, 1), (4, 7, 1), (5, 21, 1);

UPDATE orders  
SET total_price = (SELECT sum(products.price * products_orders.amount)
FROM products_orders
JOIN products
on products_orders.product_id = products.product_id
WHERE products_orders.order_id = orders.order_id);

SELECT
min(total_price),
max(total_price),
avg(total_price)
FROM orders;

SELECT customer_name, count(*)
FROM orders
GROUP by customer_name
ORDER by count(*) DESC
LIMIT 1;

SELECT
product_id, sum(amount)
FROM products_orders
GROUP by product_id
ORDER by sum(amount) DESC
LIMIT 1;

SELECT
product_id, sum(amount)
FROM products_orders
GROUP by product_id
ORDER by sum(amount) ASC
LIMIT 1;

SELECT
avg(amount)
FROM products_orders;

SELECT
category.name, category.category_id, sum(amount)
FROM products_orders
JOIN products
on products.product_id = products_orders.product_id
JOIN category
on products.category_id = category.category_id
GROUP by category.category_id
ORDER by sum(amount) DESC
LIMIT 1;

SELECT
category.name, category.category_id, sum(amount)
FROM products_orders
JOIN products
on products.product_id = products_orders.product_id
JOIN category
on products.category_id = category.category_id
GROUP by category.category_id
ORDER by sum(amount) ASC
LIMIT 1;






