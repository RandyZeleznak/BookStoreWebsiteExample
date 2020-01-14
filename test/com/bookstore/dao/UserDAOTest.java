package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;


import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;



import com.bookstore.entity.Users;

public class UserDAOTest extends BaseDAOTest{
	
	
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setUpClass() throws Exception{
		BaseDAOTest.setUpBeforeClass();
		userDAO = new UserDAO(entityManager);
	}

	@Test
	public void testCreateUsers() {
		
		Users user1 = new Users();
		user1.setEmail("JohnPaul@zepelin.net");
		user1.setFullName("John Paul Jones");
		user1.setPassword("password");
		
		
		user1 = userDAO.create(user1);
		
		assertTrue(user1.getUserId() > 0);
		
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldNotSet() {
		Users user1 = new Users();
		user1 = userDAO.create(user1);
	}
	
	@Test
	public void testUpdateUsers() {
		Users user = new Users();
		user.setUserId(1);
		user.setEmail("name@zeleznak.net");
		user.setFullName("Randy Zeleznak");
		user.setPassword("password");
		
		user = userDAO.update(user);
		
		String expected = "password";
		String actual = user.getPassword();
		assertEquals(expected, actual);
	}
	
	@Test
	public void testGetUsersNotFound(){
		Integer userId = 10;
		Users user = userDAO.get(userId);
		assertNull(user);
	}
	
	@Test
	public void testGetUsersFound() {
		Integer userId = 1;
		Users user = userDAO.get(userId);
		
		if(user != null) {
			System.out.println(user.getEmail());
		}
		assertNotNull(user);
	}
	
	@Test
	public void testDeleteUsers() {
		Integer userId = 4;
		userDAO.delete(userId);
		Users user = userDAO.get(userId);
		assertNull(user);
	}
	
	@Test
	public void testDeleteNotFoundException() {
		Integer userId = 55;
		userDAO.delete(userId);
	}
	
	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		for(Users user: listUsers) {
			System.out.println(user.getFullName()+" "+ user.getEmail());
		}
		assertTrue(listUsers.size() > 0);
	}
	@Test
	public void testCount() {
		long totalUsers = userDAO.count();
		assertEquals(3, totalUsers);
	}
	
	@Test
	public void testValidateLoginSuccess() {
		String email = "John@Bonham.com";
		String password = "password";
		boolean loginResult	= userDAO.validateLogin(email, password);
		
		assertTrue(loginResult);
	}
	
	@Test
	public void testValidateLoginFail() {
		String email = "Johny@Boham.com";
		String password = "pass";
		boolean loginResult	= userDAO.validateLogin(email, password);
		
		assertFalse(loginResult);
	}

	@Test
	public void testFindByEmail() {
		String email = "tom@aerosmith.com";
		Users user = userDAO.findByEmail(email);
		
		assertNotNull(user);
	}
	
	
	@AfterClass
	public static void tearDownClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

}
