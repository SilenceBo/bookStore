package my.destiny.bookstore.admin.web.servlet;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;

public class AdminLoginServlet extends BaseServlet {
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminname = request.getParameter("adminname");
		String password = request.getParameter("password");
		
		if(adminname.equals("admin") && password.equals("123456")){
			return "f:/adminjsps/admin/index.jsp";
		}else {
			request.setAttribute("msg", "您的账户或密码有误");
			return "f:/adminjsps/msg.jsp";
		}
	}
}
