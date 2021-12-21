package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.FoodItem;
import com.Entity.Income;
import com.Service.Bd.IncomeBd;

@Controller
public class IncomeController {

	@Autowired 
	private IncomeBd incomeService;

	public IncomeBd getIncomeService() {
		return incomeService;
	}

	public void setIncomeService(IncomeBd incomeService) {
		this.incomeService = incomeService;
	}
	
	/**
	 * save new today income
	 * @param income
	 * @return
	 */
	@PostMapping("/AdminDashbord/Income/saveIncome")
	@ResponseBody
	public String save(@ModelAttribute("saveIncome") Income income){
		incomeService.save(income);
		return "income";
	}
	
	/**
	 * get all income details
	 * @return income list
	 */
	@GetMapping("/AdminDashbord/Income/getAllIncome")
	@ResponseBody
	public List<Income> getAll(){
		List<Income> list = incomeService.getAll();
		return list;
	}
	
	/**
	 * get income details by income id
	 * @param id
	 * @return income for adminDashboard page
	 */
	@GetMapping("/AdminDashbord/Income/getAllIncome/{id}")
	@ResponseBody
	public Income getById(@PathVariable int id){
		Income income = incomeService.getById(id);
		return income;
	}
	
	/**
	 * update income details
	 * @param income
	 * @return
	 */
	@PostMapping("/AdminDashbord/Income/updateIncome")
	@ResponseBody
	public String updateFoodItem(@ModelAttribute("updateIncome") Income income){
		incomeService.update(income);
	    return "updated";
	}
	
	/**
	 * delete income details by income id
	 * @param id
	 * @return
	 */
	@GetMapping("/AdminDashbord/Income/deleteIncome/{id}")
	@ResponseBody
	public String delete(@PathVariable int id){
		incomeService.delete(id);
		return "deleted";
	}
}
