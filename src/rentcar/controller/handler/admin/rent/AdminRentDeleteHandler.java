package rentcar.controller.handler.admin.rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Rent;
import rentcar.service.RentService;
import rentcar.utils.Paging;

public class AdminRentDeleteHandler implements Command {
	private RentService rentService = new RentService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int rentNo = Integer.parseInt(request.getParameter("rentNo"));
//		System.out.println("rentNo>>>>>>" + rentNo);
		int res = rentService.updateRent_isRent(rentNo); // 삭제하려고 했으나 반납유무 y로 수정함
		response.getWriter().print(res);
		return null;
	}
	
}
