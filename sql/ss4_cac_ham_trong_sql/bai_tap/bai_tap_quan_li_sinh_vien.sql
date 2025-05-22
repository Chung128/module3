use quan_li_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * , max(s.credit) as max_credit
from subjects s;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_id,s.sub_name,max(m.mark) as max_point
from subjects s
join mark m;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự
--  điểm giảm dần
select s.*,avg(m.mark) as diem_tb
from student s
join mark m on s.student_id=m.student_id
group by s.student_id
order by diem_tb desc;