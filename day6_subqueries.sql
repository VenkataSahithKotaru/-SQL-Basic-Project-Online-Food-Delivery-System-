use online_food_del;

-- 1.show all menu items,price along with the average price of all items--

select item_name,price,(select avg(price) from menu_item) as avg_price
 from menu_item;




--- 2.show customers who placed at least one order---

select customer_id,customer_name from customers
where customer_id in (select customer_id from orders);







--- 3.show each food item and how much more it costs than the average--

select item_name,price,(select avg(price) from menu_item) as avg_price,
(price-(select avg(price) from menu_item)) as costs_more_than_avg 
from menu_item; 





--- 4.list food items that cost more than the average price--

select item_name,price from menu_item where price > (select avg(price) from menu_item);







--- 5.show customers who havent placed any orders---
 
 select customer_name from customers where customer_id not in (select customer_id from orders);

