package com.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.CustomerOrder;
import com.Entity.FoodItemOrder;
import com.Entity.PromoOrder;
import com.Entity.ShippingDetails;
import com.Entity.ShoppingCart;
import com.Repository.Dao.CustomerOrderDao;
import com.Repository.Dao.ShippingDetailsDao;
import com.Service.Bd.CustomerOrderBd;

@Service("customerOrderBd")
public class CustomerOrderService implements CustomerOrderBd{

	private List<CustomerOrder> customerOrderList;
	private List<PromoOrder> promoOrderList;
	private List<PromoOrder> newPromoOrderList;
	private List<FoodItemOrder> foodItemOrderList;
	private List<FoodItemOrder> newFoodItemOrderList;
	private  CustomerOrder customerOrder;

	@Autowired
	private CustomerOrderDao customerOrderRepository;

	public CustomerOrderDao getCustomerOrderRepository() {
		return customerOrderRepository;
	}

	public void setCustomerOrderRepository(CustomerOrderDao customerOrderRepository) {
		this.customerOrderRepository = customerOrderRepository;
	}
	
	/**
	 * save new customer order
	 */
	@Override
	public int save(CustomerOrder customerOrder) {
		return customerOrderRepository.save(customerOrder);
	}

	/**
	 * get all customer order details
	 */
	@Override
	public List<CustomerOrder> getAll() {
		//get all customer order details
		customerOrderList = customerOrderRepository.getAll();
		
		for(CustomerOrder customerOrder : customerOrderList) {
			customerOrder.setFoodItemOrderList(null);
			customerOrder.setPromoOrderList(null);
		}
		
		return customerOrderList;
	}
	
	/**
	 * get all customer order details by customer id
	 */
	@Override
	public List<CustomerOrder> getAllByCustomerId(int id) {
		//get all customer order details by customer id
		customerOrderList = customerOrderRepository.getAllByCustomerId(id);
		
		for(CustomerOrder customerOrder : customerOrderList) {
			customerOrder.setFoodItemOrderList(null);
			customerOrder.setPromoOrderList(null);
		}
		
		return customerOrderList;
	}

	/**
	 * get all food item order details by order id
	 */
	@Override
	public List<FoodItemOrder> getFoodItemOrderDetailsByOrderId(int id) {
		return (List<FoodItemOrder>) customerOrderRepository.getById(id).getFoodItemOrderList();
	}

	/**
	 * get all promo order details by order id
	 */
	@Override
	public List<PromoOrder> getPromoOrderDetailsByOrderId(int id) {
		return (List<PromoOrder>) customerOrderRepository.getById(id).getPromoOrderList();
	}

	/**
	 * get all today order details by date
	 */
	@Override
	public List<CustomerOrder> getTodayOrderByDate() {
		//get date
		long millis = System.currentTimeMillis();  
		java.sql.Date date = new java.sql.Date(millis);  
		
		return customerOrderRepository.getTodayOrderByDate(date);
	}
	
	/**
	 * get top selling promo details
	 */
	@Override
	public List<PromoOrder> getTopSellingPromo(String status) {
		newPromoOrderList = new ArrayList<PromoOrder>();
		
		//get customer order details by status
		customerOrderList = customerOrderRepository.getAllByStatus(status);
		
		for(int i=0;  i < customerOrderList.size(); i++) {
			//get promo order details from customer order
			promoOrderList = (List<PromoOrder>) customerOrderList.get(i).getPromoOrderList();
			
			for(int a=0;  a < promoOrderList.size(); a++) {
				//check existing promo
				int index = PromoIsExisting(promoOrderList.get(a).getPromo().getId());
				
				if(index == -1) {
					newPromoOrderList.add(new PromoOrder(promoOrderList.get(a).getPromo(), promoOrderList.get(a).getQuantity()));
				}else {
					int quantity = newPromoOrderList.get(index).getQuantity() + promoOrderList.get(a).getQuantity();
					newPromoOrderList.get(index).setQuantity(quantity);
				}
			}
			
		}
		
		return newPromoOrderList;
	}
	
	/**
	 * check existing promo
	 */
	@Override
	public int PromoIsExisting(int id) {
			for(int i=0;  i<newPromoOrderList.size(); i++) {
				if(newPromoOrderList.get(i).getPromo().getId()==id) {
					return i;
				}
			}
			return -1;
	}
	
	/**
	 * get top selling food item details
	 */
	@Override
	public List<FoodItemOrder> getTopSellingFoodItems(String status) {
		newFoodItemOrderList = new ArrayList<FoodItemOrder>();
		
		//get customer order details by status
		customerOrderList = customerOrderRepository.getAllByStatus(status);
		
		for(int i=0;  i < customerOrderList.size(); i++) {
			//get food item order details from customer order
			foodItemOrderList = (List<FoodItemOrder>) customerOrderList.get(i).getFoodItemOrderList();
			
			for(int a=0;  a < foodItemOrderList.size(); a++) {
				//check existing food item
				int index = FoodItemIsExisting(foodItemOrderList.get(a).getFoodItem().getId());
				
				if(index == -1) {
					newFoodItemOrderList.add(new FoodItemOrder(foodItemOrderList.get(a).getFoodItem(), foodItemOrderList.get(a).getQuantity()));
				}else {
					int quantity = newFoodItemOrderList.get(index).getQuantity() + foodItemOrderList.get(a).getQuantity();
					newFoodItemOrderList.get(index).setQuantity(quantity);
				}
			}
			
		}
		
		return newFoodItemOrderList;
	}

	/**
	 * check existing promo
	 */
	@Override
	public int FoodItemIsExisting(int id) {
		for(int i=0;  i<newFoodItemOrderList.size(); i++) {
			if(newFoodItemOrderList.get(i).getFoodItem().getId()==id) {
				return i;
			}
		}
		return -1;
	}
	
	/**
	 * update order status by order id
	 */
	@Override
	public void updateStatusById(String status, int id) {
		customerOrder = new CustomerOrder();
		
		//get customer order details by customer order id
		customerOrder = customerOrderRepository.getById(id);
		
		//set customer order status
		customerOrder.setStatus(status);
		
		customerOrderRepository.update(customerOrder);
	}

	

	
	

	
	
}
