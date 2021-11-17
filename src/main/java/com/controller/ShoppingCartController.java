package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.ShoppingCart;
import com.Entity.FoodItem;
import com.Entity.Promo;
import com.Service.Bd.FoodItemBd;
import com.Service.Bd.PromoBd;

@Controller
public class ShoppingCartController {

	@Autowired
	private FoodItemBd foodItemService;
	@Autowired
	private PromoBd promoService;
	
	public FoodItemBd getFoodItemService() {
		return foodItemService;
	}
	public void setFoodItemService(FoodItemBd foodItemService) {
		this.foodItemService = foodItemService;
	}
	public PromoBd getPromoService() {
		return promoService;
	}
	public void setPromoService(PromoBd promoService) {
		this.promoService = promoService;
	}

	/**
	 * add food item for shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/FoodItemMenu/foodItemCart/{id}")
	@ResponseBody
	public String foodItemShoppingCart(@PathVariable int id, HttpSession session){
		//get food item details by food item id
		FoodItem foodItem = foodItemService.getById(id);
		
		//check shopping cart
		if(session.getAttribute("foodItemCart") == null) {
			
			List<ShoppingCart> foodItemCartList = new ArrayList<ShoppingCart>();
			foodItemCartList.add(new ShoppingCart(foodItem, 1, foodItem.getPrice()));
			session.setAttribute("foodItemCart", foodItemCartList);
			
		}else {
			List<ShoppingCart> foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");
			
			int index = FoodItemIsExisting(id, session);
			
			if(index == -1) {
				foodItemCartList.add(new ShoppingCart(foodItem, 1, foodItem.getPrice()));
			}else {
				int quantity = foodItemCartList.get(index).getFoodItemQuantity() + 1;
				foodItemCartList.get(index).setFoodItemQuantity(quantity);
				
				float total = quantity * foodItemCartList.get(index).getFoodItem().getPrice();
				foodItemCartList.get(index).setFoodItemTotal(total);
			}
			session.setAttribute("foodItemCart", foodItemCartList);
		}
		
		return "shoppingCart";
	}
	
	/**
	 * check existing food item
	 * @param id
	 * @param session
	 * @return
	 */
	private int FoodItemIsExisting(int id, HttpSession session) {
		List<ShoppingCart> foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");

		for(int i=0;  i<foodItemCartList.size(); i++) {
			if(foodItemCartList.get(i).getFoodItem().getId()==id) {
				return i;
			}
		}
		return -1;
	}
	
	/**
	 * add promo for shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/PromoMenu/promoCart/{id}")
	@ResponseBody
	public String promoShoppingCart(@PathVariable int id, HttpSession session){
		//get promo details by promo id
		Promo promo = promoService.getById(id);
		
		//check shopping cart
		if(session.getAttribute("promoCart") == null) {
			
			List<ShoppingCart> promoCartList = new ArrayList<ShoppingCart>();
			promoCartList.add(new ShoppingCart(promo, 1, promo.getPrice(), promo.getDiscount()));
			session.setAttribute("promoCart", promoCartList);
			
		}else {
			List<ShoppingCart> promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");
			
			int index = PromoIsExisting(id, session);
			
			if(index == -1) {
				promoCartList.add(new ShoppingCart(promo, 1, promo.getPrice(), promo.getDiscount()));
			}else {
				int quantity = promoCartList.get(index).getPromoQuantity() + 1;
				promoCartList.get(index).setPromoQuantity(quantity);
				
				float total = quantity * promoCartList.get(index).getPromo().getPrice();
				promoCartList.get(index).setPromoTotal(total);
				
				float discount = quantity * promoCartList.get(index).getPromo().getDiscount();
				promoCartList.get(index).setPromoTotalDiscount(discount);
			}
			session.setAttribute("promoCart", promoCartList);
		}
		
		return "shoppingCart";
	}
	
	/**
	 * check existing promo
	 * @param id
	 * @param session
	 * @return
	 */
	private int PromoIsExisting(int id, HttpSession session) {
		List<ShoppingCart> promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");

		for(int i=0;  i<promoCartList.size(); i++) {
			if(promoCartList.get(i).getPromo().getId()==id) {
				return i;
			}
		}
		return -1;
	}

	
}
