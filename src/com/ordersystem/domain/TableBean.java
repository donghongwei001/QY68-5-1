package com.ordersystem.domain;

public class TableBean {
	private int table_id;
	private int table_Capacity;
	private String  table_state;
	private String fk_emp_id;
	private String table_name;
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public int getTable_id() {
		return table_id;
	}
	public void setTable_id(int table_id) {
		this.table_id = table_id;
	}
	public int getTable_Capacity() {
		return table_Capacity;
	}
	public void setTable_Capacity(int table_Capacity) {
		this.table_Capacity = table_Capacity;
	}
	
	public String getTable_state() {
		return table_state;
	}
	public void setTable_state(String table_state) {
		this.table_state = table_state;
	}
	public String getFk_emp_id() {
		return fk_emp_id;
	}
	public void setFk_emp_id(String fk_emp_id) {
		this.fk_emp_id = fk_emp_id;
	}
	

}
