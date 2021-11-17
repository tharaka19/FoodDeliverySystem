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

import com.Entity.Category;
import com.Service.Bd.CategoryBd;

@Controller
public class CategoeyController {

	@Autowired
	private CategoryBd categoryService ;

	public CategoryBd getService() {
		return categoryService;
	}

	public void setService(CategoryBd categoryService) {
		this.categoryService = categoryService;
	}

	/**
	 * save new category
	 * @param category
	 * @return
	 */
	@PostMapping("/AdminDashbord/Category/saveCategory")
	@ResponseBody
	public String save(@ModelAttribute("saveCategory") Category category){
		categoryService.save(category);	 		 		
		return "category";
	}
	
	/**
	 * get all category details
	 * @return category list
	 */
	@GetMapping("/AdminDashbord/Category/getAllCategory")
	@ResponseBody
	public List<Category> getAll(){
		List<Category> list=categoryService.getAll();
		return list;
	}
	
	/**
	 * get category details by category id
	 * @param id
	 * @return category
	 */
	@GetMapping("/AdminDashbord/Category/getOneCategory/{id}")
	@ResponseBody
	public Category getById(@PathVariable int id){
		return categoryService.getById(id);
	}
	
	/**
	 * get active category details by category status
	 * @param status
	 * @return category list for adminDashboard page
	 */
	@GetMapping("/AdminDashbord/Category/getActiveCategory/{status}")
	@ResponseBody
	public List<Category> getAllByStatus(@PathVariable String status){
		List<Category> activelist=categoryService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * get active category details by category status
	 * @param status
	 * @return category list for category menu page
	 */
	@GetMapping("/CategoryMenu/getActiveCategory/{status}")
	@ResponseBody
	public List<Category> getAllForCategoryMenu(@PathVariable String status){
		List<Category> activelist=categoryService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * get active category details by category status
	 * @param status
	 * @return category list for home page
	 */
	@GetMapping("/Home/getActiveCategory/{status}")
	@ResponseBody
	public List<Category> getAllForHome(@PathVariable String status){
		List<Category> activelist=categoryService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * update category details
	 * @param category
	 * @return
	 */
	@PostMapping("/AdminDashbord/Category/updateCategory")
	@ResponseBody
	public String update(@ModelAttribute("updateCategory") Category category){
		categoryService.update(category);
	    return "updated";
	}
	
	/**
	 * update category status by category id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/Category/updateCategoryStatus")
	@ResponseBody
	public String updateStatusById(@RequestParam("status") String status,@RequestParam("id") int id){
		categoryService.updateStatusById(status, id);
	    return "updated";
	}
	
	/**
	 * delete category details by category id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/Category/deleteCategory/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		categoryService.delete(id);
		return "deleted";
	}
	
}
