create database quanlythongtinsinhvien;
create schema quanlythongtinsinhvienschema;
CREATE TABLE students
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(50),
    age   INT,
    major VARCHAR(50),
    gpa   DECIMAL(3, 2)
);

INSERT INTO students (name, age, major, gpa)
VALUES ('An', 20, 'CNTT', 3.5),
       ('Bình', 21, 'Toán', 3.2),
       ('Cường', 22, 'CNTT', 3.8),
       ('Dương', 20, 'Vật lý', 3.0),
       ('Em', 21, 'CNTT', 2.9);
INSERT INTO students (name, age, major, gpa)
VALUES ('Hùng', 23, 'Hóa học', 3.4);
UPDATE students SET gpa = 3.6 WHERE name = 'Bình';
delete from students where gpa < 3.0;
select  name,major,gpa from students order by gpa DESC;
select distinct name from students where major = 'CNTT';
select name,gpa from students where gpa between 3.0 and 3.6;
select name from students where name ilike '%c%';
SELECT * FROM students ORDER BY name ASC LIMIT 3;
SELECT * FROM students ORDER BY name ASC LIMIT 3 OFFSET 1;