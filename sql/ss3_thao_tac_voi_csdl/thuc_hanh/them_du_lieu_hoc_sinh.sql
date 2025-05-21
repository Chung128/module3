use quan_li_sinh_vien;
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
INSERT INTO Student (Student_Name, Address, Phone, Status, Class_Id)
VALUES ('Chung', 'Quảng Binh', '0912113113', 1, 1);
INSERT INTO Student (Student_Name, Address, Status, Class_Id)
VALUES ('Bình', 'Đà Nẵng', 1, 1);
INSERT INTO Student (Student_Name, Address, Phone, Status, Class_Id)
VALUES ('Đông', 'Kon Tôm', '0123123123', 0, 2);
INSERT INTO Subjects
VALUES (1, 'Toán', 5, 1),
 (2, 'Văn', 6, 1),
 (3, 'Anh', 5, 1),
 (4, 'Hóa', 10, 1);
 INSERT INTO Mark (Sub_Id, Student_Id, Mark, exam_times)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);