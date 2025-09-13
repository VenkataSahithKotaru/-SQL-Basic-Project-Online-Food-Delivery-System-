use online_food_del;

----1. show all orders along with rest name from which they were placed---

select o.order_id,r.rest_name from orders o join restaurants r on o.restaurant_id=r.restaurant_id;






------2. show customer names andorder dates for orders placed injan 2023--

select c.customer_name,o.order_date,o.order_id
from customers c join orders o 
on c.customer_id=o.customer_id 
where o.order_date between '2023-01-01' and '2023-01-31';






------3.list all customers along with their city who placed an order on or after '2023-01-01'

select c.customer_name,c.city,o.order_date 
from customers c join orders o 
on c.customer_id=o.customer_id
where o.order_date >='2023-01-01';






--4. show restaraunt names and order IDs for orders placed from restaruants in mumbai

select r.rest_name,o.order_id
from restaurants r join orders o
on r.restaurant_id=o.restaurant_id
where r.city='Mumbai';





--5.customers who have ordered from a specific restaurant(Royal Garden)--

select o.customer_id,c.customer_name,r.rest_name 
from orders o join restaurants r
on o.restaurant_id=r.restaurant_id
join customers c on o.customer_id=c.customer_id
where r.rest_name='Royal Garden';