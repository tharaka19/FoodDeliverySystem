package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Customer;
import com.Repository.Dao.CustomerDao;

@Repository("customerDao")
public class CustomerRepository implements CustomerDao {

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	/**
	 * check existing email
	 */
	@SuppressWarnings("deprecation")
	@Override
	public int checkEmail(String email) {
		return hibernateTemplate.findByNamedParam("FROM Customer WHERE email=:email", "email", email).size();
	}
	
	/**
	 * check existing password
	 */
	@SuppressWarnings("deprecation")
	@Override
	public int checkPassword(String currentPassword, int id) {
		return hibernateTemplate.findByNamedParam("FROM Customer WHERE password=:password AND id=:id",
				new String[] {"password","id"},
				new Object[] {currentPassword, id}).size();
	}
	
	/**
	 * save new customer
	 */
	@Transactional
	@Override
	public int save(Customer customer) {
		return (int) hibernateTemplate.save(customer);
	}	

	/**
	 * check login validation
	 */
	@SuppressWarnings("deprecation")
	@Override
	public int login(Customer customer) {
		return hibernateTemplate.findByNamedParam("FROM Customer WHERE email=:email AND password=:password",
				new String[] {"email","password"},
				new Object[] {customer.getEmail(), customer.getPassword()}).size();
	}
	
	/**
	 * get all customer details
	 */
	@Override
	public List<Customer> getAllCustomer() {
		return hibernateTemplate.loadAll(Customer.class);
	}
	
	/**
	 * get customer details by customer id
	 */
	@Override
	public Customer getById(int id) {
		return hibernateTemplate.get(Customer.class, id);
	}

	/**
	 * get customer details by customer email
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Customer> getByEmail(String email) {
		return (List<Customer>) hibernateTemplate.findByNamedParam("FROM User WHERE email=:email", "email", email);
	}
	
	/**
	 * update Customer details
	 */
	@Transactional
	@Override
	public void update(Customer customer) {
		hibernateTemplate.update(customer);
	}

	/**
	 * delete customer item details by customer id
	 */
	@Transactional
	@Override
	public void delete(Customer customer) {
		hibernateTemplate.delete(customer);
	}
	
}
