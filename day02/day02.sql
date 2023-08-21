SELECT * FROM EMPLOYEES e ;

-- 1. 연봉이 12000 초과되는 직원들의 LAST_NAME 및 연봉을 조회한다.
-- 단, 급여 오름차순으로 조회
SELECT 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY > 12000
ORDER BY SALARY ASC 
;

-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT 	LAST_NAME , DEPARTMENT_ID , EMPLOYEE_ID 
FROM 	EMPLOYEES e
WHERE 	EMPLOYEE_ID = 176
;

-- 3. 연봉이 5000 에서 12000의 범위 이외인 사람들의 
-- LAST_NAME 및 연봉을 조회힌다.
SELECT 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e
WHERE 	NOT SALARY BETWEEN 5000 AND 12000
ORDER BY SALARY 
;

-- 4. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 
-- LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.
SELECT 	SALARY ,LAST_NAME ,   DEPARTMENT_ID  
FROM 	EMPLOYEES e
WHERE  	DEPARTMENT_ID IN (20,50)
ORDER  BY SALARY , LAST_NAME ASC 
;

-- 5. 20 번 및 50 번 부서에 근무하며, 
-- 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다.
SELECT 	LAST_NAME , SALARY , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	SALARY BETWEEN 5000 AND 12000
AND 	DEPARTMENT_ID IN (20, 50)
;

-- 6. LAST_NAME 첫 글자가 A 인 사원들의 LAST_NAME 을 조회한다.
SELECT 	LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	LAST_NAME LIKE 'A%'
;

-- 7. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT 	LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e
WHERE 	MANAGER_ID IS null
;

-- 8. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
-- 연봉 역순 정렬한다.
SELECT 	LAST_NAME , SALARY , COMMISSION_PCT 
FROM 	EMPLOYEES e
WHERE 	COMMISSION_PCT IS NOT NULL 
ORDER BY SALARY DESC 
;

-----------------------------------------------
-- concat  : 문자열 연결
SELECT 	CONCAT('Hello','bye'), CONCAT('good','bad')  
FROM 	dual
;

-- ||
SELECT 	CONCAT('good','bad') 	concat, 
		'good' || 'bad'			operators
FROM dual
;

-- initcatp : 첫 글자를 대문자로
SELECT  INITCAP('good morning')
FROM	dual
;

-- lower, upper
SELECT 	LOWER('GOOD'), UPPER('good')
FROM	dual
;

-- LPAD() , RPAD()
SELECT 	LPAD('good',6) 		"LPAD1"
	,	LPAD('good',7,'#') 	"LPAD2"
	,	LPAD('good',8,'L')  "LPAD3"
FROM dual
;

SELECT 	RPAD('good',6) 		"RPAD1"
	,	RPAD('good',7,'#') 	"RPAD2"
	,	RPAD('good',8,'L')  "RPAD3"
FROM dual
;

-- LTRIM(), RTRIM()
SELECT 	LTRIM('goodbye','g')
	,	LTRIM('goodbye','o')
	,	LTRIM('goodbye','go')
FROM dual
;

SELECT 	RTRIM('goodbye','e')
	,	RTRIM('goodbye','i')
FROM dual
;

-- substr(문자열, 시작위치, 길이)
SELECT 	SUBSTR('good morning john', 1, 4)
FROM	dual
;

SELECT 	SUBSTR('good morning john', 8, 4)
FROM	dual
;

SELECT 	SUBSTR('good morning john', 8)
FROM	dual
;

SELECT 	SUBSTR('good morning john', -4)
FROM	dual
;

-- replace()
SELECT 	REPLACE ('good morning tom','morning','evenning')
FROM	dual
;
----------------- 날짜
-- sysdate 
SELECT 	SYSDATE  FROM dual;

-- 7개월을 더한다
SELECT 	ADD_MONTHS(SYSDATE, 7)
FROM	dual
;

-- last_date : 현재달의 마지막 날짜
SELECT 	LAST_DAY(SYSDATE)
FROM	dual
;

SELECT 	SYSDATE  + (INTERVAL '1' YEAR)
	,	SYSDATE  + (INTERVAL '1' MONTH)
	,	SYSDATE  + (INTERVAL '1' DAY)
	,	SYSDATE  + (INTERVAL '1' HOUR)
	,	SYSDATE  + (INTERVAL '1' MINUTE)
	,	SYSDATE  + (INTERVAL '1' SECOND)
FROM 	dual
;

-- to_char() : 문자열 변환
SELECT 	TO_CHAR(SYSDATE, 'yyyy/mm/dd') 
	,	TO_CHAR(SYSDATE, 'yyyymmdd')
	,	TO_CHAR(SYSDATE, 'yyyy-mm-dd')
	,	TO_CHAR(SYSDATE, 'yyyy-mm-dd HH24:MI:SS')
FROM 	dual
; 

-- to_date() : 날짜형으로 변환
SELECT 	TO_DATE('2023-07-19','yyyy/mm/dd')
FROM	dual
;

-- nvl() : 널값을 다른 데이터로 변경하는 함수
SELECT 	FIRST_NAME ,LAST_NAME ,NVL(COMMISSION_PCT, 0) commission  
FROM 	EMPLOYEES e 
;

-- decode() : switch
SELECT 	* FROM DEPARTMENTS d ;

SELECT 	DEPARTMENT_ID 
	,	DECODE(DEPARTMENT_ID, 20, 'MA', 60, 'IT', 90, 'EX', 'ETC') 
FROM 	DEPARTMENTS d 
;

-- case() : else if 문과 같은 역할 함수
SELECT	FIRST_NAME , LAST_NAME 
	,	CASE WHEN DEPARTMENT_ID = 20 THEN 'MA' 
			 WHEN DEPARTMENT_ID = 60 THEN 'IT'
			 WHEN DEPARTMENT_ID = 90 THEN 'EX'
			 ELSE ''
		END "department"
FROM 	EMPLOYEES e 
;
--------------------------------------------------------
/*
문제1) EMPLOYEES 테이블에서 King의 정보를 소문자로 검색하고
사원번호,성명, 담당업무(소문자로),부서번호를 출력하라.
*/
SELECT 	EMPLOYEE_ID , LAST_NAME , FIRST_NAME 	
	,	LOWER(JOB_ID), DEPARTMENT_ID  
FROM 	EMPLOYEES e
WHERE 	LOWER(LAST_NAME) = 'king' 
;


/*
문제2) EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고 사원번호,
성명, 담당업무(대문자로),부서번호를 출력하라.
*/
SELECT 	EMPLOYEE_ID , LAST_NAME , FIRST_NAME 	
	,	UPPER(JOB_ID), DEPARTMENT_ID  
FROM 	EMPLOYEES e
WHERE 	UPPER(LAST_NAME) = 'KING' 
;

/*
문제3) DEPARTMENTS 테이블에서 부서번호와 부서이름, 위치번호를 합하여 출력하도록 하라.(||사용)
*/
SELECT 	DEPARTMENT_ID || DEPARTMENT_NAME  || LOCATION_ID 
FROM 	DEPARTMENTS d 
;

/*
문제4) EMPLOYEES 테이블에서 30번 부서 중 사원번호 이름과 담당 아이디를 연결하여 출력하여라. 
	(concat 사용)
*/
SELECT	CONCAT(CONCAT(DEPARTMENT_ID, LAST_NAME), MANAGER_ID)    	
FROM 	EMPLOYEES e  
WHERE 	DEPARTMENT_ID = 30
;

/*
 * 문제 5. SALARY+SALARY*nvl(COMMISSION_PCT ,0) 이 10000이상이면, 'good' 
 * 			5000 이상이면, 	'average', 
 * 			1이상 5000미만이면 'bad' 
 * 			0이면 no good 로 평가하고  
	EMPLOYEE_ID ,FIRST_NAME , SALARY ,COMMISSION_PCT, 
	 SALARY+SALARY*nvl(COMMISSION_PCT ,0) 평가를 출력해라.
 */
SELECT 	EMPLOYEE_ID , FIRST_NAME , SALARY , COMMISSION_PCT 
	,	SALARY + SALARY * nvl(COMMISSION_PCT, 0) AS sal
	,	CASE 
		WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) >= 10000 THEN 'good'
		WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) >= 5000 THEN 'average'
		WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) >= 1 	THEN 'bad'
		WHEN SALARY + SALARY * nvl(COMMISSION_PCT, 0) = 0 	THEN 'no good'
	END AS grade	
FROM 	EMPLOYEES e
ORDER BY sal
;

-------------------------------------------------------------------
SELECT 	*
FROM 	EMPLOYEES e 
;
-- DISTINCT : 유니크(중복을 제거)한 데이터를 조회하는 경우 사용
SELECT 	DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES e 
;
-- GROUP BY : 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다. 
-- 			  집계함수와 짝을 이루어 사용할 수 있다.
SELECT  DEPARTMENT_ID 
FROM 	EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
;

-- 부서별 급여의 합계
-- SQL Error [937] [42000]: ORA-00937: not a single-group group function
SELECT 	DISTINCT DEPARTMENT_ID , sum(SALARY)
FROM 	EMPLOYEES e 
;

SELECT 	DEPARTMENT_ID , SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
;
-- SQL Error [979] [42000]: ORA-00979: not a GROUP BY expression
SELECT 	EMPLOYEE_ID , DEPARTMENT_ID 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID
;
SELECT 	EMPLOYEE_ID , DEPARTMENT_ID 
FROM 	EMPLOYEES e
ORDER BY DEPARTMENT_ID
;

-- 부서별 사원수와 평균 급여, 부서별 급여의 총 합 까지 구해보자 
SELECT 	DEPARTMENT_ID , SUM(SALARY), AVG(SALARY), COUNT(EMPLOYEE_ID)  
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID 
;

-- 부서별, 직급별(job_id) 사원수와, 평균급여, 급여의 합계를 구해보자
SELECT 	DEPARTMENT_ID , JOB_ID 
	,	SUM(SALARY), COUNT(EMPLOYEE_ID), AVG(SALARY)  
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- 80번 부서의 부서별, 직급별(job_id) 사원수와, 평균급여, 급여의 합계를 구해보자
SELECT 	DEPARTMENT_ID , JOB_ID 
	,	SUM(SALARY), COUNT(EMPLOYEE_ID), AVG(SALARY)  
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID = 80
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- 부서가 존재하고, 사원수가 10명 이상인 부서를 조회
/*
 * - where에서는 집계함수를 사용할 수 없다
 * - having 절은 집계함수를 가지고 조건비교를 할 때 사용한다
 * - having 절은 group by와 함께 사용 된다.
 */
SELECT 	DEPARTMENT_ID , COUNT(*) 
FROM 	EMPLOYEES e
WHERE 	DEPARTMENT_ID  IS NOT NULL 
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 10 
ORDER BY DEPARTMENT_ID 
;
---------------------------------------------------------
-- 문제1) EMPLOYEES 테이블에서 job_id가 'SA'로 시작하는 사람에 대하여 
-- 급여의 평균, 최고액, 최저액, 합계를 구하여 출력하여라.
SELECT 	AVG(SALARY), MAX(SALARY), MIN(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e
WHERE 	JOB_ID LIKE 'SA%'
;

-- 문제2) EMPLOYEES 테이블에 등록되어 있는 인원수, 
-- 커미션이 NULL이 아닌 인원수, 연봉평균, 
-- 등록되어 있는 부서의 수를 구하여 출력하라.
SELECT 	COUNT(*)
	,	COUNT(COMMISSION_PCT)
	,	ROUND(AVG(SALARY)) 
	,	COUNT( DISTINCT DEPARTMENT_ID  ) 
FROM 	EMPLOYEES e 
;

-- 문제3) EMPLOYEES 테이블에서 부서별로 인원수, 
-- 평균 급여, 최저급여, 최고 급여, 급여의 합을 구하여 출력하라.
SELECT 	DEPARTMENT_ID ,	COUNT(*)
	,	AVG(SALARY)	, MIN(SALARY), MAX(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
;


-- 문제4) EMPLOYEES 테이블에서 각 부서별로 인원수,
-- 급여의 평균, 최저 급여, 최고 급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력하여라.
SELECT 	DEPARTMENT_ID ,	COUNT(*)
	,	AVG(SALARY)	, MIN(SALARY), MAX(SALARY), SUM(SALARY) AS sumsal  
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
ORDER BY sumsal desc
-- ORDER BY SUM(SALARY)  DESC
;

-- 문제5) EMPLOYEES 테이블에서 부서별, 업무별 그룹하여 결과를 부서번호, 
-- 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하여라.
SELECT 	DEPARTMENT_ID , JOB_ID 
	,	COUNT(*)	, AVG(SALARY)  , SUM(SALARY) 
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID , JOB_ID
ORDER BY DEPARTMENT_ID , JOB_ID 
;

-- 문제6) EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 
-- 인원수, 급여의 합을 구하여 출력하여라
SELECT 	DEPARTMENT_ID , COUNT(*), SUM(SALARY)  
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) > 4 
;

-- 문제7) EMPLOYEES 테이블에서 급여가 최대 10000이상인 부서에 대해서 부서번호, 
-- 평균 급여, 급여의 합을 구하여 출력하여라.
SELECT 	DEPARTMENT_ID , AVG(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) > 10000 
;

-- 문제8) EMPLOYEES 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서 업무명,
-- 평균 급여, 급여의 합을 구하여 출력하라.
SELECT 	JOB_ID , AVG(SALARY), SUM(SALARY)  
FROM 	EMPLOYEES e
GROUP BY JOB_ID 
HAVING AVG(SALARY) >= 10000 
;

-- 문제9) EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 
-- 각 업무에 대해서 업무와 월급여 합계를 출력하라. 
-- 단 판매원(SA_)은 제외하고 월 급여 합계로 정렬(내림차순)하라.
SELECT 	JOB_ID , SUM(SALARY) 
FROM 	EMPLOYEES e
WHERE 	JOB_ID NOT LIKE 'SA_%'
GROUP BY JOB_ID 
HAVING SUM(SALARY) > 10000 
ORDER BY SUM(SALARY) DESC  
;

-- 문제10) 동일한 직업(JOB_ID)을 가진 사원들의 총 수를 조회한다.
SELECT 	JOB_ID , COUNT(*) 
FROM 	EMPLOYEES e
GROUP BY JOB_ID 
ORDER BY JOB_ID 
;

-- 문제11) 매니저의 사번 및 그 매니저가 관리하는 직원들 중 
--   최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉 기준 역순으로 조회한다.
SELECT 	MANAGER_ID, MIN(SALARY)  
FROM 	EMPLOYEES e 
WHERE MANAGER_ID IS NOT NULL 
GROUP BY MANAGER_ID 
ORDER BY MIN(SALARY) DESC  
;
----------------------------------------------------------
























