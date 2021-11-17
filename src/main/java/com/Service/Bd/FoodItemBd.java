package com.Service.Bd;

import java.util.List;

import com.Entity.FoodItem;

public interface FoodItemBd {

	public void save(FoodItem foodItem);
	public List<FoodItem> getAll();
	public FoodItem getById(int id);
	public List<FoodItem> getAllByStatus(String status);
	public int getQuantityById(int id);
	public List<FoodItem> getAllByStatusAndCategoryId(String status, int id);
	public void update(FoodItem foodItem);
	public void updateStatusById(String status,int id);
	public void updateStatusByCategoryId(String status,int id);
	public void updateQuantityById(int id, int quantity);
	public void delete(int id);
}
