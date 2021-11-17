package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Admin;
import com.Repository.Dao.AdminDao;
import com.Service.Bd.AdminBd;

@Service("adminBd")
public class AdminService implements AdminBd {

	@Autowired
	private AdminDao adminRepository;
	
	public AdminDao getAdminRepository() {
		return adminRepository;
	}

	public void setAdminRepository(AdminDao adminRepository) {
		this.adminRepository = adminRepository;
	}
	
	/**
	 * check existing email
	 */
	@Override
	public boolean checkEmail(String email) {
		return adminRepository.checkEmail(email);
	}
	
	/**
	 * save new admin
	 */
	@Override
	public void save(Admin admin) {
		adminRepository.save(admin);
	}

	/**
	 * check login validation
	 */
	@Override
	public boolean login(Admin admin) {
		return adminRepository.login(admin);
	}

	/**
	 * get admin details by admin email
	 */
	@Override
	public Admin getByEmail(String email) {
		List<Admin> adminList =  adminRepository.getByEmail(email);
		
		for(Admin admin : adminList) {
			System.out.println(admin.getFirstName());
			return admin;
		}
		
		return null;
	}



	
}
