package com.Service.Bd;

import com.Entity.Admin;

public interface AdminBd {

	public boolean checkEmail(String email);
	public void save(Admin admin);
	public boolean login(Admin admin);
	public Admin getByEmail(String email);
}
