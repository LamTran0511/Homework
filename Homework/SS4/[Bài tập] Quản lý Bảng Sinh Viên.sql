create database truongdaihoc;
create schema quanglysinhvien;
create type enum_sex as ENUM ('Nam','Nu','Khac');
create table students
(
    id         serial primary key,
    full_name  varchar(200) not null,
    gender     enum_sex default ('Khac'),
    birth_year int,
    major      varchar(50),
    gpa        decimal(3, 2)
);
INSERT INTO students (id, full_name, gender, birth_year, major, gpa)
VALUES (1, 'Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       (2, 'Trần Thị Bích Ngọc', 'Nu', 2001, 'Kinh tế', 3.2),
       (3, 'Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
       (4, 'Phạm Minh Anh', 'Nu', 2000, 'Luật', 3.9),
       (5, 'Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       (6, 'Lưu Đức Tài', 'Nam', 2004, 'Cơ khí', NULL),
       (7, 'Võ Thị Thu Hằng', 'Nu', 2001, 'CNTT', 3.0);
INSERT into students(id,full_name,gender,birth_year, major, gpa)
VALUES ('8','Phan Hoàng Nam','Nam','2003','CNTT','3.8');
UPDATE students set gpa = 3.4 where full_name = 'Lê Quốc Cường';
DELETE from students where gpa is null;
select * from students where major = 'CNTT' and gpa >=3.0
limit 3;
select distinct students.major from students;
select * from students where major = 'CNTT' order by gpa desc, full_name asc;
SELECT * FROM students WHERE full_name LIKE 'Nguyễn%';
select * from students where birth_year between 2001 and 2003;