package rentcar.service;

import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.List;

import rentcar.dao.CarDao;
import rentcar.dao.impl.CarDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Car;

public class CarService {
	private static Connection con;
	private CarDao dao;

	public CarService() {
		con = JndiDS.getConnection();
		dao = CarDaoImpl.getInstance();
		((CarDaoImpl) dao).setCon(con);
	}
	
	// 차량리스트 불러오기
	public List<Car> selectCarByAll(){
		return dao.selectCarByAll();
	}
	
	// 렌트중인 차량정보 불러오기
	public List<Car> selectCarByRent(){
		return dao.selectCarByRent();
	}
	
	// 차량목록 분류별로 검색하기
	public List<Car> selectCarByFind(int res, String query){
		return dao.selectCarByFind(res, query);
	}
	
	// 차량정보 불러오기
	public Car selectCarByNo(String no){
		return dao.selectCarByNo(no);
	}
	
	// 대여일기입 대여가능차량 목록 불러오기
	public List<Car> selectRentByCar(LocalDateTime rentDate){
		return dao.selectRentByCar(rentDate);
	}
	
	// 대여반납일 기입 대여가능차량 목록 불러오기
	public List<Car> selectRentByCar(LocalDateTime rentdate, LocalDateTime returnDate){
		return dao.selectRentByCar(rentdate, returnDate);
	}
	
	//차량의 최대 대여일 표기
	
	// 차량 추가하기
	public int insertCar(Car car){
		return dao.insertCar(car);
	}

	// 차량 수정하기
	public int updateCar(Car car){
		return dao.updateCar(car);
	}
	
	// 차량 삭제하기
	public int deleteCar(Car car){
		return dao.deleteCar(car);
	}
}