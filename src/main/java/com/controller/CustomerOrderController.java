package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.CustomerOrder;
import com.Entity.FoodItem;
import com.Entity.FoodItemOrder;
import com.Entity.PromoOrder;
import com.Service.Bd.CustomerOrderBd;

@Controller
public class CustomerOrderController {

	@Autowired
	private CustomerOrderBd customerOrderService;

	public CustomerOrderBd getCustomerOrderService() {
		return customerOrderService;
	}

	public void setCustomerOrderService(CustomerOrderBd customerOrderService) {
		this.customerOrderService = customerOrderService;
	}
	
	/**
	 * get all customer order details
	 * @return customer order list
	 */
	@GetMapping("/AdminDashbord/Order/getAllCusromerOrder")
	@ResponseBody
	public List<CustomerOrder> getAll(){
		List<CustomerOrder> list = customerOrderService.getAll();
		return list;
	}
	
	/**
	 * get all customer order details by customer id
	 * @return customer order list
	 */
	@PostMapping("/MyAccount/getAllOrderByCustomerId")
	@ResponseBody
	public List<CustomerOrder> getAllByCustomerId(@RequestParam("id") int id){
		List<CustomerOrder> list = customerOrderService.getAllByCustomerId(id);
		return list;
	}
	
	/**
	 * get all food item order details by order id
	 * @return food item order list
	 */
	@PostMapping("/AdminDashbord/Order/getFoodItemOrdeDetails")
	@ResponseBody
	public List<FoodItemOrder> getFoodItemOrderDetailsByOrderId(@RequestParam("id") int id){
		List<FoodItemOrder> list = customerOrderService.getFoodItemOrderDetailsByOrderId(id);
		return list;
	}
	
	/**
	 * get all promo order details by order id
	 * @return promo order list
	 */
	@PostMapping("/AdminDashbord/Order/getPromoOrdeDetails")
	@ResponseBody
	public List<PromoOrder> getPromoOrderDetailsByOrderId(@RequestParam("id") int id){
		List<PromoOrder> list = customerOrderService.getPromoOrderDetailsByOrderId(id);
		return list;
	}
	
	/**
	 * get all today order details by date
	 * @return order list
	 */
	@PostMapping("/AdminDashbord/Home/getTodayOrderDetails")
	@ResponseBody
	public List<CustomerOrder> getTodayOrderByDate(){
		List<CustomerOrder> list = customerOrderService.getTodayOrderByDate();
		return list;
	}
	
	/**
	 * get top selling promo details
	 * @return order list
	 */
	@PostMapping("/AdminDashbord/Home/getTopSellingPromo")
	@ResponseBody
	public List<PromoOrder> getTopSellingPromo(@RequestParam("status") String status){
		List<PromoOrder> list = customerOrderService.getTopSellingPromo(status);
		return list;
	}
	
	/**
	 * get top selling food item details
	 * @return order list
	 */
	@PostMapping("/AdminDashbord/Home/getTopSellingFoodItems")
	@ResponseBody
	public List<FoodItemOrder> getTopSellingFoodItems(@RequestParam("status") String status){
		List<FoodItemOrder> list = customerOrderService.getTopSellingFoodItems(status);
		return list;
	}
	
	/**
	 * update order status by order id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/Order/updateOrderStatus")
	@ResponseBody
	public String updateStatusById(@RequestParam("status") String status, @RequestParam("id") int id){
		customerOrderService.updateStatusById(status, id);
	    return "updated";
	}
	
}
