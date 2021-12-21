package com.Repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Customer;
import com.Entity.CustomerOrder;
import com.Entity.FoodItem;
import com.Entity.PromoOrder;
import com.Entity.ShippingDetails;
import com.Repository.Dao.CustomerOrderDao;

@Repository("customerOrderDao")
public class CustomerOrderRepository implements CustomerOrderDao{

	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save new customer order
	 */
	@Transactional
	@Override
	public int save(CustomerOrder customerOrder) {
		//set shipping details for customer order
		customerOrder.setShippingDetails(hibernateTemplate.get(ShippingDetails.class, customerOrder.getShippingDetailsId()));
		
		//set customer for customer order
		customerOrder.setCustomer(hibernateTemplate.get(Customer.class, customerOrder.getCustomerId()));
		
		return (int) hibernateTemplate.save(customerOrder);
	}
	
	/**
	 * get all customer order details
	 */
	@Override
	public List<CustomerOrder> getAll() {
		return hibernateTemplate.loadAll(CustomerOrder.class);
	}
	
	/**
	 * get customer order details by customer order id
	 */
	@Override
	public CustomerOrder getById(int id) {
		return hibernateTemplate.get(CustomerOrder.class, id);
	}
	
	/**
	 * get all customer order details by customer id
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<CustomerOrder> getAllByCustomerId(int id) {
		return (List<CustomerOrder>) hibernateTemplate.findByNamedParam("FROM CustomerOrder WHERE customer=:customer", "customer",
				hibernateTemplate.get(Customer.class, id));
	}
	
	/**
	 * get customer order details by status
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<CustomerOrder> getAllByStatus(String status) {
		return (List<CustomerOrder>) hibernateTemplate.findByNamedParam("FROM CustomerOrder WHERE status=:status", "status", status);
	}
	
	/**
	 * get all today order details by date
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<CustomerOrder> getTodayOrderByDate(Date date) {
		return (List<CustomerOrder>) hibernateTemplate.findByNamedParam("FROM CustomerOrder WHERE date=:date", "date", date);
	}
	
	@Transactional
	@Override
	public void update(CustomerOrder customerOrder) {
		//set shipping details for customer order
		customerOrder.setShippingDetails(hibernateTemplate.get(ShippingDetails.class, customerOrder.getShippingDetails().getId()));
		
		//set customer for customer order
		customerOrder.setCustomer(hibernateTemplate.get(Customer.class, customerOrder.getCustomer().getId()));
		
		hibernateTemplate.update(customerOrder);
	}

	

	

	
}
