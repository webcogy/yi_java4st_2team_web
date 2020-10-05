DELETE FROM RENT;
DELETE FROM CAR;
DELETE FROM MEMBER;
DELETE FROM INSURANCE;
    
-- 회원
INSERT INTO MEMBER VALUES ('test', 1234, '동자승', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-01, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'Y', '대구 서구 삼익뉴타운', '빡빡이');
INSERT INTO MEMBER VALUES ('test2', 1234, '홍길동', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-02, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'N', '조선', '조선족');
INSERT INTO MEMBER VALUES ('test3', 1234, '크리링', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-03, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'Y', '화성', '빡빡이');
INSERT INTO MEMBER VALUES ('test4', 1234, '손오공', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-04, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'N', '지구', '미친놈');
INSERT INTO MEMBER VALUES ('test5', 1234, '배지터', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-05, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'Y', '지구', '미친놈 친구');
INSERT INTO MEMBER VALUES ('test6', 1234, '손오반', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-06, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'N', '지구', '미친놈 아들');
INSERT INTO MEMBER VALUES ('test7', 1234, '크러쉬', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-07, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'Y', '서울', '딴따라');
INSERT INTO MEMBER VALUES ('test8', 1234, '스펀지밥', '010-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0') || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(1, 9999)), 4, '0'),11-17-174133-08, TRUNC(DBMS_RANDOM.VALUE(1, 1000)) * 10, 'N', '바닷속', '스펀지');

-- 차량
INSERT INTO CAR VALUES ('12하4219', '아반떼', 'S', TRUNC(DBMS_RANDOM.VALUE(1, 1000)), '침수차량');
INSERT INTO CAR VALUES ('52하6437', '소렌토', 'M', TRUNC(DBMS_RANDOM.VALUE(1, 1000)), '잘구른다');
INSERT INTO CAR VALUES ('38허4532', '스타렉스', 'H', TRUNC(DBMS_RANDOM.VALUE(1, 1000)), '티라노 사우르스 렉스같은 강력함, 느껴보세요');
INSERT INTO CAR VALUES ('29허9435', '15인승', 'B', TRUNC(DBMS_RANDOM.VALUE(1, 1000)), '운전기사 필수');
INSERT INTO CAR VALUES ('19호2362', '30인승', 'B', TRUNC(DBMS_RANDOM.VALUE(1, 1000)), '마!');
INSERT INTO CAR VALUES ('06호8254', '지프지프', 'J', TRUNC(DBMS_RANDOM.VALUE(1, 1000)), '내가 낸데');
INSERT INTO CAR VALUES ('03호8254', '30인승', 'B', TRUNC(DBMS_RANDOM.VALUE(1, 1000)), '내가 내다!');

-- 보험
INSERT INTO INSURANCE VALUES ('보험', 5000);

-- 회원
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, ADDRESS)
VALUES ('dong', '1234', '동자승', '010-1234-1234', '22-15-061904-90', '대구시 서구');
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, ADDRESS)
VALUES ('one', '1111', '원', '010-1111-1111', '22-15-061904-91', '서울시 서구');
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, ADDRESS)
VALUES ('two', '2222', '투', '010-2222-2222', '22-15-061904-92', '부산시 서구');

-- 대여
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test', NULL, '12하4219', '보험', '2018/02/15', '2018/02/17', 1, 0, 0, '절도범');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test2', NULL, '52하6437', '보험', '2018/02/15', '2018/02/17', 1, 0, 0, '사고');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test3', NULL, '38허4532', '보험', '2019/01/15', '2019/02/10', 1, 1, 0, '이상무');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test4', NULL, '29허9435', '보험', '2019/05/15', '2019/05/16', 1, 1, 0, '빵상');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test5', NULL, '19호2362', '보험', '2019/07/12', '2019/07/15', 1, 0, 0, '장발장');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test6', NULL, '06호8254', '보험', '2020/05/20', '2020/05/22', 1, 0, 0, '차량파손');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test7', NULL, '03호8254', '보험', '2021/05/23', '2021/05/25', 1, 0, 1, '차량파손');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES (NULL, '010-1234-5678', '03호8254', '보험', '2020/05/23', '2020/05/25', 0, 0, 0, '연락두절');
UPDATE RENT r SET PRICE = TO_CHAR(TO_DATE(RETURN_DATE)-TO_DATE(RENT_DATE)) * (SELECT PRICE FROM CAR WHERE CAR_NO = r.CAR_NO);

--장기렌트
INSERT INTO LONGRENT VALUES (1,'제목', '내용', '외관/내장', '안전', '편의/멀티미디어', '시트', 5000000, NULL, NULL, 1, SYSDATE);
--INSERT INTO LONGRENT(NO, title, CONTENTS, EXTERIOR, SAFETY, MULTI, SHEET, FARE) VALUES (1, '제목', '내용', '외관/내장', '안전', '편의/멀티미디어', '시트', 5000000);



-- 조회
SELECT * FROM CAR;
SELECT * FROM CUSTOMER;
SELECT * FROM RENT;
SELECT * FROM LONGRENT;
SELECT * FROM MEMBER;
