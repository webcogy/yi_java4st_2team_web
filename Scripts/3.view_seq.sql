/*****************************************
시퀀스 삭제
******************************************/
DROP SEQUENCE RENT_NO_SEQ;
DROP SEQUENCE LONGRENT_NO_SEQ;

/*****************************************
시퀀스 생성
******************************************/

--RENT(no)
CREATE SEQUENCE RENT_NO_SEQ
	START WITH 1
	INCREMENT BY 1
	NOcache;

CREATE OR REPLACE TRIGGER TRI_RENT_NO_SEQ
BEFORE INSERT ON RENT
FOR EACH ROW 
BEGIN 
	IF Inserting AND :NEW.RENT_NO IS NULL THEN 
		SELECT RENT_NO_SEQ.NEXTVAL INTO :NEW.RENT_NO FROM DUAL;
	END IF;
END; 

--LONGRENT(no)
CREATE SEQUENCE LONGRENT_NO_SEQ
	START WITH 1
	INCREMENT BY 1;
	
CREATE OR REPLACE TRIGGER TRI_LONGRENT_NO_SEQ
BEFORE INSERT ON LONGRENT
FOR EACH ROW
BEGIN
	IF Inserting AND :NEW.NO IS NULL THEN
		SELECT LONGRENT_NO_SEQ.NEXTVAL INTO :NEW.NO FROM DUAL;
	END IF;
END 