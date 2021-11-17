package com.Entity;

import java.io.File;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name="Promo")
public class Promo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Prmo_ID")
	private int id;
	@Column(name = "Name")
	private String name;
	@Column(name = "Price")
	private float price;
	@Column(name = "Discount")
	private float discount;
	@Column(name = "Quantity")
	private int quantity;
	@Column(name = "Description")
	private String description;
	@Column(name = "Image")
	private String image;
	@Column(name = "Coca_Cola")
	private String cocaCola;
	@Column(name = "Status")
	private String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		File f = new File(image);
		String img = f.getAbsolutePath().substring(f.getAbsolutePath().lastIndexOf("\\")+1);
		this.image = img;
	}
	public String getCocaCola() {
		return cocaCola;
	}
	public void setCocaCola(String cocaCola) {
		this.cocaCola = cocaCola;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	/*
	 * public Set<PromoFood> getPromoFood() { return promoFood; } public void
	 * setPromoFood(Set<PromoFood> promoFood) { this.promoFood = promoFood; }
	 */
	
}
