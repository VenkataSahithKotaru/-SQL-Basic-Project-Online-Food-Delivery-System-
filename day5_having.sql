use online_food_del;
--- 1. find cities with morenthan 5 total orders--

select r.city,count(o.order_id) as total_orders from
restaurants r join orders o 
on r.restaurant_id=o.restaurant_id
group by r.city
having count(o.order_id)>5;

--- 2.show food items that earned more than 1000/- in total revenue--

select m.item_name, round(sum(m.price*o.quantity),2) as total_revenue
from menu_item m join order_details o 
on m.item_id=o.item_id
group by m.item_name
having round(sum(m.price*o.quantity),2)>1000;

--- 3.list customers who placed more than 3 orders--

select c.customer_name,count(o.order_id) as total_num_of_orders from
customers c join orders o on
c.customer_id=o.customer_id
group by c.customer_name
having count(o.order_id)>3
order by count(o.order_id) desc;


---- 4. display menu items that were ordered more than 2 times--

select m.item_name, count(o.order_id) as num_of_orders
from menu_item m join order_details o
on m.item_id=o.item_id
group by m.item_name
having count(o.order_id)>2
order by count(o.order_id) desc;

---  5.find restaurants with total revenue > 5000/-

select r.rest_name,round(sum(m.price*o.quantity),2) as total_revenue
from restaurants r join menu_item m on r.restaurant_id=m.restaurant_id
join order_details o on m.item_id=o.item_id
group by r.rest_name
having total_revenue>5000
order by total_revenue desc;
