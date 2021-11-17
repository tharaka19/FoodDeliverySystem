package com.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Table;


@Entity
@Table(name="Customer")
public class Customer extends User {

	@Column(name = "Password")
	private String password;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
