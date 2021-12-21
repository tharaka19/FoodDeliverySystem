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

import com.Entity.DeliveryLocation;
import com.Entity.FoodItem;
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
	public String save(@ModelAttribute("saveShippingAddress") ShippingDetails shippingDetails) {
		shippingDetailsService.save(shippingDetails);
		return "save";
	}

	/**
	 * save new shipping details
	 * @param shippingDetails
	 * @return
	 */
	@PostMapping("/MyAccount/saveShippingDetails")
	@ResponseBody
	public String saveShippingDetails(@ModelAttribute("saveShippingDetails") ShippingDetails shippingDetails) {
		shippingDetailsService.saveShippingDetails(shippingDetails);
		return "save";
	}
	
	/**
	 * get shipping details by shipping id
	 * @param id
	 * @return shipping details
	 */
	@GetMapping("/AdminDashbord/Order/getCustomerShippingDetails/{id}")
	@ResponseBody
	public ShippingDetails getById(@PathVariable int id){
		ShippingDetails shippingDetails = shippingDetailsService.getById(id);
		return shippingDetails;
	}

	/**
	 * get all shipping details by customer id
	 * @param id
	 * @return
	 */
	@PostMapping("/MyAccount/getAllShippingDetails")
	@ResponseBody
	public List<ShippingDetails> getAllByStatus(@RequestParam("id") int id) {
		List<ShippingDetails> shippinglist = shippingDetailsService.getAllById(id);
		return shippinglist;
	}

	/**
	 * get all shipping details by customer id
	 * @param id
	 * @return
	 */
	@PostMapping("/ShoppingCart/getAllShippingDetails")
	@ResponseBody
	public List<ShippingDetails> getAll(@RequestParam("id") int id) {
		List<ShippingDetails> shippinglist = shippingDetailsService.getAllById(id);
		return shippinglist;
	}

	/**
	 * get all shipping details by customer id
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/Customer/getAllCustomerShippingDetails")
	@ResponseBody
	public List<ShippingDetails> getAllByCustomerId(@RequestParam("customerId") int id) {
		List<ShippingDetails> shippinglist = shippingDetailsService.getAllById(id);
		return shippinglist;
	}

	/**
	 * get on shipping details by status and customer id
	 * 
	 * @param status, customerId
	 * @return shipping details for order page
	 *//*
		 * @PostMapping("/AdminDashbord/Order/getCustomerShippingDetails")
		 * 
		 * @ResponseBody public ShippingDetails
		 * getOneByStatusAndCustomerId(@RequestParam("status") String
		 * status, @RequestParam("customerId") int id){ return
		 * shippingDetailsService.getOneByStatusAndCustomerId(status, id); }
		 */

	/**
	 * get on shipping details by shipping status and customer id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/MyAccount/getCustomerShippingDetails")
	@ResponseBody
	public ShippingDetails getOneByStatusAndCustomerId(@RequestParam("status") String status, @RequestParam("customerId") int id) {
		return shippingDetailsService.getOneByStatusAndCustomerId(status, id);
	}

	/**
	 * update shipping details status by shipping details id
	 * @param customerId
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/MyAccount/updateShoppingDetailsStatus")
	@ResponseBody
	public String updateShippingDetailsStatus(@RequestParam("customerId") int customerId, @RequestParam("status") String status, @RequestParam("id") int id) {
		shippingDetailsService.updateStatusById(customerId, status, id);
		return "update";
	}

	/**
	 * update shipping details status by shipping details id
	 * @param customerId
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/ShoppingCart/updateShoppingDetailsStatus")
	@ResponseBody
	public String updateShippingDetails(@RequestParam("customerId") int customerId, @RequestParam("status") String status, @RequestParam("id") int id) {
		shippingDetailsService.updateStatusById(customerId, status, id);
		return "update";
	}
	
}
