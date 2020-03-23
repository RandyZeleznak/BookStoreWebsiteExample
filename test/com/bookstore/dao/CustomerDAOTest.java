package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDao = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEMail("Bobby@gmail.com");
		customer.setFullName("Robert Plant");
		customer.setCity("London");
		customer.setCountry("England");
		customer.setAddress("330 B 16 Manchester Blvd");
		customer.setPassword("password");
		customer.setPhone("116467861234");
		customer.setZipcode("123-54378");
		
		Customer savedCustomer = customerDao.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
		
	}

	@Test
	public void testGet() {
		Integer customerId = 1;
		Customer customer = customerDao.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(1);
		String fullName = "Tom Sawyer";
		customer.setFullName(fullName);
		
		Customer updatedCustomer = customerDao.update(customer);
		
		assertTrue(updatedCustomer.getFullName().equals(fullName));
	}

	@Test
	public void testDeleteCustomer() {
		Integer customerId = 1;
		customerDao.delete(customerId);
		Customer customer = customerDao.get(1);
		
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List <Customer> listCustomers = customerDao.listAll();
		
		for(Customer customer: listCustomers) {
			System.out.println(customer.getFullName());
		}
		
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test
	public void testCount() {
		long totalCustomers =  customerDao.count();
		
		assertEquals(2, totalCustomers);
	}
	
	
	

}