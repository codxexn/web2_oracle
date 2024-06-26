DROP TABLE WEB_GIFT_LIST;
DROP TABLE WEB_PRODUCT;

-- 상품테이블 생성(제약조건을 테이블 레벨에서 작성)
CREATE TABLE WEB_PRODUCT( 
   PRODUCT_NUMBER NUMBER,
   PRODUCT_NAME VARCHAR2(1000), 
   PRODUCT_PRICE NUMBER,
   CONSTRAINT PK_PRODUCT PRIMARY KEY(PRODUCT_NUMBER)
);

SELECT * FROM WEB_PRODUCT;

-- PRODUCT 테이블에 데이터 저장
INSERT INTO WEB_PRODUCT
VALUES(1, '아이패드', 800000);

INSERT INTO WEB_PRODUCT
VALUES(2, '플스5', 800000);

INSERT INTO WEB_PRODUCT
VALUES(3, '갤럭시워치', 500000);

INSERT INTO WEB_PRODUCT
VALUES(4, '노트북', 2000000);

INSERT INTO WEB_PRODUCT
VALUES(5, '아이폰', 1500000);

--INSERT INTO WEB_PRODUCT
--VALUES(2, '노트북', 2000000); --상품번호가 PK기 때문에 중복값 허용하지 않음

--INSERT INTO WEB_PRODUCT
--VALUES(NULL, '노트북', 2000000); --상품번호가 PK기 때문에 NULL값 허용하지 않음


-- 선물 목록 테이블(WEB_GIFT_LIST)
CREATE TABLE WEB_GIFT_LIST( 
   GIFT_ID NUMBER,
   GIFT_NAME VARCHAR2(1000),
   PRODUCT_NUMBER NUMBER,
   CONSTRAINT PK_GIFT PRIMARY KEY(GIFT_ID),
   CONSTRAINT FK_PRODUCT FOREIGN KEY(PRODUCT_NUMBER) REFERENCES WEB_PRODUCT(PRODUCT_NUMBER)
);


DROP TABLE WEB_GIFT_LIST;

CREATE TABLE WEB_STUDENT(
	STUDENT_NUMBER NUMBER CONSTRAINT PK_STUDENT PRIMARY KEY,
	STUDENT_ID VARCHAR2(1000) CONSTRAINT UN_STUDENT UNIQUE,
	STUDENT_NAME VARCHAR2(1000),
	STUDENT_MAJOR VARCHAR2(1000),
	STUDENT_GENDER CHAR(1) DEFAULT 'F' NOT NULL
	CONSTRAINT CK_STUDENT
	CHECK (STUDENT_GENDER = 'M' OR STUDENT_GENDER = 'F')
);

SELECT * FROM WEB_STUDENT;

INSERT INTO WEB_STUDENT
VALUES('1', 'NO1ZEUS', '제우스', '컴퓨터 공학', 'M');

INSERT INTO WEB_STUDENT
VALUES('2', 'BEAUTIFULHERA', '헤라', '컴퓨터 공학', 'F');

CREATE TABLE WEB_ORDER(
	ORDER_NUMBER NUMBER,
	ORDER_DATE DATE,
	ORDER_ID VARCHAR2(1000),
	CONSTRAINT PK_ORDER PRIMARY KEY (ORDER_NUMBER, ORDER_DATE)
);

INSERT INTO WEB_ORDER
VALUES(1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 101);

INSERT INTO WEB_ORDER
VALUES(2, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 102);

SELECT * FROM WEB_ORDER;

CREATE TABLE WEB_MEMBER(
	MEMBER_ID NUMBER CONSTRAINT PK_MEMBER PRIMARY KEY,
	MEMBER_NAME VARCHAR2(255),
	MEMBER_AGE NUMBER,
	MEMBER_PHONE NUMBER NOT NULL,
	MEMBER_ADDRESS VARCHAR2(255)
);

ALTER TABLE WEB_MEMBER MODIFY MEMBER_PHONE VARCHAR2(255);

DELETE FROM WEB_MEMBER
WHERE MEMBER_ID = 1;

DELETE FROM WEB_BOOK
WHERE BOOK_ID = 1;

CREATE TABLE WEB_BOOK (
	BOOK_ID NUMBER CONSTRAINT PK_BOOK PRIMARY KEY,
	BOOK_NAME VARCHAR2(255) NOT NULL,
	BOOK_GENRE VARCHAR2(255) NOT NULL
	CONSTRAINT CK_BOOK
	CHECK (BOOK_GENRE = '인문학' OR BOOK_GENRE = 'IT' OR BOOK_GENRE = '추리' OR BOOK_GENRE = '경영'),
	MEMBER_ID NUMBER, 
	CONSTRAINT FK_BOOK_MEMBER FOREIGN KEY(MEMBER_ID)
	REFERENCES WEB_MEMBER(MEMBER_ID)
);

SELECT * FROM WEB_MEMBER;
SELECT * FROM WEB_BOOK;

INSERT INTO WEB_MEMBER
VALUES(1, '제우스', 20, '0101111111', '올림푸스');

INSERT INTO WEB_BOOK
VALUES(1, '백엔드 정복', 'IT', 1);





