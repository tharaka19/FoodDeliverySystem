package com.Service.Bd;

import java.util.List;

import com.Entity.Category;
import com.Entity.DeliveryLocation;

public interface DeliveryLocationBd {

	public void save(DeliveryLocation deliveryLocation);
	public List<DeliveryLocation> getAll();
	public DeliveryLocation getById(int id);
	public List<DeliveryLocation> getAllByStatus(String status);
	public float getDeliveryLocationFeeByCity(String city);
	public void update(DeliveryLocation deliveryLocation);
	public void updateStatusById(String status,int id);
	public void delete(int id);
}
