package com.Service.Bd;

import java.util.List;

import com.Entity.Category;

public interface CategoryBd {

	public void save(Category category);
	public List<Category> getAll();
	public Category getById(int id);
	public List<Category> getAllByStatus(String status);
	public void update(Category Category);
	public void updateStatusById(String status,int id);
	public void delete(int id);
	
}
