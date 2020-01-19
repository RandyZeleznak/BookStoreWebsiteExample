package com.bookstore.dao;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

class BookDAOTest extends BaseDAOTest{
	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		bookDAO = new BookDAO(entityManager);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Advanced Java");
		category.setCategoryId(2);
		newBook.setCategory(category);
		
		newBook.setTitle("Effective Java (2nd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		Date publishDate = dateFormat.parse("05/28/2008");
		newBook.setPublishDate(publishDate);
		
		String imagePath = "C:\\Users\\Randy\\Downloads\\BookStoreProjectBooks\\books\\Effective Java.jpg";
		byte [] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDAO.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	void testUpdateBook() throws ParseException, IOException {

		
		Book existBook = new Book();
		Category category = new Category("Core Java");
		category.setCategoryId(2);
		existBook.setCategory(category);
		
		existBook.setTitle("Copy Effective Java (2nd Edition)");
		existBook.setAuthor("Not by Joshua Bloch");
		existBook.setDescription("Stale coverage of generics, enums, annotations, autoboxing");
		existBook.setPrice(138.87f);
		existBook.setIsbn("0321356613");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		Date publishDate = dateFormat.parse("09/13/1986");
		existBook.setPublishDate(publishDate);
		
		String imagePath = "C:\\Users\\Randy\\Downloads\\BookStoreProjectBooks\\books\\Effective Java.jpg";
		byte [] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(imageBytes);
		
		Book updatedBook = bookDAO.update(existBook);
		
		assertEquals(updatedBook.getTitle(), "Copy Effective Java (2nd Edition)");
	}

	
	
	
	
}