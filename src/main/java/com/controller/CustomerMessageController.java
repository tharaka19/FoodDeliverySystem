package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.Category;
import com.Entity.CustomerMessage;
import com.Service.Bd.CustomerMessageBd;

@Controller
public class CustomerMessageController {

	@Autowired
	private CustomerMessageBd customerMessageService;
	
	public CustomerMessageBd getCustomerMessageService() {
		return customerMessageService;
	}

	public void setCustomerMessageService(CustomerMessageBd customerMessageService) {
		this.customerMessageService = customerMessageService;
	}
	
	/**
	 * save new customer massage
	 * @param customerMassage
	 * @return
	 */
	@PostMapping("/Home/sendMessage")
	@ResponseBody
	public String save(@ModelAttribute("sendMessage") CustomerMessage customerMessage){
		customerMessageService.save(customerMessage);	 		 		
		return "customerMassage";
	}

	/**
	 * get all customer message details
	 * @return message list
	 */
	@GetMapping("/AdminDashbord/Message/getAllMessage")
	@ResponseBody
	public List<CustomerMessage> getAll(){
		List<CustomerMessage> list = customerMessageService.getAll();
		return list;
	}
	
	/**
	 * get customer message details by customer message id
	 * @param id
	 * @return message
	 */
	@GetMapping("/AdminDashbord/Message/getOneMessage/{id}")
	@ResponseBody
	public CustomerMessage getById(@PathVariable int id){
		return customerMessageService.getById(id);
	}
	
	/**
	 * delete customer message details by customer message id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/Message/deleteMessage/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		customerMessageService.delete(id);
		return "deleted";
	}
}
