package com.Service.Bd;

import java.util.List;

import com.Entity.Customer;
import com.Entity.User;

public interface CustomerBd {

	public boolean checkEmail(String email);
	public boolean checkPassword(String currentPassword, int id);
	public int save(Customer customer);
	public boolean login(Customer customer);
	public Customer getById(int id);
	public Customer getByEmail(String email);
	public List<Customer> getAllCustomer();
	public void updatePassword(String password, int id);
	public void delete(int id);
}
