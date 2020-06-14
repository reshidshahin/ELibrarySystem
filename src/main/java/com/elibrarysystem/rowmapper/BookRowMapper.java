package com.elibrarysystem.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.elibrarysystem.domain.Book;


public class BookRowMapper implements RowMapper<Book>{
    @Override
    public Book mapRow(ResultSet rs, int i) throws SQLException {
        Book b=new Book();
        b.setBookId(rs.getInt("bookId"));
        b.setUserId(rs.getInt("userId"));
        b.setBookName(rs.getString("bookName"));
        b.setAuthor(rs.getString("author"));
        b.setIssuedTime(rs.getString("issuedTime"));
        b.setReturnTime(rs.getString("returnTime"));
        b.setComments(rs.getString("comments"));
        return b;
    }
    
}
