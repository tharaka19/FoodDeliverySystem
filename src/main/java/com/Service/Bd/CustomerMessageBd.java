package com.Service.Bd;

import java.util.List;

import com.Entity.Category;
import com.Entity.Customer;
import com.Entity.CustomerMessage;

public interface CustomerMessageBd {

	public void save(CustomerMessage customerMagssage);
	public List<CustomerMessage> getAll();
	public CustomerMessage getById(int id);
	public void delete(int id);
}
