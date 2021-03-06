package rentcar.dao.impl;

import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;
import rentcar.dto.Car;
import rentcar.dto.Ins;
import rentcar.dto.Member;
import rentcar.dto.Rent;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RentDaoImplTest {
	private static RentDaoImpl dao = RentDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void test01SelectRentByAll() {
		System.out.println("testSelectRentByAll");
		List<Rent> list = dao.selectRentByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test // test할때마다 숫자1씩 올려줄것
	public void test02SelectRentByNo() {
		System.out.println("testSelectRentByNo");
		Rent r = dao.selectRentByNo(6);
		Assert.assertNotNull(r);
		System.out.println(r);
	}

	@Test
	public void test03InsertRent() {
		System.out.println("testInsertRent");
		LocalDateTime rent_date = LocalDateTime.of(2020, 10, 20, 0, 0);
		LocalDateTime return_date = LocalDateTime.of(2020, 10, 25, 0, 0);
		Rent r = new Rent(new Member("dong"), new Car("13히1234"), new Ins(1), rent_date, return_date, "Y", 50000, "동자승");
		int res = dao.insertRent(r);
		Assert.assertEquals(1, res);
	}

	@Test // test할때마다 숫자1씩 올려줄것
	public void test04UpdateRent() {
		System.out.println("testUpdateRent");
		LocalDateTime rent_date = LocalDateTime.of(2020, 10, 20, 0, 0);
		LocalDateTime return_date = LocalDateTime.of(2020, 10, 25, 0, 0);
		Rent r = new Rent(6, new Member("dong"), new Car("14호1234"), new Ins(1), rent_date, return_date, "Y", 50000, "동자승");
		int res = dao.updateRent(r);
		Assert.assertEquals(1, res);
	}

	@Test // test할때마다 숫자1씩 올려줄것
	public void test05DeleteRent() {
//		System.out.println("testDeleteRent");
//		Rent r = new Rent(7);
//		int res = dao.deleteRent(r);
//		Assert.assertEquals(1, res);
	}

}
