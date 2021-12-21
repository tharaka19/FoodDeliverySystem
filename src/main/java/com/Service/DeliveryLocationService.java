package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Category;
import com.Entity.DeliveryLocation;
import com.Repository.Dao.DeliveryLocationDao;
import com.Service.Bd.DeliveryLocationBd;

@Service("deliveryLocationBd")
public class DeliveryLocationService implements DeliveryLocationBd{

	private List<DeliveryLocation> deliveryLocationList;
	private DeliveryLocation deliveryLocation;
	
	@Autowired
	private DeliveryLocationDao deliveryLocationRepository;

	public DeliveryLocationDao getDeliveryLocationRepository() {
		return deliveryLocationRepository;
	}

	public void setDeliveryLocationRepository(DeliveryLocationDao deliveryLocationRepository) {
		this.deliveryLocationRepository = deliveryLocationRepository;
	}

	/**
	 * save new delivery location
	 */
	@Override
	public void save(DeliveryLocation deliveryLocation) {
		deliveryLocationRepository.save(deliveryLocation);
	}

	/**
	 * get all delivery location details
	 */
	@Override
	public List<DeliveryLocation> getAll() {
		return deliveryLocationRepository.getAll();
	}

	/**
	 *  get delivery location details by delivery location id
	 */
	@Override
	public DeliveryLocation getById(int id) {
		return deliveryLocationRepository.getById(id);
	}

	/**
	 * get active delivery location details by delivery location status
	 */
	@Override
	public List<DeliveryLocation> getAllByStatus(String status) {
		return deliveryLocationRepository.getAllByStatus(status);
	}
	
	/**
	 * get delivery location fee by delivery location city
	 */
	@Override
	public float getDeliveryLocationFeeByCity(String city) {
		//get delivery location fee by delivery location city
		deliveryLocationList = deliveryLocationRepository.getDeliveryLocationFeeByCity(city);
		
		if(deliveryLocationList.size() > 0) {
			return deliveryLocationList.get(0).getDeliveryFee();
		}else {
			return (float) 0.0;
		}
		
	}
	
	/**
	 * update delivery location details
	 */
	@Override
	public void update(DeliveryLocation deliveryLocation) {
		//set delivery location status
		deliveryLocation.setStatus(deliveryLocationRepository.getById(deliveryLocation.getId()).getStatus());
		
		deliveryLocationRepository.update(deliveryLocation);
	}

	/**
	 * update delivery location status by delivery location id
	 */
	@Override
	public void updateStatusById(String status, int id) {
		deliveryLocation = new DeliveryLocation();
		
		//get delivery location details by delivery location id
		deliveryLocation = deliveryLocationRepository.getById(id);
		
		////set delivery location status
		deliveryLocation.setStatus(status);
		
		deliveryLocationRepository.update(deliveryLocation);
		
	}

	/**
	 * delete delivery location details by delivery location id
	 */
	@Override
	public void delete(int id) {
		deliveryLocationRepository.delete(deliveryLocationRepository.getById(id));
	}
	
}
