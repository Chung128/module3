use quan_li_sinh_vien;
-- Hiển thị số lượng sinh viên ở từng nơi
select s.address,count(s.address) as so_luong
from student s
group by s.address;

-- Tính điểm trung bình các môn học của mỗi học viên
select s.student_name, avg(m.mark) as diem_trung_binh
from student s
join mark m on s.student_id=m.student_id
group by s.student_name;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 10
select s.student_name, avg(m.mark) as diem_trung_binh
from student s
join mark m on s.student_id=m.student_id
group by s.student_name
having diem_trung_binh > 10 
;
select s.student_name, avg(m.mark) as diem_trung_binh
from student s
join mark m on s.student_id=m.student_id
group by s.student_name
order by diem_trung_binh desc
limit 1;
-- select s.student_name, avg(m.mark) as diem_trung_binh
-- from student s
-- join mark m on s.student_id=m.student_id
-- group by s.student_name
-- having avg(mark) >= all(select avg(mark) from mark group by mark.student_id)
-- ;
-- SELECT S.Student_Id, S.Student_Name, AVG(Mark)
-- FROM Student S join Mark M on S.Student_Id = M.Student_Id
-- GROUP BY S.Student_Id, S.Student_Name
-- HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.Student_Id);