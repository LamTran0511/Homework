CREATE DATABASE UniversityDB;
CREATE SCHEMA university;
CREATE TABLE Students
(
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50)  NOT NULL,
    last_name  VARCHAR(50)  NOT NULL,
    birth_date DATE,
    email      VARCHAR(200) NOT NULL UNIQUE
);
CREATE TABLE Courses
(
    course_id   INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits     INT
);
