

create database online_food_del;
use online_food_del;
create table customers
( customer_id int primary key,
customer_name varchar(60),
email varchar(60),
city varchar(60),
signup_date date
);

create table restaurants
( restaurant_id int primary key,
rest_name varchar(60),
city varchar(60),
reg_date date);

create table menu_item
(item_id int primary key,
restaurant_id int,
item_name varchar(60),
price decimal(10,2),
constraint fk_menu_rest
foreign key (restaurant_id)
references restaurants(restaurant_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id int,
    restaurant_id int,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

create table order_details
(orderdetail_id int primary key,
order_id int,
item_id int,
quantity varchar(60),
foreign key (order_id) references orders(order_id),
foreign key (item_id) references menu_item(item_id)
);
