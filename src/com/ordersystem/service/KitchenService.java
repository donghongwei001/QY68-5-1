package com.ordersystem.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.ordersystem.dao.impl.KitchenDaoImpl;
import com.ordersystem.domain.FoodCategoryBean;
import com.ordersystem.domain.SortKitchenFoodBean;
import com.ordersystem.domain.WaitFoodBean;
import com.ordersystem.entity.MyFormat;

public class KitchenService {
	KitchenDaoImpl kdi = new KitchenDaoImpl();
	
	/**查询显示待做的菜品  并且按权重排序
	 * @author hcb
	 * 
	 */
	public List<SortKitchenFoodBean> showWaitFood(String foodStatus) {
		String sql = "select odf.order_food_id,odf.order_food_weight,ot.order_id 'fk_order_id',tt.table_id 'table_name' , ft.food_name 'food_name',odf.order_food_mark 'order_food_mark',DATEDIFF(minute,ot.order_lasttime,GETDATE()) 'lasttime',DATEDIFF(minute,ot.order_time,GETDATE()) 'time',et.emp_name 'emp_name',odf.order_press 'order_press',ft.food_time 'food_time',odf.order_food_num 'food_num',ft.food_merge 'food_maxcb' from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt"+
				" where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+foodStatus+" and ot.order_status=11 order by order_food_weight desc";
		return kdi.showWaitFood(sql,sql);
		
	}
	
	
	/**此方法用来查询所有已做的菜
	 * @author hcb
	 * 
	 */
	public List<WaitFoodBean> showDoneFood(Integer pagesize,Integer startIndex ) {
		// TODO Auto-generated method stub
		Timestamp dayBegin = MyFormat.getDayBegin();
		String nowtime = MyFormat.getDateformat().format(new Date());
		String sql = "select top "+pagesize+" odf.order_food_id,odf.order_food_weight,odf.servingtime,ot.order_id 'fk_order_id',tt.table_id 'table_name' , ft.food_name 'food_name',odf.order_food_mark 'order_food_mark',DATEDIFF(SS,ot.order_lasttime,GETDATE()) 'lasttime',DATEDIFF(SS,ot.order_time,GETDATE()) 'time',et.emp_name 'emp_name',odf.order_press 'order_press',ft.food_time 'food_time',odf.order_food_num 'food_num',ft.food_merge 'food_maxcb' from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt"+
				" where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status=3 and odf.servingtime between '"+dayBegin+"' and '"+nowtime+"' and odf.servingtime not in(select top "+startIndex+" odf.servingtime from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt "+
						"where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.servingtime between '"+dayBegin+"' and '"+nowtime+"' and odf.order_food_status=3 order by odf.servingtime desc) order by servingtime desc";
		return kdi.showFood(sql);
	}

	/**查询状态为3 的菜品总数 应为sql语句不同 所以要分开 
	 * @author hcb
	 * 
	 */
	public String findPageCountdone() {
		// TODO Auto-generated method stub
		Timestamp dayBegin = MyFormat.getDayBegin();
		String nowtime = MyFormat.getDateformat().format(new Date());
		String sql = "select count(*) from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status=3 and odf.servingtime between '"+dayBegin+"' and '"+nowtime+"'"; 
				/*"select odf.order_food_id,odf.order_food_weight,ot.order_id 'fk_order_id',tt.table_id 'table_name' , ft.food_name 'food_name',odf.order_food_mark 'order_food_mark',DATEDIFF(minute,ot.order_lasttime,GETDATE()) 'lasttime',DATEDIFF(minute,ot.order_time,GETDATE()) 'time',et.emp_name 'emp_name',odf.order_press 'order_press',ft.food_time 'food_time',odf.order_food_num 'food_num',ft.food_merge 'food_maxcb' from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt"+
				" where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+status+" order by order_food_weight desc";*/
		return kdi.findCount(sql);
	}
	
	/**查找厨房待做的菜品总数量(status 为状态 徽章显示部分,或分页总数查询)	
	 * @author hcb
	 * 
	 */
	public String findCount(String status) {
		// TODO Auto-generated method stub
		String sql = "select COUNT(*) from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt"+
				" where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_status=11 and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+status;
		
		return kdi.findCount(sql);
	}
	
	/**更新数据库菜品状态的方法
	 * @author hcb
	 * 
	 */
	public void updateStatus(String id,String status) {
		// TODO Auto-generated method stub
		String sql="update order_food set order_food_status=? where order_food_id in (?)";
		
		if (id.indexOf("-")>0) {
			String[] params = id.split("-");
			for (int i = 0; i < params.length; i++) {
				kdi.updateDataBase(sql,status,params[i]);
			}
		}else{
			kdi.updateDataBase(sql,status,id);
		}
	}
	
	/**更新数据库菜品状态的方法
	 * @author hcb
	 * 
	 */
	public void updateStatusServingTime(String id,String status) {
		// TODO Auto-generated method stub
		String sql="update order_food set servingtime=? , order_food_status=? where order_food_id in (?)";
		String date = MyFormat.getLastServingFormat().format(new Date());
		if (id.indexOf("-")>0) {
			String[] params = id.split("-");
			for (int i = 0; i < params.length; i++) {
				kdi.updateDataBase(sql,date,status,params[i]);
			}
		}else{
			kdi.updateDataBase(sql,date,status,id);
		}
	}

	/**更新数据库最后上菜时间
	 * @author hcb
	 * 
	 */
	public void updateLastTime(String orderId) {
		// TODO Auto-generated method stub
		String sql="update order_table set order_lasttime=? where order_id in (?)";
		String date = MyFormat.getLastServingFormat().format(new Date());
		if (orderId.indexOf("-")>0) {
			String[] params = orderId.split("-");
			for (int i = 0; i < params.length; i++) {
				System.out.println(params[i]);
				kdi.updateDataBase(sql,date,params[i]);
			}
		}else{
			kdi.updateDataBase(sql,date,orderId);
		}
	}

	/**算法2:按时间先后排序
	 * @author hcb
	 * 
	 */
	public List<SortKitchenFoodBean> secShowWaitFood(String foodStatus) {
		// TODO Auto-generated method stub
		String sql = "select odf.order_food_id,odf.order_food_weight,ot.order_id 'fk_order_id',tt.table_id 'table_name' , ft.food_name 'food_name',odf.order_food_mark 'order_food_mark',DATEDIFF(minute,ot.order_lasttime,GETDATE()) 'lasttime',DATEDIFF(minute,ot.order_time,GETDATE()) 'time',et.emp_name 'emp_name',odf.order_press 'order_press',ft.food_time 'food_time',odf.order_food_num 'food_num',ft.food_merge 'food_maxcb' from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt"+
				" where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+foodStatus+" and ot.order_status=11 order by order_time asc";
		return kdi.secShowWaitFood(sql,sql);
	}

	/**算法3:按订单顺序每桌取一个菜在后厨界面显示
	 * @author hcb
	 * @Status 为需要查询的状态eg:已做,未做
	 */
	public List<SortKitchenFoodBean> ThrShowWaitFood(String Status) {
		// TODO Auto-generated method stub
		List<SortKitchenFoodBean> foodlist = kdi.ThrShowWaitFood(Status);
		
		return foodlist;
	}

	/**查询状态为3 的菜品总数 应为sql语句不同 所以要分开 
	 * @author hcb
	 * 
	 */
	public String findPageCount(String status) {
		// TODO Auto-generated method stub
		String sql ="select count(*) from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt "+
					"where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+status;
				/*"select odf.order_food_id,odf.order_food_weight,ot.order_id 'fk_order_id',tt.table_id 'table_name' , ft.food_name 'food_name',odf.order_food_mark 'order_food_mark',DATEDIFF(minute,ot.order_lasttime,GETDATE()) 'lasttime',DATEDIFF(minute,ot.order_time,GETDATE()) 'time',et.emp_name 'emp_name',odf.order_press 'order_press',ft.food_time 'food_time',odf.order_food_num 'food_num',ft.food_merge 'food_maxcb' from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt"+
				" where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+status+" order by order_food_weight desc";*/
		return kdi.findCount(sql);
	}

}
