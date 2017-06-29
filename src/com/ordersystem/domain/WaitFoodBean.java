package com.ordersystem.domain;

public class WaitFoodBean {
	private String fk_order_id;	//订单id
	private String table_name;	//餐桌名字
	private String food_name;	//菜名
	//private int count; //合并菜品之后的数量
	private String order_food_mark;	//备注存放该菜 辣或微辣等
	private int lasttime;	//该桌子最后一道菜上菜时间  用于权重计算
	private int time;		//该订单最后创建的时间  用于权重计算
	private String emp_name;	//服务员姓名
	private int order_press; //改单的催单次数
	private int food_time;	//做这个菜需要的时间
	private int food_num;	//所点该菜的数量
	private int food_maxcb;	//该菜最大能合并数
	//修改
	private float order_food_weight;	//该菜的上菜权重 按权重排序
	private int order_food_id;	//该菜的菜单编号
	private String servingtime;		//记录该才的上菜时间
	
	public String getServingtime() {
		return servingtime;
	}
	public void setServingtime(String servingtime) {
		this.servingtime = servingtime;
	}
	public float getOrder_food_weight() {
		return order_food_weight;
	}
	public void setOrder_food_weight(float order_food_weight) {
		this.order_food_weight = order_food_weight;
	}
	public int getOrder_food_id() {
		return order_food_id;
	}
	public void setOrder_food_id(int order_food_id) {
		this.order_food_id = order_food_id;
	}
	
	public int getFood_maxcb() {
		return food_maxcb;
	}
	@Override
	public String toString() {
		return "fk_order_id=" + fk_order_id + ", table_name="
				+ table_name + ", food_name=" + food_name
				+ ", order_food_mark=" + order_food_mark + ", lasttime="
				+ lasttime + ", time=" + time + ", emp_name=" + emp_name
				+ ", order_press=" + order_press + ", food_time=" + food_time
				+ ", food_num=" + food_num + ", food_maxcb=" + food_maxcb
				+ ", order_food_weight=" + order_food_weight
				+ ", order_food_id=" + order_food_id;
	}
	public void setFood_maxcb(int food_maxcb) {
		this.food_maxcb = food_maxcb;
	}
	public String getFk_order_id() {
		return fk_order_id;
	}
	public void setFk_order_id(String fk_order_id) {
		this.fk_order_id = fk_order_id;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public int getFood_time() {
		return food_time;
	}
	public void setFood_time(int food_time) {
		this.food_time = food_time;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getOrder_food_mark() {
		return order_food_mark;
	}
	public void setOrder_food_mark(String order_food_mark) {
		this.order_food_mark = order_food_mark;
	}
	public int getLasttime() {
		return lasttime;
	}
	public void setLasttime(int lasttime) {
		this.lasttime = lasttime;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getOrder_press() {
		return order_press;
	}
	public void setOrder_press(int order_press) {
		this.order_press = order_press;
	}
	
}
