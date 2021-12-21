package com.Controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.Category;
import com.Entity.Payment;
import com.Entity.Promo;
import com.Service.Bd.PaymentBd;

@Controller
public class PaymentController {

	@Autowired
	private PaymentBd paymentService;

	public PaymentBd getPaymentService() {
		return paymentService;
	}

	public void setPaymentService(PaymentBd paymentService) {
		this.paymentService = paymentService;
	}
	
	/**
	 * save new payment
	 * @param payment
	 * @return
	 */
	@PostMapping("/ShoppingCart/savePayment")
	@ResponseBody
	public String save(@ModelAttribute("savePromo") Payment payment){
		paymentService.save(payment);
		return "payment";
	}
	
	/**
	 * get all payment details
	 * @return payment list
	 */
	@GetMapping("/AdminDashbord/Payment/getAllPayment")
	@ResponseBody
	public List<Payment> getAll(){
		List<Payment> list = paymentService.getAll();
		return list;
	}
	
	/**
	 * get today sales
	 * @return payment list
	 */
	@PostMapping("/AdminDashbord/Income/getTodaySales")
	@ResponseBody
	public float getTodaySales(@RequestParam("status") String status){
		return paymentService.getTodaySales(status);
	}
	
	/**
	 * get payment by payment status and order id
	 * @return payment
	 */
	@PostMapping("/Payment/getPaidPayment")
	@ResponseBody
	public Payment getPaymentBytStatusAndId(@RequestParam("orderId") int orderId){
		return paymentService.getPaymentBytStatusAndId(orderId);
	}
	
	/**
	 * update payment status by payment id
	 * @param status
	 * @param id
	 * @return
	 */
	@PostMapping("/AdminDashbord/Payment/updatePaymentStatus")
	@ResponseBody
	public String updateStatusById(@RequestParam("status") String status, @RequestParam("id") int id){
		paymentService.updateStatusById(status, id);
	    return "updated";
	}
	
}
