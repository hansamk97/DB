SELECT * FROM employees;

SELECT * FROM tab;

-- 한줄 주석
/*
 * 여러줄 주석
 */

/*
 * 데이터 조작어 - 검색
 * 	select
 * 
 *  select	* 
 *  from	테이블 이름
 *  where	조건
 *  group by
 *  having
 *  order by 
 */

SELECT 	LAST_NAME , FIRST_NAME 
FROM 	EMPLOYEES e
WHERE 	LAST_NAME = 'Bell'
;

SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , HIRE_DATE 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME = 'Steven'
AND 	LAST_NAME = 'King'
;
-- 1번. employees 테이블에서 department_id가 100이고 
-- job_id가 FI_MGR인 사람의 모든 데이터 조회
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 100
AND 	JOB_ID = 'FI_MGR'
;

-- 2번.employees 테이블에서 first_name이 Guy인 사람의 
-- employee_id, first_name,last_name, job_id 조회
SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e
WHERE 	FIRST_NAME = 'Guy'
;

-- 3번. employees 테이블에서 department_id가 50이고 managet_id가 121인 사람의 
-- employee_id, first_name, last_name, job_id 조회
SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 50
AND 	MANAGER_ID = 121
;

-- 별칭, 알리아스
SELECT 	e.EMPLOYEE_ID AS 	"ID" 
	, 	SALARY 			"SAL" 
FROM 	EMPLOYEES e 
;

-- distinct : 중복제거
SELECT 	DISTINCT JOB_ID 
FROM 	EMPLOYEES e 
;

SELECT 	DISTINCT  DEPARTMENT_ID 
FROM 	EMPLOYEES e 
;

SELECT 	*
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID IS NULL 
;

-- >,<,>=,<=
SELECT 	*
FROM 	EMPLOYEES e
WHERE 	SALARY >= 5000
;

-- or
-- 부서가 50번이거나, 매니저 번호가 100번인 사람
SELECT 	FIRST_NAME , LAST_NAME , MANAGER_ID , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 50
OR 		MANAGER_ID = 100
;

-- not
-- 50번 부서가 아닌 사람
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	NOT (DEPARTMENT_ID = 50)
;

-- not -> <>
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID  <> 50
;

-- not -> !=
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID != 50
;

-- 급여가 4000 ~ 8000 사람, => between A and B
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	SALARY >= 4000
AND 	SALARY <= 8000
;

SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	SALARY BETWEEN 4000 AND 8000
;

-- 급여가 6500 또는 7700 또는 13000인 사람  -> in()
SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	SALARY = 6500
OR 		SALARY = 7700
OR 		SALARY = 13000
;

SELECT 	*
FROM 	EMPLOYEES e 
WHERE 	SALARY IN (6500, 7700, 13000)
;
/*
 * 문1.
 * employees 테이블에서 employee_id, first_name, last_anem, job_id를 출력하는데,
 * job_id가 ST_MAN이고, manager_id가 100이고, salary가 5000이상인 사람.
 */
SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	JOB_ID  = 'ST_MAN'
AND 	MANAGER_ID = 100
AND 	SALARY 	>= 5000
;

-- 문2.
-- EMPLOYEES 테이블에서 EMPLOYEE_ID, first_name, last_name, JOB_ID
-- MANAGER_ID, SALARY 를 조회
-- DEPARTMENT_ID가 10 또는 30 또는 100 또는 90에 속하고,
-- 급여(SALARY)가 5000에서 10000사이 이고
-- 매니저(MANAGER_ID)가 100이 아닌 사람을 조회
SELECT 	EMPLOYEE_ID , FIRST_NAME , LAST_NAME 
	, 	JOB_ID , MANAGER_ID , SALARY 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID IN (10, 30, 100, 90)
AND 	SALARY BETWEEN 5000 AND 10000
AND 	MANAGER_ID <> 100
;

-- like : D로 시작하는 사람
SELECT 	FIRST_NAME , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME LIKE 'D%'
;

-- %d 로 끝나는 사람
SELECT 	FIRST_NAME , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME LIKE '%d'
;

-- __a%
SELECT 	FIRST_NAME , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	FIRST_NAME LIKE '__a%'
;

-- is null
SELECT 	FIRST_NAME , LAST_NAME , COMMISSION_PCT 
	, 	DEPARTMENT_ID , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT IS NULL 
;

-- is not null
SELECT 	FIRST_NAME , LAST_NAME 
	, 	DEPARTMENT_ID , JOB_ID , COMMISSION_PCT 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT IS NOT NULL 
;

-- 오름차순 
-- order by 컬럼 ASC , 생략가능
SELECT 	*
FROM 	EMPLOYEES e 
ORDER BY SALARY 
;


-- 내림차순, order by 컬럼 DESC 
SELECT 	*
FROM 	EMPLOYEES e 
ORDER BY SALARY DESC 
;

-- 합계 : sum()
SELECT 	SUM(SALARY) 
FROM 	EMPLOYEES e 
;

-- count(컬럼)
SELECT 	COUNT(*) 
FROM 	EMPLOYEES e 
;
SELECT * FROM  EMPLOYEES e ;

SELECT 	COUNT(COMMISSION_PCT)  commition
FROM 	EMPLOYEES e 
;

-- EMPLOYEES 테이블에서 first_name 중복을 제외한 숫자값을 출력
SELECT 	COUNT(FIRST_NAME) , COUNT(DISTINCT  FIRST_NAME) 
FROM 	EMPLOYEES e 
;

-- 평균 : avg
SELECT 	AVG(SALARY) 
FROM 	EMPLOYEES e 
;

-- 80번부서의 급여의 평균
SELECT 	AVG(SALARY) 
FROM 	EMPLOYEES e 
WHERE 	DEPARTMENT_ID = 80
;

-- 최대값 : max
SELECT 	MAX(SALARY) 
FROM 	EMPLOYEES e 
;

SELECT 	MAX(HIRE_DATE) 
FROM 	EMPLOYEES e 
;

-- 최소값 : min()
SELECT 	MIN(SALARY) 
FROM 	EMPLOYEES e 
;

SELECT 	MIN(HIRE_DATE) 
FROM 	EMPLOYEES e 
;

-- dual
-- abs() : 절대값
SELECT 	ABS(-234) 
FROM 	dual
;

-- 반올림 : round()
SELECT 	ROUND(0.123) , ROUND(0.543) 
FROM	dual
;

-- 절사 : TRUNC
SELECT 	TRUNC(1234.56789) 
FROM	dual
;
SELECT 	TRUNC(1234.56789, 2) 
FROM	dual
;
SELECT 	TRUNC(1234.56789, 0) 
FROM	dual
;
SELECT 	TRUNC(1234.56789, -1) 
FROM	dual
;





