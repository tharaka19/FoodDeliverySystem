package com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	//return login page
	@RequestMapping("/")
	public String welcome(){
		return "login";
	}
	
	//return login page
	@RequestMapping(value="/Login",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
		
	//return signUp page
	@RequestMapping(value="/SignUp",method=RequestMethod.GET)
	public String signUp() {
		return "signUp";
	}
	
	//return guest home page
	@RequestMapping(value="/GuestHome",method=RequestMethod.GET)
	public String guestHome() {
		return "guestHome";
	}
	
	//return home page
	@RequestMapping(value="/Home",method=RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	//return about page 
	@RequestMapping(value="/About",method=RequestMethod.GET)
	public String about() {
		return "about";		
	}
				
	//return feature page 
	@RequestMapping(value="/Feature",method=RequestMethod.GET)
	public String feature() {
		return "feature";		
	}
				
	//return menu page 
	@RequestMapping(value="/Menu",method=RequestMethod.GET)
	public String menu() {
		return "menu";		
	}
	
	//return chef page 
	@RequestMapping(value="/Chef",method=RequestMethod.GET)
	public String chef() {
		return "chef";		
	}
					
	//return contact page 
	@RequestMapping(value="/Contact",method=RequestMethod.GET)
	public String contact() {
		return "contact";		
	}
	
	//return my account page 
	@RequestMapping(value="/MyAccount",method=RequestMethod.GET)
	public String myAccount() {
		return "myAccount";		
	}
					
	//return shopping Cart page 
	@RequestMapping(value="/ShoppingCart",method=RequestMethod.GET)
	public String shoppingCart() {
		return "shoppingCart";		
	}
	
	//return promo menu page 
	@RequestMapping(value="/PromoMenu",method=RequestMethod.GET)
	public String promoMenu() {
		return "promoMenu";		
	}
	
	//return food item menu page 
	@RequestMapping(value="/FoodItemMenu",method=RequestMethod.GET)
	public String categoryMenu() {
		return "foodItemMenu";		
	}

	//return admin login page 
	@RequestMapping(value="/AdminLogin",method=RequestMethod.GET)
	public String adminLogin() {
		return "adminLogin";		
	}
	
	//return admin signup page 
	@RequestMapping(value="/AdminSignUp",method=RequestMethod.GET)
	public String adminSignUp() {
		return "adminSignUp";		
	}
	
	//return admin dashbord page 
	@RequestMapping(value="/AdminDashbord/Index",method=RequestMethod.GET)
	public String adminDashbordIndex() {
		return "adminDashbordIndex";		
	}
	
	//return admin dashbord page 
	@RequestMapping(value="/AdminDashbord/Home",method=RequestMethod.GET)
	public String adminDashbord() {
		return "adminDashbord";		
	}
	
	//return profile page 
	@RequestMapping(value="/AdminDashbord/Profile",method=RequestMethod.GET)
	public String profile() {
		return "profile";		
	}
	
	//return customer page 
	@RequestMapping(value="/AdminDashbord/Customer",method=RequestMethod.GET)
	public String customer() {
		return "customer";		
	}
	
	//return order page 
	@RequestMapping(value="/AdminDashbord/Order",method=RequestMethod.GET)
	public String order() {
		return "order";		
	}
	
	//return payment page 
	@RequestMapping(value="/AdminDashbord/Payment",method=RequestMethod.GET)
	public String payment() {
		return "payment";		
	}
	
	//return income page 
	@RequestMapping(value="/AdminDashbord/Income",method=RequestMethod.GET)
	public String income() {
		return "income";		
	}
	
	//return category page 
	@RequestMapping(value="/AdminDashbord/Category",method=RequestMethod.GET)
	public String category() {
		return "category";		
	}
	
	//return food item page 
	@RequestMapping(value="/AdminDashbord/FoodItem",method=RequestMethod.GET)
	public String foodItem() {
		return "foodItem";		
	}
	
	//return promo page 
	@RequestMapping(value="/AdminDashbord/Promo",method=RequestMethod.GET)
	public String promo() {
		return "promo";		
	}
	
	//return promo food page 
	@RequestMapping(value="/AdminDashbord/PromoFood",method=RequestMethod.GET)
	public String promoFood() {
		return "promoFood";		
	}
	
	//return delivery location page 
	@RequestMapping(value="/AdminDashbord/DeliveryLocation",method=RequestMethod.GET)
	public String deliveryLocation() {
		return "deliveryLocation";		
	}
	
	//return message page 
	@RequestMapping(value="/AdminDashbord/Email",method=RequestMethod.GET)
	public String message() {
		return "message";		
	}

}
