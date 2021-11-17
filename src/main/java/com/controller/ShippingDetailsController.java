package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.ShippingDetails;
import com.Service.Bd.ShippingDetailsBd;

@Controller
public class ShippingDetailsController {

	@Autowired
	private ShippingDetailsBd shippingDetailsService;

	public ShippingDetailsBd getShippingDetailsService() {
		return shippingDetailsService;
	}
	public void setShippingDetailsService(ShippingDetailsBd shippingDetailsService) {
		this.shippingDetailsService = shippingDetailsService;
	}

	/**
	 * save shipping details using customer signUp
	 * @param shippingDetails
	 * @return
	 */
	@PostMapping("/SignUp/saveShippingAddress")
	@ResponseBody
	public String save(@ModelAttribute("saveShippingAddress") ShippingDetails shippingDetails){
		shippingDetailsService.save(shippingDetails);
		return "admin";
	}
	
	/**
	 * save new shipping details
	 * @param shippingDetails
	 * @return
	 */
	@PostMapping("/MyAccount/saveShippingDetails")
	@ResponseBody
	public String saveShippingDetails(@ModelAttribute("saveShippingDetails") ShippingDetails shippingDetails){
		shippingDetailsService.saveShippingDetails(shippingDetails);
		return "admin";
	}
	
	/**
	 * get all shipping details
	 * @param id
	 * @return shipping details list
	 */
	@PostMapping("/MyAccount/getAllShippingDetails")
	@ResponseBody
	public List<ShippingDetails> getAllByStatus(@RequestParam("id") int id){
		List<ShippingDetails> shippinglist = shippingDetailsService.getAllById(id);
		return shippinglist;
	}
	
	/**
	 * update shopping details status by shipping details id
	 * @param customerId
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/MyAccount/updateShoppingDetailsStatus")
	@ResponseBody
	public String updateShoppingDetailsStatus(@RequestParam("customerId") int customerId,@RequestParam("status") String status, @RequestParam("id") int id){
		shippingDetailsService.updateStatusById(customerId, status, id);
		return "admin";
	}
}
