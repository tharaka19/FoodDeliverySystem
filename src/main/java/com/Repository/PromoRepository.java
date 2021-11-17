package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Promo;
import com.Repository.Dao.PromoDao;

@Repository("promoDao")
public class PromoRepository implements PromoDao{

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	/**
	 * save new promo
	 */
	@Transactional
	@Override
	public void save(Promo promo) {
		hibernateTemplate.save(promo);
	}

	/**
	 * get all promo details
	 * @return promo list
	 */
	@Override
	public List<Promo> getAll() {
		return hibernateTemplate.loadAll(Promo.class);
	}

	/**
	 * get promo details by promo id
	 * @param id
	 * @return promo
	 */
	@Override
	public Promo getById(int id) {
		return hibernateTemplate.get(Promo.class, id);
	}
	
	/**
	 * get active promo details by promo status
	 * @param status
	 * @return promo list
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Promo> getAllByStatus(String status) {
		return (List<Promo>) hibernateTemplate.findByNamedParam("FROM Promo WHERE status=:status", "status", status);
	}
	
	/**
	 * get promo quantity by promo id
	 * @param id
	 * @return promo quantity
	 */
	@Override
	public int getQuantityById(int id) {
		return hibernateTemplate.get(Promo.class, id).getQuantity();
	}

	/**
	 * update promo details
	 */
	@Transactional
	@Override
	public void update(Promo promo) {
		hibernateTemplate.update(promo);
	}

	/**
	 * delete promo details by promo id
	 */
	@Transactional
	@Override
	public void delete(Promo promo) {
		hibernateTemplate.delete(promo);
	}

	



}
