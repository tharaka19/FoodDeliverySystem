package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.Category;
import com.Entity.DeliveryLocation;
import com.Service.Bd.DeliveryLocationBd;

@Controller
public class DeliveryLocationController {

	@Autowired
	private DeliveryLocationBd deliveryLocationService;

	public DeliveryLocationBd getDeliveryLocationService() {
		return deliveryLocationService;
	}

	public void setDeliveryLocationService(DeliveryLocationBd deliveryLocationService) {
		this.deliveryLocationService = deliveryLocationService;
	}
	
	/**
	 * save new delivery location
	 * @param deliveryLocation
	 * @return
	 */
	@PostMapping("/AdminDashbord/DeliveryLocation/saveDeliveryLocation")
	@ResponseBody
	public String save(@ModelAttribute("saveDeliveryLocation") DeliveryLocation deliveryLocation){
		deliveryLocationService.save(deliveryLocation);	 		 		
		return "deliveryLocation";
	}
	
	/**
	 * get all delivery location details
	 * @return delivery location list
	 */
	@GetMapping("/AdminDashbord/DeliveryLocation/getAllDeliveryLocation")
	@ResponseBody
	public List<DeliveryLocation> getAll(){
		List<DeliveryLocation> list = deliveryLocationService.getAll();
		return list;
	}
	
	/**
	 * get delivery location details by delivery location id
	 * @param id
	 * @return delivery location
	 */
	@GetMapping("/AdminDashbord/DeliveryLocation/getOneDeliveryLocation/{id}")
	@ResponseBody
	public DeliveryLocation getById(@PathVariable int id){
		return deliveryLocationService.getById(id);
	}
	
	/**
	 * get active delivery location details by delivery location status
	 * @param status
	 * @return delivery location list for signUp page
	 */
	@GetMapping("/SignUp/getActiveDeliveryLocation/{status}")
	@ResponseBody
	public List<DeliveryLocation> getAllByStatus(@PathVariable String status){
		List<DeliveryLocation> activelist = deliveryLocationService.getAllByStatus(status);
		return activelist;
	}
	
	/**
	 * get delivery location fee by delivery location city
	 * @param city
	 * @return delivery location fee
	 */
	@GetMapping("/ShoppingCart/getDeliveryLocationFee/{city}")
	@ResponseBody
	public String getDeliveryLocationFeeByCity(@PathVariable String city, HttpSession session){
		session.setAttribute("deliveryFee", deliveryLocationService.getDeliveryLocationFeeByCity(city));
		return "shoppingCart";
	}
	
	/**
	 * update delivery location details
	 * @param deliveryLocation
	 * @return
	 */
	@PostMapping("/AdminDashbord/DeliveryLocation/updateDeliveryLocation")
	@ResponseBody
	public String update(@ModelAttribute("updateDeliveryLocation") DeliveryLocation deliveryLocation){
		deliveryLocationService.update(deliveryLocation);
	    return "updated";
	}
	
	/**
	 * update delivery location status by delivery location id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/DeliveryLocation/updateDeliveryLocationStatus")
	@ResponseBody
	public String updateStatusById(@RequestParam("status") String status,@RequestParam("id") int id){
		deliveryLocationService.updateStatusById(status, id);
	    return "updated";
	}
	
	/**
	 * delete delivery location details by delivery location id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/DeliveryLocation/deleteDeliveryLocation/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		deliveryLocationService.delete(id);
		return "deleted";
	}
}
