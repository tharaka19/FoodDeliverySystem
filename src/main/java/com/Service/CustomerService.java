package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Customer;
import com.Repository.Dao.CustomerDao;
import com.Service.Bd.CustomerBd;

@Service("customerBd")
public class CustomerService implements CustomerBd {
	
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
		return customerRepository.checkEmail(email);
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
		return customerRepository.login(customer);
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
		for(Customer customer : CustomerList) {
			System.out.println(customer.getFirstName());
			return customer;
		}
		return null;
	}


}
