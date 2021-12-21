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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.Customer;
import com.Entity.CustomerOrder;
import com.Entity.User;
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

		System.out.println(customer.getEmail());
		System.out.println(customer.getPassword());
		
		//check login validation
		if(customerService.login(customer)) {
			System.out.println("login");
			
			HttpSession session = request.getSession();
			//get customer details by customer email
			session.setAttribute("customer", customerService.getByEmail(customer.getEmail()));

			RequestDispatcher rd = request.getRequestDispatcher("Home");
			rd.forward(request, response);
		
		}else {
			
			String status="email or password inccorect";
			System.out.println(status);
			
			request.setAttribute("status", status);
			
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
	
	/**
	 * get all customer details
	 * @return customer list
	 */
	@PostMapping("/AdminDashbord/Home/getAllCustomer")
	@ResponseBody
	public List<Customer> getAllCustomer(){
		List<Customer> list = customerService.getAllCustomer();
		return list;
	}
	
	/**
	 * get all customer details
	 * @return customer list for customer page
	 */
	@GetMapping("/AdminDashbord/Customer/getAllCustomer")
	@ResponseBody
	public List<Customer> getAllCustomerForCustomerPage(){
		List<Customer> list = customerService.getAllCustomer();
		return list;
	}
	
	/**
	 * check existing password by customer id
	 * @param currentPassword
	 * @param id
	 * @return
	 */
	@PostMapping("/MyAccount/checkPassword")
	@ResponseBody
	public boolean checkPassword(@RequestParam("currentPassword") String currentPassword, @RequestParam("id") int id){
		return customerService.checkPassword(currentPassword,id);
	}
	
	/**
	 * update password by customer id
	 * @param password
	 * @param id
	 */
	@PostMapping("/MyAccount/updatePassword")
	@ResponseBody
	public void savePassword(@RequestParam("password") String password, @RequestParam("id") int id){
		customerService.updatePassword(password, id);
	}
	
	/**
	 * delete customer item details by customer id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/Customer/deleteFoodItem/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		customerService.delete(id);
		return "deleted";
	}
}
