SELECT * FROM DEPARTMENT

SELECT * FROM STUDENT

SELECT * FROM PROFESSOR

SELECT * FROM COURSE

SELECT * FROM CLASS

SELECT * FROM TAKES

create table department 
	(
		dept_id 		varchar2(10),
		dept_name 	varchar2(20) not null,
		office 		varchar2(20),
		constraint pk_department primary key(dept_id)
	)
	
create table student 
	(
		stu_id 		varchar2(10),
		resident_id 	varchar2(14) not null,
		name 		varchar2(10) not null,
		year 		int,
		address 		varchar2(10),
		dept_id 		varchar2(10),
		constraint pk_student 	primary key(stu_id),
		constraint fk_student 	foreign key(dept_id) references department(dept_id)
	)

create table professor 
	(
		prof_id 		varchar2(10) ,
		resident_id 	varchar2(14) 	not null,
		name 		varchar2(10) 	not null,
		dept_id 		varchar2(10),
		position 		varchar2(10),
		year_emp 	int,
		constraint 	pk_professor 	primary key(prof_id),
		constraint 	fk_professor 	foreign key(dept_id) 
				references department(dept_id)
	)

create table course 
	(
		course_id 	varchar2(10) ,
		title 		varchar2(14) 	not null,
		credit 		int,
		constraint 	pk_course 	primary key(course_id)
	)
	
create table class 
	(
		class_id 		varchar2(10) ,
		course_id 	varchar2(10),
		year 		int,
		semester 		int,
		division 		char(1),
		prof_id 		varchar2(10),
		classroom 	varchar2(9),
		enroll 		int,
		constraint 	pk_class 		primary key(class_id),
		constraint 	fk_class1		foreign key(course_id) 
				references  	course(course_id),
		constraint 	fk_class2 		foreign key(prof_id) 
				references 	professor(prof_id)
	)

create table takes 
	(
		stu_id 		varchar2(10) ,
		class_id 		varchar2(10),
		grade 		char(5),
		constraint 	pk_takes 		primary key(stu_id, class_id),
		constraint 	fk_takes1 		foreign key(stu_id) 
				references 	student(stu_id),
		constraint 	fk_takes2 		foreign key(class_id) 
				references 	class(class_id)
	)
	
ALTER TABLE STUDENT 
ADD age int

ALTER TABLE STUDENT 
DROP COLUMN 

INSERT INTO DEPARTMENT (dept_id, dept_name, office)
VALUES ('920', '컴퓨터공학과', '201호')

INSERT INTO DEPARTMENT
VALUES ('923', '산업공학과', '207호')

INSERT INTO DEPARTMENT
values('925', '전자공학과', '308호')

INSERT INTO student
values('1292001', '900424*1825409', '김광식', 3, '서울', 920)

INSERT INTO student
VALUES('1292002', '900305*1730021', '김정현', 3, '서울', 920)

INSERT INTO student
values('1292003', '891021*2308302', '김현정', 4, '대전', 920)

INSERT INTO student
values('1292301', '890902*2704012', '김현정', 2, '대구', 923)

INSERT INTO student
values('1292303', '910715*1524390', '박광수', 3, '광주', 923)

INSERT INTO student
values('1292305', '921011*1809003', '김우주', 4, '부산', 923)

INSERT INTO student
VALUES('1292501', '900825*1506390', '박철수', 3, '대전', 925)

INSERT INTO student
VALUES('1292502', '911011*1809003', '백태성', 3, '서울', 925)

INSERT INTO PROFESSOR
	VALUES('92001', '590327*1839240', '이태규', '920', '교수', 1997)

INSERT INTO PROFESSOR
	VALUES('92002', '690702*1350026', '고희석', '920', '부교수', 2003)

INSERT INTO PROFESSOR
	values('92301', '741011*2765501', '최성희', '923', '부교수', 2005)
	
INSERT INTO PROFESSOR
	values('92302', '750728*1102458', '김태석', '923', '교수', 1999)
	
INSERT INTO PROFESSOR
	values('92501', '620505*1200546', '박철재', '925', '조교수', 2007)
	
INSERT INTO PROFESSOR
	values('92502', '740101*1830264', '장민석', '925', '부교수', 2005)
	
INSERT INTO course values('C101', '전산개론', 3)

INSERT INTO course values('C102', '자료구조', 3)

INSERT INTO course VALUES('C103', '데이터', 4)

INSERT INTO course values('C301', '운영체제', 3)

INSERT INTO course values('C302', '컴구조', 3)

INSERT INTO course values('C303', '이산수학', 4)

insert INTO course values('C304', '객체지향', 4)

INSERT INTO course values('C501', '인공지능', 3)

INSERT INTO course values('C502', '알고리즘', 2)

INSERT INTO class VALUES('C101-01', 'C101', 2012, 1, 'A', '92301', '301호', 40)

INSERT INTO class VALUES('C102-01', 'C102', 2012, 1, 'A', '92001', '209호', 30)

INSERT INTO class VALUES('C103-01', 'C103', 2012, 1, 'A', '92501', '208호', 30)

INSERT INTO class values('C103-02', 'C103', 2012, 1, 'B', '92301', '301호', 30)

INSERT INTO class values('C501-01', 'C501', 2012, 1, 'A', '92501', '103호', 45)

INSERT INTO class VALUES('C501-02', 'C501', 2012, 1, 'B', '92502', '204호', 25)

INSERT INTO class VALUES('C301-01', 'C301', 2012, 2, 'A', '92502', '301호', 30)

INSERT INTO class VALUES('C302-01', 'C302', 2012, 2, 'A', '92501', '209호', 45)

INSERT INTO class VALUES('C502-01', 'C502', 2012, 2, 'A', '92001', '209호', 30)

INSERT INTO class values('C502-02', 'C502', 2012, 2, 'B', '92301', '103호', 26)

INSERT INTO takes values('1292001', 'C101-01', 'B+')

INSERT INTO takes values('1292001', 'C103-01', 'A+')

INSERT INTO takes values('1292001', 'C301-01', 'A')

INSERT INTO takes values('1292002', 'C102-01', 'A')

INSERT INTO takes values('1292002', 'C103-01', 'B+')

INSERT INTO takes VALUES('1292002', 'C502-01', 'C+')

INSERT INTO takes VALUES('1292003', 'C103-02', 'B')

INSERT INTO takes VALUES('1292003', 'C501-02', 'A+')

INSERT INTO takes VALUES('1292301', 'C102-01', 'C+')

INSERT INTO takes VALUES('1292303', 'C102-01', 'C')

INSERT INTO takes VALUES('1292303', 'C103-02', 'B+')

INSERT INTO takes values('1292303', 'C501-01', 'A+')
