package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.ShippingDetails;
import com.Repository.Dao.ShippingDetailsDao;
import com.Service.Bd.ShippingDetailsBd;

@Service("customerAddressBd")
public class ShippingDetailsService implements ShippingDetailsBd{

	private List<ShippingDetails> shipiingDetailsList;
	private ShippingDetails shippingDetails;
	
	@Autowired
	private ShippingDetailsDao shippingDetailsRepository;

	public ShippingDetailsDao getShippingDetailsRepository() {
		return shippingDetailsRepository;
	}
	public void setShippingDetailsRepository(ShippingDetailsDao shippingDetailsRepository) {
		this.shippingDetailsRepository = shippingDetailsRepository;
	}

	/**
	 * save shipping details using customer signUp
	 */
	@Override
	public void save(ShippingDetails shippingDetails) {
		shippingDetailsRepository.save(shippingDetails);		
	}
	
	/**
	 * save new shipping details
	 */
	@Override
	public void saveShippingDetails(ShippingDetails shippingDetails) {
		//get shipping details list by customer id
		shipiingDetailsList = shippingDetailsRepository.getAllById(shippingDetails.getCustomerId());
		
		//check on status
		if(shippingDetails.getStatus().equals("On")) {
			
			for(ShippingDetails shipping : shipiingDetailsList) {
				shipping.setStatus("Off");
				shippingDetailsRepository.update(shipping);
			}
			
		}else {}
		//save new shipping details
		shippingDetailsRepository.save(shippingDetails);
	}
	
	/**
	 * get shipping details by shipping id
	 */
	@Override
	public ShippingDetails getById(int id) {
		return shippingDetailsRepository.getById(id);
	}
	
	/**
	 * get all shipping details by customer id
	 */
	@Override
	public List<ShippingDetails> getAllById(int id) {
		return shippingDetailsRepository.getAllById(id);
	}
	
	/**
	 * get on shipping details by shopping status and customer id 
	 */
	@Override
	public ShippingDetails getOneByStatusAndCustomerId(String status, int id) {
		shipiingDetailsList = shippingDetailsRepository.getOneByStatusAndCustomerId(status, id);
		
		if(shipiingDetailsList.size() > 0) {
			return shipiingDetailsList.get(0);
		}else {
			return null;
		}
				
	}
	
	/**
	 * update shopping details status by shipping details id
	 */
	@Override
	public void updateStatusById(int customerId, String status, int id) {
		//get shipping details list by customer id
		shipiingDetailsList = shippingDetailsRepository.getAllById(customerId);
		
		//get shipping details by shipping id
		shippingDetails = shippingDetailsRepository.getById(id);
		
		//check on status
		if(status.equals("On")) {
			
			for(ShippingDetails shipping : shipiingDetailsList) {
				shipping.setStatus("Off");
				shippingDetailsRepository.update(shipping);
			}
			
		}else {}
		
		shippingDetails.setStatus(status);
		shippingDetailsRepository.update(shippingDetails);
	}

}
