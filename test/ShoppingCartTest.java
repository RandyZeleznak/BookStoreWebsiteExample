import static org.junit.Assert.*;

import java.util.Map;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.entity.Book;

public class ShoppingCartTest {
	private static ShoppingCart cart;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		cart = new ShoppingCart();
		Book book = new Book(2);
		book.setPrice(10);
		
		book.setBookId(2);
		cart.addItem(book);

		cart.addItem(book);
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		
	}

	@Test
	public void testAdditem () {
		Book book = new Book(2);
		
		book.setBookId(2);
		cart.addItem(book);
		
		Map<Book, Integer> items = cart.getItems();
		int quantity = items.get(book);
		
		assertEquals(2, quantity);	
		
	}
	
	
	
	@Test
	public void testRemoveItem() {
			cart.removeItem(new Book(2));
			
			assertTrue(cart.getItems().isEmpty());
	}
	
	@Test
	public void testRemoveItem2() {
		Book book2 = new Book(2);
		cart.addItem(book2);
		cart.removeItem(new Book(2));
		
		assertNull(cart.getItems().get(book2));
	
	}
	
	@Test
	public void testGetTotalQuantity() {
		Book book4 = new Book(2);
		cart.addItem(book4);
		cart.addItem(book4);
		cart.addItem(book4);
		
		assertEquals(4, cart.getTotalQuantity());
	}
	
	@Test
	public void testGetTotalAmount1() {
		ShoppingCart cart = new ShoppingCart();
		
		assertEquals(0.0f, cart.getTotalAmount(), 0.0f);
		
	}
	
	@Test
	public void testGetTotalAmount2() {
		
		assertEquals(20.0f, cart.getTotalAmount(), 0.0f);
	}
	
	@Test
	public void testClear() {
		cart.clear();
		assertEquals(0, cart.getTotalQuantity());
	}
	
	@Test
	public void testUpdateCart() {
		ShoppingCart cart = new ShoppingCart();
		Book book1 = new Book(1);
		Book book2 = new Book(2);
		
		cart.addItem(book1);
		cart.addItem(book2);
		
		int[] bookIds = {1,2};
		int[] quantities = {3,4};
		
		cart.updateCart(bookIds, quantities);
		
		assertEquals(7, cart.getTotalQuantity());
	}
	
	
	
	


}


