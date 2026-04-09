SELECT deptno 부서코드, dname 부서명, loc AS 지역 -- 필드에 별칭(alias)를 붙일 수 있다.
FROM DEPT

select empno, ename || '(' ||job||')' employee -- 문자 합성 연산자
FROM emp

SELECT ename, round(sal/12, 1) 반올림, trunc(sal/12, 1) 버림
FROM emp

SELECT ename, hiredate,
TO_CHAR(hiredate, 'YYYY') 입사연도,				-- 날짜 데이터를 문자열로 치환
TO_char(hiredate, 'MM') 월,
TO_char(hiredate, 'DD') 일
FROM EMP

SELECT ename, hiredate,
TO_number(TO_char(hiredate, 'YYYY')) 입시연도,		-- 날짜 데이터에서 연/월/일 추출
TO_NUMBER(TO_CHAR(hiredate, 'MM')) 입사월,
TO_NUMBER(TO_CHAR(hiredate, 'DD')) 입사일
FROM EMP

SELECT to_char(sysdate, 'YYYY/MM/DD') 날짜,
to_char(sysdate, 'YYYY.MON.DAY') 문자형			-- 문자형 날짜 표기
FROM dual										-- dual은 더미 테이블

SELECT ename,
CASE
WHEN sal>2000									-- 연봉이 2000이상일 때
THEN sal										-- 원래 값을 출력하고
ELSE 2000										-- 그게 아니라면 2000을 출력한다
END revised_sal									-- revised_sal이라는 필드에 그 값을 표현한다
FROM emp

SELECT loc, CASE loc
WHEN 'NEW YORK' THEN 'EAST'
WHEN 'BOSTON' THEN 'EAST'
WHEN 'CHICAGO' THEN 'CENTER'
WHEN 'DALLAS' THEN 'CENTER'
ELSE 'ETC'
END AS area
FROM dept

SELECT loc,
decode(loc,										-- 오라클에서만 쓸 수 있는 decode 문법
'NEW YORK', 'EAST',
'BOSTON', 'EAST',
'DALLAS', 'CENTER',
'CHICAGO', 'CENTER') area
FROM DEPT

SELECT ename,
CASE
WHEN sal >= 3000 THEN 'high'
WHEN sal >= 1000 THEN 'mid'
ELSE 'low'
end AS salary_grade
FROM emp

SELECT empno, ename, sal, comm, sal+comm FROM emp -- 널 값과 숫자를 합치면 널이 나온다.

SELECT empno, ename, sal,
CASE WHEN comm IS NULL								-- case로 널 값을 0으로 처리해주는 방법
THEN 0																
ELSE comm												--			|
END AS commision,										--			|
sal + (													--			v
CASE WHEN comm IS NULL								-- 그걸 이용해 널값을 0 으로 만들고	합산 필드를 만듦
THEN 0
ELSE comm END) AS  result
FROM EMP

SELECT empno, ename, sal, nvl(comm, 3) AS commision, sal + nvl(comm, 0) AS RESULT
FROM emp											-- 오라클에선 간단하게 nvl로 널값을 지정이 가능하다

SELECT * FROM EMP
WHERE comm IS NULL;									-- NULL 레코드 찾기

SELECT * from emp
WHERE comm IS NOT NULL								-- NULL이 아닌 레코드 찾기

SELECT * FROM emp
WHERE rownum<=5										-- 위로부터 5개의 레코드 추출

SELECT *
FROM(
SELECT ename, sal, comm, sal+nvl(comm,0) salsum		-- 내림차순으로 연봉 상위 5명 추출
FROM emp
ORDER BY 4 DESC
)
WHERE rownum<=5

SELECT *
FROM(
SELECT ename, sal+nvl(comm,0) total
FROM EMP e 	
ORDER BY 2											-- 오름차순으로 연봉 하위 4명 추출
)
WHERE rownum<=4

SELECT * FROM emp		
WHERE sal BETWEEN 1500 AND 2500						-- 연봉이 1500~2500 사이인 직원

SELECT dname, job,
count(*) "Total empl",
sum(sal) "Total sal"
FROM emp e, DEPT d
WHERE d.deptno = e.DEPTNO
GROUP BY dname, job
ORDER BY "Total sal" desc

SELECT dname, job,
count(*) "Total empl",
sum(sal) "Total sal"
FROM emp e, DEPT d
WHERE d.deptno = e.DEPTNO
GROUP BY ROLLUP(dname, job)							-- 롤 업
ORDER BY DNAME,  JOB;								-- 정렬까지 그룹바이랑 같은 필드를 써야하나봄

INSERT INTO emp(empno, ename) VALUES('9696', 'CHA')






























