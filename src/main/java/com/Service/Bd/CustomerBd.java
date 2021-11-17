package com.Service.Bd;

import com.Entity.Customer;

public interface CustomerBd {

	public boolean checkEmail(String email);
	public int save(Customer customer);
	public boolean login(Customer customer);
	public Customer getById(int id);
	public Customer getByEmail(String email);
}
