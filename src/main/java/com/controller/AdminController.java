package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.Admin;
import com.Service.Bd.AdminBd;

@Controller
public class AdminController {

	@Autowired
	private AdminBd adminService;

	public AdminBd getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminBd adminService) {
		this.adminService = adminService;
	}
	
	/**
	 * save admin
	 * @param admin
	 * @return 
	 */
	@PostMapping("/AdminSignUp/saveAdmin")
	@ResponseBody
	public String save(@ModelAttribute("saveAdmin") Admin admin){
		
		//check existing email 
		if(adminService.checkEmail(admin.getEmail())) {
			System.out.println("is already registerd");
			return admin.getEmail() + "is already registerd";
			
		}else {
			//save new admin
			adminService.save(admin);
			return "admin";
		}
		
	}
	
	/**
	 * admin login validation
	 * @param admin
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/loginAdmin",method=RequestMethod.GET)
	public void login(@ModelAttribute("loginAdmin") Admin admin, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		//check login validation
		if(adminService.login(admin)) {
			System.out.println("login");
			
			HttpSession session = request.getSession();
			//get admin details by admin email
			session.setAttribute("admin", adminService.getByEmail(admin.getEmail()));

			RequestDispatcher rd = request.getRequestDispatcher("AdminDashbord");
			rd.forward(request, response);
		
		}else {
			System.out.println("cannot login");
			
			RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin");
			rd.forward(request, response);
		}
				
	}
	
	
	
}
