use online_food_del;

--1.find name and price of all food items costing more than 300

select item_name,price from menu_item where price > 300;










--2.list top5 cheapest food items

select item_name,price from menu_item order by price asc limit 5;








--3. list all restaraunts located in delhi

select rest_name,city from restaurants where city='delhi';






--4. show top 3 most expensive menu items

select item_name,price from menu_item order by price desc limit 3;






--5.List order IDs where quantity>2

select order_id from order_details where quantity > 2;