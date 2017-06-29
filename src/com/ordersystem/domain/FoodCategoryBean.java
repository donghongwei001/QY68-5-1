package com.ordersystem.domain;

import java.io.Serializable;

public class FoodCategoryBean implements Serializable{
	private int dishes_id;
	private String dishes_name;
	
	
	public int getDishes_id() {
		return dishes_id;
	}
	public void setDishes_id(int dishes_id) {
		this.dishes_id = dishes_id;
	}
	public String getDishes_name() {
		return dishes_name;
	}
	public void setDishes_name(String dishes_name) {
		this.dishes_name = dishes_name;
	}
	@Override
	public String toString() {
		return "dishes_id=" + dishes_id + ", dishes_name="
				+ dishes_name;
	}
	
	
}
