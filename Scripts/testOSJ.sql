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
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT ORDER BY EVENT_CODE DESC;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE EVENT_CODE = 1;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'y';

SELECT * FROM event_box;

SELECT EVENT_BOX, EVENT_CODE, ID, IS_EVENT FROM EVENT_BOX WHERE EVENT_CODE = 1 AND ID = 'dong';

INSERT INTO EVENT_BOX(EVENT_CODE, ID) VALUES(1, 'dong');

UPDATE EVENT_BOX SET IS_EVENT = 'n' WHERE ID = 'dong';

DELETE FROM EVENT_BOX;

SELECT * FROM USER_TABLES;

SELECT * FROM MEMBER;

SELECT * FROM USER_TABLES;

select count(*) from EVENT;

SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM EVENT ORDER BY EVENT_CODE DESC) a) WHERE RN BETWEEN 1 AND 5 ORDER BY RN;
