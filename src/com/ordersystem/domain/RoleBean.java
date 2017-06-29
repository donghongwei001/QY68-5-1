package com.ordersystem.domain;

public class RoleBean {
	private int role_id;
	private String role_name;
	private String code_name;
	
	
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	@Override
	public String toString() {
		return "role_id=" + role_id + ", role_name=" + role_name;
	}
	
	
}
