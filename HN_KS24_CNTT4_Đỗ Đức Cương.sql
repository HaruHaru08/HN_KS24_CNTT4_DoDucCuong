create database db_KTTH;
use db_KTTH;

create table reader(
	reader_id int primary key auto_increment,
    reader_name varchar(100) not null,
    phone varchar(15) unique,
    register_date Date default(current_date())
);

create table book(
	book_id int primary key,
    book_title varchar(150) not null,
    author varchar(100),
    publish_year int check(publish_year >= 1900)
);

create table borrow(
	reader_id int,
    book_id int,
    borrow_date date default(current_date()),
    return_date date,
    primary key (reader_id,book_id),
    foreign key (reader_id) references reader(reader_id),
    foreign key (book_id) references book(book_id)
);

alter table reader add email varchar(100) unique;
alter table book modify author varchar(150);
alter table borrow add constraint check(return_date>=borrow_date);

select * from reader;
insert into reader(reader_name,phone,email,register_date) value
('Nguyễn Văn An','0901234567','an.nguyen@gmail.com','2024-09-01'),
('Trần Thị Bình','0912345678','binh.tran@gmail.com','2024-09-05'),
('Lê Minh Châu','0923456789','chau.le@gmail.com','2024-09-10');

select * from book;
insert 	into book(book_id,book_title,author,publish_year) value 
(101,'Lập trình C căn bản','Nguyễn Văn A','2018'),
(102,'Cơ sở dữ liệu','Trần Thị B','2020'),
(103,'Lập trình Java','Lê Minh C','2019'),
(104,'Hệ quản trị MySQL','Phạm Văn D','2021');

select * from borrow;
insert 	into book(reader_id,book_id,borrow_date,return_date) value
(1,101,'2024-09-15'),
(1,102,'2024-09-15','2024-09-25'),
(2,103,'2024-09-18'); 
