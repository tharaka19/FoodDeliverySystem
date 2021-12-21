package com.Repository.Dao;

import java.util.Date;
import java.util.List;

import com.Entity.CustomerOrder;
import com.Entity.Payment;

public interface PaymentDao {

	public void save(Payment payment);
	public List<Payment> getAll();
	public Payment getById(int id);
	public List<Payment> getTodaySales(String status, Date date);
	public List<Payment> getPaymentBytStatusAndId(int orderId);
	public void updateAll(Payment payment);
}
