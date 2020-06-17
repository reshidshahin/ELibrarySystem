package com.elibrarysystem.dao;

import com.elibrarysystem.domain.Book;

import java.util.List;

public interface BookDAO {

    public void save(Book b);

    public void update(Book b);

    public void delete(Book b);

    public void delete(Integer bookId);

    public Book findById(Integer bookId);

    public List<Book> findAllBooks();

    public List<Book> findByProperty(String propName, Object propValue);
}
