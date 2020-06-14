package com.elibrarysystem.test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.elibrarysystem.config.SpringRootConfig;
import com.elibrarysystem.dao.BookDAO;
import com.elibrarysystem.domain.Book;

public class TestBookDAOSave {
	
	public static void main(String[] args) {
		
		
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
		BookDAO bookDao = ctx.getBean(BookDAO.class);
		
		Book b = new Book();
		b.setBookName("Tarix");
		b.setAuthor("Polad");
		b.setIssuedTime("12.12.2012");
		b.setReturnTime("12.12.2020");
		b.setComments("Meslehetdi");
	
		bookDao.save(b);
		System.out.println("--------Book Saved------");
	
	}

}
