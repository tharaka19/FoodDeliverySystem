package com.Entity;

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
@Table(name="Shipping_Details")
public class ShippingDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Shipping_Dtails_ID")
	private int id;
	@Column(name = "Full_Name")
	private String fullName;
	@Column(name = "House_No_or_Lane")
	private String houseNoOrLane;
	@Column(name = "Street_Name")
	private String streetName;
	@Column(name = "City")
	private String city;
	@Column(name = "Status")
	private String status;
	@ManyToOne
	@JoinColumn(name = "Customer_ID")
	private Customer customer;
	@Transient
	private int customerId;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getHouseNoOrLane() {
		return houseNoOrLane;
	}
	public void setHouseNoOrLane(String houseNoOrLane) {
		this.houseNoOrLane = houseNoOrLane;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
}
