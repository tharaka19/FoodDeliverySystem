package com.Service.Bd;

import com.Entity.Admin;
import com.Entity.Customer;

public interface AdminBd {

	public boolean checkEmail(String email);
	public boolean checkPassword(String currentPassword, int id);
	public void save(Admin admin);
	public boolean login(Admin admin);
	public Admin getById(int id);
	public Admin getByEmail(String email);
	public void updatePassword(String password, int id);

}
