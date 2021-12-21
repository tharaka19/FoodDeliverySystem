package com.Entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="Customer_Order")
public class CustomerOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Order_ID")
	private int id;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "Customer_ID") 
	private Customer customer;
	
	@OneToOne
	@JoinColumn(name = "Shipping_Dtails_ID")
	private ShippingDetails shippingDetails;
	
	@ElementCollection(fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name="Food_Item_Order", joinColumns = @JoinColumn(name="Order_ID"))
	private Collection<FoodItemOrder> foodItemOrderList = new ArrayList<FoodItemOrder>();
	
	@ElementCollection(fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name="Promo_Order", joinColumns = @JoinColumn(name="Order_ID"))
	private Collection<PromoOrder> promoOrderList = new ArrayList<PromoOrder>();
	
	@Column(name="Item_Count")
	private int itemCount;
	@Column(name="Sub_Total")
	private float subTotal;
	@Column(name="Delivery_Fee")
	private float deliveryFee;
	@Column(name="Total_Discount")
	private float totalDiscount;
	@Column(name="Total")
	private float total;
	@Column(name="Status")
	private String status;
	
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name = "Date")
	private Date date;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Order_Date")
	private Date orderDate;

	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Action_Date")
	private Date actionDate;
	

	@Transient
	private int customerId;
	@Transient
	private int shippingDetailsId;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() { 
		return customer; 
	} 
	public void setCustomer(Customer customer) { 
		this.customer = customer; 
	}
	public ShippingDetails getShippingDetails() {
		return shippingDetails;
	}
	public void setShippingDetails(ShippingDetails shippingDetails) {
		this.shippingDetails = shippingDetails;
	}
	public Collection<FoodItemOrder> getFoodItemOrderList() { 
		return foodItemOrderList; 
	} 
	public void setFoodItemOrderList(Collection<FoodItemOrder> foodItemOrderList) {
		this.foodItemOrderList = foodItemOrderList;
	}
    public Collection<PromoOrder> getPromoOrderList() { 
    	return promoOrderList; 
    }
	public void setPromoOrderList(Collection<PromoOrder> promoOrderList) {
	  this.promoOrderList = promoOrderList; 
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public float getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}
	public float getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(float deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public float getTotalDiscount() {
		return totalDiscount;
	}
	public void setTotalDiscount(float totalDiscount) {
		this.totalDiscount = totalDiscount;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getActionDate() {
		return actionDate;
	}
	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getShippingDetailsId() {
		return shippingDetailsId;
	}
	public void setShippingDetailsId(int shippingDetailsId) {
		this.shippingDetailsId = shippingDetailsId;
	}
}
