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
	public boolean checkEmail(String email) {
		for (int i = 0; i < hibernateTemplate.findByNamedParam("FROM Customer WHERE email=:email", "email", email).size(); i++) {
			return true;
		}
		return false;
	}
	
	/**
	 * save new customer
	 */
	@Transactional
	@Override
	public int save(Customer customer) {
		return (int) hibernateTemplate.save(customer);
	}
	
	@Transactional
	@Override
	public void saveAdddress(Customer customer) {
		hibernateTemplate.saveOrUpdate(customer);
	}	

	/**
	 * check login validation
	 */
	@SuppressWarnings("deprecation")
	@Override
	public boolean login(Customer customer) {
		for (int i = 0; i < hibernateTemplate.findByNamedParam("FROM Customer WHERE email=:email AND password=:password",
				new String[] {"email","password"},
				new Object[] {customer.getEmail(), customer.getPassword()}).size(); i++) {
			return true;
		}
		return false;
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

	

	
}
