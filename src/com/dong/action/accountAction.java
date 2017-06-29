package com.dong.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ordersystem.domain.EmpBeam;
import com.ordersystem.domain.accountBean;
import com.ordersystem.service.accountService;

public class accountAction extends BaseAction{
		HttpServletRequest request=ServletActionContext.getRequest();
	accountService ac=new accountService();
	
		
	/** 	
	 * 方法功能说明： 查询所有登录账号信息状态 
	 */
	public String selac(){
		System.out.println(request.getRequestURI());
		List<accountBean> list=ac.seleAll();
		super.setsession("list", list);
		return "acfun";
	}
	
	/** 
	 * 方法功能说明：编辑登录信息状态  
	 */
	
	public String edit() {
		System.out.println(request.getRequestURI());
		String account_number=super.getparameter("account_number");
		String account_psw=super.getparameter("account_psw");
		String account_fk_emp_id=super.getparameter("account_fk_emp_id");
		super.setsession("account_number", account_number);
		super.setsession("account_psw", account_psw);
		super.setsession("account_fk_emp_id", account_fk_emp_id);
		return "blili";
	}
	
	public String ed() {
		String account_number=super.getparameter("account_number");
		String account_psw=super.getparameter("account_psw");
		String account_status=super.getparameter("zhuangtai");
		String account_fk_emp_id=super.getparameter("account_fk_emp_id");
		accountBean ab=new accountBean();
		ab.setAccount_number(account_number); 
		ab.setAccount_psw(account_psw);
		ab.setAccount_status(account_status);
		ac.up(ab,account_fk_emp_id);
		selac();
		return "acfun";
	}
	
	/**
	 * 
	 * 方法功能说明：  添加是员工账号状态是用JSON在员工表查出所有员工编号
	 */
	public String  selemp() {
		List<EmpBeam> li=ac.se();
		String str=com.alibaba.fastjson.JSON.toJSONString(li);
		super.write(str);
		return null;
	}
	
	public String add() {
		System.out.println(request.getRequestURI());
		String account_number=super.getparameter("account_number");
		String account_psw=super.getparameter("account_psw");
		String account_fk_emp_id=super.getparameter("account_fk_emp_id");
		String account_status=super.getparameter("account_status");
		accountBean ab=new accountBean();
		ab.setAccount_number(account_number); 
		ab.setAccount_psw(account_psw);
		ab.setAccount_fk_emp_id(account_fk_emp_id);
		ab.setAccount_status(account_status);
		ac.addac(ab);
		selac();
		return "acfun";
	}
}
