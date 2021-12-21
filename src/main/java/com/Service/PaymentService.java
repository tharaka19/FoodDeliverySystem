package com.Service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Admin;
import com.Entity.Payment;
import com.Repository.Dao.PaymentDao;
import com.Service.Bd.PaymentBd;

@Service("paymentBd")
public class PaymentService implements PaymentBd{

	private List<Payment> paymentList;
	private Payment payment;
	
	@Autowired
	private PaymentDao paymentRepository;

	public PaymentDao getPaymentRepository() {
		return paymentRepository;
	}

	public void setPaymentRepository(PaymentDao paymentRepository) {
		this.paymentRepository = paymentRepository;
	}

	/**
	 * save new payment
	 */
	@Override
	public void save(Payment payment) {
		paymentRepository.save(payment);
	}

	/**
	 * get all payment details
	 */
	@Override
	public List<Payment> getAll() {
		return paymentRepository.getAll();
	}
	
	/**
	 * get today sales
	 */
	@Override
	public float getTodaySales(String status) {
		float sales = 0;
		
		//get date
		long millis = System.currentTimeMillis();  
		java.sql.Date date = new java.sql.Date(millis);  
		
		//get payment details by date and status
		paymentList = paymentRepository.getTodaySales(status, date);
		
		for(Payment pay : paymentList) {
			sales = sales + pay.getAmount();
		}
		
		return sales;
	}

	/**
	 * get payment by payment status and order id
	 */
	@Override
	public Payment getPaymentBytStatusAndId(int orderId) {
		paymentList =  paymentRepository.getPaymentBytStatusAndId(orderId);
		
		if(paymentList.size() > 0) {
			return paymentList.get(0);
		}else {
			return null;
		}
	}
	
	/**
	 * update payment status by payment id
	 */
	@Override
	public void updateStatusById(String status, int id) {
		payment = new Payment();
		
		//get payment details by payment id
		payment = paymentRepository.getById(id);
		
		//set payment status
		payment.setStatus(status);
		
		paymentRepository.updateAll(payment);
	}
	
}
