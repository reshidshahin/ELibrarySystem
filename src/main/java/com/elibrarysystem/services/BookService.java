package com.elibrarysystem.services;

import java.util.List;

import com.elibrarysystem.domain.Book;

/**
 * The interface specifies all business operation for Book Entity.
 *
 * 
 */
public interface BookService {

    public void save(Book c);

    public void update(Book c);

    public void delete(Integer bookId);
   
    /**
     * Bulk delete
     * @param bookIds 
     */
    public void delete(Integer[] bookIds);
    
    public Book findById(Integer bookId);

    /**
     * This method returns all User Books (user who is logged in).
     *
     * @param userId
     * @return
     */
    public List<Book> findUserBook(Integer userId);

    /**
     * The method search book for user(userId) based on given
     * free-text-criteria (txt)
     *
     * @param userId User who is logged in
     * @param txt criteria used to search - free text search criteria
     * @return
     */
    public List<Book> findUserBook(Integer userId, String txt);
    
    public List<Book> findAll();
}
