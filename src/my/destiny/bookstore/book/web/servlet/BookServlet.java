package my.destiny.bookstore.book.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.destiny.bookstore.book.domain.Book;
import my.destiny.bookstore.book.service.BookService;

import cn.itcast.servlet.BaseServlet;

public class BookServlet extends BaseServlet {

	private BookService bookService = new BookService();

	public String load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bid = request.getParameter("bid");
		Book load = bookService.load(bid);
		request.setAttribute("book", load);
		return "f:/jsps/book/desc.jsp";
	}

	/**
	 * 按分类查询
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCategroy(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		request.setAttribute("bookList", bookService.findByCategory(cid));
		return "f:/jsps/book/list.jsp";
	}

	/**
	 * 查询所有图书
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("bookList", bookService.findAll());
		return "f:/jsps/book/list.jsp";
	}
}
