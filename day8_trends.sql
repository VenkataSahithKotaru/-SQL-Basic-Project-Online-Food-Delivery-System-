use online_food_del;

-- 1.monthly order trends

select month(order_date) as order_month,monthname(order_date) as ordr_month, count(order_id) as total_orders
from orders
group by monthname(order_date),month(order_date)
order by order_month;

-- insights: tracking the monthly growth in orders
-- peak ordering months
-- impacts of festivals, holidays,weather


-- 2.top 3 cities by revenue

select c.city,round(sum(m.price*od.quantity),2) as revenue
from customers c
join orders o on c.customer_id=o.customer_id
join order_details od on o.order_id=od.order_id
join menu_item m on od.item_id=m.item_id
group by c.city
order by revenue desc
limit 3;

-- insights: top3 cities with highest revenue
-- improving marketing,publicity at these cities 





-- 3. number of unique customers per city

select city,count(distinct customer_id)  as unique_customers from customers
group by city
order by unique_customers desc; 

-- insights: cities with hghest num of customers
-- publishing,marketing more at ahmedhabad,chennai,kolkata can increase in customers







-- 4.most frequently ordered items

select m.item_name,count(o.order_id) as num_of_orders 
from menu_item m join order_details o
on m.item_id=o.item_id
group by m.item_name
order by num_of_orders desc;

-- insights: top performing items
-- fishcurry,momos,alooparatha arethe top3 items in orders



-- 5.restaurants with low order counts(<30)

select r.rest_name,count(distinct o.order_id) as order_counts
from restaurants r join orders o 
on r.restaurant_id=o.restaurant_id
group by r.rest_name
having order_counts < 30
order by order_counts desc;

-- insights: restaurants with lowest order_counts
-- publishing or decreasing the prices at those restaurants