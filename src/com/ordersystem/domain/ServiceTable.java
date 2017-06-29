package com.ordersystem.domain;

public class ServiceTable {
	private int table_id;
	private int table_Capacity;
	private int table_state;		//桌子状态外键
	private String table_name;		//餐桌名字
	private int emp_id;				//服务员id外键
	private String emp_name;		//服务员名字
	private String code_name;		//桌子状态
	
	public int getTable_id() {
		return table_id;
	}
	public void setTable_id(int table_id) {
		this.table_id = table_id;
	}
	public int getTable_Capacity() {
		return table_Capacity;
	}
	@Override
	public String toString() {
		return "table_id=" + table_id + ", table_Capacity="
				+ table_Capacity + ", table_state=" + table_state
				+ ", table_name=" + table_name + ", emp_id=" + emp_id
				+ ", emp_name=" + emp_name + ", code_name=" + code_name;
	}
	public void setTable_Capacity(int table_Capacity) {
		this.table_Capacity = table_Capacity;
	}
	public int getTable_state() {
		return table_state;
	}
	public void setTable_state(int table_state) {
		this.table_state = table_state;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	
}
