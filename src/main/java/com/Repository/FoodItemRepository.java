package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Category;
import com.Entity.FoodItem;
import com.Repository.Dao.FoodItemDao;

@Repository("foodItemDao")
public class FoodItemRepository implements FoodItemDao{

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	/**
	 * save new food item
	 */
	@Transactional
	@Override
	public void save(FoodItem foodItem) {
		//set category for food item
		foodItem.setCategory(hibernateTemplate.get(Category.class, foodItem.getCategoryId()));
		hibernateTemplate.save(foodItem);
	}

	/**
	 * get all food item details
	 * @return food item list
	 */
	@Override
	public List<FoodItem> getAll() {
		return hibernateTemplate.loadAll(FoodItem.class);
	}

	/**
	 * get food item details by food item id
	 * @param id
	 * @return food item
	 */
	@Override
	public FoodItem getById(int id) {
		return hibernateTemplate.get(FoodItem.class, id);
	}
	
	/**
	 * get active food item details by food item status
	 * @param status
	 * @return food item list for adminDashboard page
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<FoodItem> getAllByStatus(String status) {
		return (List<FoodItem>) hibernateTemplate.findByNamedParam("FROM FoodItem WHERE status=:status", "status", status);
	}

	/**
	 * get food item quantity by food item id
	 * @param status
	 * @return food item quantity
	 */
	@Override
	public int getQuantityById(int id) {
		return hibernateTemplate.get(FoodItem.class, id).getQuantity();
	}
	
	/**
	 * get all food item details by food item status and category id
	 * @param status
	 * @return food item list
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<FoodItem> getAllByStatusAndCategoryId(String status, int id) {
		return (List<FoodItem>) hibernateTemplate.findByNamedParam("FROM FoodItem WHERE status=:status AND category=:category",
				new String[] {"status","category"},
				new Object[] {status,hibernateTemplate.get(Category.class, id)});
	}
	
	/**
	 * update food item details
	 */
	@Transactional
	@Override
	public void updateAll(FoodItem foodItem) {
		//set category for food item
		foodItem.setCategory(hibernateTemplate.get(Category.class, foodItem.getCategoryId()));
		hibernateTemplate.update(foodItem);
	}

	/**
	 * update food item details
	 */
	@Transactional
	@Override
	public void update(FoodItem foodItem) {
		hibernateTemplate.update(foodItem);
	}
	
	/**
	 * delete food item details by food item id
	 */
	@Transactional
	@Override
	public void delete(FoodItem foodItem) {
		hibernateTemplate.delete(foodItem);		
	}

}
