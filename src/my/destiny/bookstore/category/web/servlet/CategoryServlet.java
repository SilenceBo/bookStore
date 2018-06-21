package my.destiny.bookstore.category.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.destiny.bookstore.category.service.CategoryService;
import cn.itcast.servlet.BaseServlet;

public class CategoryServlet extends BaseServlet{
	
	private CategoryService categoryService = new CategoryService();
	/**
	 * 查询所有分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		requset.setAttribute("categoryList", categoryService.findAll());
		return "f:/jsps/left.jsp";
	}
}
