package my.destiny.bookstore.book.service;

import java.util.List;

import my.destiny.bookstore.book.dao.BookDao;
import my.destiny.bookstore.book.domain.Book;

public class BookService {
	
	private BookDao bookDao = new BookDao();
	
	/**
	 * 加载图书
	 * @return
	 */
	public Book load(String bid){
		return bookDao.findByBid(bid);
	}
	
	/**
	 * 按分类查询 
	 * @return
	 */
	public List<Book> findByCategory(String cid){
		return bookDao.findByCategory(cid);
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Book> findAll(){
		return bookDao.findAll();
	}

	/**
	 * 　添加图书
	 * @param book
	 */
	public void add(Book book) {
		bookDao.add(book);
	}
	
	/**
	 * 删除图书
	 * @param bid
	 */
	public void delete(String bid) {
		bookDao.delete(bid);
	}
	
	/**
	 * 编辑图书
	 * @param book
	 */
	public void edit(Book book) {
		bookDao.edit(book);
	}
}
