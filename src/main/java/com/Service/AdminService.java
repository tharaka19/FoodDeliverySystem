package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Admin;
import com.Repository.Dao.AdminDao;
import com.Service.Bd.AdminBd;

@Service("adminBd")
public class AdminService implements AdminBd {

	private Admin admin;
	
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
		if(adminRepository.checkEmail(email) > 0){
			return true;
		}else {
			return false;
		}
	}
	
    /**
     * check existing password by admin id
     */
	@Override
	public boolean checkPassword(String currentPassword, int id) {
		if(adminRepository.checkPassword(currentPassword, id) > 0) {
			return true;
		}else {
			return false;
		}
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
		if(adminRepository.login(admin) > 0 ) {
			return true;
		}else {
			return false;
		}
	}
	
	/**
	 * get admin details by admin id
	 */
	@Override
	public Admin getById(int id) {
		return adminRepository.getById(id);
	}

	/**
	 * get admin details by admin email
	 */
	@Override
	public Admin getByEmail(String email) {
		//get admin details by admin email
		List<Admin> adminList =  adminRepository.getByEmail(email);
		
		if(adminList.size() > 0) {
			return adminList.get(0);
		}else {
			return null;
		}
	}

	/**
	 * update password by admin id
	 */
	@Override
	public void updatePassword(String password, int id) {
		admin = new Admin();
		
		//get admin details by admin id
		admin = adminRepository.getById(id);
		
		//set admin password
		admin.setPassword(password);
		
		adminRepository.update(admin);
	}

}
