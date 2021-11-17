package com.Repository.Dao;

import java.util.List;

import com.Entity.Promo;

public interface PromoDao {

	public void save(Promo promo);
	public List<Promo> getAll();
	public Promo getById(int id);
	public List<Promo> getAllByStatus(String status);
	public int getQuantityById(int id);
	public void update(Promo promo);
	public void delete(Promo promo);

}
