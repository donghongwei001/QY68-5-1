package com.ordersystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.daofactory.DaoFactory;
import com.ordersystem.domain.EmpBeam;
import com.ordersystem.domain.accountBean;

public class AccountImpl {
	DaoFactory dt=new DaoFactory();
	/**
	 * 
	 * 方法功能说明：  查询所有员工信息状态
	 * 创建：2017-6-27 by Administrator   
	 * 修改：日期 by 修改者  
	 * 修改内容：  
	 * @参数： @return      
	 * @return List<accountBean>     
	 * @throws
	 */
	public List<accountBean> seleAll() {
		String sql="select a.account_number,a.account_psw,a.account_fk_emp_id,e.emp_name,a.account_status from account a,emp_table e where a.account_fk_emp_id=e.emp_id";
		ArrayList<ArrayList> arr=dt.execQuery(sql, null);
		ArrayList<accountBean> list=new ArrayList<accountBean>();
		for (int i = 0; i < arr.size(); i++) {
			accountBean ab=new accountBean();
			ab.setAccount_number((String) arr.get(i).get(0));
			ab.setAccount_psw((String) arr.get(i).get(1));
			ab.setAccount_fk_emp_id(arr.get(i).get(2).toString());
			ab.setEmp_name((String) arr.get(i).get(3));
			ab.setAccount_status(arr.get(i).get(4).toString());
			list.add(ab);
		}
		return list;
	}
	
	public void update(accountBean tb,String account_fk_emp_id) {
		Object[] id=new Object[]{account_fk_emp_id};
		String sql="update account set account_number='"+tb.getAccount_number()+"',account_psw='"+tb.getAccount_psw()+"',account_status='"+tb.getAccount_status()+"' where account_fk_emp_id=?";
		dt.executeUpdate(sql, id);
	}
	
	/**
	 * 
	 * 方法功能说明：  查询员工编号
	 */
	public List<EmpBeam> sele() {
		String sql="select emp_id from emp_table";
		ArrayList<ArrayList> arr=dt.execQuery(sql, null);
		ArrayList<EmpBeam> list=new ArrayList<EmpBeam>();
		for (int i = 0; i < arr.size(); i++) {
			EmpBeam eb=new EmpBeam();
			eb.setEmp_id((Integer) arr.get(i).get(0));
			list.add(eb);
		}
		return list;
	}
	/**
	 * 方法功能说明：  添加员工账号状态信息
	 */
	public void addaccount(accountBean ab){
		Object[] pa=new Object[]{ab.getAccount_number(),ab.getAccount_psw(),ab.getAccount_fk_emp_id(),ab.getAccount_status()};
		String sql="insert into account (account_number,account_psw,account_fk_emp_id,account_status) values(?,?,?,?)";
		dt.executeUpdate(sql, pa);
	}
	
}
