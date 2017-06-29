package com.ordersystem.domain;

public class DisheBean {
	private int food_id;				//菜单编号
	private String food_name;			//菜名
	private int food_price;				//价格
	private int food_fk_dishes_id;		//菜系外键
	private String dishes_name;			//菜系名
	private int food_merge;				//最大并菜数
	private int food_time;				//做菜耗时
	private String food_pic;			//图片路径
	private String food_description;	//菜品描述 db.description
	
	public String getFood_description() {
		return food_description;
	}
	public void setFood_description(String food_description) {
		this.food_description = food_description;
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getFood_price() {
		return food_price;
	}
	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}
	public int getFood_fk_dishes_id() {
		return food_fk_dishes_id;
	}
	public void setFood_fk_dishes_id(int food_fk_dishes_id) {
		this.food_fk_dishes_id = food_fk_dishes_id;
	}
	public int getFood_merge() {
		return food_merge;
	}
	public void setFood_merge(int food_merge) {
		this.food_merge = food_merge;
	}
	public int getFood_time() {
		return food_time;
	}
	public void setFood_time(int food_time) {
		this.food_time = food_time;
	}
	public String getDishes_name() {
		return dishes_name;
	}
	public void setDishes_name(String dishes_name) {
		this.dishes_name = dishes_name;
	}
	public String getFood_pic() {
		return food_pic;
	}
	public void setFood_pic(String food_pic) {
		this.food_pic = food_pic;
	}
	@Override
	public String toString() {
		return "food_id=" + food_id + ", food_name=" + food_name
				+ ", food_price=" + food_price + ", food_fk_dishes_id="
				+ food_fk_dishes_id + ", food_merge=" + food_merge
				+ ", food_time=" + food_time + ", dishes_name=" + dishes_name
				+ ", food_pic=" + food_pic + ", food_description="
				+ food_description ;
	}
	
	
}
