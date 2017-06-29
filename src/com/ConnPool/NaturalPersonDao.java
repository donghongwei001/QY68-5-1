package com.ConnPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.ConnPool.ConnPool;
import com.ordersystem.domain.OrderBean;


public class NaturalPersonDao {
		public List<OrderBean> queryPerson(int startIndex,int maxPage){
			ConnPool cp=new ConnPool();
			List<OrderBean> ListOrder=new ArrayList<OrderBean>();
			PreparedStatement ps=null;
			String sql="select top "+maxPage+" o.order_id,o.order_time,o.order_fk_tabid,o.order_money,e.emp_name,c.cus_name,o.order_dt_score,o.oeder_dt_mark,t.code_name from code_table t, order_table o,emp_table e,cus_table c where t.code_id=o.order_status and o.order_fk_empid=e.emp_id and o.order_fk_cusid=c.cus_id and order_id not in(select top "+startIndex+" order_id from order_table order by order_id desc)order by order_id desc";
			Connection  conn=cp.getConnection();
			try {
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					OrderBean o=new OrderBean();
					o.setOrder_id(rs.getInt(1));
					o.setOrder_time(rs.getDate(2));
					o.setOrder_fk_tabid(rs.getInt(3));
					o.setOrder_money(rs.getString(4));
					o.setEmp_name(rs.getString(5));
					o.setCus_name(rs.getString(6));
					o.setOrder_dt_score(rs.getInt(7));
					o.setOeder_dt_mark(rs.getString(8));
					o.setCode_name(rs.getString(9));
					ListOrder.add(o);
				}
				ps.close();
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally{
				
			}
			return ListOrder;
		}
		public int getCount(){
			String sql="select count(*) from order_table";
			int total=0;
			Connection conn=ConnPool.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
				ps.close();
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				ConnPool.close();
			}
			return total;
		}
}
