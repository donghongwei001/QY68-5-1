package com.ordersystem.service;

import java.util.List;

import com.ordersystem.dao.impl.CustImpl;
import com.ordersystem.domain.CustBean;
import com.ordersystem.domain.CustBean_indent;

public class CustService {
	CustImpl ci = new CustImpl();
	
	public List<CustBean> showAllCust() {
		return ci.showAllCust();
	}

	public List<CustBean> showCust(String user) {
		// TODO Auto-generated method stub
		return ci.listCust(user);
	}
	public List<CustBean_indent> shop(String aa) {
		return ci.xiaofei(aa);
	}
}
