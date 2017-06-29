package com.ordersystem.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.daofactory.Connpool;
import com.ordersystem.dao.impl.ServicePageImpl;
import com.ordersystem.domain.DisheBean;
import com.ordersystem.domain.ServiceOrderListBean;
import com.ordersystem.domain.ServiceTable;
import com.ordersystem.entity.MyFormat;

public class ServicePageService {

	Connpool cp = new Connpool();
	QueryRunner qr = new QueryRunner(cp.getDataSource());
	
	ServicePageImpl spi = new ServicePageImpl();
	/**查询桌子状态在服务员界面显示
	 * @author hcb
	 * 
	 */
	public List<ServiceTable> showTable() {
		// TODO Auto-generated method stub
		List<ServiceTable> tbList = spi.showTable();
		return tbList;
	}
	
	/**统计各种状态的桌子总数
	 * @author hcb
	 * 
	 */
	public Integer countCategory(int i) {
		String sql = "select count(*) from table_table where table_state=?";
		Integer count = spi.countCategory(sql,i);
		return count;
	}

	/**查询订单状态总数
	 * @author hcb
	 * 
	 */
	public Integer countOrderStatus(int i) {
		// TODO Auto-generated method stub// select count(*) from order_table where order_time between '2017-06-18' and '2017-06-19' and order_status=11
		Integer count = spi.countOrderStatus(i);
		return count;
	}
	
	/**查询出该桌号下待结账的订单菜品列表
	 * @author hcb
	 * 
	 */
	public List<ServiceOrderListBean> showOrderDetails(String table_id) {
		// TODO Auto-generated method stub
		List<ServiceOrderListBean> solb = spi.showOrderDetails(table_id);
		return solb;
	}

	/**通过order_food_id移除数据库中的该菜
	 * @author hcb
	 * 
	 */
	public int delOrderfood(String foodid) {
		// TODO Auto-generated method stub
		int i = spi.delOrderfood(foodid);
		return i;
	}


	/**催单的方法
	 * @author hcb
	 * 
	 */
	public int reminder(String tableid) {
		// TODO Auto-generated method stub
		int i = spi.reminder(tableid);
		return i;
	}

	/**分页查询显示数据库中的已有的菜品
	 * @author hcb
	 * 忽略  通过调用dishesservice类的方法实现此功能
	 */
	public List<DisheBean> showmenuList() {
		// TODO Auto-generated method stub
		
		return null;
	}

	/**服务员页面给餐桌添加菜的方法
	 * @author hcb
	 * 
	 */
	public Integer addOrderfood(String foodid, String tableid) {
		// TODO Auto-generated method stub
		Integer i = spi.addOrderfood(foodid,tableid);
		return i;
	}
	
	/**该函数功能为结账前先检查该餐桌是否有未上完的菜
	 * @author hcb
	 * 
	 */
	public int checkfood(String tbid) {
		// TODO Auto-generated method stub
		Integer i = spi.checkfood(tbid);
		return i;
	}
	
	/**该函数的功能是负责前端传回的桌号结账
	 * @author hcb
	 * 	1.得到菜品消费应付总金额(已做和正做)
	 *  2.更新数据库订单的金额
	 *  3.改变桌子状态为 待清扫
	 *  4.改变订单状态为 结账
	 * 
	 */
	public Integer paymoney(String tbid,String count) {
		// TODO Auto-generated method stub
		Integer orderId = spi.searchOrderId(tbid);		//得到桌子id
		String sql = "update table_table set table_state=10 where table_id=?";
		Object[] params = new Object[]{tbid};
		String sql1 = "update order_table set order_status=12,order_money=? where order_id=?";
		Object[] param1 = new Object[]{count,orderId};
		//Integer status = spi.updateStatus(sql1,param1);		//更新订单状态为已结账与订单表中的金额	以及更新该订单编号的状态为已结账
		Integer status = -1;
		try {
			status = qr.update("update order_table set order_status=12,order_money="+count+" where order_id="+orderId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	//更新订单状态为已结账与订单表中的金额	以及更新该订单编号的状态为已结账
		if (status==1) {
			spi.updateStatus(sql,params);		//更新桌子状态
		}
		
		return status;
	}

	/**清台结束改变桌子状态为可用
	 * @author hcb
	 * 
	 */
	public Integer updateTable(String tableid) {
		// TODO Auto-generated method stub
		String sql = "update  table_table set table_state=8 where table_id= ? and table_state=10";
		Object[] params = new Object[]{tableid};
		return spi.updateStatus(sql, params);
	}

	/**服务员界面开台的方法
	 * @author hcb
	 * 向订单表中插入一条订单信息
	 * 把桌子状态改为占用
	 */
	public Integer starteat(String tableid,String empid) {
		// TODO Auto-generated method stub
		
		String sql = "insert into order_table (order_time,order_fk_tabid,order_money,order_fk_empid,order_lasttime,order_status) values (?,?,?,?,?,?)";
		String date = MyFormat.getLastServingFormat().format(new Date());
		Object[] params = new Object[]{date,tableid,0,empid,date,11};
		Integer i = spi.updateStatus(sql, params);		//向订单表中插入一条订单记录
		Integer j = 0;
		String sql2 = "update table_table set table_state=9 where table_id=? and table_state=8";
		Object[] param = new Object[]{tableid};
		if(i>0){
			j=spi.updateStatus(sql2, param);
		}
		return j;
	}

	/**取消呼叫服务员的方法 更改桌子状态为占用
	 * @author hcb
	 * 
	 */
	public Integer cancelcall(String tableid) {
		// TODO Auto-generated method stub
		String sql = "update table_table set table_state=9 where table_state=13 and table_id=?";
		Object[] params = new Object[]{tableid};
		return spi.updateStatus(sql, params);
	}

	/**更新数据库订单中的菜品数量 服务员界面中的修改菜品数量
	 * @author hcb
	 * 1.需先查询出当桌号前吃饭的订单编号
	 * 2.查询出该菜名的菜品序号
	 * 3.更新该菜的数量
	 * 
	 */
	public Integer updatefoodnum(String tabid, String foodname, String newnum) {
		// TODO Auto-generated method stub
		Integer orderId = spi.searchOrderId(tabid);		//得到该桌子的正在吃饭的订单id
		String sql1 = "select food_id from food_table where food_name='"+foodname+"'";		//获得指定菜名的菜品序号
		Integer foodid = spi.findone(sql1);    			//得到需更改菜品的序号
		String sql = "update order_food set order_food_num=? where fk_order_id=? and fk_food_id=? and order_food_status=1";
		Object[] params = new Object[]{newnum,orderId,foodid};
		return spi.updateStatus(sql, params);
	}
	

}
