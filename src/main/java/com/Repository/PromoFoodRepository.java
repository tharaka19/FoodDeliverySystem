package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.FoodItem;
import com.Entity.Promo;
import com.Entity.PromoFood;
import com.Repository.Dao.PromoFoodDao;

@Repository("promoFoodDao")
public class PromoFoodRepository implements PromoFoodDao{

	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save food item for promo
	 */
	@Transactional
	@Override
	public void save(PromoFood promoFood) {
		//set promo for promoFood
		promoFood.setPromo(hibernateTemplate.get(Promo.class, promoFood.getPromoId()));
		
		//set food item for promoFood
		promoFood.setFoodItem(hibernateTemplate.get(FoodItem.class, promoFood.getFoodItemId()));
		
		hibernateTemplate.save(promoFood);
	}

	/**
	 * get all promo food 
	 */
	@Override
	public List<PromoFood> getAll() {
		List<PromoFood> foodList = hibernateTemplate.loadAll(PromoFood.class);
		return foodList;
	}

	/**
	 * get promo food details by promo food id
	 */
	@Override
	public PromoFood getById(int id) {
		return hibernateTemplate.get(PromoFood.class, id);
	}
	
	/**
	 * get promo food details by promo food id and status
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<PromoFood> getOnePromoDetailsById(String status, int id) {
		return (List<PromoFood>) hibernateTemplate.findByNamedParam("FROM PromoFood WHERE status=:status AND promo=:promo",
				new String[] {"status","promo"},
				new Object[] {status,hibernateTemplate.get(Promo.class, id)});
	}
	
	/**
	 * get all promo food details by promo food status and promo id
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<PromoFood> getAllStatusByPromoId(String status, int id) {
		return (List<PromoFood>) hibernateTemplate.findByNamedParam("FROM PromoFood WHERE status=:status AND promo=:promo",
				new String[] {"status","promo"},
				new Object[] {status,hibernateTemplate.get(Promo.class, id)});
	}
	
	/**
	 * update promo food details
	 */
	@Transactional
	@Override
	public void update(PromoFood promoFood) {
		//set promo for promoFood
		promoFood.setPromo(hibernateTemplate.get(Promo.class, promoFood.getPromoId()));
		
		//set food item for promoFood
		promoFood.setFoodItem(hibernateTemplate.get(FoodItem.class, promoFood.getFoodItemId()));
		
		hibernateTemplate.update(promoFood);
	}

	/**
	 * update promo food details
	 */
	@Transactional
	@Override
	public void updateStatus(PromoFood promoFood) {
		hibernateTemplate.update(promoFood);
	}
	
	/**
	 * check available food item for promo food by food item id and promo id
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<PromoFood> checkFoodItemForPromo(int promoId, int foodItemId) {
	     return (List<PromoFood>) hibernateTemplate.findByNamedParam("FROM PromoFood WHERE promo=:promo AND foodItem=:foodItem",
				new String[] {"promo","foodItem"},
				new Object[] {hibernateTemplate.get(Promo.class, promoId),hibernateTemplate.get(FoodItem.class, foodItemId)});
		
	}

	/**
	 * delete promo food details by promo food id
	 */
	@Transactional
	@Override
	public void delete(PromoFood promoFood) {
		hibernateTemplate.delete(promoFood);		
	}

}
