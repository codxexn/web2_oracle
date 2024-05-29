-- 주석 : 설명문(ctrl + /)
-- hr 계정 내에 존재하는 emloyees 테이블
-- 11개의 컬럼으로 이루어져 있다.
-- 107개의 행이 존재한다.
-- 107명의 직원 데이터를 저장해놓은 연습용 테이블

SELECT FIRST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;
SELECT LAST_NAME, FIRST_NAME, PHONE_NUMBER, EMAIL, EMPLOYEE_ID FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM EMPLOYEES e
ORDER BY SALARY ASC; 

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE 
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

SELECT FIRST_NAME 이름, LAST_NAME 성, SALARY 봉급, HIRE_DATE 고용일
FROM EMPLOYEES e 
ORDER BY FIRST_NAME ASC, LAST_NAME ASC;

SELECT COUNT(JOB_ID)  
FROM EMPLOYEES e
WHERE e.JOB_ID = 'FI_ACCOUNT';

SELECT JOB_ID 직종
FROM EMPLOYEES e;

SELECT FIRST_NAME 이름, LAST_NAME 성, SALARY 봉급, PHONE_NUMBER 전화번호
FROM EMPLOYEES e 
ORDER BY 봉급 DESC;

-- 두값의 연결 결과를 조회하는 것, 다른 테이블을 참조할 필요가 없이 값을 확인하고 싶을 때 사용하는 테이블, VARCHAR2로 나옴
SELECT 10 || 20
FROM DUAL;

-- 문자도 작은 따옴표로 표현한다.
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME"
FROM EMPLOYEES e ;

SELECT FIRST_NAME || ' ' || LAST_NAME AS 이름, EMAIL || '@koreait.com' AS 이메일
FROM EMPLOYEES e; 

-- 산술 연산자
SELECT EMPLOYEE_ID, EMPLOYEE_ID + 10, EMPLOYEE_ID -10, EMPLOYEE_ID * 2, EMPLOYEE_ID /2
FROM EMPLOYEES e;

SELECT HIRE_DATE, HIRE_DATE + 10, HIRE_DATE - 10
FROM EMPLOYEES e;

-- 날짜를 산술 연산하면 일자에서 더하거나 뺀 값이 결과로 나온다.
SELECT TO_DATE('2023-12-31', 'YYYY-MM-DD') - TO_DATE('2023-12-25', 'YYYY-MM-DD') AS 일자차이
FROM DUAL;

SELECT FIRST_NAME || ' ' || LAST_NAME AS 이름, 
SALARY AS 기존봉급, 
SALARY * 1.1 AS 인상봉급, 
SALARY * 0.95 AS 감축봉급
FROM EMPLOYEES e
ORDER BY SALARY;

SELECT SYSDATE 
FROM DUAL;

SELECT HIRE_DATE AS 고용일, SYSDATE AS 오늘, SYSDATE - HIRE_DATE AS "고용일 기준 지난 일자"
FROM EMPLOYEES e; 

-- 시간으로 연산할 때는 하루를 1로 생각해서 소수점으로 연산하면 된다.
SELECT SYSDATE,
SYSDATE + 0.5,
SYSDATE - 0.5
FROM DUAL;







