package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Admin;
import com.Repository.Dao.AdminDao;

@Repository("adminDao")
public class AdminRepository implements AdminDao {

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	/**
	 * check existing email
	 */
	@SuppressWarnings("deprecation")
	@Override
	public boolean checkEmail(String email) {
		for (int i = 0; i < hibernateTemplate.findByNamedParam("FROM Admin WHERE email=:email", "email", email).size(); i++) {
			return true;
		}
		return false;
	}
	
	/**
	 * save new admin
	 */
	@Transactional
	@Override
	public void save(Admin admin) {
		hibernateTemplate.save(admin);
	}

	/**
	 * check login validation
	 */
	@SuppressWarnings("deprecation")
	@Override
	public boolean login(Admin admin) {
		for (int i = 0; i < hibernateTemplate.findByNamedParam("FROM Admin WHERE email=:email AND password=:password",
				new String[] {"email","password"},
				new Object[] {admin.getEmail(), admin.getPassword()}).size(); i++) {
			return true;
		}
		return false;
	}

	/**
	 * get admin details by admin email
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Admin> getByEmail(String email) {
		return  (List<Admin>) hibernateTemplate.findByNamedParam("FROM User WHERE email=:email", "email", email);
	}

}
