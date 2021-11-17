package com.Repository.Dao;

import java.util.List;

import com.Entity.PromoFood;

public interface PromoFoodDao {

	public void save(PromoFood promoFood);
	public List<PromoFood> getAll();
	public PromoFood getById(int id);
	public List<PromoFood> getOnePromoDetailsById(String status, int id);
	public List<PromoFood> getAllStatusByPromoId(String status,int id);
	public void update(PromoFood PromoFood);
	public void updateStatus(PromoFood promoFood);
	public List<PromoFood> checkFoodItemForPromo(int promoId, int foodItemId);
	public void delete(PromoFood promoFood);


}
