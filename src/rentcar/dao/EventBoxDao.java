package rentcar.dao;

import java.util.ArrayList;

import rentcar.dto.EventBox;

public interface EventBoxDao {
	// 이벤트 보관함 추가
	int insertEventBox(EventBox eventBox);
	
	// 이벤트 보관함 삭제 - 이벤트 코드번호로 삭제
	int deleteEventBox(EventBox eventBox);
	
	// 이벤트 보관함 - 아이디 및 쿠폰 코드 찾기
	EventBox selectEventBoxFindCodeId(String eventCode, String id);
	
	// 이벤트 찾기 - 코드
	ArrayList<EventBox> selectEventBoxFindCode(String eventCode);
	
	// 이벤트 종료 - 보관함에 사용여부 y
	int updateEventBoxEndIsEvent(String eventCode);

	// 렌트 '예약하기' 에서 쿠폰 사용할 경우 사용여부 y
	int updateEventBoxEndIsEventFromMember(EventBox eventBox);
}
