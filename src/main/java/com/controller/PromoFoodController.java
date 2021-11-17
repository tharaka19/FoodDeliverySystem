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

import com.Entity.PromoFood;
import com.Service.Bd.PromoFoodBd;

@Controller
public class PromoFoodController {

	@Autowired	
	private PromoFoodBd promoFoodService;

	public PromoFoodBd getPeomoFoodService() {
		return promoFoodService;
	}

	public void setPeomoFoodService(PromoFoodBd promoFoodService) {
		this.promoFoodService = promoFoodService;
	}
	
	/**
	 * save promo food
	 * @param promoFood
	 * @return
	 */
	@PostMapping("/AdminDashbord/PromoFood/savePromoFood")
	@ResponseBody
	public String save(@ModelAttribute("savePromoFood") PromoFood promoFood){
		promoFoodService.save(promoFood); 	
		return "foodItem";
	}
	
	/**
	 * get all promo food details
	 * @return promo food list
	 */
	@GetMapping("/AdminDashbord/PromoFood/getAllPromoFood")
	@ResponseBody
	public List<PromoFood> getAll(){
		List<PromoFood> list = promoFoodService.getAll();
		return list;
	}
	
	/**
	 * get promo food details by promo food id
	 * @param id
	 * @return promo food
	 */
	@GetMapping("/AdminDashbord/PromoFood/getOnePromoFood/{id}")
	@ResponseBody
	public PromoFood getById(@PathVariable int id){
		return promoFoodService.getById(id);
	}
	
	/**
	 * get promo food details by promo food id and status
	 * @param status
	 * @param id
	 * @return promo food list for promo menu page
	 */
	@PostMapping("/PromoMenu/getOnePromoDetails")
	@ResponseBody
	public List<PromoFood> getOnePromoDetailsById(@RequestParam("status") String status,@RequestParam("id") int id){
		List<PromoFood> promoFoods =  promoFoodService.getOnePromoDetailsById(status, id);
		return promoFoods;
	}
	
	/**
	 * update promo food details
	 * @param promoFood
	 * @return
	 */
	@PostMapping("/AdminDashbord/PromoFood/updatePromoFood")
	@ResponseBody
	public String updateStudent(@ModelAttribute("updatePromoFood") PromoFood promoFood){
		promoFoodService.update(promoFood);
	    return "updated";
	}
	
	/**
	 * update promo food status by promo food id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/PromoFood/updatePromoFoodStatus")
	@ResponseBody
	public String updateStatusById(@RequestParam("status") String status,@RequestParam("id") int id){
		promoFoodService.updateStatusById(status, id);
	    return "updated";
	}
	
	/**
	 * update promo food status by promo id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/PromoFood/updatePromoPromoFoodStatus")
	@ResponseBody
	public String updateStatusByPromoId(@RequestParam("status") String status,@RequestParam("id") int id){
		promoFoodService.updateStatusByPromoId(status, id);
	    return "updated";
	}
	
	/**
	 * check available food item for promo food by food item id and promo id
	 * @param promoId
	 * @param foodItemId
	 * @return
	 */
	@PostMapping("/AdminDashbord/PromoFood/checkFoodItemForPromo")
	@ResponseBody
	public boolean checkFoodItemForPromo(@RequestParam("promoId") int promoId,@RequestParam("foodItemId") int foodItemId){
		return promoFoodService.checkFoodItemForPromo(promoId, foodItemId);
	}
	
	/**
	 * delete promo food details by promo food id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/PromoFood/deletePromoFood/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		promoFoodService.delete(id);
		return "deleted";
	}
}
