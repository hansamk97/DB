--1
CREATE TABLE TB_TEAM(
	team_id		number(10) PRIMARY KEY,
	location	varchar2(10) NOT NULL,
	team_name	varchar2(10) NOT NULL,
	phone_num	varchar2(15),
	home		varchar2(60)
); 

CREATE TABLE TB_PLAYER(
	player_num		number(10) PRIMARY KEY,
	player_name		varchar2(10) not NULL,
	posit			varchar2(10),
	tall			number(3),
	team_id			number(10)
	CONSTRAINTS fk_tb_team FOREIGN KEY (team_id)
	REFERENCES TB_TEAM(team_id) ON DELETE CASCADE
	);
--2	
INSERT INTO TB_TEAM VALUES (3, '서울', '성수', '010-1234-5678', 'www.abc.com');
INSERT INTO TB_TEAM VALUES (4, '제주', '건대', '010-1234-5679', 'www.def.com');
SELECT * FROM TB_TEAM tt ;

--3
INSERT INTO TB_PLAYER VALUES (1, '박지성', '투수', 1, 13);
INSERT INTO TB_PLAYER VALUES (2, '박주영', '타자', 2, 14);
INSERT INTO TB_PLAYER VALUES (3, '이영표', '포수', 3, 15);
INSERT INTO TB_PLAYER VALUES (4, '설기현', '투수', 4, 16);
INSERT INTO TB_PLAYER VALUES (5, '제라드', '포수', 5, 17);
INSERT INTO TB_PLAYER VALUES (6, '램파드', '투수', 6, 18);
INSERT INTO TB_PLAYER VALUES (7, '스콜스', '타자', 7, 19);
INSERT INTO TB_PLAYER VALUES (8, '파바르', '포수', 8, 10);
INSERT INTO TB_PLAYER VALUES (9, '즐라탄', '투수', 9, 11);
INSERT INTO TB_PLAYER VALUES (10, '메시', '투수', 10, 12);


--4
SELECT tp.PLAYER_NUM , tp.PLAYER_NAME , tp.POSIT , tp.TALL , tt.TEAM_NAME ,tt.HOME 
FROM TB_PLAYER tp
	LEFT OUTER JOIN TB_TEAM tt 
	ON tp.TEAM_ID = tt.TEAM_ID 
;

--5
DROP TABLE TB_TEAM ;
DROP TABLE TB_PLAYER ;

--6
--6-1
--LOCATIONS 테이블 : 부모
--COUNTRIES 테이블 : 자식

--6-2
--COUNTRIES 테이블 : 부모
--REGIONS 테이블 : 자식

--6-3
--ON DELETE cascade
--참조되는 부모테이블의 값이 삭제되면 연쇄적으로 자식테이블의 값도 삭제된다.

--6-4
--ON DELETE SET null
--부모테이블의 값이 삭제되면 해당 참조되는 자식테이블의 값은 null값이 된다.

--7
CREATE OR REPLACE VIEW v_employee(emp_id, name, department_id, hire_date, dept_name)
AS 
SELECT e.EMPLOYEE_ID , CONCAT(RPAD(e.FIRST_NAME,LENGTH(e.FIRST_NAME)+1) ,e.LAST_NAME ) , e.DEPARTMENT_ID , e.HIRE_DATE, d.DEPARTMENT_NAME 
FROM EMPLOYEES e 
	LEFT OUTER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID 
WHERE e.DEPARTMENT_ID = 20
;


















