package com.Service.Bd;

import java.util.List;

import com.Entity.ShippingDetails;

public interface ShippingDetailsBd {

	public void save(ShippingDetails shippingDetails);
	public void saveShippingDetails(ShippingDetails shippingDetails);
	public List<ShippingDetails> getAllById(int id);
	public void updateStatusById(int customerId, String status, int id);

}
