package com.Repository.Dao;

import java.util.List;

import com.Entity.FoodItem;

public interface FoodItemDao {

	public void save(FoodItem foodItem);
	public List<FoodItem> getAll();
	public FoodItem getById(int id);
	public List<FoodItem> getAllByStatus(String status);
	public int getQuantityById(int id);
	public List<FoodItem> getAllByStatusAndCategoryId(String status,int id);
	public void updateAll(FoodItem foodItem);
	public void update(FoodItem foodItem);
	public void delete(FoodItem foodItem);
}
