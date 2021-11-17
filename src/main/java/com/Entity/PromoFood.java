package com.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Promo_Food")
public class PromoFood {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Promo_Food_ID")
	private int id;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "Promo_ID")
	private Promo promo;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "Food_Item_ID")
	private FoodItem foodItem;
	@Column(name = "Food_Quantity")
	private int foodQuantity;
	@Column(name = "Status")
	private String status;
	@Transient
	private int promoId;
	@Transient
	private int foodItemId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Promo getPromo() {
		return promo;
	}
	public void setPromo(Promo promo) {
		this.promo = promo;
	}
	public FoodItem getFoodItem() {
		return foodItem;
	}
	public void setFoodItem(FoodItem foodItem) {
		this.foodItem = foodItem;
	}
	public int getFoodQuantity() {
		return foodQuantity;
	}
	public void setFoodQuantity(int foodQuantity) {
		this.foodQuantity = foodQuantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPromoId() {
		return promoId;
	}
	public void setPromoId(int promoId) {
		this.promoId = promoId;
	}
	public int getFoodItemId() {
		return foodItemId;
	}
	public void setFoodItemId(int foodItemId) {
		this.foodItemId = foodItemId;
	}
}
