package com.ordersystem.domain;

public class accountBean {
	private String account_number; //ÕËºÅ
	private String account_psw;		//ÃÜÂë
	private String account_status;  //Ô±¹¤±àºÅ	
	private String emp_name; //Ô±¹¤Ãû³Æ
	private String account_fk_emp_id;    //×´Ì¬
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public String getAccount_psw() {
		return account_psw;
	}
	public void setAccount_psw(String account_psw) {
		this.account_psw = account_psw;
	}
	public String getAccount_status() {
		return account_status;
	}
	public void setAccount_status(String account_status) {
		this.account_status = account_status;
	}
	public String getAccount_fk_emp_id() {
		return account_fk_emp_id;
	}
	public void setAccount_fk_emp_id(String account_fk_emp_id) {
		this.account_fk_emp_id = account_fk_emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	

}
