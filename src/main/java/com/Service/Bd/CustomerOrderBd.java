package com.Service.Bd;

import java.util.List;

import com.Entity.Customer;
import com.Entity.CustomerOrder;
import com.Entity.FoodItem;
import com.Entity.FoodItemOrder;
import com.Entity.PromoOrder;

public interface CustomerOrderBd {

	public int save(CustomerOrder customerOrder);
	public List<CustomerOrder> getAll();
	public List<CustomerOrder> getAllByCustomerId(int id);
	public List<FoodItemOrder> getFoodItemOrderDetailsByOrderId(int id);
	public List<PromoOrder> getPromoOrderDetailsByOrderId(int id);
	public List<CustomerOrder> getTodayOrderByDate();
	public List<PromoOrder> getTopSellingPromo(String status);
	public List<FoodItemOrder> getTopSellingFoodItems(String status);
	public int PromoIsExisting(int id);
	public int FoodItemIsExisting(int id);
	public void updateStatusById(String status,int id);
}
