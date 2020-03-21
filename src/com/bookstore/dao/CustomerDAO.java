package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import com.bookstore.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {

	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.create(customer);
	}

	@Override
	public Customer get(Object id) {
		// TODO Auto-generated method stub
		return super.find(Customer.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customer.class, id);
	}

	

	@Override
	public List<Customer> listAll() {
		return super.findWithNamedQuery("Customer.findAll");
		
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Customer.countAll");
	}

	@Override
	public List<Customer> findWithNamedQuery() {
		// TODO Auto-generated method stub
		return null;
	}

}