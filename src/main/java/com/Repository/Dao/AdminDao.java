package com.Repository.Dao;

import java.util.List;

import com.Entity.Admin;

public interface AdminDao {
	
	public boolean checkEmail(String email);
	public void save(Admin admin);
	public boolean login(Admin admin);
	public List<Admin> getByEmail(String email);

}
