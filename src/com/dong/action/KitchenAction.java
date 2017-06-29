package com.dong.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.inject.Context;
import com.ordersystem.domain.SortKitchenFoodBean;
import com.ordersystem.domain.WaitFoodBean;
import com.ordersystem.entity.PageUtil;
import com.ordersystem.service.KitchenService;

//@ParentPackage("struts-default")
//@Result(name="error",location="error.jsp")
public class KitchenAction extends BaseAction{
	KitchenService ks = new KitchenService(); 
	HttpServletRequest request=ServletActionContext.getRequest();
	PageUtil pu = new PageUtil();		//分页辅助类
	/**算法3:查找排序后的菜品清单
	 * @author hcb
	 * 执行此方法时  1.更新 排序列表和出菜列表 
	 * 			 2.更新数据库菜品状态为正做
	 * 			3.更新徽章显示的数量
	 * 			4.更新已做菜单列表
	 */
	//@Action(value="sortwaitfood",results={@Result(name="pass",location= "admin/products/Kitchen.jsp")})
	public String findFood(){
		List<SortKitchenFoodBean> list = ks.showWaitFood("1");//查询状态为1的待做菜品
		super.setsession("list", list);
		List<SortKitchenFoodBean> doingFood = ks.showWaitFood("2");//查询状态为2的正做菜品
		super.setsession("doing", doingFood);		
		
		//System.out.println("doneFood:"+doneFood.size());
		PageUtil paging = paging();		//分页封装查询状态为3的已做菜品
		super.setsession("done", paging);		
		String count = ks.findCount("1");
		super.setsession("count", count);
		return "pass";
	}
	
	/**做菜按钮
	 * 	功能:1.更新数据库菜品状态信息
	 * 		2.更新页面菜品显示 调用findfood方法
	 * @author hcb
	 * 
	 */
	public String doFood(){
		String orderfoodid = super.getparameter("orderfoodid");
		String status = super.getparameter("status");
		ks.updateStatus(orderfoodid,status);
		findFood();
		return "pass";
	}
	
	/**上菜按钮
	 * 	功能:1.更新数据库菜品状态信息
	 * 		2.更新数据库最后上菜时间
	 * 		3.记录该菜的上菜时间
	 * 		3.更新页面菜品显示  调用findfood方法
	 * @author hcb
	 * 
	 */
	public String servingFood(){
		String orderfoodid = super.getparameter("orderfoodid");
		String status = super.getparameter("status");
		String orderId = super.getparameter("orderId");
		ks.updateStatusServingTime(orderfoodid,status);	//更新数据库菜品状态和该菜上菜时间
		ks.updateLastTime(orderId);		//更新数据库最后上菜时间
		findFood();
		return "pass";
	}
	
	/**分页封装函数
	 * @author hcb
	 * 
	 */
	public PageUtil paging(){
		Integer currPage = null;
		Integer pageSize =null;
		try {
			currPage = Integer.parseInt(super.getparameter("currPage"));	//获取当前页码
			pageSize = Integer.parseInt(super.getparameter("pageSize"));	//获取每页显示条数
		} catch (Exception e) {
			//e.printStackTrace();
		}
		currPage =currPage==null?1:currPage;	//设置默认页数
		pageSize = pageSize==null?10:pageSize;	//设置默认每页显示条数
		int startIndex=(currPage-1)*pageSize;	//设置默认
		Integer count = Integer.parseInt(ks.findPageCountdone());//
		List<WaitFoodBean> doneFood = ks.showDoneFood(pageSize,startIndex);//查询状态为3的已做菜品
		pu.setRows(doneFood);
		pu.setTotal(count);
		pu.setCurrPage(currPage);
		pu.setPage(pageSize);
		return pu;
	}
	
	/**ajax分页方法
	 * @author hcb
	 * 
	 */
	public String slitPage(){
		String pageNo = super.getparameter("pageNo");
		Integer page = null;
		try {
			page = Integer.parseInt(pageNo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		page = page==null?1:page;
		int startIndex = (page-1)*10;
		List<WaitFoodBean> doneFood = ks.showDoneFood(10,startIndex);//查询状态为3的已做菜品
		for (int i = 0; i < doneFood.size(); i++) {
			String mark = doneFood.get(i).getOrder_food_mark()==null?"":doneFood.get(i).getOrder_food_mark();
			doneFood.get(i).setOrder_food_mark(mark);
		}
		String js = JSON.toJSONString(doneFood);
		super.write(js);
		return null;
	}
	
	   /**算法2:按时间先进先出  查找排序后的菜品清单
		 * @author hcb
		 * 执行此方法时  1.更新 排序列表和出菜列表 
		 * 			 2.更新数据库菜品状态为正做
		 * 			3.更新徽章显示的数量
		 * 			4.更新已做菜单列表
		 */
		public String secFindFood(){
			List<SortKitchenFoodBean> list = ks.secShowWaitFood("1");//查询状态为1的待做菜品
			super.setsession("list", list);
			List<SortKitchenFoodBean> doingFood = ks.secShowWaitFood("2");//查询状态为2的正做菜品
			super.setsession("doing", doingFood);		
			PageUtil paging = paging();		//分页封装查询状态为3的已做菜品
			super.setsession("done", paging);		
			String count = ks.findCount("1");
			super.setsession("count", count);
			return "secpass";
		}
		
		/**算法2:做菜按钮
		 * 	功能:1.更新数据库菜品状态信息
		 * 		2.更新页面菜品显示 调用findfood方法
		 * @author hcb
		 * 
		 */
		public String secDoFood(){
			String orderfoodid = super.getparameter("orderfoodid");
			String status = super.getparameter("status");
			ks.updateStatus(orderfoodid,status);
			secFindFood();
			return "secpass";
		}
		
		/**算法2:上菜按钮
		 * 	功能:1.更新数据库菜品状态信息
		 * 		2.更新数据库最后上菜时间
		 * 		3.记录该菜的上菜时间
		 * 		3.更新页面菜品显示  调用findfood方法
		 * @author hcb
		 * 
		 */
		public String secServingFood(){
			String orderfoodid = super.getparameter("orderfoodid");
			String status = super.getparameter("status");
			String orderId = super.getparameter("orderId");
			ks.updateStatusServingTime(orderfoodid,status);	//更新数据库菜品状态和该菜上菜时间
			ks.updateLastTime(orderId);		//更新数据库最后上菜时间
			secFindFood();
			return "secpass";
		}
		
		/**算法3: 按桌号轮流取菜排序   查找排序后的菜品清单
		 * @author hcb
		 * 执行此方法时  1.更新 排序列表和出菜列表 
		 * 			 2.更新数据库菜品状态为正做
		 * 			3.更新徽章显示的数量
		 * 			4.更新已做菜单列表
		 */
		//@Action(value="sortwaitfood",results={@Result(name="pass",location= "admin/products/Kitchen.jsp")})
		public String thrFindFood(){
			List<SortKitchenFoodBean> list = ks.ThrShowWaitFood("1");//查询状态为1的待做菜品
			super.setsession("list", list);
			List<SortKitchenFoodBean> doingFood = ks.ThrShowWaitFood("2");//查询状态为2的正做菜品
			super.setsession("doing", doingFood);		
			
			PageUtil paging = paging();		//分页封装查询状态为3的已做菜品
			super.setsession("done", paging);		
			String count = ks.findCount("1");
			super.setsession("count", count);
			return "thrpass";
		}
		
		/**算法3:做菜按钮
		 * 	功能:1.更新数据库菜品状态信息
		 * 		2.更新页面菜品显示 调用findfood方法
		 * @author hcb
		 * 
		 */
		public String thrDoFood(){
			String orderfoodid = super.getparameter("orderfoodid");
			String status = super.getparameter("status");
			ks.updateStatus(orderfoodid,status);
			thrFindFood();
			return "thrpass";
		}
		
		/**算法3:上菜按钮
		 * 	功能:1.更新数据库菜品状态信息
		 * 		2.更新数据库最后上菜时间
		 * 		3.记录该菜的上菜时间
		 * 		3.更新页面菜品显示  调用findfood方法
		 * @author hcb
		 * 
		 */
		public String thrServingFood(){
			String orderfoodid = super.getparameter("orderfoodid");
			String status = super.getparameter("status");
			String orderId = super.getparameter("orderId");
			ks.updateStatusServingTime(orderfoodid,status);	//更新数据库菜品状态和该菜上菜时间
			ks.updateLastTime(orderId);		//更新数据库最后上菜时间
			thrFindFood();
			return "thrpass";
		}
		
		
}
