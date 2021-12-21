package com.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.ShoppingCart;
import com.Entity.FoodItem;
import com.Entity.FoodItemOrder;
import com.Entity.CustomerOrder;
import com.Entity.Promo;
import com.Entity.PromoOrder;
import com.Entity.ShippingDetails;
import com.Service.Bd.CustomerOrderBd;
import com.Service.Bd.FoodItemBd;
import com.Service.Bd.PromoBd;
import com.Service.Bd.ShoppingCartBd;

@Controller
public class ShoppingCartController {

	private List<ShoppingCart> foodItemCartList;
	private List<ShoppingCart> promoCartList;
	private FoodItem foodItem;
	private Promo promo;
	
	@Autowired
	private ShoppingCartBd shoppingCartService;
	@Autowired
	private FoodItemBd foodItemService;
	@Autowired
	private PromoBd promoService;
	@Autowired
	private CustomerOrderBd customerOrderService;
	
	public ShoppingCartBd getShoppingCartService() {
		return shoppingCartService;
	}
	public void setShoppingCartService(ShoppingCartBd shoppingCartService) {
		this.shoppingCartService = shoppingCartService;
	}
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
	public CustomerOrderBd getCustomerOrderService() {
		return customerOrderService;
	}
	public void setCustomerOrderService(CustomerOrderBd customerOrderService) {
		this.customerOrderService = customerOrderService;
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
		foodItem = foodItemService.getById(id);
		
		//check shopping cart
		if(session.getAttribute("foodItemCart") == null) {
			
			foodItemCartList = new ArrayList<ShoppingCart>();
			foodItemCartList.add(new ShoppingCart(foodItem, 1, foodItem.getPrice()));
			session.setAttribute("foodItemCart", foodItemCartList);
			
		}else {
			foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");
			
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
		foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");

		for(int i=0;  i<foodItemCartList.size(); i++) {
			if(foodItemCartList.get(i).getFoodItem().getId()==id) {
				return i;
			}
		}
		return -1;
	}
	
	/**
	 * calculate food item quantity for shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@PostMapping("/ShoppingCart/calculateFoodQuantity")
	@ResponseBody
	public String calculateFoodQuantity(@RequestParam("action") String action,@RequestParam("id") int id, HttpSession session){
		foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");
		int index = FoodItemIsExisting(id, session);

		if(action.equals("plus")) {
			if(index == -1) {
			}else {
				int quantity = foodItemCartList.get(index).getFoodItemQuantity() + 1;
				if(quantity > foodItem.getQuantity()) {
					System.out.println("out of stok");
				}else {
					foodItemCartList.get(index).setFoodItemQuantity(quantity);
					
					float total = quantity * foodItemCartList.get(index).getFoodItem().getPrice();
					foodItemCartList.get(index).setFoodItemTotal(total);
				}
			}
		}else {
			if(index == -1) {
			}else {
				int quantity = foodItemCartList.get(index).getFoodItemQuantity() - 1;
				if(quantity == 0) {
					foodItemCartList.remove(index);
				}else {
					foodItemCartList.get(index).setFoodItemQuantity(quantity);
					
					float total = quantity * foodItemCartList.get(index).getFoodItem().getPrice();
					foodItemCartList.get(index).setFoodItemTotal(total);
				}
				
			}
		}
		
		session.setAttribute("foodItemCart", foodItemCartList);
		return "shoppingCart";
		
	}
	
	/**
	 * delete food item from shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/ShoppingCart/deleteFoodItem/{id}")
	@ResponseBody
	public String deleteFoodItem(@PathVariable int id, HttpSession session){
		foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");
		int index = FoodItemIsExisting(id, session);
		foodItemCartList.remove(index);
		session.setAttribute("foodItemCart", foodItemCartList);
		return "shoppingCart";
	}
	
	/**
	 * clear food item from shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/ShoppingCart/clearFoodItem")
	@ResponseBody
	public String clearFoodItem(HttpSession session){
		foodItemCartList = (List<ShoppingCart>) session.getAttribute("foodItemCart");
		foodItemCartList.removeAll(foodItemCartList);
		session.setAttribute("foodItemCart", foodItemCartList);
		return "shoppingCart";
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
		promo = promoService.getById(id);
		
		//check shopping cart
		if(session.getAttribute("promoCart") == null) {
			
			promoCartList = new ArrayList<ShoppingCart>();
			promoCartList.add(new ShoppingCart(promo, 1, promo.getPrice(), promo.getDiscount()));
			session.setAttribute("promoCart", promoCartList);
			
		}else {
			promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");
			
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
		promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");

		for(int i=0;  i<promoCartList.size(); i++) {
			if(promoCartList.get(i).getPromo().getId()==id) {
				return i;
			}
		}
		return -1;
	}
	
	/**
	 * calculate promo quantity for shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@PostMapping("/ShoppingCart/calculatePromoQuantity")
	@ResponseBody
	public String calculatePromo(@RequestParam("action") String action,@RequestParam("id") int id, HttpSession session){
		promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");
		int index = PromoIsExisting(id, session);

		if(action.equals("plus")) {
			if(index == -1) {
			}else {
				int quantity = promoCartList.get(index).getPromoQuantity() + 1;
				if(quantity > promo.getQuantity()) {
					System.out.println("out of stok");
				}else {
					promoCartList.get(index).setPromoQuantity(quantity);
					
					float total = quantity * promoCartList.get(index).getPromo().getPrice();
					promoCartList.get(index).setPromoTotal(total);
					
					float discount = quantity * promoCartList.get(index).getPromo().getDiscount();
					promoCartList.get(index).setPromoTotalDiscount(discount);
				}
				
			}
		}else {
			if(index == -1) {
			}else {
				int quantity = promoCartList.get(index).getPromoQuantity() - 1;
				if(quantity == 0) {
					promoCartList.remove(index);
				}else {
					promoCartList.get(index).setPromoQuantity(quantity);
					
					float total = quantity * promoCartList.get(index).getPromo().getPrice();
					promoCartList.get(index).setPromoTotal(total);
					
					float discount = quantity * promoCartList.get(index).getPromo().getDiscount();
					promoCartList.get(index).setPromoTotalDiscount(discount);
				}
				
			}
		}
		
		session.setAttribute("promoCart", promoCartList);
		return "shoppingCart";
	}
	
	/**
	 * delete promo from shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/ShoppingCart/deletePromo/{id}")
	@ResponseBody
	public String deletePromo(@PathVariable int id, HttpSession session){
		promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");
		int index = PromoIsExisting(id, session);
		promoCartList.remove(index);
		session.setAttribute("promoCart", promoCartList);
		return "shoppingCart";
	}
	
	/**
	 * clear food item from shopping cart page
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/ShoppingCart/clearPromo")
	@ResponseBody
	public String clearPromo(HttpSession session){
		promoCartList = (List<ShoppingCart>) session.getAttribute("promoCart");
		promoCartList.removeAll(promoCartList);
		session.setAttribute("promoCart", foodItemCartList);
		return "shoppingCart";
	}
	
	/**
	 * save shipping details using customer signUp
	 * @param shippingDetails
	 * @return
	 */
	@PostMapping("/ShoppingCart/proccedOrder")
	@ResponseBody
	public int proccedOrder(@ModelAttribute("proccedOrder") CustomerOrder customerOrder, HttpSession session){
		
		if(foodItemCartList != null && promoCartList == null) {

			for(ShoppingCart shoppingCart : foodItemCartList) {
				
				FoodItemOrder foodItemOrder = new FoodItemOrder();
				foodItemOrder.setFoodItem(shoppingCart.getFoodItem());
				foodItemOrder.setQuantity(shoppingCart.getFoodItemQuantity());
				foodItemOrder.setTotal(shoppingCart.getFoodItemTotal());
				
				customerOrder.getFoodItemOrderList().add(foodItemOrder);
				
				int foodQuantity = shoppingCart.getFoodItem().getQuantity() - shoppingCart.getFoodItemQuantity();
				foodItemService.updateQuantityById(shoppingCart.getFoodItem().getId(), foodQuantity);
			}
			
			foodItemCartList.removeAll(foodItemCartList);
			session.setAttribute("foodItemCart", foodItemCartList);
			
			return customerOrderService.save(customerOrder);
			
			
		}else if(promoCartList != null && foodItemCartList == null){
			
			for(ShoppingCart shoppingCart : promoCartList) {
				
				PromoOrder promoOrder = new PromoOrder();
				promoOrder.setPromo(shoppingCart.getPromo());
				promoOrder.setQuantity(shoppingCart.getPromoQuantity());
				promoOrder.setDiscount(shoppingCart.getPromoTotalDiscount());
				promoOrder.setTotal(shoppingCart.getPromoTotal());
				
				customerOrder.getPromoOrderList().add(promoOrder);
				
				int promoQuantity = shoppingCart.getPromo().getQuantity() - shoppingCart.getPromoQuantity();
				promoService.updateQuantityById(promoQuantity, shoppingCart.getPromo().getId());
			}
			
			promoCartList.removeAll(promoCartList);
			session.setAttribute("promoCart", foodItemCartList);
			
			return customerOrderService.save(customerOrder);
			
		}else if(foodItemCartList != null && promoCartList != null){
			
			for(ShoppingCart shoppingCart : foodItemCartList) {
				
				FoodItemOrder foodItemOrder = new FoodItemOrder();
				foodItemOrder.setFoodItem(shoppingCart.getFoodItem());
				foodItemOrder.setQuantity(shoppingCart.getFoodItemQuantity());
				foodItemOrder.setTotal(shoppingCart.getFoodItemTotal());
				
				customerOrder.getFoodItemOrderList().add(foodItemOrder);
				
				int foodQuantity = shoppingCart.getFoodItem().getQuantity() - shoppingCart.getFoodItemQuantity();
				foodItemService.updateQuantityById(shoppingCart.getFoodItem().getId(), foodQuantity);
			}
			
			for(ShoppingCart shoppingCart : promoCartList) {
				
				PromoOrder promoOrder = new PromoOrder();
				promoOrder.setPromo(shoppingCart.getPromo());
				promoOrder.setQuantity(shoppingCart.getPromoQuantity());
				promoOrder.setDiscount(shoppingCart.getPromoTotalDiscount());
				promoOrder.setTotal(shoppingCart.getPromoTotal());
				
				customerOrder.getPromoOrderList().add(promoOrder);
				
				int promoQuantity = shoppingCart.getPromo().getQuantity() - shoppingCart.getPromoQuantity();
				promoService.updateQuantityById(promoQuantity, shoppingCart.getPromo().getId());
			}
			
			foodItemCartList.removeAll(foodItemCartList);
			session.setAttribute("foodItemCart", foodItemCartList);
			
			promoCartList.removeAll(promoCartList);
			session.setAttribute("promoCart", foodItemCartList);
			
			return customerOrderService.save(customerOrder);
			
		}else {
			return 0;
		}
	}

	
}
