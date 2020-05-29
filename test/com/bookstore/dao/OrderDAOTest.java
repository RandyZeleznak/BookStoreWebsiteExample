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
		customer.setCustomerId(11);

		order.setCustomer(customer);
		order.setFirstName("Joe");
		order.setLastName("Bonamassa");
		order.setPhone("123456789");
		order.setAddressLine1("123 Broadway");
		order.setAddressLine2(" ");
		order.setCity("New York");
		order.setState("NY");
		order.setCountry("US");
		order.setZipcode("50103");
		order.setPaymentMethod("paypal");
			
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();

		Book book = new Book(9);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(66.58f);
		orderDetail.setBookOrder(order);

		orderDetails.add(orderDetail);

		order.setOrderDetails(orderDetails);
		order.setTax(6.65f);
		order.setShippingFee(2.0f);
		order.setOrderSubTotal(66.58f);
		order.setOrderTotal(75.23f);;

		orderDAO.create(order);

		assertTrue(order.getOrderId() > 0);

	}

	@Test
	public void testCreateBookOrder2() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(3);

		order.setCustomer(customer);
		order.setFirstName("Joe Bonamassa");
		order.setPhone("123456789");
		order.setAddressLine1("123 Broadway, New York, NY");

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
		order.setAddressLine1("New Shipping Address");

		orderDAO.update(order);

		BookOrder updatedOrder = orderDAO.get(orderId);

		assertEquals(order.getAddressLine1(), updatedOrder.getAddressLine1());
	}

	@Test
	public void testUpdateBookOrderDetail() {
		Integer orderId =30;
		BookOrder order = orderDAO.get(orderId);

		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 9) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(99.87f);
			}
		}

		orderDAO.update(order);

		// BookOrder updatedOrder = orderDAO.get(orderId);

		iterator = order.getOrderDetails().iterator();

		int expectedQuantity = 3;
		float expectedSubtotal = 99.87f;
		int actualQuantity = 0;
		float actualSubtotal = 0;

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 9) {
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
		System.out.println(order.getFirstName());
		System.out.println(order.getPhone());
		System.out.println(order.getAddressLine1());
		System.out.println(order.getOrderStatus());
		System.out.println(order.getOrderTotal());
		System.out.println(order.getPaymentMethod());

		assertEquals(1, order.getOrderDetails().size());
	}

	@Test
	public void testGetByIdAndCustomerNull() {
		Integer orderId = 10;
		Integer customerId = 99;

		BookOrder order = orderDAO.get(orderId, customerId);

		assertNull(order);
	}

	@Test
	public void testGetByIdAndCustomerNotNull() {
		Integer orderId = 8;
		Integer customerId = 3;

		BookOrder order = orderDAO.get(orderId, customerId);

		assertNotNull(order);
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

		for (BookOrder order : listOrders) {
			System.out.println(order.getOrderId() + " " + order.getCustomer().getFirstName() + " " + " "
					+ order.getOrderTotal() + " " + order.getOrderStatus());

			for (OrderDetail detail : order.getOrderDetails()) {
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
	public void testListByCustomerWithOrders() {
		Integer customerId = 6;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);

		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(2, totalOrders);
	}

	@Test
	public void testListMostRecentSales() {
		List<BookOrder> recentOrders = orderDAO.listMostRecentSales();

		assertEquals(3, recentOrders.size());
	}

}
