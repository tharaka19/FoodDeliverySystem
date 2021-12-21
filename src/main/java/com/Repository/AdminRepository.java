package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Admin;
import com.Entity.Customer;
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
	public int checkEmail(String email) {
		return hibernateTemplate.findByNamedParam("FROM Admin WHERE email=:email", "email", email).size();
	}
	
	/**
	 * check existing password
	 */
	@SuppressWarnings("deprecation")
	@Override
	public int checkPassword(String currentPassword, int id) {
		return hibernateTemplate.findByNamedParam("FROM Admin WHERE password=:password AND id=:id",
				new String[] {"password","id"},
				new Object[] {currentPassword, id}).size();
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
	public int login(Admin admin) {
		return hibernateTemplate.findByNamedParam("FROM Admin WHERE email=:email AND password=:password",
				new String[] {"email","password"},
				new Object[] {admin.getEmail(), admin.getPassword()}).size();
	}

	/**
	 * get admin details by admin id
	 */
	@Override
	public Admin getById(int id) {
		return hibernateTemplate.get(Admin.class, id);
	}
	
	/**
	 * get admin details by admin email
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Admin> getByEmail(String email) {
		return  (List<Admin>) hibernateTemplate.findByNamedParam("FROM Admin WHERE email=:email", "email", email);
	}

	/**
	 * update admin details
	 */
	@Transactional
	@Override
	public void update(Admin admin) {
		hibernateTemplate.update(admin);
	}

	

}
