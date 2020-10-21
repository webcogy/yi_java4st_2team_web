package rentcar.controller.handler.car;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Kind;
import rentcar.service.BrandService;
import rentcar.service.CarService;
import rentcar.service.KindService;

public class CarSearchHandler implements Command {
	private CarService service = new CarService();
	private KindService kService = new KindService();
	private BrandService bService = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			
			int res = Integer.parseInt(request.getParameter("res"));
			String query = request.getParameter("query");
			
			List<Car> carList = service.selectCarByFind(res, query);
			request.setAttribute("carList", carList);

			List<Kind> kindList = kService.kindList();
			request.setAttribute("kindList", kindList);
			
			List<Brand> brandList = bService.brandList();
			request.setAttribute("brandList", brandList);

			return "/admin/car/carList.jsp";
		} else {
			System.out.println("POST");

			return null;
		}
	}
}
