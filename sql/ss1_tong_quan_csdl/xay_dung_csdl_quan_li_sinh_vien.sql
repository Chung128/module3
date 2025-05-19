create database student_management;
use student_management;
create table Class(
id int,
`name` varchar(100)
);
create table Teacher(
id int,
`name` varchar(100),
age int,
country varchar(100)
);
select * from Class;
select id from Teacher;
select * from Teacher;