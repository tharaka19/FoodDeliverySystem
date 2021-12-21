package com.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.User;
import com.Service.Bd.UserBd;

@Controller
public class UserController {

	@Autowired
	private UserBd userService;

	public UserBd getUserService() {
		return userService;
	}

	public void setUserService(UserBd userService) {
		this.userService = userService;
	}
	
	/**
	 * update customer details
	 * @param user
	 * @return
	 */
	@PostMapping("/MyAccount/updateCustomer")
	@ResponseBody
	public String updateCustomer(@ModelAttribute("updateCustomer") User user){
		userService.update(user);
		return "updated";
	}
	
	/**
	 * update admin details
	 * @param user
	 * @return
	 */
	@PostMapping("/AdminDashbord/Profile/updateAdmin")
	@ResponseBody
	public String updateAdmin(@ModelAttribute("updateAdmin") User user){
		userService.update(user);
		return "updated";
	}
	
}
