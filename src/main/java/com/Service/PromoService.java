package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Promo;
import com.Repository.Dao.PromoDao;
import com.Service.Bd.PromoBd;

@Service("promoBd")
public class PromoService implements PromoBd{

	private Promo promo;
	
	@Autowired
	private PromoDao promoRepository;
	
	public PromoDao getPromoRepository() {
		return promoRepository;
	}

	public void setPromoRepository(PromoDao promoRepository) {
		this.promoRepository = promoRepository;
	}

	/**
	 * save new promo
	 */
	@Override
	public void save(Promo promo) {
		promoRepository.save(promo);
	}

	/**
	 * get all promo details
	 */
	@Override
	public List<Promo> getAll() {
		return promoRepository.getAll();
	}

	/**
	 * get promo details by promo id
	 */
	@Override
	public Promo getById(int id) {
		return promoRepository.getById(id);
	}
	
	/**
	 * get active promo details by promo status
	 */
	@Override
	public List<Promo> getAllByStatus(String status) {
		return promoRepository.getAllByStatus(status);
	}
	
	/**
	 * get promo quantity by promo id
	 */
	@Override
	public int getQuantityById(int id) {
		return promoRepository.getQuantityById(id);
	}

	/**
	 * update promo details
	 */
	@Override
	public void update(Promo promo) {
		//set promo status
		promo.setStatus(promoRepository.getById(promo.getId()).getStatus());
		promoRepository.update(promo);
	}
	
	/**
	 * update promo status by promo id
	 */
	@Override
	public void updateStatusById(String status, int id) {
		promo = new Promo();
		
		//get promo details by promo id
		promo = promoRepository.getById(id);
		
		//set promo status
		promo.setStatus(status);
		
		promoRepository.update(promo);
	}
	
	/**
	 * update promo quantity by promo id
	 */
	@Override
	public void updateQuantityById(int quantity, int id) {
		promo = new Promo();
		
		//get promo details by promo id
		promo = promoRepository.getById(id);
		
		//set promo quantity
		promo.setQuantity(quantity);
		
		promoRepository.update(promo);		
	}

	/**
	 * delete promo details by promo id
	 */
	@Override
	public void delete(int id) {
		promoRepository.delete(promoRepository.getById(id));
	}
	
}
