package com.ordersystem.dao.impl;


import java.util.ArrayList;
import java.util.List;
import com.daofactory.DaoFactory;
import com.ordersystem.domain.CustBean;
import com.ordersystem.domain.CustBean_indent;

/*
 * 根据输入的内容user进行条件查询
 */

public class CustImpl {
	DaoFactory ss=new DaoFactory();
	public List<CustBean> listCust(String user){
		String sql="select b.cus_id,b.cus_name,c.xiaofei from cus_id_money c,cus_table b where c.cus_id = b.cus_id and b.cus_name like ?";
		Object[] para =new Object[]{'%'+user+'%'};
		ArrayList<ArrayList> arr=ss.execQuery(sql, para);
		ArrayList<CustBean> list=new ArrayList<CustBean>();
		for (int i = 0; i < arr.size(); i++) {
			CustBean ct=new CustBean();
			ct.setCus_id((Integer) arr.get(i).get(0));
			ct.setCus_name((String) arr.get(i).get(1));
			ct.setXiaofei((String) arr.get(i).get(2).toString());
			list.add(ct);
		}
		return list;
	}
	
	/*   
	 * 查询数据库中所有顾客信息
	 */
	public List<CustBean> showAllCust() {
		String sql="select b.cus_id,b.cus_name,c.xiaofei from cus_id_money c,cus_table b where c.cus_id = b.cus_id";
		ArrayList<ArrayList> arr = ss.execQuery(sql, null);
		ArrayList<CustBean> list=new ArrayList<CustBean>();
		
		for (int i = 0; i < arr.size(); i++) {
			CustBean ct=new CustBean();
		
				ct.setCus_id((Integer) arr.get(i).get(0));
				ct.setCus_name((String) arr.get(i).get(1));
				ct.setXiaofei((String) arr.get(i).get(2).toString());
				list.add(ct);
			
		}
		return list;
	}
	
/* 
 * 	查询某位顾客消费情况
 *  
 * 
 */
	public List<CustBean_indent> xiaofei(String aa){
		String sql="select order_id,order_time,order_fk_cusid,order_money,order_fk_empid,order_dt_score,oeder_dt_mark from order_table where order_fk_cusid=?";
		Object[] para=new Object[]{aa};
		ArrayList<ArrayList> arr = ss.execQuery(sql,para);
		ArrayList<CustBean_indent> list=new ArrayList<CustBean_indent>();
		for (int i = 0; i < arr.size(); i++) {
			CustBean_indent ct=new CustBean_indent();
			ct.setOrder_id(arr.get(i).get(0)+"");
			ct.setOrder_time( arr.get(i).get(1)+"");
			ct.setOrder_fk_cusid(arr.get(i).get(2)+"");
			ct.setOrder_money(arr.get(i).get(3)+"");
			ct.setOrder_fk_empid( arr.get(i).get(4)+"");
			ct.setOrder_dt_score((Integer) arr.get(i).get(5));
			ct.setOeder_dt_mark((Integer)arr.get(i).get(6));
			list.add(ct);
		}
		return list;
	}
}
