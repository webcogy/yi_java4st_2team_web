--김창동----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car;

SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car WHERE CAR_NO LIKE '%허%';

SELECT OPT_CODE FROM OPT_BOX WHERE RENT_NO = 3;
SELECT MAX(OPT_BOX) FROM OPT_BOX;

SELECT * FROM RENT r ;

SELECT CAR_NO
  FROM RENT
 WHERE TO_CHAR(TO_DATE(RETURN_DATE)-TO_DATE('2020/10/18')) <= 0;  TO_CHAR(TO_DATE(RENT_DATE)-TO_DATE('2020/10/21')) <=0;


SELECT CAR_NO
  FROM RENT
 WHERE NOT TO_DATE('2020/10/18') BETWEEN TO_DATE(RENT_DATE) AND TO_DATE(RETURN_DATE)
		AND TO_DATE('2020/10/21') BETWEEN to_date; 

	
SELECT min(return_date)
  FROM RENT r 
 WHERE CAR_NO = '03호8254';
--오수정----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE EVENT_CODE = 1;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'y';

SELECT * FROM event_box;

INSERT INTO EVENT_BOX(EVENT_CODE, ID, IS_EVENT) VALUES(1, 'dong', 'y');

DELETE FROM EVENT_BOX WHERE EVENT_BOX = 21;

SELECT * FROM USER_TABLES;

--김대현----------------------------------------------------------------------------------------------------------------------------------------------------------



--이승은----------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM LONGRENT;
--SELECT NO, SUBJECT, CONTENT, REP, ID, REP_YN, WRITE_DATE"
--				+ " FROM QNA WHERE ID =? ORDER BY NO DESC

SELECT NO, title, CONTENTS, EXTERIOR, SAFETY , MULTI , SHEET, FARE , ID, NON_TEL , REP_YN , WRITE_DATE 
FROM LONGRENT WHERE ID = 'dong' ORDER BY NO DESC ;

UPDATE LONGRENT SET id = 'dong' WHERE NO = 1;

--NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT
FROM LONGRENT WHERE NO = 3;

INSERT INTO LONGRENT (NO, title, CONTENTS, REP_YN, WRITE_DATE, rent_term, name,tel, pwd, OPTIONS)
VALUES(?,?,?,?,?,?,?,)

DELETE FROM longrent WHERE NO = 28;

UPDATE LONGRENT SET TITLE = ?, contents = ?, RENT_TERM = ? , name= ? , tel =? , PWD = ?, OPTIONS = ? WHERE NO = ?;
UPDATE LONGRENT SET TITLE = '김창동입니다. 답변을 주세요', contents = '전동킥보드는 장기렌트 안 되나요?', RENT_TERM = '한달' , name= '동자승' , tel ='010-2222-1111' , PWD = '1111', OPTIONS = '풀옵션' WHERE NO = 22;

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM longrent WHERE NUM =? PWD = ?;

SELECT * FROM LONGRENT;


SELECT  COUNT(*) FROM LONGRENT WHERE NO LIKE 1;

--문중희----------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * 
  FROM MEMBER;

INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong1', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');

DELETE FROM MEMBER WHERE ID = 'pp555555';

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS FROM LONGRENT WHERE NO = 3 AND PWD = '1111'