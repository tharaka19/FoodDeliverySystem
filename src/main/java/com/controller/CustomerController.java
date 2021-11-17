package com.controller;

import java.io.IOException;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.Customer;
import com.Service.Bd.CustomerBd;

@Controller
public class CustomerController {

	@Autowired
	private CustomerBd customerService;

	public CustomerBd getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerBd customerService) {
		this.customerService = customerService;
	}
	
	/**
	 * save customer
	 * @param customer
	 * @return customer id
	 */
	@PostMapping("/SignUp/saveCustomer")
	@ResponseBody
	public int save(@ModelAttribute("saveCustomer") Customer customer){
		
		//check existing email
		if(customerService.checkEmail(customer.getEmail())) {
			System.out.println("is already registerd");
			return 0;
			
		}else {
			//save new customer
			return customerService.save(customer);
		}
		
	}
	
	/**
	 * customer login validation
	 * @param customer
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/loginCustomer",method=RequestMethod.GET)
	public void login(@ModelAttribute("loginCustomer") Customer customer, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		//check login validation
		if(customerService.login(customer)) {
			System.out.println("login");
			
			HttpSession session = request.getSession();
			//get customer details by customer email
			session.setAttribute("customer", customerService.getByEmail(customer.getEmail()));

			RequestDispatcher rd = request.getRequestDispatcher("Home");
			rd.forward(request, response);
		
		}else {
			System.out.println("cannot login");
			
			 RequestDispatcher rd = request.getRequestDispatcher("/Login");
			 rd.forward(request, response);
		
		}
				
	}
	
	/**
	 * get customer details by customer id
	 * @param id
	 * @param session
	 */
	@GetMapping("/MyAccount/getCustomer/{id}")
	@ResponseBody
	public void getById(@PathVariable int id, HttpSession session){
		session.setAttribute("customer", customerService.getById(id));
	}

}
