package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDaoTest extends BaseDAOTest{
	private static BookDAO bookDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		bookDao = new BookDAO(entityManager);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	
	public void testCreateBook() throws ParseException, IOException {
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
		
		Book createdBook = bookDao.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testCreateSecondBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Advanced Java");
		category.setCategoryId(2);
		newBook.setCategory(category);
		
		newBook.setTitle("Java 8 in Action: Lambdas, Streams, and functional-style programming");
		newBook.setAuthor("Raoul-Gabriel Urma, Mario Fusco, Alan Mycroft");
		newBook.setDescription("Java 8 in Action is a clearly written guide to the new features of Java 8. The book covers lambdas, streams, and functional-style programming. With Java 8's functional features you can now write more concise code in less time, and also automatically benefit from multicore architectures. It's time to dig in!\r\n");
		newBook.setPrice(36.72f);
		newBook.setIsbn("1617291994");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		Date publishDate = dateFormat.parse("08/28/2014");
		newBook.setPublishDate(publishDate);
		
		String imagePath = "C:\\Users\\Randy\\Downloads\\BookStoreProjectBooks\\books\\Java 8 in Action.jpg";
		byte [] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		
		Book createdBook = bookDao.create(newBook);
		
		assertTrue(createdBook.getBookId() > 0);
	}
	
	@Test
	public void testUpdateBook() throws ParseException, IOException {
		
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
		
		Book updatedBook = bookDao.update(existBook);
		
		assertEquals(updatedBook.getTitle(), "Copy Effective Java (2nd Edition)");
	}

	@Test
	public void testGetBookSuccess(){
		Integer bookId = 2;
		Book book = bookDao.get(bookId);
		
		assertNotNull(book);
	}
	
	@Test
	public void testGetBookFail(){
		Integer bookId = 99;
		Book book = bookDao.get(bookId);
		
		assertNull(book);
	}
	
	@Test
	public void testListAll() {
		List<Book> listBooks = bookDao.listAll();
		
		for(Book aBook : listBooks) {
			System.out.println(aBook.getTitle()+" - "+aBook.getAuthor());
		}
		
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void testFindByTitleExist() {
		String title = "Effective Java (2nd Edition)";
		Book book = bookDao.findByTitle(title);
		
		System.out.println("Book -> " +book.getTitle());
		assertNotNull(book);
	}
	
	@Test
	public void testFindByTitleNotExist() {
		String title = "Tbhinkking in Java";
		Book book = bookDao.findByTitle(title);
		
		assertNull(book);
	}
	
	@Test
	public void testCount() {
		long totalBooks = bookDao.count();
		
		assertEquals(2, totalBooks);
	}
	
	
	@Test(expected  = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 3;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testListByCategory() {
		int categoryId = 1;
		
		 List<Book> listBooks = bookDao.listByCategory(categoryId); 
		 System.out.println("CategoryId= "+categoryId+ " Size=  "+listBooks.size());
		 assertTrue(listBooks.size() > 0);
		 
	}
	
	
}










