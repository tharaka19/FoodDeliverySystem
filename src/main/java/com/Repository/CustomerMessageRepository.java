package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Customer;
import com.Entity.CustomerMessage;
import com.Repository.Dao.CustomerMessageDao;

@Repository("customerMassageDao")
public class CustomerMessageRepository implements CustomerMessageDao{

	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save new customer message
	 */
	@Transactional
	@Override
	public void save(CustomerMessage customerMagssage) {
		//set customer for customer message
		customerMagssage.setCustomer(hibernateTemplate.get(Customer.class, customerMagssage.getCustomerId()));
		hibernateTemplate.save(customerMagssage);
	}

	/**
	 * get all customer message details
	 */
	@Override
	public List<CustomerMessage> getAll() {
		return hibernateTemplate.loadAll(CustomerMessage.class);
	}

	/**
	 * get customer message details by customer message id
	 */
	@Override
	public CustomerMessage getById(int id) {
		return hibernateTemplate.get(CustomerMessage.class, id);
	}

	/**
	 * delete customer message details by customer message id
	 */
	@Transactional
	@Override
	public void delete(CustomerMessage customerMessage) {
		hibernateTemplate.delete(customerMessage);
	}
	
}
