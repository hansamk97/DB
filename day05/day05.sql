SELECT *
FROM EMPLOYEES e 
;

/* view */
CREATE VIEW v_emp( emp_id, first_name, job_id, hiredate, dept_id )
AS
SELECT EMPLOYEE_ID , FIRST_NAME , JOB_ID , HIRE_DATE , DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE  JOB_ID = 'ST_CLERK'
;

SELECT * FROM v_emp;

-- view 삭제
DROP VIEW V_EMP ;

---------------------------------------
CREATE OR REPLACE VIEW v_emp(emp_id, first_name, job_id, hiredate, dept_id)
AS
SELECT NVL(EMPLOYEE_ID, ''), NVL(FIRST_NAME, '') , JOB_ID , HIRE_DATE , DEPARTMENT_ID  
FROM EMPLOYEES e 
;
SELECT * FROM v_emp;

-- 102 Lex
-- 함수로 작성된 부분은 수정 불가
UPDATE V_EMP SET FIRST_NAME = 'kim'
WHERE FIRST_NAME  = 'Lex';

----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_emp2(emp_id, first_name, job_id, hiredate, dept_id)
AS
SELECT NVL(EMPLOYEE_ID, ''), FIRST_NAME, JOB_ID , HIRE_DATE , DEPARTMENT_ID  
FROM EMPLOYEES e 
;
SELECT * FROM v_emp2;

-- 102 Lex
-- 함수로 작성된 부분은 수정 불가
UPDATE V_EMP2 SET FIRST_NAME = 'kim'
WHERE FIRST_NAME  = 'Lex';
SELECT * FROM EMPLOYEES e WHERE EMPLOYEE_ID = 102;

--UPDATE EMPLOYEES SET FIRST_NAME = 'Lex'
SELECT * FROM EMPLOYEES e 
WHERE EMPLOYEE_ID = 102;

/*
 * view  : v_emp_salary
 * 		   emp_id, last_name, salary, annual_sal
 * annual_sal	: (급여 + 급여 * commition_pct) * 12
 */
CREATE OR REPLACE VIEW v_emp_salary(emp_id, last_name, salary, annual_sal)
AS 
SELECT EMPLOYEE_ID , LAST_NAME , SALARY
	, (SALARY + (SALARY * nvl(COMMISSION_PCT, 0))) * 12
FROM EMPLOYEES e 
;
SELECT * FROM V_EMP_SALARY ves  ;


CREATE OR REPLACE VIEW v_emp_salary2(emp_id, last_name, salary, annual_sal)
AS 
SELECT EMPLOYEE_ID , LAST_NAME , SALARY
	, (SALARY + (SALARY * nvl(COMMISSION_PCT, 0))) * 12
FROM EMPLOYEES e 
WITH READ ONLY
;
SELECT * FROM V_EMP_SALARY2 ves  ;
UPDATE V_EMP_SALARY2 SET last_name = 'Kim'
WHERE last_name = 'Austin';

/*
 *  1.
 *  view		: v_samp1
 * 			: employee_id, last_name, department_id, hire_date
 * 	조건		: 급여가 4000이상이고, 50번 부서, job_id가 'ST_MAN'
 */
CREATE OR REPLACE VIEW v_samp1(employee_id, last_name, department_id, hire_date)
AS
SELECT EMPLOYEE_ID , LAST_NAME , DEPARTMENT_ID , HIRE_DATE 
FROM EMPLOYEES e 
WHERE SALARY >= 4000
AND DEPARTMENT_ID = 50
AND JOB_ID = 'ST_MAN'
;
SELECT * FROM V_SAMP1 vs ;

/*
 *  2.
 *  view	: v_samp2
 * 			: emp_id, name, department_id, hire_date
 * 조건		: 50번 부서, name 출력시 first_name + ' ' + last_name
 */
CREATE OR REPLACE VIEW v_samp2(emp_id, name, department_id, hire_date)
AS
SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME , DEPARTMENT_ID , HIRE_DATE 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 50
;
SELECT * FROM V_SAMP2 vs ;



/*
 *  3.
 *  view	: v_samp3
 * 			: 사번, 이름, 부서번호, 부서명, 입사일
 * 조건		: 이름 first_name + ' ' + last_name
 */
CREATE OR REPLACE VIEW v_samp3(사번, 이름, 부서번호, 부서명, 입사일)
AS
SELECT e.EMPLOYEE_ID , e.FIRST_NAME || ' ' || e.LAST_NAME , d.DEPARTMENT_ID ,d.DEPARTMENT_NAME,  e.HIRE_DATE  
FROM EMPLOYEES e 
	LEFT OUTER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID 
;
SELECT * FROM V_SAMP3;

--------------------------------------------------------
/* 시퀀스 생성 : 제품번호를 생성하는 시퀀스 만들기 */
CREATE SEQUENCE seq_serial_no
increment BY 1
START WITH 100
MAXVALUE 110
MINVALUE 99
CYCLE 
cache 2;

CREATE TABLE goods(
	goods_no		number(3),
	goods_name		varchar2(10)
);

INSERT INTO GOODS g 
VALUES (seq_serial_no.nextval, '제품12');
SELECT * FROM GOODS g ;

-- 현재 시퀀스 값 : currval
SELECT seq_serial_no.currval FROM dual;

-- 시퀀스 삭제
DROP SEQUENCE seq_serial_no;

------------------------------------------------
/* index */
CREATE TABLE EMPLOYEES3  AS SELECT * FROM EMPLOYEES e ;
SELECT * FROM EMPLOYEES3 e ;

SELECT rowid, EMPLOYEE_ID 
FROM	EMPLOYEES3 e 
;
INSERT INTO EMPLOYEES3 e (EMPLOYEE_ID, FIRST_NAME, LAST_NAME)
VALUES (100, 'Ismael', 'Chen');
SELECT * FROM EMPLOYEES3 e WHERE EMPLOYEE_ID  = 100;

-- unique index 생성
CREATE UNIQUE INDEX idx_employee3_id
ON employees3(employee_id);

DELETE FROM EMPLOYEES3 e 
WHERE FIRST_NAME = 'Ismael'
AND LAST_NAME = 'Chen';

-- index
INSERT INTO EMPLOYEES3 e (EMPLOYEE_ID, FIRST_NAME, LAST_NAME)
VALUES (500, 'Ismael', 'Chen');
SELECT * FROM EMPLOYEES3 e  WHERE FIRST_NAME = 'Ismael';

CREATE INDEX idx_employee3_first
ON employees3(first_name);




























