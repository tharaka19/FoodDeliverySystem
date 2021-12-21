package com.Service.Bd;

import java.util.List;

import com.Entity.FoodItem;
import com.Entity.Income;

public interface IncomeBd {

	public void save(Income income);
	public List<Income> getAll();
	public Income getById(int id);
	public void update(Income income);
	public void delete(int id);

}
