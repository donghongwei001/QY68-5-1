package com.ordersystem.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ordersystem.dao.impl.CookImpl;
import com.ordersystem.domain.CookBean;

public class CookService {
	CookImpl ci=new CookImpl();
	/**向数据库中插入菜系记录
	 * @author an
	 * 
	 */
	 public void addCook(CookBean cb) {
		// TODO Auto-generated method stub
		ci.addCook(cb);
	}
	 /**
	  * 查询
	 * @return 
	  */
	 public List<CookBean> findCook(){
		 String sql="select * from dishes_table";
		 List<CookBean> cook = ci.findCook(sql);
		 return cook;
	 }
	 /**删除菜品的方法
		 * @author hcb
		 * 
		 */
		public void del_cook(String dele_id) {
			// TODO Auto-generated method stub
			String sql = "delete dishes_table where dishes_id=?";
			ci.del_cook(sql, dele_id);
		}
		
		
		/**
		 * 
		 * @param dishes_id
		 * @return
		 */
		public List<CookBean> findone(String dishes_id) {
			// TODO Auto-generated method stub
			String sql = "select * from dishes_table where dishes_id="+dishes_id;
			List<CookBean> cook = ci.findCook(sql);
			return cook;
		}
		/**
		 * 修改菜系名称的方法
		 * @param dishes_id
		 * @param newname 
		 */
		public void modify(String dishes_id, String newname) {
			// TODO Auto-generated method stub
			String sql="update dishes_table set dishes_name='"+newname+"' where dishes_id="+dishes_id;
			ci.update(sql);
		}
		
		public List<CookBean> findonebyname(String cookname) {
			String sql = "select * from dishes_table where dishes_name='"+cookname+"'";
			List<CookBean> cook = ci.findCook(sql);
			return cook;
		}
		
		
	
	
}
