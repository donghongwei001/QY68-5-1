package com.ordersystem.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.daofactory.Connpool;
import com.daofactory.DaoFactory;
import com.ordersystem.dao.DisheDao;
import com.ordersystem.domain.DisheBean;
import com.ordersystem.domain.FoodCategoryBean;

public class DisheImpl implements DisheDao {
	Connpool cp = new Connpool();
	QueryRunner qr = new QueryRunner(cp.getDataSource());
	DaoFactory dt=new DaoFactory();
	
	/**向数据库中插入菜品记录
	 * @author hcb
	 * 
	 */
	public void addDishes(DisheBean db) {
		// TODO Auto-generated method stub
		String sql = "insert into food_table values(?,?,?,?,?,?,?)";
		Object[] params = new Object[]{db.getFood_name(),db.getFood_price(),db.getFood_fk_dishes_id(),db.getFood_merge(),db.getFood_time(),db.getFood_pic(),db.getFood_description()};
		int i = DaoFactory.executeUpdate(sql, params);
		System.out.println("插入结果为"+i);
	}

	/**查询数据库中的菜系类别
	 * @author hcb
	 * 
	 */
	public List<FoodCategoryBean> findCategory() {
		// TODO Auto-generated method stub
		String sql = "select * from dishes_table";
		List<FoodCategoryBean> fcb = null;
		try {
			fcb = qr.query(sql, new BeanListHandler<FoodCategoryBean>(FoodCategoryBean.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fcb;
	}
	
	/**分页按条件查询
	 * @author hcb
	 * 
	 */
	public List queryDishe(String sql1,String sql2) {
		List disheInfo = new ArrayList();
		
		try {
			List<DisheBean> dishList = qr.query(sql1, new BeanListHandler<DisheBean>(DisheBean.class));
			Integer count = (Integer) qr.query(sql2, new ScalarHandler(1));
			disheInfo.add(dishList);
			disheInfo.add(count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return disheInfo;
	}

	/**删除菜品信息
	 * @author hcb
	 * 
	 */
	public void del_dishe(String sql, String del_id) {
		// TODO Auto-generated method stub
		Object[] params = new Object[]{del_id};
		try {
		int i = DaoFactory.executeUpdate(sql, params);
		System.out.println("删除的结果为:"+i);
			//qr.update(sql, del_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int sltbname(String tbname) {
		Object[] arr=new Object[]{tbname};
		String sql="select food_name from food_table where food_name=?";
		int fl=dt.execQuery(sql, arr).get(0).size();
		return fl;
	}

	/**更新数据库的方法
	 * @author hcb
	 * 
	 */
	public Integer updatedb(String sql,Object[] params){
		return DaoFactory.executeUpdate(sql, params);
	}
}
