package com.Entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class FoodItemOrder {

	@ManyToOne
	@JoinColumn(name="Food_Item_ID")
	private FoodItem foodItem;
	@Column(name="Quantity")
	private int quantity;
	@Column(name="Total")
	private float total;
	
	
	
	public FoodItemOrder(FoodItem foodItem, int quantity) {
		super();
		this.foodItem = foodItem;
		this.quantity = quantity;
	}
	
	public FoodItemOrder() {
		super();
	}

	public FoodItem getFoodItem() {
		return foodItem;
	}
	public void setFoodItem(FoodItem foodItem) {
		this.foodItem = foodItem;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
	
}
