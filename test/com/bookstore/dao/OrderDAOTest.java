package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.OrderDetailId;

public class OrderDAOTest {

	private static OrderDAO orderDAO;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(3);
		
		order.setCustomer(customer);
		order.setRecipientName("Joe Bonamassa");
		order.setRecipientPhone("123456789");
		order.setShippingAddress("123 Broadway, New York, NY");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(2);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(79.98f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		
		orderDAO.create(order);
		
		assertTrue(order.getOrderId() > 0);
		
	}
	
	@Test
	public void testCreateBookOrder2() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(3);
		
		order.setCustomer(customer);
		order.setRecipientName("Joe Bonamassa");
		order.setRecipientPhone("123456789");
		order.setShippingAddress("123 Broadway, New York, NY");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(4);
		orderDetail.setBook(book);
		orderDetail.setQuantity(1);
		orderDetail.setSubtotal(39.99f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		
		orderDAO.create(order);
		
		assertTrue(order.getOrderId() > 0);
		
	}

	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 9;
		BookOrder order = orderDAO.get(orderId);
		order.setShippingAddress("New Shipping Address");
		
		orderDAO.update(order);
		
		BookOrder updatedOrder = orderDAO.get(orderId);
		
		assertEquals(order.getShippingAddress(), updatedOrder.getShippingAddress());
	}
	
	@Test
	public void testUpdateBookOrderDetail() {
		Integer orderId = 9;
		BookOrder order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 4) {
				orderDetail.setQuantity(2);
				orderDetail.setSubtotal(79.98f);
			}
		}
			
		
		orderDAO.update(order);
		
		//BookOrder updatedOrder = orderDAO.get(orderId);
		
		iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity = 2;
		float expectedSubtotal = 79.98f;
		int actualQuantity = 0;
		float actualSubtotal = 0;
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 4) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}		
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
		
	}
	
	
		
	
	
	@Test
	public void testGet() {
		Integer orderId = 8;
		BookOrder order = orderDAO.get(orderId);
		System.out.println(order.getRecipientName());
		System.out.println(order.getRecipientPhone());
		System.out.println(order.getShippingAddress());
		System.out.println(order.getOrderStatus());
		System.out.println(order.getOrderTotal());
		System.out.println(order.getPaymentMethod());
		
		
		assertEquals(1,order.getOrderDetails().size());
	}

	@Test
	public void testDeleteOrder() {
		int orderId = 9;
		orderDAO.delete(orderId);
		
		BookOrder order = orderDAO.get(orderId);
		
		assertNull(order);
	}

	@Test
	public void testFindWithNamedQuery() {
		fail("Not yet implemented");
	}

	@Test
	public void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();
		
		for( BookOrder order: listOrders) {
			System.out.println(order.getOrderId() + " " + order.getCustomer().getFullName() + " " 
		+ " " + order.getOrderTotal() + " " + order.getOrderStatus()) ; 
			
			for(OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}
		
		
		assertTrue(listOrders.size() > 0);
	}
	
	
	@Test
	public void testListByCustomerNoOrders() {
		Integer customerId = 99;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.isEmpty());
	}
	
	
	
	

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(2, totalOrders);
	}
	
	
	

}
