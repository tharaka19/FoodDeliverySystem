package com.Repository.Dao;

import java.util.List;

import com.Entity.Customer;
import com.Entity.FoodItem;

public interface CustomerDao {

	public int checkEmail(String email);
	public int checkPassword(String currentPassword, int id);
	public int save(Customer customer);
	public int login(Customer customer);
	public Customer getById(int id);
	public List<Customer> getByEmail(String email);
	public List<Customer> getAllCustomer();
	public void update(Customer customer);
	public void delete(Customer customer);

}
