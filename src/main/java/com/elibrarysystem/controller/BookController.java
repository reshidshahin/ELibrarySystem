package com.elibrarysystem.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.elibrarysystem.domain.Book;
import com.elibrarysystem.services.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;

	@RequestMapping(value = "/user/book_form")
	public String bookForm(Model m) {
		Book book = new Book();
		m.addAttribute("command", book);
		return "book_form";// JSP form view
	}

	@RequestMapping(value = "/user/edit_book")
	public String prepareEditForm(Model m, HttpSession session, @RequestParam("cid") Integer bookId) {
		session.setAttribute("aBookId", bookId);
		Book c = bookService.findById(bookId);
		m.addAttribute("command", c);
		return "book_form";// JSP form view
	}
	@RequestMapping(value = "/user/edit_book_list")
	public String prepareEditList(Model m, HttpSession session, @RequestParam("cid") Integer bookId) {
		session.setAttribute("aBookId", bookId);
		Book c = bookService.findById(bookId);
		m.addAttribute("command", c);
		return "book_form";// JSP form view
	}

	@RequestMapping(value = "/user/save_book")
	public String saveOrUpdateBook(@ModelAttribute("command") Book c, HttpSession session, Model m,
								   BindingResult result) {
		Integer bookId = (Integer) session.getAttribute("aBookId");
		if (bookId == null) {
			// save task
			try {
				Integer userId = (Integer) session.getAttribute("userId");
				c.setUserId(userId);// FK ; logged in userId
				bookService.save(c);
				return "redirect:clist?act=sv";// redirect user to book list url
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to save book");
				return "book_form";
			}
		} else {
			// update task
			try {
				c.setBookId(bookId); // PK
				bookService.update(c);
				session.removeAttribute("aBookId");
				return "redirect:clist?act=ed";// redirect user to book list url
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to Edit book");
				return "book_form";
			}
		}
	}

	@RequestMapping(value = "/user/clist")
	public String bookList(Model m, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		m.addAttribute("bookList", bookService.findUserBook(userId));
		return "clist"; // JSP
	}

	@RequestMapping(value = "/user/books")
	public String getAllBook(Model m, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		m.addAttribute("allBookList", bookService.findUserBook(userId));
		return "books"; // JSP
	}

	@RequestMapping(value = "/user/order_book") // bunun icini yaz
	public String orderBook(Model m, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		m.addAttribute("bookList", bookService.findAll());
		return "order"; // JSP
	}

	@RequestMapping(value = "/user/book_search")
	public String bookSearch(Model m, HttpSession session, @RequestParam("freeText") String freeText) {
		Integer userId = (Integer) session.getAttribute("userId");
		m.addAttribute("bookList", bookService.findUserBook(userId, freeText));
		return "clist"; // JSP
	}

	@RequestMapping(value = "/user/del_book")
	public String deleteBook(@RequestParam("cid") Integer bookId) {
		bookService.delete(bookId);
		return "redirect:clist?act=del";
	}

	@RequestMapping(value = "/user/del_book_list")
	public String deleteBookFromList(@RequestParam("cid") Integer bookId) {
		bookService.delete(bookId);
		return "redirect:books";
	}

	@RequestMapping(value = "/user/bulk_cdelete")
	public String deleteBulkBook(@RequestParam("cid") Integer[] bookIds) {
		bookService.delete(bookIds);
		return "redirect:clist?act=del";
	}
}