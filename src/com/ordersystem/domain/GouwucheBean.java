package com.ordersystem.domain;

import java.util.ArrayList;

public class GouwucheBean {
	private String count;
	private ArrayList name;
	private String price;
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	public ArrayList getName() {
		return name;
	}
	public void setName(ArrayList name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}
