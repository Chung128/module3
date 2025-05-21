use c0225g1;
-- + Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
SELECT c.name AS class_name, COUNT(s.id) AS student_count
FROM class c
JOIN student s ON c.id = s.class_id
GROUP BY c.name;
-- + Tính điểm lớn nhất của mỗi các lớp
SELECT c.name AS class_name, MAX(s.point) AS max_point
FROM class c
JOIN student s ON c.id = s.class_id
GROUP BY c.name;
-- + Tình điểm trung bình của từng lớp
SELECT c.name AS class_name, ROUND(AVG(s.point), 2) AS avg_point
FROM class c
JOIN student s ON c.id = s.class_id
GROUP BY c.name;
-- + Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.
SELECT name, birthday, 'student' AS type
FROM student
UNION
SELECT name, birthday, 'instructor' AS type
FROM instructor;
-- + Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
SELECT *
FROM student
ORDER BY point DESC
LIMIT 3;
-- + Lấy ra các học viên có điểm số là cao nhất của trung tâm.
SELECT *
FROM student
WHERE point = (
  SELECT MAX(point) FROM student
);