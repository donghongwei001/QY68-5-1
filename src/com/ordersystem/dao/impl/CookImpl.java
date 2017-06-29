package com.ordersystem.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.daofactory.Connpool;
import com.daofactory.DaoFactory;
import com.ordersystem.domain.CookBean;
import com.ordersystem.domain.DisheBean;

import com.ordersystem.domain.FoodCategoryBean;

public class CookImpl {
	Connpool cp = new Connpool();
	QueryRunner qr = new QueryRunner(cp.getDataSource());
	
	/**向数据库中插入菜系记录
	 * @author an
	 * 
	 */
	public void addCook(CookBean cb) {
		// TODO Auto-generated method stub
		String sql = "insert into dishes_table values(?)";
		Object[] params = new Object[]{cb.getDishes_name()};
		int i = DaoFactory.executeUpdate(sql, params);
	}
	/**
	 * @author an
	 * 
	 */
	public List<CookBean>findCook(String sql){
		List<CookBean> list = null;
		 try {
			list = qr.query(sql,new BeanListHandler<CookBean>(CookBean.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**分页按条件查询
	 * @author hcb
	 * 
	 */
	public List queryCook(String sql) {
		List cookInfo = new ArrayList();
		try {
			List<CookBean> cookList = qr.query(sql, new BeanListHandler<CookBean>(CookBean.class));
			cookInfo.add(cookList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return cookInfo;
	}
	/**删除菜系信息
	 * @author hcb
	 * 
	 */
	public void del_cook(String sql, String dele_id) {
		// TODO Auto-generated method stub
		Object[] params = new Object[]{dele_id};
		try {
		int i = DaoFactory.executeUpdate(sql, params);
			//qr.update(sql, del_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Integer update(String sql){
		
		try {
			return qr.update(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
