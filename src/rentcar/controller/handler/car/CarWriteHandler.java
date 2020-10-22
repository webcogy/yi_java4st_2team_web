package rentcar.controller.handler.car;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Kind;
import rentcar.service.BrandService;
import rentcar.service.CarService;
import rentcar.service.KindService;

public class CarWriteHandler implements Command {
	private CarService service = new CarService();
	private KindService kService = new KindService();
	private BrandService bService = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			
			List<Kind> kindList = kService.kindList();
			request.setAttribute("kindList", kindList);
			
			List<Brand> brandList = bService.brandList();
			request.setAttribute("brandList", brandList);
			
		return "/admin/car/carWrite.jsp";
	} else {
		System.out.println("POST");
		response.setContentType("text/html; charsert=UTF8");
		PrintWriter out = response.getWriter();

		String savePath = "upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String enctype = "UTF-8";
		int res = 0;

		ServletContext context = request.getServletContext(); // 컨트롤러 인터페이스를 상속받아 처리하는 경우 request 사용
		String uploadFilePath = context.getRealPath(savePath);

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, enctype,
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();

			String no = multi.getParameter("carNo");
//			String name = multi.getParameter("carName");
//			int kindNo = Integer.parseInt(multi.getParameter("kind"));
//			int brandNo = Integer.parseInt(multi.getParameter("brand"));
//			String remark = multi.getParameter("remark");
//			String image = multi.getFilesystemName("image");
//
//			Car c = new Car();
//			c.setNo(no);
//			c.setName(name);
//			c.setKind(new Kind(kindNo));
//			c.setBrand(new Brand(brandNo));
//			c.setRemark(remark);
//			c.setImage(image);
			if(service.isCar(no)) {
				Gson gson = new Gson();
				Car c = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Car.class);
				System.out.println("json 잘 왔니^^? " + c);
//				res = service.insertCar(c);
				
				response.setCharacterEncoding("UTF-8");
				response.setStatus(HttpServletResponse.SC_ACCEPTED);
				
				PrintWriter pw = response.getWriter();
				pw.print(res);
				pw.flush();
//				response.sendRedirect("carList.do");
			}
		} catch (Exception e) {
			System.out.println("예외 발생 : " + e);
		}
	}
		return null;
}
}
