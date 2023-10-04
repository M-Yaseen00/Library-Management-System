create database Quaid_e_Azam_Library_Management_System
use [Quaid_e_Azam_Library_Management_System]

Create table Book(
book_id int NOT NULL primary key,
book_title varchar(50),
book_price int,
book_pages int,
book_category varchar(50),
book_edition varchar(30),
);

drop table Book
alter table Book

Create Table Rack(
rack_id int NOT NULL primary key,
rack_row varchar(20),
rack_size int,
staff_i   int foreign key references Staff(staff_id),
book_id int foreign key references Book(book_id)
);
drop table Rack
alter table Rack


Create Table Author(
author_code int NOT NULL primary key,
author_name varchar(100),
author_subject varchar(50),
author_qualification varchar(50),
author_country varchar(50),
book_id int foreign key references Book(book_id)
);

drop table Author
alter table Author

Create Table Staff(
staff_id int NOT NULL Primary Key,
staff_name varchar(100),
staff_type varchar(50),
staff_address varchar(100),
staff_phno int,
book_id int foreign key  references Book(book_id)
);
drop table Staff
alter table Staff

Create Table Student(
student_rollno int NOT NULL Primary Key,
student_name varchar(100),
student_email varchar(100),
student_department varchar(100),
student_phno int,
book_id int foreign key  references  Book(book_id)
);
drop table Student
alter table Student

Create Table Receipt(
receipt_id int NOT NULL Primary Key,
receipt_name varchar(100),
receipt_role varchar(100),
receipt_email varchar(70),
receipt_phno int,
book_id int foreign key  references Book(book_id),
student_rollno int foreign key  references Student(student_rollno)
);
drop table Receipt
alter table Receipt

---------------------------------------------------------------------------------------------------------
--insertion 

select * from Book

insert into [Book] values(67,       'Dr.faustus',         700,    1012, 'English',     '5th'),
(26,       'Ice candy man',      900,    775,   'literature',    '8th'),   
(68,       'Moth Smoke',         678,    1002,  'linguistics',   '4th'),
(90,       'Oedipus Rex',        950,    660,   'Sementics',     '2nd'),   
(41,       'Paradise Lost',      890,    1120,  'literature',    '3rd'),
(44,       'Maze Novel',         990,    1340,  'Novel',         '1st'),
(78,       'Maxe Beth',          1000,   1340,  'linguistics',   '7th');   

--SEARCH
select * from Book where book_id=26;

--UPDATE
update Book set book_edition = '6th' WHERE book_id = 78
select book_id, book_edition from Book

--delete
delete from Book where book_title = 'Maze Novel';

--To check table in database
sp_help

--To check attributes of Table in database
sp_help Book

--some built-in functions
select * from Book;
select sum  (book_id) from Book;
select count(book_id) from Book where book_price < 400;
select AVG  (book_id) from Book;
select MIN  (book_id) from Book;
select MAX  (book_id) from Book;

--Group by class
select COUNT (book_id), book_pages
from Book
GROUP BY book_pages;


----------------------------------------------------------------------------------------------------------

select * from Author

insert into [Author] values(094, 'ShakeSphare',           'Semantics',            'PHD in Sign System',   'USA',    67),
(1768,     'Gorge Orwell',       'Research Methodology',  'PHD in Linguistics',   'Canada',     26),
(6583,     'BapsiSidhwa',        'PsychoLinguistics',     'Mphil English',        'India',      68),
(098,      'MohsinHamid',        'Pakistani Literature',  'PHD in Literature',    'Pakistan',   90),  
(099,      'HamadTarar',         'Pakistani History',     'PHD in History',       'japan',      41),  
(124,      'Cristopher Marlowe', 'Classical Drama',       'PHD in Plays',         'United Kingdom',44),
(784,      'Sphocles',           'Classical Poetry',      'PHD in Poetry',        'japan',      78);

--SEARCH
select * from Author where author_code=098;

--UPDATE
update Author set author_country = 'china' WHERE author_code = 784
select author_code, author_country from Author

--delete
delete from Author where author_name = 'HamadTarar';

--To check table in database
sp_help

--To check attributes of Table in database
sp_help Author

--some Built-in functions
select * from Author;
select sum  (author_code) from Author;
select count(author_code) from Author where author_country = 'japan';
select AVG  (author_code) from Author;
select MIN  (author_code) from Author;
select MAX  (author_code) from Author;

--Group by class
select COUNT (author_code), author_country
from Author
GROUP BY author_country;

-------------------------------------------------------------------------------------------------------------------------------
select * from Rack

insert into [Rack] values
(147,     '5th',       15,        04,       67),
(173,     '8th',       12,        05,       26),
(608,     '6th',       14,        06,       68),
(720,     '4th',       10,        07,       90),  
(084,     '3rd',       19,        08,       41);



--SEARCH
select * from Rack where rack_size=084;

--UPDATE
update Rack set rack_size =  16 WHERE rack_id  = 084
select rack_id, rack_size from Rack

--delete
delete from Rack where rack_row = '5th';

--To check table in database
sp_help

--To check attributes of Table in database
sp_help Rack

--some Built-in functions
select * from Rack;
select sum  (rack_id) from Rack;
select count(rack_id) from Rack where rack_row = '8th';
select AVG  (rack_id) from Rack;
select MIN  (rack_id) from Rack;
select MAX  (rack_id) from Rack;

--Group by class
Select rack_row, count(*) from Rack group by rack_row

---------------------------------------------------------------------------------------------------------------------------

select * from Staff

insert into [Staff] values(04,       'Ali',      'Maintain-book-order',     'Gulzar-e-Madina',  0309737930,  67)
insert into [Staff] values(05,       'Ahmad',    'Maintain_discipline',     'Shadman Colony',   0342709456,  26)   
insert into [Staff] values(06,       'Babar',    'staff_manager',           'Chanab Ocharad',   0317327840,  68)
insert into [Staff] values(07,       'Badar',    'Maintain_discipline',     'Gulshan Colony',   0327098709,  90)   
insert into [Staff] values(08,       'Zunair',   'Guard',                   'River Garden',     0312780954,  41)

--SEARCH
select * from Staff where staff_id=07;

--UPDATE
update Staff set staff_phno = 03458924854 WHERE staff_id = 08
select staff_id, staff_phno from Staff

--delete
delete from Staff where staff_name = 'Ahmad';

--To check table in database
sp_help

--To check attributes of Table in database
sp_help Staff
--some built-in functions
select * from Staff;
select sum  (staff_id) from Staff;
select count(staff_id) from Staff where staff_type = 'Guard';
select AVG  (staff_id) from Staff;
select MIN  (staff_id) from Staff;
select MAX  (staff_id) from Staff;

--Group by class
select COUNT (staff_id), staff_address
from Staff
GROUP BY staff_address;
-----------------------------------------------------------------------------------------------------------------------

select * from Student

insert into [Student] values(10,       'Yasir Hussain',       'Yasir@gmail.com',      'BSSE',         0309733900,   67),
(11,       'Muhammad Ali',        'Ali@gmail.com',        'MSEnglish',    0344018746,     26),   
(12,       'Fatima Tahir',        'Fatima@gmail.com',     'MSCS',         0317092846,     68),
(13,       'Muhammad Yaseen',     'Yaseen@gmail.com',     'BSCS',         0302739693,     90),   
(14,       'Abdullah',            'Abdullah@gmail.com',   'BSIT',         0345859268,     41),
(15,       'Ahmad Ali',           'Ahmad@gmail.com',      'BSChemistry',  0325794739,     44);

--SEARCH
select * from Student where student_rollno = 13;

--UPDATE
update Student set student_phno = 03026795360 WHERE student_rollno = 12
select student_rollno, student_phno from Student

--delete
delete from Student where student_name = 'Ahmad Ali';

--To check table in database
sp_help

--To check attributes of Table in database
sp_help Student

--some built-in function
select * from Student;
select sum  (student_rollno) from Student;
select count(student_rollno) from Student where student_name = 'Abdullah';
select AVG  (student_rollno) from Student;
select MIN  (student_rollno) from Student;
select MAX  (student_rollno) from Student;

--Group by class
select COUNT (student_department), student_rollno
from Student
GROUP BY student_rollno;
----------------------------------------------------------------------------------------------------------------

select * from Receipt

insert into [Receipt] values(16,       'Imran Ali',     'Issue_book',                  'Imran@gmail.com',       0303670432,  67,  10),
(17,       'Warda khan',    'Enter_data_of_book_barrow',   'Warda@gmail.com',       0345680046,  26,   11),  
(18,       'Anaya Zoi',     'Enter_data_of_students',      'anaya@gmail.com',       0344603758,  68,   12);   

--SEARCH
select * from Receipt where receipt_id= 17;

--UPDATE
update Receipt set receipt_email = 'khan@gmail' WHERE receipt_id = 17
select receipt_id, receipt_email from Receipt

--delete
delete from Receipt where receipt_name = 'Anaya Zoi';

--To check table in database
sp_help

--To check attributes of Table in database
sp_help Receipt

--Built-in functions
select * from Receipt;
select sum  (receipt_id) from Receipt;
select count(receipt_id) from Receipt where receipt_id > 15;
select AVG  (receipt_id) from Receipt;
select MIN  (receipt_id) from Receipt;
select MAX  (receipt_id) from Receipt;

--Group by class
select SUM (receipt_id), receipt_role from Receipt
GROUP BY receipt_role;