package rentcar.controller.handler.longrent;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;
import rentcar.utils.Paging;

public class LongRentHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage"); //현재페이지
		System.out.println("longrent nowPage : " + nowPage );
		String cntPerPage = "10"; //페이지당 몇 개의 글을 보일지 저장
		
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
		
		
		int total = 0;
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			//처음 접속했을 때 초기 세팅
			total = service.countLongRentByAll();
		}else {
			System.out.println("longrent ->>>>> post");
			total = service.countSearchLongRentByAll(condition, keyword);
		}
		
		if(nowPage == null) {
			nowPage = "1";
		}
		
		//이후 페이지 클래스로 정리하는 곳
		Paging paging = new Paging(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		
		ArrayList<LongRent> list= null;
		if (request.getMethod().equalsIgnoreCase("get")) {
			list = service.pagingLongRentByAll(paging);
		} else { // POST
		
			list = (ArrayList<LongRent>) service.searchLongRentPagingList(condition, keyword, paging);
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
			request.setAttribute("method", "post");
		}
		
		System.out.println("현재 페이지 ===>" + nowPage);
		System.out.println("한 페이지당 나오는 게시물수 ===>" + cntPerPage);
		System.out.println("총게시물 갯수 ===>" + total);
		
		System.out.println(paging);
		System.out.println(list);

		request.setAttribute("total", total);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		

		return "/longrent/longrent_list.jsp";
	}
}
