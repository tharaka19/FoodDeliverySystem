package com.Repository.Dao;

import java.util.List;

import com.Entity.Admin;
import com.Entity.Customer;

public interface AdminDao {
	
	public int checkEmail(String email);
	public int checkPassword(String currentPassword, int id);
	public void save(Admin admin);
	public int login(Admin admin);
	public Admin getById(int id);
	public List<Admin> getByEmail(String email);
	public void update(Admin admin);

}
