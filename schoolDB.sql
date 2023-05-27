-- create School database
create database School;

use School;

-- create tables
create table School(school_id int, school_name varchar(26), school_pincode int, school_contact int, school_type varchar(10));

create table Teachers(teacher_id int, teacher_name varchar(26), teacher_contact int, teacher_subject varchar(20), stud_id varchar(12), subj_id varchar(7));

create table Students(student_id varchar(12), student_name varchar(26), student_contact int, student_dob date, sub_id varchar(7));

create table Subjects(subject_id varchar(7), subject_name varchar(20), subject_credits int, subject_type varchar(5), teach_id int);

create table Examination(exam_id int, exam_hall varchar(5), exam_date date, stud_attendance float, subj_id varchar(7), stud_id varchar(7));

-- insert records into School table
insert into School values(12345, 'Presidency School', 560064, 987654321, 'private');

insert into School values(23456, 'Government High School', 560046, 876543219, 'government');

insert into School values(34567, 'Navodaya School', 560026, 765432198, 'government');

insert into School values(45678, 'Cordial School', 560062, 654321987, 'private');

insert into School values(56789, 'Kendriya Vidyalaya', 560056, 543219876, 'government');

-- insert records into Teachers table
insert into Teachers values(2312, 'Vinay', 988776654, 'Mathematics', '20211CSE0408','MAT1001' );

insert into Teachers values(3423, 'Jayashree', 877665543, 'Science', '20211CSE0421','SCI1001' );

insert into Teachers values(4534, 'Ravikumar', 766554321, 'English', '20211CSE0413','ENG1001' );

insert into Teachers values(5645, 'Parvathi', 655443322, 'Hindi', '20211CSE0422','HIN1001' );

insert into Teachers values(6756, 'Ramesh', 544332219, 'Social', '20211CSE0430','SOC1001' );

-- insert records into Students table
insert into Students values('20211CSE0408', 'Harshini', 986532871, '2003-12-11', 'MAT1001');

insert into Students values('20211CSE0413', 'Sushma', 865328719, '2002-04-24', 'ENG1001');

insert into Students values('20211CSE0421', 'Sinchana', 653287198, '2004-06-28', 'SCI1001');

insert into Students values('20211CSE0422', 'Kushal', 532871985, '2003-06-02', 'HIN1001');

insert into Students values('20211CSE0421', 'Venkat', 532871985, '2003-08-20', 'SOC1001');

-- insert records into Subjects table
insert into Subjects values('ENG1001','English',3,'core',4534);

insert into Subjects values('HIN1001','Hindi',2,'open',5645);

insert into Subjects values('SOC1001','Social',4,'core',6756);

insert into Subjects values('MAT1001','Mathematics',4,'core',2312);

insert into Subjects values('SCI1001','Science',4,'core',3423);

-- adding constraints
-- adding primary key and not null to School table
alter table School add constraint pri primary key(school_id);

alter table School modify school_pincode int not null;

alter table School modify school_contact int not null;

-- adding primary key and not null to Students table
alter table Students add constraint pri primary key(student_id);

alter table Students modify student_contact int not null;

alter table Students modify sub_id varchar(7) not null;

-- adding primary key, not null and foreign key to Subjects table
alter table Subjects add constraint pri primary key(subject_id);

alter table Subjects modify subject_type varchar(5) not null;

alter table Subjects modify subject_name varchar(20) not null;

alter table Subjects add constraint fk_teach_id foreign key(teach_id) references Teachers(teacher_id);

-- adding primary key, not null and foreign key to Teachers table
alter table Teachers add constraint pri primary key(teacher_id);

alter table Teachers modify teacher_subject varchar(20) not null;

alter table Teachers add constraint fk_stud_id foreign key(stud_id) references Students(student_id);

-- adding primary key, not null, check constraint and foreign key to Examination table
alter table Examination add constraint pri primary key(exam_id);

alter table Examination modify exam_date date not null;

alter table Examination modify exam_hall varchar(5) not null;

alter table Examination add constraint ck_stud_attendance check(stud_attendance>75);

alter table Examination add constraint fk_stud_id foreign key(stud_id) references Students(student_id);
