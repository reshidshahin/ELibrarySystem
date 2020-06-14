package com.elibrarysystem.dao;

import java.util.List;

import com.elibrarysystem.domain.Book;

public interface BookDAO {

    public void save(Book b);

    public void update(Book b);

    public void delete(Book b);

    public void delete(Integer bookId);

    public Book findById(Integer bookId);

    public List<Book> findAllBooks();

    public List<Book> findByProperty(String propName, Object propValue);
}
