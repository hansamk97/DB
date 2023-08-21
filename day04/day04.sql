SELECT * FROM EMPLOYEES2 e ;

-- DELETE 
DELETE FROM EMPLOYEES2 
WHERE EMPLOYEE_ID = 1; 

-- 테이블 생성
/* 5분까지
 * 테이블 이름 	: sample
 * 컬럼 		: deptNo		number(20)
 * 			  deptName		varchar2(15)
 * 			  deptLoc		varchar2(15)
 * 			  depManager 	varchar2(10)
 */

CREATE TABLE sample(
	deptNo		number(20),
	deptName	varchar2(15),
	deptLoc		varchar2(15),
	deptManager	varchar2(10)
);
SELECT * FROM sample;

/*	15분까지
 *	10, 기획실, 서울, 홍길동
 *	20, 전산실, 부산, 이순신
 *  30, 영업부, 광주, null 
 */
INSERT INTO SAMPLE (deptNo, DEPTNAME, DEPTLOC, DEPTMANAGER)
VALUES (10, '기획실','서울','홍길동');
INSERT INTO SAMPLE VALUES (20, '전산실','부산','이순신');
INSERT INTO SAMPLE VALUES (30, '영업부','광주',null);
SELECT * FROM SAMPLE s; 

/* 20분까지
 * update
 * - 부서번호가 30번 부서를 50번으로 변경
 */
UPDATE 	SAMPLE SET DEPTNO = 50
WHERE 	DEPTNO = 30;
SELECT * FROM SAMPLE s ;

UPDATE SAMPLE SET DEPTLOC = '인천'
WHERE 	DEPTNAME = '영업부';

/* 
 * 삭제,
 * 영업부 삭제
 */
DELETE FROM SAMPLE s WHERE DEPTNAME = '영업부';
SELECT * FROM  SAMPLE s ;

COMMIT;
SELECT * FROM SAMPLE s ;
DELETE sample;
ROLLBACK;

/* not null */
CREATE TABLE null_test(
	col1	varchar2(20) NOT NULL,
	col2 	varchar2(20) NULL,
	col3 	varchar2(20)
);
SELECT * FROM null_test;

INSERT INTO NULL_TEST (col1, col2) 
VALUES ('aa','bb');
-- 에러 발생
INSERT INTO NULL_TEST (col2, col3) 
VALUES ('cc','dd');

INSERT INTO NULL_TEST (col1, col3) 
VALUES ('cc','dd');
SELECT * FROM NULL_TEST nt ;

/* unique */
CREATE TABLE unique_test(
	col1	varchar2(20) UNIQUE NOT NULL,
	col2	varchar2(20) UNIQUE,
	col3	varchar2(20) NOT NULL,
	col4 	varchar2(20) NOT NULL,
	CONSTRAINTS temp_unique unique(col3, col4)
);
SELECT * FROM unique_test;

INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
VALUES ('aa','bb','cc','dd');
INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
VALUES ('aa2','bb2','cc2','dd2');
-- SQL Error [1] [23000]: ORA-00001: 
-- unique constraint (HR.SYS_C008519) violated
UPDATE UNIQUE_TEST SET col1 = 'aa'
WHERE  COL2 = 'bb2';

SELECT * FROM UNIQUE_TEST ut ;
INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
VALUES ('aa3', '', 'cc3','dd3');
INSERT INTO UNIQUE_TEST (col1, COL2, COL3, COL4)
VALUES ('aa4', '', 'cc4','dd4');
UPDATE UNIQUE_TEST SET col4 = 'dd3'
WHERE  COL1 = 'aa3';
----------------------------------------------------
/*
 * unique 제약으로 들어가는 컬럼들은 그들의 조합이 유일해야 한다.
 * 각 컬럼의 데이터의 유일함은 의미가 없고, 조합이 유일해야 한다. 
 * constraints 제약명 unique(컬럼1, 컬럼2, ..)
 */
CREATE TABLE unique_test2(
	col1 	varchar2(20),
	col2	varchar2(20),
	CONSTRAINTS temp_unique2 unique(col1, col2)
);
SELECT * FROM UNIQUE_TEST2;

INSERT INTO UNIQUE_TEST2 (col1, COL2)
VALUES ('aa','ee');

/* check */
CREATE TABLE check_test(
	gender 	varchar2(10) NOT NULL
		CONSTRAINTS check_gender CHECK (gender IN('M','F'))
);
SELECT * FROM check_test;

INSERT INTO CHECK_TEST values('test');

/* primary key */
CREATE TABLE primary_test(
	student_id		number(10) PRIMARY KEY,
	name			varchar2(20)	
);
SELECT * FROM primary_test;

CREATE TABLE primary_test2(
	student_id		number(10),
	name			varchar2(20),
	CONSTRAINTS student_pk PRIMARY key(student_id)
);
SELECT * FROM PRIMARY_TEST2;

/* foreign key */
CREATE TABLE daddy(
	idx		number(10),
	mID		number(10) PRIMARY key
);

CREATE TABLE daughter(
	idx		number(10) PRIMARY KEY,
	mID		number(10),
	CONSTRAINTS fk_da FOREIGN KEY (mID)
	REFERENCES daddy(mID) ON DELETE CASCADE
);
SELECT * FROM DADDY d ;
INSERT INTO daddy VALUES (1, 10);
INSERT INTO daddy VALUES (2, 20);
INSERT INTO daddy VALUES (3, 30);
DELETE FROM DADDY WHERE  IDX = 2;

/*
IDX		MID
1		10
2		20
*/
SELECT * FROM DAUGHTER d ;
INSERT INTO DAUGHTER VALUES (100, 10);
INSERT INTO DAUGHTER VALUES (101, 10);
INSERT INTO DAUGHTER VALUES (102, 10);
INSERT INTO DAUGHTER VALUES (200, 20);
INSERT INTO DAUGHTER VALUES (201, 20);
INSERT INTO DAUGHTER VALUES (202, 20);
INSERT INTO DAUGHTER VALUES (300, 30);
INSERT INTO DAUGHTER VALUES (301, 30);
INSERT INTO DAUGHTER VALUES (302, 30);

----------------------------------------------
CREATE TABLE daddy2(
	idx		number(10),
	mID		number(10) PRIMARY key
);
DROP TABLE daughter2;
CREATE TABLE daughter2(
	idx		number(10) PRIMARY KEY,
	mID		number(10),
	CONSTRAINTS fk_da2 FOREIGN KEY (mID)
	REFERENCES daddy2(mID) ON DELETE SET NULL 
);

SELECT * FROM DADDY2 d ;
INSERT INTO daddy2 VALUES (1, 10);
INSERT INTO daddy2 VALUES (2, 20);
INSERT INTO daddy2 VALUES (3, 30);
DELETE FROM DADDY2 WHERE  IDX = 2;

SELECT * FROM DAUGHTER2 d ;
INSERT INTO DAUGHTER2 VALUES (100, 10);
INSERT INTO DAUGHTER2 VALUES (101, 10);
INSERT INTO DAUGHTER2 VALUES (102, 10);
INSERT INTO DAUGHTER2 VALUES (200, 20);
INSERT INTO DAUGHTER2 VALUES (201, 20);
INSERT INTO DAUGHTER2 VALUES (202, 20);
INSERT INTO DAUGHTER2 VALUES (300, 30);
INSERT INTO DAUGHTER2 VALUES (301, 30);
INSERT INTO DAUGHTER2 VALUES (302, 30);





