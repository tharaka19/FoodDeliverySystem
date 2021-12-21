package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.Promo;
import com.Service.Bd.PromoBd;

@Controller
public class PromoController {

	@Autowired
	private PromoBd promoService;

	public PromoBd getPromoService() {
		return promoService;
	}

	public void setPromoService(PromoBd promoService) {
		this.promoService = promoService;
	}
	
	/**
	 * save new promo
	 * @param promo
	 * @return
	 */
	@PostMapping("/AdminDashbord/Promo/savePromo")
	@ResponseBody
	public String save(@ModelAttribute("savePromo") Promo promo){
		promoService.save(promo); 	
		return "promo";
	}
	
	/**
	 * get all promo details
	 * @return promo list
	 */
	@GetMapping("/AdminDashbord/Promo/getAllPrmo")
	@ResponseBody
	public List<Promo> getAll(){
		List<Promo> list = promoService.getAll();
		return list;
	}
	
	/**
	 * get promo details by promo id
	 * @param id
	 * @return promo
	 */
	@GetMapping("/AdminDashbord/Promo/getOnePromo/{id}")
	@ResponseBody
	public Promo getById(@PathVariable int id){
		return promoService.getById(id);
	}
	
	/**
	 * get active promo details by promo status
	 * @param status
	 * @return promo list for adminDashboard page
	 */
	@GetMapping("/AdminDashbord/Promo/getActivePrmomo/{status}")
	@ResponseBody
	public List<Promo> getAllByStatus(@PathVariable String status){
		List<Promo> activelist = promoService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * get promo quantity by promo id
	 * @param id
	 * @return promo quantity
	 */
	@GetMapping("/AdminDashbord/Promo/getPromoQuantity/{id}")
	@ResponseBody
	public int getQuantityById(@PathVariable int id){
		return promoService.getQuantityById(id);
	}
	
	/**
	 * get active promo details by promo status
	 * @param status
	 * @return promo list for promo menu page
	 */
	@GetMapping("/PromoMenu/getActivePrmomo/{status}")
	@ResponseBody
	public List<Promo> getAllForPromoMenu(@PathVariable String status){
		List<Promo> activelist = promoService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * get active promo details by promo status
	 * @param status
	 * @return promo list for home page
	 */
	@GetMapping("/Home/getActivePrmomo/{status}")
	@ResponseBody
	public List<Promo> getAllForHome(@PathVariable String status){
		List<Promo> activelist = promoService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * update promo details
	 * @param promo
	 * @return
	 */
	@PostMapping("/AdminDashbord/Promo/updatePromo")
	@ResponseBody
	public String update(@ModelAttribute("updatePromo") Promo promo){
		promoService.update(promo);
	    return "updated";
	}
	
	/**
	 * update promo status by promo id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/Promo/updatePromoStatus")
	@ResponseBody
	public String updateStatusById(@RequestParam("status") String status,@RequestParam("id") int id){
		promoService.updateStatusById(status, id);
	    return "updated";
	}
	
	/**
	 * delete promo details by promo id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/Promo/deletePromo/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		promoService.delete(id);
		return "deleted";
	}
	
}
