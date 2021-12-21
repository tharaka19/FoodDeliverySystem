package com.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.Entity.Income;
import com.Repository.Dao.IncomeDao;

@Repository("incomeDao")
public class IncomeRepository implements IncomeDao{
    
	@Autowired
	HibernateTemplate hibernateTemplate;

	/**
	 * save new today income
	 */
	@Transactional
	@Override
	public void save(Income income) {
		hibernateTemplate.save(income);
	}

	/**
	 * get all income details
	 */
	@Override
	public List<Income> getAll() {
		return hibernateTemplate.loadAll(Income.class);
	}

	/**
	 * get income details by income id
	 */
	@Override
	public Income getById(int id) {
		return hibernateTemplate.get(Income.class, id);
	}

	/**
	 * update income details
	 */
	@Transactional
	@Override
	public void update(Income income) {
		hibernateTemplate.update(income);
	}

	/**
	 * delete income details by income id
	 */
	@Transactional
	@Override
	public void delete(Income income) {
		hibernateTemplate.delete(income);
	}
}
