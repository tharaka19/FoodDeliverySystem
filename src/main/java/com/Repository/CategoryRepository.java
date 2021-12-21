package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Category;
import com.Repository.Dao.CategoryDao;

@Repository("categoryDao")
public class CategoryRepository implements CategoryDao{
	
	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save new category
	 */
	@Transactional
	@Override
	public void save(Category category) {
		hibernateTemplate.save(category);
	}

	/**
	 * get all category details
	 */
	@Override
	public List<Category> getAll() {
		return hibernateTemplate.loadAll(Category.class);
	}

	/**
	 * get category details by category id
	 */
	@Override
	public Category getById(int id) {
		return hibernateTemplate.get(Category.class, id);
	}
	
	/**
	 * get category details by category status
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Category> getAllByStatus(String status) {
		return (List<Category>) hibernateTemplate.findByNamedParam("FROM Category WHERE status=:status", "status", status);
	}

	/**
	 * update category details
	 */
	@Transactional
	@Override
	public void update(Category category) {
		hibernateTemplate.update(category);	
	}
	
	@SuppressWarnings("deprecation")
	@Transactional
	@Override
	public void updateFoodItemStatusByCategoryId(String status, int id) {
		System.out.println(status);
		//hibernateTemplate.bulkUpdate("DELETE FROM FoodItem WHERE id="+id+"");
		hibernateTemplate.bulkUpdate("UPDATE FoodItem SET status=:status WHERE id=:id", new String[] {"status","id"}, new Object[] {status,id});		
	}
	
	/**
	 * delete category details by category id
	 */
	@Transactional
	@Override
	public void delete(Category category) {
		hibernateTemplate.delete(category);	
	}
	
}
