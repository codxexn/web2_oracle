-- EMPLOYEES 테이블에서 직원의 이름, 성을 이름 별칭 붙이기
SELECT first_name || ' ' || last_name "이름"
FROM EMPLOYEES;

-- 이름과 봉급을 조회해서 봉급 기준으로 내림차순 정렬 조회하기
SELECT first_name || ' ' || last_name "이름",
	SALARY 봉급
FROM EMPLOYEES
ORDER BY 봉급 DESC;

-- 이름과 봉급, 이메일주소 조회하기
SELECT first_name || ' ' || last_name "이름",
	SALARY 봉급,
	EMAIL||'@koreait.com' 이메일주소
FROM EMPLOYEES;

--3. 관계연산자(where절)
-- 직원 이름, 성, 봉급 조회한다
-- 단, 봉급이 10000이상인 직원 정보만 조회
SELECT first_name, last_name, salary
FROM EMPLOYEES
WHERE salary >= 10000
ORDER BY salary;


-- 직원의 이름, 성을 조회
-- 단, 이름이 David인 직원만 골라서 출력
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE first_name = 'David';
-- 문자타입은 반드시 ''로 감싸준다
-- 대소문자를 동일하게 작성해야한다

-- 별칭설정
SELECT FIRST_NAME 이름,
	last_name 성,
	salary 봉급
FROM EMPLOYEES
WHERE SALARY >= 10000  -- 오류발생
ORDER BY 봉급;

-- 4) SQL연산자
-- employees 테이블에서 salary가 10000이상 12000이하인 직원들의
-- first_name, last_name, salary를
-- salary 오름차순으로 조회하기

SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000
ORDER BY salary;


-- hire_date => 2005-12-31부터 2007-12-31
-- 성과 이름은 이름 별칭으로
-- salary, hire_date 조회하기

SELECT first_name || ' ' ||last_name 이름,
	salary, hire_date
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2005-12-31' AND '2007-12-31';

-- IN
-- EMPLOYEES 테이블에서
-- salary가 10000 또는 11000 또는 12000인 직원의
-- first_name, last_name, salary를
-- salary 오름차순으로 정렬하여 조회

SELECT first_name, last_name, salary
FROM employees
WHERE salary IN(10000, 11000, 12000)
ORDER BY salary;

-- LIKE
-- 'David' Da
-- % : ~아무거나
-- _ : 자리수
SELECT first_name
FROM employees
WHERE first_name LIKE 'Da%';

SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE '____e';

-- e와 n을 포함하는 문자를 조회
SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE '%e%n%';

-- e와 n사이에 한글자가 더 있는 문자를 조회
SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE '%e_n%';

SELECT * FROM employees;

-- NULL도 값이다
-- NULL은 연산하면 결과가 NULL이다
SELECT NULL + 10
FROM dual;

-- employees 테이블에서
-- commission_pct가 NULL인 직원의
-- 이름, 성, commission_pct를 조회하기
SELECT first_name, last_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;
-- NULL 조회할 때 = NULL 조회결과가 나오지 않는다(많이 실수하는 부분!!)
-- NULL값이 들어있는지 검사할 때는 IS NULL을 사용해야한다

-- NULL이 아닌 직원의 이름, 성, commission_pct 조회하기
SELECT first_name, last_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--WHERE commission_pct <> NULL;
-- 조회되지 않는다



-- ANY(a, b, c)
SELECT salary
FROM employees
WHERE salary = ANY(10000, 11000, 12000);

-- ALL(a, b, c)
SELECT  salary
FROM employees
WHERE salary > ALL(10000, 11000, 12000);

-- 5) 논리연산자
-- AND 연산자
-- salary가 5000 이상이고 hire_date가 2005-01-01이후인 직원 조회하기
-- 직원의 성, 이름, salary, hire_date

SELECT last_name, first_name, salary, hire_date
FROM employees
WHERE salary >= 5000 AND hire_date >= '2005-01-01';

-- OR 연산자
SELECT * FROM EMPLOYEES;
-- department_id가 30이거나 100인 직원 조회하기
-- 직원 성, 이름, department_id, salary 조회
SELECT last_name, first_name, department_id, salary
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 100;

-- NOT 연산자
-- job_id가 IT_PROG가 아닌 직원 조회하기
SELECT last_name, first_name, job_id, salary
FROM EMPLOYEES
WHERE NOT job_id ='IT_PROG';

-- 복합논리연산자 사용
-- 직원의 성, 이름, job_id, salary, comission_pct, manager_id 조회
-- 급여가 8000이상, commission_pct가 0.2보다 크거나 manager_id가 101인 직원을 조회
SELECT last_name, first_name, job_id, salary, commission_pct, manager_id
FROM employees
WHERE salary >= 8000 AND (commission_pct > 0.2 OR MANAGER_ID = 101);

-- 테이블 생성(WEB_MEMBER)
CREATE TABLE WEB_MEMBER(
	MEMBER_ID NUMBER,
	MEMBER_NAME VARCHAR2(1000),
	MEMBER_AGE NUMBER
);

SELECT * FROM WEB_MEMBER;

-- WEB_MEMBER 테이블에 정보를 추가하기 전에 무슨 데이터가 있는지
-- 확인 결과를 보고 컬럼의 이름과 타입을 맞춰서 값을 넣어준다
-- 회원정보 추가
INSERT INTO WEB_MEMBER (MEMBER_ID, MEMBER_NAME, MEMBER_AGE)
VALUES(1, '이도은', 20);

INSERT INTO WEB_MEMBER
VALUES(2, '홍길동', 14);

SELECT * FROM WEB_MEMBER;

-- 여러개의 행을 한번에 추가하기(UNION ALL 추가 뒤에서 다시 진행)
INSERT INTO WEB_MEMBER (MEMBER_ID, MEMBER_NAME, MEMBER_AGE)
VALUES (3, '짱구', 5);
INSERT INTO WEB_MEMBER (MEMBER_ID, MEMBER_NAME, MEMBER_AGE)
VALUES (4, '유리', 5);

-- 데이터 수정
UPDATE WEB_MEMBER
SET MEMBER_NAME = '이도은';

SELECT * FROM WEB_MEMBER;

-- MEMBER_AGE 14인 값의 이름을 홍길동으로 변경
UPDATE WEB_MEMBER
SET MEMBER_NAME = '홍길동'
WHERE MEMBER_AGE = 14;

-- MEMBER_ID 3인 값의 이름을 짱구로 변경
UPDATE WEB_MEMBER
SET MEMBER_NAME = '짱구'
WHERE MEMBER_ID = 3;

SELECT * FROM WEB_MEMBER; 

-- MEMBER ID  5, 6
-- NAME 김철수 김영희
-- AGE 마음대로
INSERT INTO WEB_MEMBER
VALUES (5, '김철수', 100);
INSERT INTO WEB_MEMBER(MEMBER_NAME, MEMBER_AGE)
VALUES ('김영희', 22);

UPDATE WEB_MEMBER
SET MEMBER_ID = 6
WHERE MEMBER_NAME = '김영희';

-- 값을 삭제
DELETE FROM WEB_MEMBER
WHERE MEMBER_NAME = '김철수';

SELECT * FROM WEB_MEMBER;

DELETE FROM WEB_MEMBER;
-- WHERE절을 생략하면 모든 행의 데이터가 지워지므로 주의해야한다!!

-- 산타클로스가 아이들에게 선물을 줄 목록 저장할 테이블
CREATE TABLE WEB_CHRISTMAS_GIFTS(
	GIFT_ID NUMBER,
	CHILD_NAME VARCHAR2(100),
	GIFT_DESCRIPTION VARCHAR2(255)
);

SELECT * FROM WEB_CHRISTMAS_GIFTS;

-- GIFT_ID 1부터 시작, 아이의 이름과 선물 설명을 작성
INSERT INTO WEB_CHRISTMAS_GIFTS
VALUES(1, '짱구', '액션가면');

INSERT INTO WEB_CHRISTMAS_GIFTS
VALUES(2, '유리', '토끼인형');

INSERT INTO WEB_CHRISTMAS_GIFTS
VALUES(3, '맹구', '예쁜돌멩이');

-- 추가 본인이름, 본인이 받고싶은 선물
INSERT INTO WEB_CHRISTMAS_GIFTS
VALUES(4, '이도은', '플레이스테이션5');

SELECT * FROM WEB_CHRISTMAS_GIFTS;

-- GIFT_ID값이 1인 행을 삭제
DELETE FROM WEB_CHRISTMAS_GIFTS
WHERE GIFT_ID = 1;

-- 과제 학생 점수가 있는 테이블 만들기
CREATE TABLE WEB_STUDENT(
	STUDENT_NUMBER NUMBER,
	STUDENT_NAME VARCHAR2(100),
	STUDENT_MATH NUMBER,
	STUDENT_ENG NUMBER,
	STUDENT_KOR NUMBER,
	STUDENT_GRADE VARCHAR2(100)
);

SELECT * FROM WEB_STUDENT;


