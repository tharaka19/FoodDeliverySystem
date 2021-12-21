package com.Repository.Dao;

import java.util.Date;
import java.util.List;

import com.Entity.CustomerOrder;
import com.Entity.FoodItem;
import com.Entity.FoodItemOrder;
import com.Entity.PromoOrder;

public interface CustomerOrderDao {

	public int save(CustomerOrder customerOrder);
	public CustomerOrder getById(int id);
	public List<CustomerOrder> getAll();
	public List<CustomerOrder> getAllByCustomerId(int id);
	public List<CustomerOrder> getAllByStatus(String status);
	public List<CustomerOrder> getTodayOrderByDate(Date date);
	public void update(CustomerOrder customerOrder);
}
