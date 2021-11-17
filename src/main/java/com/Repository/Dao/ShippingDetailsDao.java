package com.Repository.Dao;

import java.util.List;

import com.Entity.ShippingDetails;

public interface ShippingDetailsDao {

	public void save(ShippingDetails shippingDetails);
	public ShippingDetails getById(int id);
	public List<ShippingDetails> getAllById(int id);
	public void update(ShippingDetails ShippingDetails);
}
