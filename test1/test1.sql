
--1
CREATE TABLE EMPLOYEES_NEW
AS
SELECT * FROM EMPLOYEES e 
;

--2
CREATE TABLE DEPARTMENTS_NEW
AS
SELECT * FROM DEPARTMENTS d 
;

--3
ALTER TABLE EMPLOYEES_NEW ADD(
	USER_NAME	varchar2(20))
;

--4
DROP  TABLE EMPLOYEES_NEW ;
CREATE TABLE EMPLOYEES_NEW (
	employee_id		number(4) PRIMARY key
);

--
ALTER TABLE employees_new ADD(
CONSTRAINT employees_pk PRIMARY KEY (employee_id)
);


--5
DROP  TABLE DEPARTMENTS_NEW  ;
CREATE TABLE DEPARTMENTS_NEW (
	department_id	number(4) PRIMARY key
);
--
ALTER TABLE departments_new add(
CONSTRAINT department_pk primary key(department_id)
);

--6
/*	EMPLOYEES_NEW 테이블의 DEPARTMENT_ID컬럼과 DEPARTMENTS_NEW 테이블 DEPARTMENT_ID 컬럼을
	EMPLOYEES_NEW 테이블이 자식 테이블, DEPARTMENTS_NEW 테이블이 부모 테이블로 Foreign Key 제약 조건(제약조건이름 자유)을 추가한다
*/	
ALTER TABLE EMPLOYEES_new ADD
CONSTRAINT emplotees_id FOREIGN KEY(department_id)
REFERENCES departments(department_id);

--7
SELECT en.EMPLOYEE_ID , en.FIRST_NAME , en.DEPARTMENT_ID , dn.DEPARTMENT_NAME 
FROM EMPLOYEES_NEW en
	LEFT OUTER JOIN DEPARTMENTS_NEW dn 
	ON dn.DEPARTMENT_ID = en.DEPARTMENT_ID 
WHERE dn.DEPARTMENT_ID  = 60
ORDER BY en.DEPARTMENT_ID ASC 
;

--8
SELECT *
FROM EMPLOYEES_NEW en 
WHERE en.DEPARTMENT_ID = 100
AND (SELECT avg (SALARY) FROM EMPLOYEES_NEW en )
;

--9
DROP TABLE EMPLOYEES_NEW ;

--10
DROP TABLE DEPARTMENTS_NEW;

--11
SELECT 	e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	LEFT OUTER JOIN 	DEPARTMENTS d 
	ON 					e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE 	d.DEPARTMENT_NAME = 'Sales'
AND 	e.SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES e WHERE e.DEPARTMENT_ID = 100)
;

--12
SELECT *
FROM EMPLOYEES e 
	LEFT OUTER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE COMMISSION_PCT is NOT NULL 
;

--13
SELECT EMPLOYEE_ID , FIRST_NAME , JOB_ID , SALARY 
FROM EMPLOYEES e 
WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES e2 WHERE EMPLOYEE_ID = 123)
AND  SALARY  = (SELECT SALARY  FROM EMPLOYEES e2 WHERE EMPLOYEE_ID = 192)

;



























