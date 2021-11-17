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
		shippingDetailsRepository.save(shippingDetails);
	}
	
	/**
	 * get all shipping details
	 * @param id
	 * @return shipping details list
	 */
	@Override
	public List<ShippingDetails> getAllById(int id) {
		return shippingDetailsRepository.getAllById(id);
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
