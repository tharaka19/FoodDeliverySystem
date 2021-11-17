package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.FoodItem;
import com.Service.Bd.FoodItemBd;

@Controller
public class FoodItemController {

	@Autowired
	private FoodItemBd foodItemService;

	public FoodItemBd getFoodItemService() {
		return foodItemService;
	}

	public void setFoodItemService(FoodItemBd foodItemService) {
		this.foodItemService = foodItemService;
	}
	
	/**
	 * save new food item
	 * @param foodItem
	 * @return
	 */
	@PostMapping("/AdminDashbord/FoodItem/saveFoodItem")
	@ResponseBody
	public String save(@ModelAttribute("saveFoodItem") FoodItem foodItem){
		foodItemService.save(foodItem);	 	
		return "foodItem";
	}
	
	/**
	 * get all food item details
	 * @return food item list
	 */
	@GetMapping("/AdminDashbord/FoodItem/getAllFoodItem")
	@ResponseBody
	public List<FoodItem> getAll(){
		List<FoodItem> list=foodItemService.getAll();
		return list;
	}
	
	/**
	 * get food item details by food item id
	 * @param id
	 * @return food item for adminDashboard page
	 */
	@GetMapping("/AdminDashbord/FoodItem/getOneFoodItem/{id}")
	@ResponseBody
	public FoodItem getById(@PathVariable int id){
		FoodItem foodItem = foodItemService.getById(id);
		return foodItem;
	}
	
	/**
	 * get food item details by food item id
	 * @param id
	 * @return food item for shopping cart page 
	 */
	@GetMapping("/ShoppingCart/getOneFoodItem/{id}")
	@ResponseBody
	public FoodItem getSelectedFoodItemById(@PathVariable int id){
		FoodItem foodItem = foodItemService.getById(id);
		return foodItem;
	}
	
	/**
	 * get active food item details by food item status
	 * @param status
	 * @return food item list for adminDashboard page
	 */
	@GetMapping("/AdminDashbord/FoodItem/getActiveFoodItem/{status}")
	@ResponseBody
	public List<FoodItem> getAllByStatus(@PathVariable String status){
		List<FoodItem> activelist = foodItemService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * get food item quantity by food item id
	 * @param status
	 * @return food item quantity
	 */
	@GetMapping("/AdminDashbord/FoodItem/getFoodItemQuantity/{id}")
	@ResponseBody
	public int getQuantityById(@PathVariable int id){
		return foodItemService.getQuantityById(id);
	}
	
	/**
	 * get active food item details by food item status and category id
	 * @param status
	 * @return food item list for food item menu page
	 */
	@PostMapping("/FoodItemMenu/getActiveFoodItem")
	@ResponseBody
	public List<FoodItem> getOnePromoDetailsById(@RequestParam("status") String status,@RequestParam("id") int id){
		List<FoodItem> activelist =  foodItemService.getAllByStatusAndCategoryId(status, id);
		return activelist;
	}
	
	/**
	 * update food item details
	 * @param foodItem
	 * @return
	 */
	@PostMapping("/AdminDashbord/FoodItem/updateFoodItem")
	@ResponseBody
	public String updateStudent(@ModelAttribute("updateFoodItem") FoodItem foodItem){
		foodItemService.update(foodItem);
	    return "updated";
	}
	
	/**
	 * update food item status by food item id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/FoodItem/updateFoodItemStatus")
	@ResponseBody
	public String updateStatusById(@RequestParam("status") String status, @RequestParam("id") int id){
		foodItemService.updateStatusById(status, id);
	    return "updated";
	}
	
	/**
	 * update food item status by category id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/FoodItem/updateCategoryFoodItemStatus")
	@ResponseBody
	public String updateStatusByCategoryId(@RequestParam("status") String status, @RequestParam("id") int id){
		foodItemService.updateStatusByCategoryId(status, id);
	    return "updated";
	}
	
	/**
	 * update food item quantity by food item id
	 * @param id
	 * @param quantity
	 * @return
	 */
	@PostMapping("/AdminDashbord/FoodItem/updateFoodItemQuantity")
	@ResponseBody
	public String updateQuantityById(@RequestParam("id") int id, @RequestParam("quantity") int quantity){
		foodItemService.updateQuantityById(id, quantity);
	    return "updated";
	}

	/**
	 * delete food item details by food item id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/FoodItem/deleteFoodItem/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		foodItemService.delete(id);
		return "deleted";
	}
}
