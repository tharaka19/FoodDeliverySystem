package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Category;
import com.Repository.Dao.CategoryDao;
import com.Service.Bd.CategoryBd;

@Service("categoryBd")
public class CategoryService implements CategoryBd{

	private Category category;
	
	@Autowired
	private CategoryDao categoryRepository;

	public CategoryDao getRepository() {
		return categoryRepository;
	}

	public void setRepository(CategoryDao categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	/**
	 * save new category
	 */
	@Override
	public void save(Category category) {
		categoryRepository.save(category);
	}

	/**
	 * get all category details
	 */
	@Override
	public List<Category> getAll() {
		return categoryRepository.getAll();
	}

	/**
	 * get category details by category id
	 */
	@Override
	public Category getById(int id) {
		return categoryRepository.getById(id);
	}

	/**
	 * get active category details by category status
	 */
	@Override
	public List<Category> getAllByStatus(String status) {
		return categoryRepository.getAllByStatus(status);
	}
	
	/**
	 * update category details
	 */
	@Override
	public void update(Category category) {	
		//set category status
		category.setStatus(categoryRepository.getById(category.getId()).getStatus());
		categoryRepository.update(category);
	}
	
	/**
	 * update category status by category id
	 */
	@Override
	public void updateStatusById(String status, int id) {
		category = new Category();
		
		//get category details by category id
		category = categoryRepository.getById(id);
		
		//set category status
		category.setStatus(status);
		
		categoryRepository.update(category);
	}

    /**
     * delete category details by category id
     */
	@Override
	public void delete(int id) {
		categoryRepository.delete(categoryRepository.getById(id));
	}

}
