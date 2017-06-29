package com.ordersystem.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ordersystem.dao.impl.DisheImpl;
import com.ordersystem.domain.DisheBean;
import com.ordersystem.domain.FoodCategoryBean;

public class DisheService {
	 DisheImpl di=new DisheImpl();
	
	 /**向数据库中插入菜品记录
	 * @author hcb
	 * 
	 */
	 public void addDishes(DisheBean db) {
		// TODO Auto-generated method stub
		di.addDishes(db);
	}

	/**查询菜系在下拉框中联动显示
	 * @author hcb
	 * 
	 */
	public List<FoodCategoryBean> findCategory() {
		// TODO Auto-generated method stub
		List<FoodCategoryBean> fcb = di.findCategory();
		
		return fcb;
	}

	/**模糊查询显示菜品列表的方法
	 * @author hcb
	 * 
	 */
	public List queryDishe(Map<String, String> ma,Map<String, String> price, String pageSize, String pageStart) {
		// TODO Auto-generated method stub
		String sta = "";
		if(ma!=null&&ma.size()!=0){
			Set<String> key = ma.keySet();
			for (String k : key) {
				sta += " and "+k+" like '%"+ma.get(k)+"%'";
			}
		}
		if(price!=null&&price.size()!=0){
			sta +=" and ft.food_price between "+price.get("minprice")+" and "+price.get("maxprice");
		}
		String sql1 = "select top "+pageSize+" ft.food_id,ft.food_name,ft.food_price,ft.food_time,ft.food_merge,ft.food_time,ft.food_pic,ft.food_fk_dishes_id,ft.food_description,dt.dishes_name from food_table ft,dishes_table dt where ft.food_fk_dishes_id=dt.dishes_id "+
		sta+" and ft.food_id not in(select top "+pageStart+" ft.food_id from food_table ft,dishes_table dt where ft.food_fk_dishes_id=dt.dishes_id "+sta+" order by ft.food_id asc) order by ft.food_id asc";
		String sql2 = "select count(*) from food_table ft,dishes_table dt where ft.food_fk_dishes_id=dt.dishes_id "+sta;
		List dishInfo = di.queryDishe(sql1,sql2);
		return dishInfo;
	}

	/**删除菜品的方法
	 * @author hcb
	 * 
	 */
	public void del_dishe(String del_id) {
		// TODO Auto-generated method stub
		String sql = "delete food_table where food_id=?";
		di.del_dishe(sql,del_id);
	}

	/**更新菜品信息
	 * @author hcb
	 * 
	 */
	public Integer updateDishes(DisheBean db) {
		// TODO Auto-generated method stub
		String sql = "update food_table set food_name=?,food_price=?,food_fk_dishes_id=?,food_merge=?,food_pic=?,food_description=?,food_time=? where food_id=?";
		Object[] params = new Object[]{db.getFood_name(),db.getFood_price(),db.getFood_fk_dishes_id(),db.getFood_merge(),db.getFood_pic(),db.getFood_description(),db.getFood_time(),db.getFood_id()};
		return di.updatedb(sql, params);
	}
	
	public int seidcar(String tbname) {
		int fll = di.sltbname(tbname);
		return fll;
	}
	
}
