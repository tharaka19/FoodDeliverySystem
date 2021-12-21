package com.Repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Category;
import com.Entity.Customer;
import com.Entity.CustomerOrder;
import com.Entity.FoodItem;
import com.Entity.Payment;
import com.Entity.ShippingDetails;
import com.Repository.Dao.PaymentDao;

@Repository("PaymentDao")
public class PaymentRepository implements PaymentDao{

	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save new payment
	 */
	@Transactional
	@Override
	public void save(Payment payment) {
		//set customer order for payment
		payment.setCustomerOrder(hibernateTemplate.get(CustomerOrder.class, payment.getOrderId()));
		hibernateTemplate.save(payment);
	}

	/**
	 * get all payment details
	 */
	@Override
	public List<Payment> getAll() {
		return hibernateTemplate.loadAll(Payment.class);
	}

	/**
	 * get payment details by payment id
	 */
	@Override
	public Payment getById(int id) {
		return hibernateTemplate.get(Payment.class, id);
	}
	
	/**
	 * get payment details by date and payment status
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Payment> getTodaySales(String status, Date date) {
		return (List<Payment>) hibernateTemplate.findByNamedParam("FROM Payment WHERE status=:status AND date=:date",
				new String[] {"status","date"},
				new Object[] {status, date});
	}
	
	/**
	 * get payment by payment status and order id
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Payment> getPaymentBytStatusAndId(int orderId) {
		return (List<Payment>) hibernateTemplate.findByNamedParam("FROM Payment WHERE customerOrder=:customerOrder", "customerOrder",
				hibernateTemplate.get(CustomerOrder.class, orderId));
	}

	@Transactional
	@Override
	public void updateAll(Payment payment) {
		payment.setCustomerOrder(hibernateTemplate.get(CustomerOrder.class, payment.getCustomerOrder().getId()));
		hibernateTemplate.update(payment);
	}
	
}
