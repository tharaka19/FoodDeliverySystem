package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Category;
import com.Entity.DeliveryLocation;
import com.Repository.Dao.DeliveryLocationDao;

@Repository("deliveryLocationDao")
public class DeliveryLocationRepository implements DeliveryLocationDao{
	
	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save new delivery location
	 */
	@Transactional
	@Override
	public void save(DeliveryLocation deliveryLocation) {
		hibernateTemplate.save(deliveryLocation);
	}

	/**
	 * get all delivery location details
	 */
	@Override
	public List<DeliveryLocation> getAll() {
		return hibernateTemplate.loadAll(DeliveryLocation.class);
	}

	/**
	 *  get delivery location details by delivery location id
	 */
	@Override
	public DeliveryLocation getById(int id) {
		return hibernateTemplate.get(DeliveryLocation.class, id);
	}
	
	/**
	 * get active delivery location details by delivery location status
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<DeliveryLocation> getAllByStatus(String status) {
		return (List<DeliveryLocation>) hibernateTemplate.findByNamedParam("FROM DeliveryLocation WHERE status=:status", "status", status);
	}
	
	/**
	 * get delivery location fee by delivery location city
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<DeliveryLocation> getDeliveryLocationFeeByCity(String city) {
		return (List<DeliveryLocation>) hibernateTemplate.findByNamedParam("FROM DeliveryLocation WHERE city=:city", "city", city);
	}

	/**
	 * update delivery location details
	 */
	@Transactional
	@Override
	public void update(DeliveryLocation deliveryLocation) {
		hibernateTemplate.update(deliveryLocation);
	}

	/**
	 * delete delivery location details by delivery location id
	 */
	@Transactional
	@Override
	public void delete(DeliveryLocation deliveryLocation) {
		hibernateTemplate.delete(deliveryLocation);
	}

}
