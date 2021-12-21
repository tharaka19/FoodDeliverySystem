package com.Repository.Dao;

import java.util.List;

import com.Entity.Category;
import com.Entity.DeliveryLocation;

public interface DeliveryLocationDao {

	public void save(DeliveryLocation deliveryLocation);
	public List<DeliveryLocation> getAll();
	public DeliveryLocation getById(int id);
	public List<DeliveryLocation> getAllByStatus(String status);
	public List<DeliveryLocation> getDeliveryLocationFeeByCity(String city);
	public void update(DeliveryLocation deliveryLocation);
	public void delete(DeliveryLocation deliveryLocation);
}
