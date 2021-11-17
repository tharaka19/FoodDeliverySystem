package com.Repository.Dao;

import java.util.List;

import com.Entity.Category;

public interface CategoryDao {

	public void save(Category category);
	public List<Category> getAll();
	public Category getById(int id);
	public List<Category> getAllByStatus(String status);
	public void update(Category category);
	public void updateFoodItemStatusByCategoryId(String status,int id);
	public void delete(Category category);

}
