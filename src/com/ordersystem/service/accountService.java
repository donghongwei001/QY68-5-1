package com.ordersystem.service;

import java.util.List;

import com.ordersystem.dao.impl.AccountImpl;
import com.ordersystem.domain.EmpBeam;
import com.ordersystem.domain.accountBean;

public class accountService {
	AccountImpl at=new AccountImpl();
	
	public List<accountBean> seleAll() {
		return at.seleAll();
	}
	
	public void up(accountBean tb,String account_fk_emp_id){
		at.update(tb, account_fk_emp_id);
	}
	public List<EmpBeam> se() {
		return at.sele();
	}
	
	public void addac(accountBean ab) {
		at.addaccount(ab);
	}
}
