create schema if not exists customer_manager;
create type enum_sex as enum ('NAM','NU','KHAC');
create table if not exists customer
(
    customer_id  char(5) primary key,
    full_name    varchar(50)  not null,
    phone_number char(10)     not null unique,
    email        varchar(100) not null,
    sex          enum_sex default ('KHAC'),
    address      text
);
-- Sửa bảng:
ALTER table customer
    ALTER column full_name type varchar(50);
