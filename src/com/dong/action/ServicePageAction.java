package com.dong.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.daofactory.DaoFactory;
import com.opensymphony.xwork2.ModelDriven;
import com.ordersystem.domain.DisheBean;
import com.ordersystem.domain.ServiceOrderListBean;
import com.ordersystem.domain.ServiceTable;
import com.ordersystem.service.DisheService;
import com.ordersystem.service.ServicePageService;

public class ServicePageAction extends BaseAction implements ModelDriven<ServiceTable> {
	ServicePageService sps = new ServicePageService();
	HttpServletRequest request=ServletActionContext.getRequest();
	public ServiceTable getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**查询显示桌子状态
	 * @author hcb
	 * serv_*
	 */
	public String showTable(){
		List<ServiceTable> tbList = sps.showTable();
		Integer occupy = sps.countCategory(9);	//查询正在使用的餐桌总数
		Integer rest = sps.countCategory(8);		//查询没有使用的餐桌总数
		Integer call = sps.countCategory(13);		//查询呼叫服务员的餐桌总数 状态 13
		Integer dirty = sps.countCategory(10);		//查询需要清扫的餐桌总数
		Integer total = sps.countOrderStatus(11);		//查询当天未付款的订单总数
		Integer payed = sps.countOrderStatus(12);	//查询当天已付款的订单总数
		total = total==null?0:total;
		payed = payed==null?0:payed;
		super.setsession("tbList", tbList);
		super.setsession("occupy",occupy+call);
		super.setsession("rest", rest);
		super.setsession("dirty", dirty);
		super.setsession("total", total);
		super.setsession("payed", payed);

		return "succ";
	}
	
	/**在服务员页面显示该桌订单详情 
	 * @author hcb
	 * http://localhost:8080/Ordersystem/admin/products/serv_orderDetails.action?table_id=1
	 * 需执行的动作:1.查询显示该桌订单中已点的菜品
	 * 				2.分页显示所有菜品 方便服务员加菜
	 * 
	 */
	public String orderDetails(){
		String table_id = super.getparameter("table_id");
		List<ServiceOrderListBean> solb = sps.showOrderDetails(table_id);		//查询出该桌号中当前餐桌订单详情
		List<DisheBean> menuList = sps.showmenuList();							//查询出该桌号中当前餐桌订单详情
		DisheService ds = new DisheService();
		
		Map<String , String> ma = new HashMap<String, String>();				//模糊查询服务员页面的菜品列表
		String food_name = super.getparameter("food_name");						//获取用户输入的菜品名称
		if (food_name!=null&&!food_name.equals("")) {
			ma.put("food_name", food_name);
		}
		Integer pageSize = 12;
		Integer pageStart = 0;
		List dishList = ds.queryDishe(ma, null, pageSize+"", pageStart+"");					//调用菜品类的方法查询出分页list的集合
		menuList = (List<DisheBean>) dishList.get(0);
		Integer total = (Integer) dishList.get(1);
		Integer pageCount = total/pageSize;
		if (total%pageSize>0) {
			pageCount++;
		}
		super.setsession("table_id", table_id);
		super.setsession("menuList", menuList);
		super.setsession("userseach", food_name);
		super.setsession("solb", solb);
		super.setsession("pageCount", pageCount);
		return "details";
	}
	
	/**服务员页面显示菜单列表用于餐桌加菜        //ajax分页方法 
	 * @author hcb
	 * 需执行的动作:1.分页显示所有菜品 方便服务员加菜
	 * 
	 */
	public String ajaxDetails(){
		String food_name = super.getparameter("food_name");
		Map<String, String> ma = new HashMap<String, String>();
		if (food_name!=null&&!food_name.equals("")) {
			ma.put("food_name", food_name);
		}
		String pageNo = super.getparameter("pageNo");
		Integer currentPage = null;
		try {
			currentPage = Integer.parseInt(pageNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		currentPage = currentPage==null?1:currentPage;
		DisheService ds = new DisheService();
		Integer pageSize = 12;
		Integer pageStart = (currentPage-1)*pageSize;
		List dishList = ds.queryDishe(ma, null, pageSize+"", pageStart+"");					//调用菜品类的方法查询出分页list的集合
		List<DisheBean> menuList = sps.showmenuList();							//查询出该桌号中当前餐桌订单详情
		menuList = (List<DisheBean>) dishList.get(0);
		String str = JSON.toJSONString(menuList);
		super.write(str);
		
		return null;
	}
	
	/**删除前台取消的菜品
	 * @author hcb
	 * 
	 */
	public String delOrderfood(){
		String foodid = super.getparameter("foodid");
		int i = sps.delOrderfood(foodid);
		if (i>0) {
			super.write("true");
		}else super.write("false");
		//ServletActionContext.getRequest().getRequestDispatcher(path);
		return null;
	}
	
	/**催菜功能实现的方法
	 * @author hcb
	 * 
	 */
	public String reminder(){
		String tableid = super.getparameter("tableid");
		int i = sps.reminder(tableid);
		if (i>0) {
			super.write("true");
		}else super.write("false");
		return null;
	}
	
	/**往订单中添加菜品的方法
	 * @author hcb
	 * 
	 */
	public String addOrderfood(){
		String foodid = super.getparameter("foodid");
		String tableid = super.getparameter("tableid");
		Integer i = sps.addOrderfood(foodid,tableid);
		if (i>0) {
			super.write("true");
		}else super.write("false");
		orderDetails();
		return null;
	}
	
	/**该函数功能为结账前先检查该餐桌是否有未上完的菜
	 * @author hcb
	 * 
	 */
	public String checkfood(){
		String tbid = super.getparameter("tableid");
		String count = super.getparameter("count");
		int i = sps.checkfood(tbid);
		if (i!=0) {
			super.write("false");
		}else{
			Integer status = sps.paymoney(tbid,count);
			if (status>0) {
				super.write("true");
			}else super.write("false");
		}
		return null;
	}
	
	/**强制付款的方法
	 * @author hcb
	 * 
	 */
	/*public String paymoney(){
		String tbid = super.getparameter("tableid");
		Integer status = sps.paymoney(tbid);
		if (status>0) {
			super.write("ture");
		}else super.write("false");
		return null;
	}*/

	/**清扫结束 改变桌子状态的方法
	 * 功能 改变桌子状态
	 * @author hcb
	 * 
	 */
	public String clearTable(){
		String tableid = super.getparameter("tableid");
		Integer i = sps.updateTable(tableid);
		if(i>0){
			super.write("true");
		}else super.write("false");
		return null;
	}
	
	/**前台服务员开台的方法
	 * @author hcb
	 * 
	 */
	public String starteat(){
		String tableid = super.getparameter("tableid");
		String empid = "1003";
		Integer i = sps.starteat(tableid,empid);
		if(i>0){
			super.write("true");
		}else super.write("false");
		return null;
	}
	
	/**取消呼叫服务员的方法
	 * @author hcb
	 * 
	 */
	public String cancelcall(){
		String tableid = super.getparameter("tableid");
		Integer i = sps.cancelcall(tableid);
		if(i>0){
			super.write("true");
		}else super.write("false");
		return null;
	}
	
	/**服务员界面修改菜品数量的方法
	 * @author hcb
	 * 
	 */
	public String updatenum(){
		String tabid = super.getparameter("tbid");
		String foodname = super.getparameter("foodname");
		String newnum = super.getparameter("newnum");
		Integer i = sps.updatefoodnum(tabid,foodname,newnum);
		if(i==1){
			super.write("true");
		}else super.write("false");
		return null;
	}
	
}



