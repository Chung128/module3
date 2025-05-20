create database quan_li_ban_hang;
use quan_li_ban_hang;
create table customer(
customer_id int primary key,
customer_name varchar(100),
customer_age int
);
create table product(
product_id int primary key,
product_name varchar(100),
product_price double
);
create table oorder(
order_id int primary key,
customer_id int,
order_date date,
order_total_price double,
foreign key(customer_id) references customer(customer_id)
);
create table order_detail(
order_id int,
product_id int,
order_qty varchar(100),
primary key(order_id,product_id),
foreign key(order_id) references oorder(order_id),
foreign key(product_id) references product(product_id)
);