package com.Service.Bd;

import java.util.List;

import com.Entity.Promo;

public interface PromoBd {

	public void save(Promo promo);
	public List<Promo> getAll();
	public Promo getById(int id);
	public List<Promo> getAllByStatus(String status);
	public int getQuantityById(int id);
	public void update(Promo promo);
	public void updateStatusById(String status,int id);
	public void delete(int id);
}
