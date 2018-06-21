package my.destiny.bookstore.order.web.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.destiny.bookstore.order.service.OrderService;

import cn.itcast.servlet.BaseServlet;



public class AdminOrderServlet extends BaseServlet{
	
	private OrderService orderService = new OrderService();
	
	/**
	 * 查找所有订单
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("orderList", orderService.findAll());
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	public String findByState(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int state = Integer.parseInt(request.getParameter("state"));
		request.setAttribute("orderList", orderService.findByState(state));
		return "f:/adminjsps/admin/order/list.jsp";
	}
}
