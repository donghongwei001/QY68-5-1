package com.ordersystem.domain;

import java.util.Date;

public class OrderBean {
	private int order_id;
	private Date order_time;
	private int order_fk_tabid;
	private String  order_money;
	private String emp_name;
	private int order_fk_empid;
	private int order_fk_cusid;
	private String cus_name;
	private int order_dt_score;
	private String oeder_dt_mark;
	private Date order_lasttime;
	private String code_name;
	
	
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public Date getOrder_lasttime() {
		return order_lasttime;
	}
	public void setOrder_lasttime(Date order_lasttime) {
		this.order_lasttime = order_lasttime;
	}
	public int getOrder_fk_empid() {
		return order_fk_empid;
	}
	public void setOrder_fk_empid(int order_fk_empid) {
		this.order_fk_empid = order_fk_empid;
	}
	public int getOrder_fk_cusid() {
		return order_fk_cusid;
	}
	public void setOrder_fk_cusid(int order_fk_cusid) {
		this.order_fk_cusid = order_fk_cusid;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public int getOrder_fk_tabid() {
		return order_fk_tabid;
	}
	public void setOrder_fk_tabid(int order_fk_tabid) {
		this.order_fk_tabid = order_fk_tabid;
	}
	public String  getOrder_money() {
		return order_money;
	}
	public void setOrder_money(String order_money) {
		this.order_money = order_money;
	}
	
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public int getOrder_dt_score() {
		return order_dt_score;
	}
	public void setOrder_dt_score(int order_dt_score) {
		this.order_dt_score = order_dt_score;
	}
	public String getOeder_dt_mark() {
		return oeder_dt_mark;
	}
	public void setOeder_dt_mark(String oeder_dt_mark) {
		this.oeder_dt_mark = oeder_dt_mark;
	}
	
}
