create database student_management;
use student_management;
create table class(
id int primary key,
`name` varchar(100)
);
create table teacher(
id int,
`name` varchar(100),
age int,
country varchar(100)
);
select * from Class;
select id from Teacher;
select * from Teacher;
insert into class(id,name) values(6,'bình'),(5,'Khánh');
update class set name='thẻo lê' where id=5;
delete from class where id=6;
-- drop table class;
-- drop table Teacher;
-- drop database student_management;
-- drop database class;