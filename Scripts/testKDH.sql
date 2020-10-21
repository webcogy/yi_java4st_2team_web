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
--조회----------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *  FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE 
WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO
FROM rent r
WHERE NOT(TO_DATE(RENT_DATE) > TO_DATE('202010090','YYYYMMDDHH24') OR TO_DATE(RETURN_DATE) < TO_DATE('202010090','YYYYMMDDHH24')));