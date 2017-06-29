package com.ordersystem.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.daofactory.Connpool;
import com.ordersystem.dao.KitchenDao;
import com.ordersystem.domain.SortKitchenFoodBean;
import com.ordersystem.domain.WaitFoodBean;

public class KitchenDaoImpl implements KitchenDao {

	public List<SortKitchenFoodBean> showWaitFood() {
		// TODO Auto-generated method stub
		return null;
	}
	
	private static Connpool cp = new Connpool();
	private static QueryRunner qr = new QueryRunner(cp.getDataSource());
	
	/** 算法1:综合排序
	 * @see com.ordersystem.dao.KitchenDao#showWaitFood()
	 */
	public List<SortKitchenFoodBean> showWaitFood(String sql1,String sql2) {
		// TODO Auto-generated method stub
		setDbweight(sql2); //排序前现在数据库中设置好权重
		return mergeFood(sql2);	//调用并菜函数
		}
	
	/**算法2:按时间顺序排序
	 * @author hcb
	 * sql1
	 */
	public List<SortKitchenFoodBean> secShowWaitFood(String sql1,String sql2) {
		setSecDbweight(sql2);		//重新按时间先后顺序排序
		return mergeFood(sql2);		//调用并菜函数
	}
	
	/**算法2:设置先进先出的菜品排序权重
	 * @author hcb
	 * 
	 */
	private void setSecDbweight(String sql) {
		// TODO Auto-generated method stub
		List<WaitFoodBean> wfb = showFood(sql);
		if (wfb.size()==0) {
			return;
		}
		//对从数据库取出的每个菜品list集合进行 遍历并向数据库中设置该菜的权重
		for (int i = 0; i < wfb.size(); i++) {
			//System.out.println(wfb.get(i));
			double weight = 0;	//定义权重变量
			weight = 30*wfb.get(i).getTime()+45*wfb.get(i).getOrder_press();//30与45  每分钟加权重30 没催一次菜权重加45 相当于按催一次菜能向前提前1.5分钟
			//System.out.println(weight);
			
			String upsql = "update order_food set order_food_weight=? where order_food_id=?";
			try {
				qr.update(upsql, weight,wfb.get(i).getOrder_food_id());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		}
	}

	/**合并菜品的函数
	 * @author hcb
	 * 
	 */
	private List<SortKitchenFoodBean> mergeFood(String sql2) {
		// TODO Auto-generated method stub
		List<WaitFoodBean> wfb = showFood(sql2);	//按权重排序从数据库中查出数据
		List<SortKitchenFoodBean> MergeList = megerFood(wfb);
		return MergeList;
	}
	
	/**纯合并菜的函数
	 * @author hcb
	 * @wfb 为数据库取出的菜品集合
	 */
	private List<SortKitchenFoodBean> megerFood(List<WaitFoodBean> wfb) {
		if (wfb.size()==0) {
			return null;
		}
		List<SortKitchenFoodBean> MergeList = new ArrayList<SortKitchenFoodBean>();
		if(MergeList.size()<15){
			for (int i = 0; i < wfb.size(); i++) {
				SortKitchenFoodBean skfb = new SortKitchenFoodBean();	//菜品封装类
				int flag=-1;	//定义一个标志 判断是否合并了该菜
				int fNum = wfb.get(i).getFood_num();		//获得该菜所点的数量
				String tNum = wfb.get(i).getTable_name();	//获得该菜的桌号
				String idString = wfb.get(i).getOrder_food_id()+"";		//菜品id
				String food_name = wfb.get(i).getFood_name();		//菜品名称
				String orderId = wfb.get(i).getFk_order_id();		//订单id  (记录用来更新订单最后上菜时间)
				//System.out.println(food_name);
				String order_food_mark = wfb.get(i).getOrder_food_mark();
				int maxMerge = wfb.get(i).getFood_maxcb();		//得到该菜的最大能合并数
				String mark = wfb.get(i).getOrder_food_mark()==null?"ept":wfb.get(i).getOrder_food_mark();
				//添加入集合前先用for对mergelist进行遍历  判断是否能进行合并
				for (int j = 0; j < MergeList.size(); j++) {
					//重新修改合并后显示菜品数目
					String foodnum = MergeList.get(j).getFoodnum();
					int megerNum = 0;	//定义一个合并后的菜品总数
					if (foodnum.indexOf('-')>0) {
						String[] splitfNum = foodnum.split("-");		//先拆分拼装好的字符串
						for (int k = 0; k < splitfNum.length; k++) {
							megerNum += Integer.parseInt(splitfNum[k]);	//转换为数字后相加即为当前的已合并总数
						}
					}else megerNum = Integer.parseInt(foodnum);			//如果取出的字符串 当前没有合并的则直接转换为数字格式
					
					int count =fNum + megerNum;//之前合并的总数		//算出如果合并后该菜的数量  判断若数量小于最大合并数 则符合并菜条件
					String merkM = MergeList.get(j).getWfb().getOrder_food_mark()==null?"ept":MergeList.get(j).getWfb().getOrder_food_mark();	//获取备注用来判断备注是否一样
					if (food_name.equals(MergeList.get(j).getWfb().getFood_name()) && maxMerge >= count && mark.equals(merkM)) {
					//if (food_name.equals(MergeList.get(j).getWfb().getFood_name())&&order_food_mark.equals(MergeList.get(j).getWfb().getOrder_food_mark())&&maxMerge > MergeList.get(j).getFoodnum()) {
						flag = 1;
						String megerNumStr= MergeList.get(j).getFoodnum()+"-"+fNum;
						tNum = MergeList.get(j).getTabid()+","+tNum;//更新桌号
						idString = MergeList.get(j).getOrder_food_id()+"-"+idString;//更新id编号
						orderId = MergeList.get(j).getOrderId()+"-"+orderId;	//更新订单id
						MergeList.get(j).setFoodnum(megerNumStr);			//更新菜品数目
						MergeList.get(j).setOrder_food_id(idString);
						MergeList.get(j).setTabid(tNum);
						MergeList.get(j).setOrderId(orderId);
					}
				}
				skfb.setFoodnum(fNum+"");
				skfb.setWfb(wfb.get(i));
				skfb.setOrder_food_id(idString);
				skfb.setTabid(tNum);
				skfb.setOrderId(orderId);
				if (flag==1) {
					System.out.println();
					continue;
				}
				MergeList.add(skfb);
			}
	}
		return MergeList;
	}

	/**算法1:设置数据库中的权重字段
	 * @author hcb
	 * 
	 */
	private void setDbweight(String sql) {
		List<WaitFoodBean> wfb = showFood(sql);
		if (wfb.size()==0) {
			return ;
		}
		//对从数据库取出的每个菜品list集合进行 遍历并菜封装
		List<SortKitchenFoodBean> list = new ArrayList<SortKitchenFoodBean>();	//用来存放封装的菜品类对象
		for (int i = 0; i < wfb.size(); i++) {
			double weight = 0;	//定义权重变量
			weight = (0.15*wfb.get(i).getLasttime()+0.35*wfb.get(i).getTime()+0.5*wfb.get(i).getOrder_press()*50)*wfb.get(i).getFood_time();
			QueryRunner qr = new QueryRunner(cp.getDataSource());
			String upsql = "update order_food set order_food_weight=? where order_food_id=?";
			try {
				System.out.println(qr.update(upsql, weight,wfb.get(i).getOrder_food_id()));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		}
	}
		
	/**通过编写sql语句在数据库中查找菜品 并把数据封装在WaitFoodBean类中  且返回list集合
	 * @author hcb
	 * 
	 */
	public List<WaitFoodBean> showFood(String sql) {
		
		QueryRunner qr = new QueryRunner(cp.getDataSource());
		List<WaitFoodBean> wfb = null;  //-----wfb存放的是数据库返回的 waitfoodbean对象
		try {
			wfb = qr.query(sql, new BeanListHandler<WaitFoodBean>(WaitFoodBean.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return wfb;
	}
			
	
	/**查询数据库中统计数据的方法并返回统计的结果(count(*))
	 * @author hcb
	 * 
	 */
		public String findCount(String sql) {
			// TODO Auto-generated method stub
			QueryRunner qr = new QueryRunner(cp.getDataSource());
			String query = null;
			try {
				query = qr.query(sql, new ScalarHandler(1) ).toString();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return query;
		}
		
	/**更新数据库的方法(一次更新一个参数的方法)
	 * param1为需要更新的参数
	 * param2位where后面的条件
	 * @author hcb
	 * 
	 */
	public void updateDataBase(String sql, String param1, String param2) {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(cp.getDataSource());
		try {
			qr.update(sql, param1,param2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**更新数据库的方法(一次更新两个参数的方法)
	 * param1为需要更新的参数
	 * param2位where后面的条件
	 * @author hcb
	 * 
	 */
	public void updateDataBase(String sql, String param1, String param2,String param3) {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(cp.getDataSource());
		try {
			qr.update(sql, param1,param2,param3);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**算法3:按订单顺序轮流取每个订单中的菜品进行合并
	 * @author hcb
	 * 
	 */
	public  List<SortKitchenFoodBean> ThrShowWaitFood(String status) {
		// TODO Auto-generated method stub
		//sql1为从数据库中查询到未结账(需要做菜排序的订单编号)
		String sql1 = "select order_id from order_table where order_status=11 order by order_time asc";
		//sql2为从数据库中查找出指定订单编号的订单菜品详情
		String sql2 = "select odf.order_food_id,odf.order_food_weight,ot.order_id 'fk_order_id',tt.table_id 'table_name' , ft.food_name 'food_name',odf.order_food_mark 'order_food_mark',DATEDIFF(minute,ot.order_lasttime,GETDATE()) 'lasttime',DATEDIFF(minute,ot.order_time,GETDATE()) 'time',et.emp_name 'emp_name',odf.order_press 'order_press',ft.food_time 'food_time',odf.order_food_num 'food_num',ft.food_merge 'food_maxcb' from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt"+
				" where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+status+" and ot.order_status=11 and ot.order_id=? order by order_time asc";
		List<Object> orderId = null;
		List<List> allOrder = new ArrayList<List>();	//用来封装所有订单 中 每个菜品的集合
		List<WaitFoodBean> allfood = new ArrayList<WaitFoodBean>();	//用来封装所有拍好序的菜品集合
		try {
			orderId = qr.query(sql1, new ColumnListHandler());
			if (orderId==null) {
				return null;
			}
			for (Object object : orderId) {
				List<WaitFoodBean> oneorder  = qr.query("select odf.order_food_id,odf.order_food_weight,ot.order_id 'fk_order_id',tt.table_id 'table_name' , ft.food_name 'food_name',odf.order_food_mark 'order_food_mark',DATEDIFF(minute,ot.order_lasttime,GETDATE()) 'lasttime',DATEDIFF(minute,ot.order_time,GETDATE()) 'time',et.emp_name 'emp_name',odf.order_press 'order_press',ft.food_time 'food_time',odf.order_food_num 'food_num',ft.food_merge 'food_maxcb' from order_food odf,order_table ot,emp_table et,food_table ft,table_table tt where odf.fk_food_id = ft.food_id and odf.fk_order_id = ot.order_id  and ot.order_fk_empid = et.emp_id and ot.order_fk_tabid = tt.table_id and odf.order_food_status="+status+" and ot.order_status=11 and ot.order_id="+object+" order by order_time asc", new BeanListHandler<WaitFoodBean>(WaitFoodBean.class));
				allOrder.add(oneorder);
			}
			int j=-1;
			while(allOrder.size()>0){
				j++;
				for (int i = 0; i < allOrder.size(); i++) {
					if (allOrder.get(i)==null||allOrder.get(i).size()==j) {
						allOrder.remove(i);
						i--;
						continue;
					}
					allfood.add((WaitFoodBean) allOrder.get(i).get(j));
				}
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<SortKitchenFoodBean> list = megerFood(allfood);
		return list;
	}
	
	
}
