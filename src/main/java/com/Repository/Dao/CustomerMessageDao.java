package com.Repository.Dao;

import java.util.List;

import com.Entity.Category;
import com.Entity.CustomerMessage;

public interface CustomerMessageDao {

	public void save(CustomerMessage customerMagssage);
	public List<CustomerMessage> getAll();
	public CustomerMessage getById(int id);
	public void delete(CustomerMessage customerMessage);
}
