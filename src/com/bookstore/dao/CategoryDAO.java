package com.bookstore.dao;	

import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO() {
		super();
	}

	@Override
	public Category create(Category category) {
		return super.create(category);
	}
	@Override
	public Category update(Category category) {
		return super.update(category);
	}
	@Override
	public Category get(Object id) {
		return super.find(Category.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Category.class, id);
		
	}

	public Category findByName(String categoryName) {
		List<Category> result = super.findWithNamedQuery("Category.findByName", "name",categoryName);
		
		if(result != null && result.size() > 0) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNamedQuery("Category.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Category> findWithNamedQuery() {
		// TODO Auto-generated method stub
		return null;
	}

}
