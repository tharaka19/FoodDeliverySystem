package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Category;
import com.Entity.Customer;
import com.Entity.FoodItem;
import com.Entity.ShippingDetails;
import com.Repository.Dao.ShippingDetailsDao;

@Repository("customerAddressDao")
public class ShippingDetailsRepository implements ShippingDetailsDao{

	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save new shipping details
	 */
	@Transactional
	@Override
	public void save(ShippingDetails shippingDetails) {
		//set customer for shipping details
		shippingDetails.setCustomer(hibernateTemplate.get(Customer.class, shippingDetails.getCustomerId()));
		hibernateTemplate.save(shippingDetails);
	}
	
	/**
	 * get shipping details by shipping id
	 */
	@Override
	public ShippingDetails getById(int id) {
		return hibernateTemplate.get(ShippingDetails.class, id);
	}

	/**
	 * get all shipping details by customer id
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<ShippingDetails> getAllById(int id) {
		return (List<ShippingDetails>) hibernateTemplate.findByNamedParam("FROM ShippingDetails WHERE customer=:customer", "customer",
				hibernateTemplate.get(Customer.class, id));
	}
	
	/**
	 * get all shipping details by shipping status and customer id
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<ShippingDetails> getOneByStatusAndCustomerId(String status, int id) {
		return  (List<ShippingDetails>) hibernateTemplate.findByNamedParam("FROM ShippingDetails WHERE status=:status AND customer=:customer",
				new String[] {"status","customer"},
				new Object[] {status,hibernateTemplate.get(Customer.class, id)});
	}
	
	/**
	 * update shipping details
	 */
	@Transactional
	@Override
	public void update(ShippingDetails ShippingDetails) {
		hibernateTemplate.update(ShippingDetails);
	}

}
