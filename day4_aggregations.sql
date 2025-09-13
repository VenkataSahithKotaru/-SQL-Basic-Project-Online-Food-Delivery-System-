use online_food_del;

---1.count how many orders each customer placed--



select c.customer_name,count(o.order_id) as total_num_of_orders 
from customers c join orders o 
on c.customer_id=o.customer_id 
group by c.customer_name;




--2.show total revenue earned from each city--



select r.city,round(sum(m.price*o.quantity),2) as total_revenue
from restaurants r join menu_item m on r.restaurant_id=m.restaurant_id
join order_details o on m.item_id=o.item_id
group by r.city;




--3.find the total num of times each food item was ordered--



select distinct m.item_name,count(o.item_id) as no_of_times_ordered
from menu_item m join order_details o 
on m.item_id=o.item_id
group by m.item_name;


--4.calculate the average order value for each customer city--


select city_orders.city,
       round(avg(city_orders.order_total),2) as average_order_value
from (
    select r.city,
           o.order_id,
           sum(m.price * od.quantity) as order_total
    from orders o join restaurants r 
        on o.restaurant_id = r.restaurant_id join order_details od 
        on o.order_id = od.order_id join menu_item m 
        on od.item_id = m.item_id
    group by r.city, o.order_id
) as city_orders
group by city_orders.city;




--5.find how many different food items were orderd per restaurant--

select r.rest_name,count(distinct m.item_name) as diff_items_ordered
from restaurants r join orders o on r.restaurant_id=o.restaurant_id 
join order_details od on o.order_id=od.order_id
join menu_item m
on  od.item_id=m.item_id
group by r.rest_name;






