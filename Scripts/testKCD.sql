--조회
SELECT * FROM CAR;
SELECT * FROM MEMBER;
SELECT * FROM ADMIN;
SELECT * FROM RENT;
SELECT * FROM INSURANCE;
SELECT * FROM LONGRENT;
SELECT * FROM OPTIONS;
SELECT * FROM KIND;
SELECT * FROM EVENT;
SELECT * FROM BRAND;
SELECT * FROM EVENT_BOX;
SELECT * FROM OPT_BOX;
-- 대여일 넣어 차량구하기----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT CAR_NO 
  FROM rent r
 WHERE NOT(TO_DATE(RENT_DATE) > TO_DATE('2020/10/15') OR TO_DATE(RETURN_DATE) < TO_DATE('2020/10/15'));

SELECT *
  FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE
 WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO 
  FROM rent r
 WHERE NOT(TO_DATE(RENT_DATE) > TO_DATE('2020/10/15') OR TO_DATE(RETURN_DATE) < TO_DATE('2020/10/15')));

-- 대여일, 반납일 넣어 차량구하기
SELECT DISTINCT CAR_NO
  FROM rent r
 WHERE (TO_DATE(RENT_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RENT_DATE) < TO_DATE('2020/10/25'))
	OR (TO_DATE(RETURN_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RETURN_DATE) < TO_DATE('2020/10/25'));  //각 대여rent값이 대여일보다 크며 반납일보다 작은차량, 각 대여return값이 대여일보다 크며 반납일보다 작은차량

SELECT *
  FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE
 WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO
  FROM rent r
 WHERE (TO_DATE(RENT_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RENT_DATE) < TO_DATE('2020/10/25'))
	OR (TO_DATE(RETURN_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RETURN_DATE) < TO_DATE('2020/10/25')));

-- 해당차량의 최대 대여일표기
SELECT min(return_date) AS RETURN_DATE 
  FROM RENT r
 WHERE CAR_NO = '11하0123';

INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values('dong', '15후1234', 1, to_date('2020/10/22 10:15:15','YYYY-MM-DD HH24:MI:SS'), to_date('2020/10/30 10:15:15','YYYY-MM-DD HH24:MI:SS'), 'Y', 500000, '동자동자');

SELECT k.kind_name, count(CAR_NO) FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE GROUP BY k.KIND_NAME ORDER BY k.KIND_NAME;

SELECT b.BRAND_NAME, count(CAR_NO) FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE GROUP BY b.BRAND_NAME ORDER BY b.BRAND_NAME;

SELECT * FROM kind;

SELECT *  FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE  WHERE KIND_NAME LIKE '%' || '소형' || '%';

SELECT * FROM CAR ORDER BY car.KIND_CODE;

SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE ORDER BY c.KIND_CODE) a) WHERE RN BETWEEN 1 AND 5 ORDER BY RN;

SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE WHERE CAR_NAME LIKE '%11%' ORDER BY c.KIND_CODE) a) WHERE RN BETWEEN 1 AND 10 ; 