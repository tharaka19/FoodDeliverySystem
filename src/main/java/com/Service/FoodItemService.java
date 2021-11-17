package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.FoodItem;
import com.Repository.Dao.FoodItemDao;
import com.Service.Bd.FoodItemBd;

@Service("foodItemBd")
public class FoodItemService implements FoodItemBd {

	private FoodItem foodItem;
	
	@Autowired
	private FoodItemDao foodItemRepository;
	
	public FoodItemDao getFooItemRepository() {
		return foodItemRepository;
	}

	public void setFooItemRepository(FoodItemDao foodItemRepository) {
		this.foodItemRepository = foodItemRepository;
	}
	
	/**
	 * save new food item
	 */
	@Override
	public void save(FoodItem foodItem) {
		foodItemRepository.save(foodItem);	
	}

	/**
	 * get all food item details
	 * @return food item list
	 */
	@Override
	public List<FoodItem> getAll() {
		return foodItemRepository.getAll();
	}

	/**
	 * get food item details by food item id
	 * @param id
	 * @return food item
	 */
	@Override
	public FoodItem getById(int id) {
		return foodItemRepository.getById(id);
	}
	
	/**
	 * get active food item details by food item status
	 * @param status
	 * @return food item list
	 */
	@Override
	public List<FoodItem> getAllByStatus(String status) {
		return foodItemRepository.getAllByStatus(status);
	}
	
	/**
	 * get food item quantity by food item id
	 * @param status
	 * @return food item quantity
	 */
	@Override
	public int getQuantityById(int id) {
		return foodItemRepository.getQuantityById(id);
	}
	
	/**
	 * get active food item details by food item status and category id
	 * @param status
	 * @return food item list
	 */
	@Override
	public List<FoodItem> getAllByStatusAndCategoryId(String status, int id) {
		return foodItemRepository.getAllByStatusAndCategoryId(status, id);
	}

	/**
	 * update food item details
	 */
	@Override
	public void update(FoodItem foodItem) {
		//set food item status
		foodItem.setStatus(foodItemRepository.getById(foodItem.getId()).getStatus());
		foodItemRepository.updateAll(foodItem);
	}
	
	/**
	 * update food item status by food item id
	 */
	@Override
	public void updateStatusById(String status, int id) {
		foodItem = new FoodItem();
		foodItem = foodItemRepository.getById(id);
		
		//check active status
		if(foodItem.getCategory().getStatus().equals("Active")) {
			foodItem.setStatus(status);
			foodItemRepository.update(foodItem);
		}else {
			System.out.println("cannot active");
		}
	}
	
	/**
	 * update food item status by category id
	 */
	@Override
	public void updateStatusByCategoryId(String status, int id) {
		List<FoodItem> foodList;
		
		//check active status
		if(status.equals("Active")) {
			foodList = foodItemRepository.getAllByStatusAndCategoryId("Deactive",id);
		}else {
			foodList = foodItemRepository.getAllByStatusAndCategoryId("Active",id);
		}
		
		for(FoodItem foodItem : foodList) {
			foodItem.setStatus(status);
			foodItemRepository.update(foodItem);
		}
	}
	
	/**
	 * update food item quantity by food item id
	 */
	@Override
	public void updateQuantityById(int id, int quantity) {
		foodItem = new FoodItem();
		
		//get food item details by food item id
		foodItem = foodItemRepository.getById(id);
		
		//set food item status
		foodItem.setQuantity(quantity);
		
		foodItemRepository.update(foodItem);
	}

	/**
	 * delete food item details by food item id
	 */
	@Override
	public void delete(int id) {
		foodItemRepository.delete(foodItemRepository.getById(id));
	}







	

	

	



}
