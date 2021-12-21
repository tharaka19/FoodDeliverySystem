package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.CustomerMessage;
import com.Repository.Dao.CustomerMessageDao;
import com.Service.Bd.CustomerMessageBd;

@Service("customerMassageBd")
public class CustomerMessageService implements CustomerMessageBd{

	@Autowired
	private CustomerMessageDao customerMassageRepository;

	public CustomerMessageDao getCustomerMassageRepository() {
		return customerMassageRepository;
	}

	public void setCustomerMassageRepository(CustomerMessageDao customerMassageRepository) {
		this.customerMassageRepository = customerMassageRepository;
	}

	/**
	 * save new customer message
	 */
	@Override
	public void save(CustomerMessage customerMagssage) {
		customerMassageRepository.save(customerMagssage);
	}

	/**
	 * get all customer message details
	 */
	@Override
	public List<CustomerMessage> getAll() {
		return customerMassageRepository.getAll();
	}

	/**
	 * get customer message details by customer message id
	 */
	@Override
	public CustomerMessage getById(int id) {
		return customerMassageRepository.getById(id);
	}

	/**
	 * delete customer message details by customer message id
	 */
	@Override
	public void delete(int id) {
		customerMassageRepository.delete(customerMassageRepository.getById(id));
	}
}
