package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.PromoFood;
import com.Repository.Dao.PromoFoodDao;
import com.Service.Bd.PromoFoodBd;

@Service("promoFoodBd")
public class PromoFoodService implements PromoFoodBd{

	private PromoFood promoFood;
	
	@Autowired
	private PromoFoodDao promoFoodRepository;

	public PromoFoodDao getPromoFoodRepository() {
		return promoFoodRepository;
	}

	public void setPromoFoodRepository(PromoFoodDao promoFoodRepository) {
		this.promoFoodRepository = promoFoodRepository;
	}

	/**
	 * save food item for promo
	 */
	@Override
	public void save(PromoFood promoFood) {
		promoFoodRepository.save(promoFood);
	}

	/**
	 * get all promo food
	 */
	@Override
	public List<PromoFood> getAll() {
		return promoFoodRepository.getAll();
	}
	
	/**
	 * get promo food details by promo food id
	 */
	@Override
	public PromoFood getById(int id) {
		return promoFoodRepository.getById(id);
	}
	
	/**
	 * get promo food details by promo food id and status
	 */
	@Override
	public List<PromoFood> getOnePromoDetailsById(String status, int id) {
		return promoFoodRepository.getOnePromoDetailsById(status, id);
	}
	
	/**
	 * update promo food details
	 */
	@Override
	public void update(PromoFood promoFood) {
		//set promo food status
		promoFood.setStatus(promoFoodRepository.getById(promoFood.getId()).getStatus());
		promoFoodRepository.update(promoFood);
	}

	/**
	 * update promo food status by promo food id
	 */
	@Override
	public void updateStatusById(String status, int id) {
		promoFood = new PromoFood();
		promoFood = promoFoodRepository.getById(id);

		//check active status
		if(promoFood.getPromo().getStatus().equals("Active")) {
			promoFood.setStatus(status);
			promoFoodRepository.updateStatus(promoFood);
		}else {
			System.out.println("cannot active");
		}		
	}

	/**
	 * update promo food status by promo id
	 */
	@Override
	public void updateStatusByPromoId(String status, int id) {
		List<PromoFood> promoFoodList;
		
		//check active status
		if(status.equals("Active")) {
			promoFoodList = promoFoodRepository.getAllStatusByPromoId("Deactive",id);
		}else {
			promoFoodList = promoFoodRepository.getAllStatusByPromoId("Active",id);
		}
		
		for(PromoFood promoFood : promoFoodList) {
			promoFood.setStatus(status);
			promoFoodRepository.updateStatus(promoFood);
		}	
	}
	
	/**
	 * check available food item for promo food by food item id and promo id
	 */
	@Override
	public boolean checkFoodItemForPromo(int promoId, int foodItemId) {
		List<PromoFood> promoFoodList = promoFoodRepository.checkFoodItemForPromo(promoId, foodItemId);
		if(promoFoodList.size() != 0) {
			return true;
		}else {
			return false;
		}		
	}

	/**
	 * delete promo food details by promo food id
	 */
	@Override
	public void delete(int id) {
		promoFoodRepository.delete(promoFoodRepository.getById(id));		
	}

}
