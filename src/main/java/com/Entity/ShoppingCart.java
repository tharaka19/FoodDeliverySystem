package com.Entity;

public class ShoppingCart {

	private FoodItem foodItem = new FoodItem();
	private int foodItemQuantity;
	private float foodItemTotal;
	
	private Promo promo = new Promo();
	private int promoQuantity;
	private float promoTotal;
	private float promoTotalDiscount;
	
	public ShoppingCart() {
		super();
	}

	public ShoppingCart(FoodItem foodItem, int foodItemQuantity, float foodItemTotal) {
		super();
		this.foodItem = foodItem;
		this.foodItemQuantity = foodItemQuantity;
		this.foodItemTotal = foodItemTotal;
	}

	public ShoppingCart(Promo promo, int promoQuantity, float promoTotal, float promoTotalDiscount) {
		super();
		this.promo = promo;
		this.promoQuantity = promoQuantity;
		this.promoTotal = promoTotal;
		this.promoTotalDiscount = promoTotalDiscount;
	}

	public FoodItem getFoodItem() {
		return foodItem;
	}

	public void setFoodItem(FoodItem foodItem) {
		this.foodItem = foodItem;
	}

	public int getFoodItemQuantity() {
		return foodItemQuantity;
	}

	public void setFoodItemQuantity(int foodItemQuantity) {
		this.foodItemQuantity = foodItemQuantity;
	}

	public float getFoodItemTotal() {
		return foodItemTotal;
	}

	public void setFoodItemTotal(float foodItemTotal) {
		this.foodItemTotal = foodItemTotal;
	}

	public Promo getPromo() {
		return promo;
	}

	public void setPromo(Promo promo) {
		this.promo = promo;
	}

	public int getPromoQuantity() {
		return promoQuantity;
	}

	public void setPromoQuantity(int promoQuantity) {
		this.promoQuantity = promoQuantity;
	}

	public float getPromoTotal() {
		return promoTotal;
	}

	public void setPromoTotal(float promoTotal) {
		this.promoTotal = promoTotal;
	}

	public float getPromoTotalDiscount() {
		return promoTotalDiscount;
	}

	public void setPromoTotalDiscount(float promoTotalDiscount) {
		this.promoTotalDiscount = promoTotalDiscount;
	}
}
