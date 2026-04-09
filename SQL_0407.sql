UPDATE STUDENT SET YEAR = YEAR-1

UPDATE professor
SET POSITION = '부교수', dept_id = '920'
WHERE name = '고희석'

DELETE --SELECT *
FROM PROFESSOR
WHERE name ='김태석'

INSERT INTO STUDENT values('1292002', '900305*1730021', '김정현', 3, '서울', '921')

SELECT distinct ADDRESS FROM student;

SELECT name, POSITION, 2026-year_emp FROM PROFESSOR -- 정수의 경우에는 레코드의 연산이 가능하다

SELECT name, stu_id, dept_id FROM STUDENT;

SELECT dept_id, dept_name FROM DEPARTMENT;

SELECT student.name, student.stu_id, department.dept_name
FROM student, DEPARTMENT
WHERE STUDENT.DEPT_ID = DEPARTMENT.DEPT_ID

SELECT s.name, d.dept_name  FROM student s, department d
WHERE s.DEPT_ID = d.DEPT_ID

SELECT student.stu_id, STUDENT.name FROM student, DEPARTMENT -- 컴퓨터공학과 3학년의 이름과 학번 출력
WHERE STUDENT.DEPT_ID = department.DEPT_ID AND student.YEAR = 3 AND DEPARTMENT.dept_name = '컴퓨터공학과'

SELECT name, stu_id
FROM student
WHERE YEAR = 3 OR YEAR = 4
ORDER BY name, STU_ID -- 역순은 name desc(디쎈트)로 쓴다.

select 	s.name, d.dept_name -- 재명명
from 	student s, department d
where 	s.dept_id = d.dept_id

SELECT s2.name, s2.address -- 같은 테이블에서의 재명명을 이용한 JOIN문(셀프조인)
FROM STUDENT s1, student s2
WHERE s1.address=s2.address AND s1.name = '김광식' -- 김광식과 주소가 같은 학생의 이름과 주소

SELECT name 이름, POSITION AS 직위, 2026-year_emp AS 재직연수 FROM professor -- 재명명으로 깔끔하게 출력할 수 있다.

SELECT * FROM STUDENT WHERE name LIKE '김%' -- 김씨로 시작하는 사람 찾기

SELECT * FROM student WHERE RESIDENT_ID LIKE '%*2%' or RESIDENT_ID LIKE '%-4%' -- 여자 찾기

SELECT s.name, p.name
FROM STUDENT s, PROFESSOR p										-- 그냥 불러올라하면 카티션 때문에
WHERE s.DEPT_ID = p.DEPT_ID 									-- 중복해서 나옴

select name from student										--  카티션 프로덕트를 제외하고
UNION	-- 중복된 결과를 제거한 합집합을 추출. 중복포함 시키려면 union all		원하는 만큼의 레코드 합을 가져올 수 있음.
SELECT name FROM PROFESSOR											


SELECT s.stu_id -- 학번을 찾겠다
FROM STUDENT s, DEPARTMENT d, takes t -- 어떤 '과목'을 가진 '학생'들 중에서의 '성적'이
WHERE s.DEPT_ID=D.DEPT_ID AND S.STU_ID=T.STU_ID AND t.GRADE = 'A+' AND dept_name='컴퓨터공학과' -- '컴퓨터 공학과'에서 'A+'을 받은

SELECT stu_id
FROM student s, DEPARTMENT d
WHERE s.DEPT_ID = d.DEPT_ID AND d.DEPT_NAME = '컴퓨터공학과'
INTERSECT													-- 교집합을 통해서도 추출 가능함
SELECT stu_id
FROM TAKES t 
WHERE t.GRADE = 'A+'

select stu_id 	from student s, department d
where s.dept_id = d.dept_id and dept_name='산업공학과'			-- 산업공학과의 학생중 A+를 받지 못한 학생들의 학번
minus
select stu_id	from takes
where grade = 'A+'








































