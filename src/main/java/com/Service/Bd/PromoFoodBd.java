package com.Service.Bd;

import java.util.List;

import com.Entity.PromoFood;

public interface PromoFoodBd {

	public void save(PromoFood promoFood);
	public List<PromoFood> getAll();
	public PromoFood getById(int id);
	public List<PromoFood> getOnePromoDetailsById(String status, int id);
	public void update(PromoFood PromoFood);
	public void updateStatusById(String status,int id);
	public void updateStatusByPromoId(String status,int id);
	public boolean checkFoodItemForPromo(int promoId, int foodItemId);
	public void delete(int id);


}
