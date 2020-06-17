package com.elibrarysystem.services;

import com.elibrarysystem.dao.BaseDAO;
import com.elibrarysystem.dao.BookDAO;
import com.elibrarysystem.domain.Book;
import com.elibrarysystem.rowmapper.BookRowMapper;
import com.elibrarysystem.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BookServiceImpl extends BaseDAO implements BookService {

    @Autowired
    private BookDAO bookDAO;
    @Autowired
    private UserService userService;


    @Override
    public void save(Book c) {
        bookDAO.save(c);
    }

    @Override
    public void update(Book c) {
        bookDAO.update(c);
    }

    @Override
    public void delete(Integer bookId) {
        bookDAO.delete(bookId);
    }

    public List<Book> findAll() {
        return bookDAO.findAllBooks();
    }

    @Override
    public void delete(Integer[] bookIds) {
        String ids = StringUtil.toCommaSeparatedString(bookIds);
        String sql = "DELETE FROM books WHERE bookId IN(" + ids + ")";
        getJdbcTemplate().update(sql);
    }

    @Override
    public List<Book> findUserBook(Integer userId) {
        return bookDAO.findByProperty("userId", userId);
    }

    @Override
    public List<Book> findUserBook(Integer userId, String txt) {
        String sql = "SELECT bookId, userId, bookName, author, issuedTime, returnTime, comments FROM books WHERE userId=? AND (bookName LIKE '%" + txt + "%' OR author LIKE '%" + txt + "%' OR issuedTime LIKE '%" + txt + "%' OR returnTime LIKE '%" + txt + "%' OR comments LIKE '%" + txt + "%')";
        return getJdbcTemplate().query(sql, new BookRowMapper(), userId);
    }

    @Override
    public Book findById(Integer bookId) {
        return bookDAO.findById(bookId);
    }


}
