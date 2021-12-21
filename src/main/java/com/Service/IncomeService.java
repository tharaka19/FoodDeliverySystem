package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Income;
import com.Repository.Dao.IncomeDao;
import com.Service.Bd.IncomeBd;

@Service("incomeBd")
public class IncomeService implements IncomeBd{
	
	@Autowired
	private IncomeDao incomeRepository;

	public IncomeDao getIncomeRepository() {
		return incomeRepository;
	}

	public void setIncomeRepository(IncomeDao incomeRepository) {
		this.incomeRepository = incomeRepository;
	}

	/**
	 * save new today income
	 */
	@Override
	public void save(Income income) {
		incomeRepository.save(income);
	}

	/**
	 * get all income details
	 */
	@Override
	public List<Income> getAll() {
		return incomeRepository.getAll();
	}

	/**
	 * get income details by income id
	 */
	@Override
	public Income getById(int id) {
		return incomeRepository.getById(id);
	}

	/**
	 * update income details
	 */
	@Override
	public void update(Income income) {
		//set date for income
		income.setDate(incomeRepository.getById(income.getId()).getDate());
		
		//set income date for income
		income.setIncomeDate(incomeRepository.getById(income.getId()).getIncomeDate());
		
		incomeRepository.update(income);
	}

	/**
	 * delete income details by income id
	 */
	@Override
	public void delete(int id) {
		incomeRepository.delete(incomeRepository.getById(id));
	}
}
