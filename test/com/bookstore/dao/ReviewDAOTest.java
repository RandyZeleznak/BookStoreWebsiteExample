package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {
	private static ReviewDAO reviewDao;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		reviewDao = new ReviewDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		reviewDao.close();
	}

	

	@Test
	public void testUpdateReview() {
		Integer reviewId = 0;
		Review review = reviewDao.get(reviewId);
		review.setHeadline("Excellent book");
		
		Review updatedReview = reviewDao.update(review);
		
		assertEquals(review.getHeadline(), updatedReview.getHeadline());
	}

	@Test
	void testCreateReview() {
		Review review = new Review();
		Book book = new Book();
		book.setBookId(2);
		
		Customer customer =  new Customer();
		customer.setCustomerId(5);
		
		review.setBook(book);
		review.setCustomer(customer);
		
		review.setHeadline("This is a really good book!");
		review.setRating(1);
		review.setComment("I have just read this book.  It is Wonderful.");
		
		Review savedReview = reviewDao.create(review);
		
		assertTrue(savedReview.getReviewId() > 0);
	}

	@Test
	void testGet() {
		Integer reviewId = 1;
		Review review = reviewDao.get(reviewId);
		
		assertNotNull(review);
		
	}
	
	@Test
	void testDeleteReview() {
		int reviewId = 0;
		reviewDao.delete(reviewId);
		
		Review review = reviewDao.get(reviewId);
		
		assertNull(review);
	}

	@Test
	void testFindWithNamedQuery() {
		fail("Not yet implemented");
	}

	@Test
	void testListAll() {
		List<Review> listReview = reviewDao.listAll();
		
		for (Review review : listReview) {
			System.out.println(review.getReviewId() + " - " + review.getBook().getTitle()
					+ " - " + review.getCustomer().getFullName()
					+ " - " + review.getHeadline() + " - " + review.getRating());
		}
		
		assertTrue(listReview.size() > 0);
	}

	@Test
	void testCount() {
		long totalReviews = reviewDao.count();
		
		System.out.println("Total Reviews : " + totalReviews);
		
		assertTrue(totalReviews > 0);
	}

}
