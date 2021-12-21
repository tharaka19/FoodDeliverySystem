package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Customer;
import com.Repository.Dao.CustomerDao;
import com.Service.Bd.CustomerBd;

@Service("customerBd")
public class CustomerService implements CustomerBd {
	
	private Customer customer;
	
	@Autowired
	private CustomerDao customerRepository;

	public CustomerDao getCustomerRepository() {
		return customerRepository;
	}

	public void setCustomerRepository(CustomerDao customerRepository) {
		this.customerRepository = customerRepository;
	}

	/**
	 * check existing email
	 */
	@Override
	public boolean checkEmail(String email) {
		if(customerRepository.checkEmail(email) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	/**
	 * check existing password
	 */
	@Override
	public boolean checkPassword(String currentPassword, int id) {
		if(customerRepository.checkPassword(currentPassword, id) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	/**
	 * save new customer
	 */
	@Override
	public int save(Customer customer) {
		return customerRepository.save(customer);
	}

	/**
	 * check login validation
	 */
	@Override
	public boolean login(Customer customer) {
		if(customerRepository.login(customer) > 0 ) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * get all customer details
	 */
	@Override
	public List<Customer> getAllCustomer() {
		return customerRepository.getAllCustomer();
	}
	
	/**
	 * get customer details by customer id
	 */
	@Override
	public Customer getById(int id) {
		return customerRepository.getById(id);
	}
	
	/**
	 * get customer details by customer email
	 */
	@Override
	public Customer getByEmail(String email) {
		List<Customer> CustomerList = customerRepository.getByEmail(email);
		
		if(CustomerList.size() > 0) {
			return CustomerList.get(0);
		}else {
			return null;
		}
	}
	
	/**
	 * update password by customer id
	 */
	@Override
	public void updatePassword(String password, int id) {
		customer = new Customer();
		
		//get customer details by customer id
		customer = customerRepository.getById(id);
		
		//set customer password
		customer.setPassword(password);
		
		customerRepository.update(customer);
	}

	/**
	 * delete customer item details by customer id
	 */
	@Override
	public void delete(int id) {
		customerRepository.delete(customerRepository.getById(id));
	}
}
