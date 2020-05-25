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
		customer.setEmail("Bobby@Plant.com");
		customer.setFirstName("Robert");
		customer.setLastName("Plant");
		customer.setCity("London");
		customer.setCountry("England");
		customer.setAddressLine1("330 B 16 Manchester Blvd");
		customer.setPassword("password");
		customer.setPhone("116467861234");
		customer.setZipcode("123-54378");
		
		Customer savedCustomer = customerDao.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
		
	}

	@Test
	public void testGet() {
		Integer customerId = 8;
		Customer customer = customerDao.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(1);
		String firstName = "Tom";
		String lastName = "Sawyer";
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		
		Customer updatedCustomer = customerDao.update(customer);
		
		assertTrue(updatedCustomer.getFirstName().equals(firstName));
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
			System.out.println(customer.getFirstName());
		}
		
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test
	public void testCount() {
		long totalCustomers =  customerDao.count();
		
		assertEquals(2, totalCustomers);
	}
	
	@Test
	public void testFindByEmail() {
		 String email = "tom@gmail.com";
		 Customer customer = customerDao.findByEmail(email);
		
		 
		 assertNotNull(customer);
	}
	
	@Test
	public void testCheckLogInSuccess() {
			String email = "brian@may.com";
			String password = "password";
			
			Customer customer = customerDao.checkLogin(email, password);
			
			assertNotNull(customer);
	}
	
	@Test
	public void testCheckLogInFail() {
			String email = "brian@mqy.com";
			String password = "password";
			
			Customer customer = customerDao.checkLogin(email, password);
			
			assertNull(customer);
	}
	

	
	
	
	
	
	
}