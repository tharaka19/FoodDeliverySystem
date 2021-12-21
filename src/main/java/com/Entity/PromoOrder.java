package com.Entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Embeddable
public class PromoOrder {

	@ManyToOne
	@JoinColumn(name="Promo_ID")
	private Promo promo;
	@Column(name="Quantity")
	private int quantity;
	@Column(name="Discount")
	private float discount;
	@Column(name="Total")
	private float total;
	
	@Transient
	private int promoId;

	public PromoOrder(Promo promo, int quantity) {
		super();
		this.promo = promo;
		this.quantity = quantity;
	}
	
	public PromoOrder() {
		super();
	}
	
	public int getPromoId() {
		return promoId;
	}
	public void setPromoId(int promoId) {
		this.promoId = promoId;
	}
	
	public Promo getPromo() {
		return promo;
	}
	public void setPromo(Promo promo) {
		this.promo = promo;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
}
