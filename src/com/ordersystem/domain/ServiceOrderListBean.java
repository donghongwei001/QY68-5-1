package com.ordersystem.domain;

public class ServiceOrderListBean {
	private String food_name;			//food表中的菜名
	private Integer food_price;			//food中的菜单价
	private String table_name;			//桌子表中的餐桌名字
	private Integer table_id;			//桌子表中的餐桌编号
	private Integer order_food_num;		//订单菜品表中的数量
	private String order_food_mark;		//订单菜品表中的口味备注
	private Integer order_food_id;		//订单菜品表中的菜编号
	private Integer order_id; 			//订单表中的订单编号
	private String code_name;			//订单菜品表中的该菜订单状态
	private Integer cus_id;				//顾客表中的顾客编号  查出来记录消费详情的时候可能会 用到
	private String cus_name;			//顾客表中的顾客姓名 查出来 能显示在订单详情页的角落上
	
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public Integer getCus_id() {
		return cus_id;
	}
	public void setCus_id(Integer cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public Integer getFood_price() {
		return food_price;
	}
	public Integer getTable_id() {
		return table_id;
	}
	public void setTable_id(Integer table_id) {
		this.table_id = table_id;
	}
	public void setFood_price(Integer food_price) {
		this.food_price = food_price;
	}
	public Integer getOrder_food_num() {
		return order_food_num;
	}
	public void setOrder_food_num(Integer order_food_num) {
		this.order_food_num = order_food_num;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public String getOrder_food_mark() {
		return order_food_mark;
	}
	public void setOrder_food_mark(String order_food_mark) {
		this.order_food_mark = order_food_mark;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getOrder_food_id() {
		return order_food_id;
	}
	public void setOrder_food_id(Integer order_food_id) {
		this.order_food_id = order_food_id;
	}
	
}
