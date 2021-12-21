package com.Service.Bd;

import java.util.Date;
import java.util.List;

import com.Entity.Category;
import com.Entity.DeliveryLocation;
import com.Entity.Payment;

public interface PaymentBd {

	public void save(Payment payment);
	public List<Payment> getAll();
	public float getTodaySales(String status);
	public Payment getPaymentBytStatusAndId(int orderId);
	public void updateStatusById(String status, int id);

}
