-- Bước 1: Tạo cơ sở dữ liệu demo
create database demo;
use demo;

-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
create table products(
pro_id int primary key ,
pro_code int,
pro_name varchar(50),
pro_price double,
pro_amount int,
pro_description varchar(200),
pro_status varchar(200)
);
INSERT INTO products (pro_id, pro_code, pro_name, pro_price, pro_amount, pro_description, pro_status)
VALUES 
(1, 1001, 'Laptop Dell XPS 13', 29999.99, 10, 'Laptop siêu mỏng, hiệu năng cao', 'Còn hàng'),
(2, 1002, 'Điện thoại iPhone 15', 25999.00, 15, 'Smartphone cao cấp của Apple', 'Còn hàng'),
(3, 1003, 'Tivi LG 55 inch', 13999.50, 5, 'Smart TV 4K UHD màn hình lớn', 'Hết hàng'),
(4, 1004, 'Máy giặt Samsung Inverter', 8999.00, 8, 'Giặt sạch, tiết kiệm điện', 'Còn hàng'),
(5, 1005, 'Quạt điện Mitsubishi', 1499.90, 20, 'Quạt mát êm ái, bền bỉ', 'Còn hàng');

-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_pro_code on products(pro_code);
-- Tạo Composite(phức hợp) Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index i_pro_name_price on products(pro_name,pro_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
drop index i_pro_name_price on products;
drop index i_pro_code on products;
explain select * from products where pro_name='Quạt điện Mitsubishi';

-- So sánh câu truy vấn trước và sau khi tạo index
create unique index i_pro_name_price on products(pro_name,pro_price);
explain select * from products where pro_name='Quạt điện Mitsubishi';

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_info_product as 
select pro_code,pro_name,pro_price,pro_status
from products;

-- Tiến hành sửa đổi thông tin trong view
update view_info_product
set pro_status = 'hết hàng '
where pro_code =1001;

-- Tiến hành xóa thông tin trong view
delete from view_info_product
where pro_code= 1005;

-- Tiến hành xoá view
drop view view_info_product;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng products
delimiter //
create procedure procedure_products()
  begin
  select * from products;
  end //
delimiter ;
call procedure_products();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_products(
IN id int ,
IN p_code int,
IN p_name varchar(50),
IN p_price double,
IN p_amprocedure int,
IN p_description varchar(200),
IN p_status varchar(200)
)
  begin
 insert into products(pro_id, pro_code, pro_name, pro_price, pro_amount, pro_description, pro_status)
 values (id,p_code,p_name,p_price,p_amprocedure,p_description,p_status);
  end //
delimiter ;
call add_products(6,1006,'Quần Đùi',100000.0,100,'bao bọc cánh cim ziệt','còn hàng');
-- Tạo store procedure sửa thông tin sản phẩm theo id
SET SQL_SAFE_UPDATES = 0;
delimiter //
create procedure update_products(
IN id int ,
IN pro_code int,
IN pro_name varchar(50),
IN pro_price double,
IN pro_amount int,
IN pro_description varchar(200),
IN pro_status varchar(200)
)
  begin
 update products
 set pro_code=pro_code,
 pro_name=pro_name,
 pro_price=pro_price,
 pro_amount=pro_amount,
 pro_description=pro_description,
 pro_status=pro_status
 where pro_id=id;
  end //
delimiter ;
call update_products(5,1005,'Quần Sịp',15000.0,100,'nâng tầm cánh chim việt','còn hàng');

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_products(
IN id int
)
  begin
 delete from products
 where pro_id=id;
  end //
delimiter ;
call delete_products(6);