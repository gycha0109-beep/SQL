select title, credit, year, semester
FROM class c1, course c2									-- 외부 조인으로 두 테이블의 값을 합쳐서 보기
WHERE c1.COURSE_ID = c2.COURSE_ID 							-- 서로 포함하지 않는 값은 추출되지 않음

select title, credit, year, semester
FROM COURSE LEFT OUTER JOIN class							-- 왼쪽 테이블에 값이 없어도 모든 값이 조인된다.
USING (COURSE_ID)

SELECT title, credit, YEAR, semester
FROM course, CLASS
WHERE COURSE.COURSE_ID=class.COURSE_ID(+)					-- 왼쪽 외부 조인 오라클 문법

SELECT title, credit, YEAR, semester
FROM COURSE c1 RIGHT OUTER JOIN CLASS c2					-- 오른족 외부 조인
using(course_id)

SELECT title, credit, YEAR, semester
FROM COURSE c1, class c2
WHERE c1.COURSE_ID(+) = c2.course_id							-- 오른쪽 외부 조인 오라클 문법

select title, credit, year, semester 
FROM COURSE FULL OUTER JOIN class							-- 왼쪽 테이블에 값이 없어도 모든 값이 조인된다.
USING (COURSE_ID)

SELECT count(*) FROM STUDENT s WHERE s.YEAR = 3			-- 3학년의 수를 카운트

SELECT count(*) FROM EMP 								-- 전체 고용자 수

SELECT count(comm) FROM EMP								-- NULL은 카운트 되지 않는다

SELECT count(DISTINCT dept_id) FROM STUDENT				-- distinct로 중복되는 내용을 제하고 카운트 할 수 있다

SELECT count(*) FROM STUDENT s, DEPARTMENT d
WHERE s.DEPT_ID = d.DEPT_ID AND d.DEPT_NAME = '컴퓨터공학과'

SELECT sum(2026-year_emp) FROM PROFESSOR				-- 교수들 재직연수의 '합'

SELECT * FROM emp e, DEPT d
WHERE e.DEPTNO(+) = d.DEPTNO

SELECT ENAME, DNAME, LOC FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO and ENAME = 'SMITH'			-- 스미스의 부서명과 부서위치

SELECT sum(sal) FROM EMP 								-- 전체 급여 합계
WHERE job = 'ANALYST'									-- 애널리스트의

SELECT sum(sal)
FROM EMP e, DEPT d 
WHERE e.DEPTNO = d.DEPTNO AND d.DNAME = 'RESEARCH'		-- 리서치 부서원들의 급여 합계

SELECT avg(2026-year_emp)								-- 교수 재직연도의 평균
FROM PROFESSOR

SELECT count(sal), avg(sal), max(sal), min(sal)			-- 어카운팅 부서의 급여지급 수, 평균, 최대, 최소
FROM emp e, dept d					
WHERE e.DEPTNO = d.DEPTNO AND d.DNAME = 'ACCOUNTING'

SELECT dept_id, count(*) 								-- group by로 {필드}와 {집계함수}를 같이 사용할 있다.
FROM student											-- student 테이블에서 학과번호(dept_id 필드)별로 레코드의 개수를 출력
group by dept_id										-- 반드시 셀렉트한 필드를 사용해야 한다

SELECT dept_name, count(*)
from student s, department d							-- 조인과 같이 사용할 수 있다.
where s.dept_id = d.dept_id
group BY dept_name

SELECT dname, count(sal), avg(sal), max(sal), min(sal)	-- 여러 연산함수도 복용 가능
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO 
GROUP BY dname

SELECT dept_name, count(*), avg(2026-YEAR_emp), max(2026-YEAR_emp)
from professor p, department d		
WHERE p.DEPT_ID = d.DEPT_ID 
GROUP BY dept_name

select dept_name, count(*), avg(2026 - year_emp), max(2026 - year_emp)
from professor p, department d
where p.dept_id = d.dept_id and avg(2026 - year_emp) >= 10	-- **그룹 함수에 그냥 조건을 추가하려면 에러가 뜸
group by dept_name

select dept_name, count(*), avg(2012 - year_emp), max(2012 - year_emp)
from professor p, department d
where p.dept_id = d.dept_id
group by dept_name
having avg(2026 - year_emp) >= 10							-- HAVING절로 조건을 추가해주어야 한다
							
SELECT dname, count(*), avg(sal), max(sal), min(sal)
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO
GROUP BY d.DNAME
HAVING count(*) >= 5

SELECT *
FROM emp   
WHERE comm IS NULL											-- 커미션의 값이 (NULL)인 사람, 반대의 경우는 IS NOT NULL로 찾는다

SELECT *
FROM EMP
WHERE comm <> 500											-- 커미션의 값이 '500'이 **아닌** 값을 추출. NULL로 처리된 값은 추출하지 않는다.

SELECT title
FROM COURSE
WHERE course_id IN(											-- in()으로 불러온 결과값을 where의 조건식으로 사용한다.
SELECT DISTINCT course_id
FROM class
WHERE classroom = '301호'
)

SELECT DISTINCT title
FROM course c1, class c2
WHERE c1.COURSE_ID=c2.COURSE_ID AND classroom = '301호'		-- in을 안 쓰고도 이렇게 쓸 수 있다

SELECT title
FROM course
WHERE course_id NOT in(
SELECT DISTINCT course_id
FROM class
WHERE YEAR = 2026 AND semester = 2							-- NOT IN 으로 '포함되지 않은'을 표현한다
)

SELECT DISTINCT title
FROM course c1, class c2
WHERE c1.COURSE_ID = c2.COURSE_ID AND YEAR <> 2026 AND semester <> 2






















































































































