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
order_qty int,
primary key(order_id,product_id),
foreign key(order_id) references oorder(order_id),
foreign key(product_id) references product(product_id)
);
INSERT INTO customer (customer_id, customer_name, customer_age) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);
INSERT INTO product (product_id, product_name, product_price) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);
INSERT INTO oorder (order_id, customer_id, order_date, order_total_price) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);
INSERT INTO order_detail (order_id, product_id, order_qty) VALUES
(1, 1, '3'),
(1, 3, '7'),
(1, 4, '2'),
(2, 1, '1'),
(2, 5, '8'),
(3, 1, '4');
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.order_id,o.order_date,o.order_total_price 
from oorder o;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.* ,group_concat(p.product_name) 
from order_detail detail
join product p on p.product_id=detail.product_id
join oorder oo on oo.order_id=detail.order_id
join customer c on c.customer_id=oo.customer_id
group by c.customer_id;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.*
from customer c
left join oorder o on c.customer_id = o.customer_id
left join order_detail od on o.order_id = od.order_id
where od.order_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng
--  loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select 
o.order_id,
o.order_date,
sum(od.order_qty*p.product_price) as total_price 
from oorder o
join order_detail od on od.order_id=o.order_id
join product p on p.product_id=od.product_id
group by o.order_id,o.order_date;