package rentcar.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import rentcar.dto.Car;
import rentcar.utils.Paging;

public interface CarDao {

	// 차량리스트 불러오기
	List<Car> selectCarByAll();

	// 렌트중인 차량정보 불러오기
	List<Car> selectCarByRent();

	// 차량목록 분류별로 검색하기
	List<Car> selectCarByFind(int res, String query);

	// 차량정보 불러오기
	Car selectCarByNo(String no);

	// 대여일기입 대여가능차량 목록 불러오기
	List<Car> selectRentByCar(LocalDateTime rentDate);

	// 대여반납일 기입 대여가능차량 목록 불러오기
	List<Car> selectRentByCar(LocalDateTime rentdate, LocalDateTime returnDate);

	// 차량의 최대 대여일 표기
	LocalDateTime rentLastDate(Car car);

	// 차량 추가하기
	int insertCar(Car car);

	// 차량 수정하기
	int updateCar(Car car);

	// 차량 삭제하기
	int deleteCar(Car car);

	// 선택한 차량 대여중인지 검색하기
	Car selectRentByNo(LocalDateTime rentDate, LocalDateTime returnDate, String no);

	// 차량추가 전 해당차량이 있을시 false값 반환
	boolean isCar(String no);

	// 차량 대여 횟수 순위
	List<Car> selectCarByRentCount();

	// 페이징
	int countCarByAll();

	ArrayList<Car> pagingCarByAll(Paging paging);

	// 관리자 차량 - 검색
	int countSearchCarByAll(String condition, String keyword);

	ArrayList<Car> searchCarList(String condition, String keyword, Paging paging);

	// 차트 - 차종별 차량수
	JSONArray getCountCarByKind();

	// 차트 - 차종별 대여횟수
	JSONArray getCountKindByRent();

	// 차트 - 브랜드별 차량수
	JSONArray getCountCarByBrand();

	// 차트 - 브랜드별 대여횟수
	JSONArray getCountBrandByRent();
	
	// 차트 - 차량 반납비율
	JSONArray getCountCarByRent();

}