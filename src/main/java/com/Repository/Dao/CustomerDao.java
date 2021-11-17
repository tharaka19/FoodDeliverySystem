package com.Repository.Dao;

import java.util.List;

import com.Entity.Customer;

public interface CustomerDao {

	public boolean checkEmail(String email);
	public int save(Customer customer);
	public void saveAdddress(Customer customer);
	public boolean login(Customer customer);
	public Customer getById(int id);
	public List<Customer> getByEmail(String email);
	
	

}
