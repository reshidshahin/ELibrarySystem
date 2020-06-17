package com.elibrarysystem.dao;

import com.elibrarysystem.domain.Book;
import com.elibrarysystem.rowmapper.BookRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
public class BookDAOImpl extends BaseDAO implements BookDAO {

    @Override
    public void save(Book b) {
        String sql = "INSERT INTO books(userId, bookName, author, issuedTime, returnTime, comments) VALUES(:userId, :bookName, :author, :issuedTime, :returnTime, :comments)";
        Map m = new HashMap();
        m.put("userId", b.getUserId());
        m.put("bookName", b.getBookName());
        m.put("author", b.getAuthor());
        m.put("issuedTime", b.getIssuedTime());
        m.put("returnTime", b.getReturnTime());
        m.put("comments", b.getComments());
        SqlParameterSource ps = new MapSqlParameterSource(m);
        KeyHolder kh = new GeneratedKeyHolder(); // auto generated id'ni get edeceyimiz ucun HeyHolder istifade eledik.
        getNamedParameterJdbcTemplate().update(sql, ps, kh);
        b.setBookId(kh.getKey().intValue());
    }

    @Override
    public void update(Book b) {
        String sql = "UPDATE books SET bookName=:bookName, author=:author, issuedTime=:issuedTime, returnTime=:returnTime, comments=:comments WHERE bookId=:bookId";
        Map m = new HashMap();
        m.put("bookId", b.getBookId());
        m.put("bookName", b.getBookName());
        m.put("author", b.getAuthor());
        m.put("issuedTime", b.getIssuedTime());
        m.put("returnTime", b.getReturnTime());
        m.put("comments", b.getComments());
        getNamedParameterJdbcTemplate().update(sql, m);
    }

    @Override
    public void delete(Book b) {
        this.delete(b.getBookId());
    }

    @Override
    public void delete(Integer bookId) {
        String sql = "DELETE FROM books WHERE bookId=?";
        getJdbcTemplate().update(sql, bookId);
    }

    @Override
    public Book findById(Integer bookId) {
        String sql = "SELECT bookId, userId, bookName, author, issuedTime, returnTime, comments FROM books WHERE bookId=?";
        return getJdbcTemplate().queryForObject(sql, new BookRowMapper(), bookId);
    }

    @Override
    public List<Book> findAllBooks() {
        String sql = "SELECT bookId, userId, bookName, author, issuedTime, returnTime, comments"
                + " FROM books";
        return getJdbcTemplate().query(sql, new BookRowMapper()
        );
    }

    @Override
    public List<Book> findByProperty(String propName, Object propValue) {
        String sql = "SELECT bookId, userId, bookName, author, issuedTime, returnTime, comments FROM books WHERE " + propName + "=?";
        return getJdbcTemplate().query(sql, new BookRowMapper(), propValue);
    }

}
